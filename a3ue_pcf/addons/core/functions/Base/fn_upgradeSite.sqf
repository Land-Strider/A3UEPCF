#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

/*
    Author: PCF
    Description: Upgrades a Resource or Factory site on the server.
    Params:
        0: STRING - Marker name
        1: OBJECT - Player unit requesting the upgrade (for UI feedback)
*/

params [
    ["_site", "", [""]],
    ["_player", objNull, [objNull]]
];

if (_site == "") exitWith { false };

// 1. Determine site type
private _isResource = _site in resourcesX;
private _isFactory = _site in factories;

if (!_isResource && !_isFactory) exitWith { false };

// 2. Ownership check
private _side = sidesX getVariable [_site, sideUnknown];
if (_side != teamPlayer) exitWith { false };

// 3. Dynamic variable mapping for Save System compatibility
private _varPrefix = if (_isResource) then { "A3UE_Resource" } else { "A3UE_Factory" };
private _levelVar = format ["%1UpgradeLevel_%2", _varPrefix, _site];
private _arrayVar = format ["%1Levels", _varPrefix];
private _typeTotalVar = format ["A3UE_TotalRebel%1Upgrades", if (_isResource) then { "Resource" } else { "Factory" }];

// 4. State & Level checks
private _currentLevel = missionNamespace getVariable [_levelVar, 0];
private _maxLevel = 3;

if (_currentLevel >= _maxLevel) exitWith { false };

// 5. Cost & Resource checks
private _totalUpgrades = missionNamespace getVariable ["A3UE_TotalRebelUpgrades", 0];
private _upgradeCost = (1 + _totalUpgrades) * PCF_ResourceUpgradeCost;
private _resourcesFIA = server getVariable ["resourcesFIA", 0];

if (_resourcesFIA < _upgradeCost) exitWith {
    if (!isNull _player) then {
        private _msg = localize "STR_a3ue_pcf_mrkMenu_upgrade_assets_not_enough_money";
        [false, _msg] remoteExecCall ["A3U_fnc_upgradeSiteResponse", _player];
    };
    false
};

// 6. Execute Upgrade & Deduct Funds
[0, -_upgradeCost] call A3A_fnc_resourcesFIA;

private _newLevel = _currentLevel + 1;
missionNamespace setVariable [_levelVar, _newLevel, true];

// Update Master Array (Used by fn_saveLoop.sqf)
private _masterArray = missionNamespace getVariable [_arrayVar, []];
private _entryIndex = _masterArray findIf { (_x select 0) isEqualTo _site };

if (_entryIndex >= 0) then {
    (_masterArray select _entryIndex) set [1, _newLevel];
} else {
    _masterArray pushBack [_site, _newLevel];
};
missionNamespace setVariable [_arrayVar, _masterArray, true];

// Update Global Counters
missionNamespace setVariable ["A3UE_TotalRebelUpgrades", _totalUpgrades + 1, true];
private _typeTotal = missionNamespace getVariable [_typeTotalVar, 0];
missionNamespace setVariable [_typeTotalVar, _typeTotal + 1, true];

// 7. Refresh visuals and notify network
[_site] remoteExec ["A3A_fnc_mrkUpdate", 0];

// Task success notification
private _siteName = [_site] call A3A_fnc_localizar;
private _successMsg = format [localize "STR_a3ue_pcf_mrkMenu_upgrade_assets_success", _siteName];

["TaskSucceeded", ["", _successMsg]] remoteExec ["BIS_fnc_showNotification", [teamPlayer, civilian]];

// Return green success response to requesting player for status panel display
if (!isNull _player) then {
    [true, _successMsg] remoteExecCall ["A3U_fnc_upgradeSiteResponse", _player];
};

Info_3("PCF: %1 %2 upgraded to level %3", if (_isResource) then { "Resource" } else { "Factory" }, _site, _newLevel);

true