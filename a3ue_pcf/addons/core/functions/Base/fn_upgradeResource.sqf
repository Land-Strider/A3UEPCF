#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("Entered the A3A_fnc_upgradeResource function");
params ["_resourceSite"];
Info_1("Starting upgrade for resource site: %1", _resourceSite);
private _name = [_resourceSite] call A3A_fnc_localizar;

// Check total rebel upgrades so far
private _totalUpgrades = missionNamespace getVariable ["A3UE_TotalRebelUpgrades", 0];

// Get current level and check maximum, also check total rebel resource upgrades count
private _currentLevel = missionNamespace getVariable [format["A3UE_ResourceUpgradeLevel_%1", _resourceSite], 0];
private _maxLevel = 3;
private _totalRebelResourceUpgrades = missionNamespace getVariable ["A3UE_TotalRebelResourceUpgrades", 0];

if (_currentLevel >= _maxLevel) exitWith {
    Info_1("Resource %1 already at max level", _resourceSite);
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_upgrade_assets_header",  
        parseText format [localize "STR_notifiers_upgrade_assets_already_max", _name],
        30
    ] spawn SCRT_fnc_ui_showMessage;
    false
};

// Check resources
private _upgradeCost = (1 + _totalUpgrades) * PCF_ResourceUpgradeCost;
private _resourcesFIA = server getVariable ["resourcesFIA", 0];

if (_resourcesFIA < _upgradeCost) exitWith {
    Info_2("Not enough resources to upgrade %1. Need: %2", _resourceSite, _upgradeCost);
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_upgrade_assets_header",  
        parseText format [localize "STR_notifiers_upgrade_assets_not_enough_money", _upgradeCost, A3A_faction_civ get "currencySymbol"],
        30
    ] spawn SCRT_fnc_ui_showMessage;
    false
};

// Upgrade the site
private _newLevel = _currentLevel + 1;

// Update individual site level
missionNamespace setVariable [format["A3UE_ResourceUpgradeLevel_%1", _resourceSite], _newLevel, true];

// Update master array - find and update the entry
private _resourceLevels = missionNamespace getVariable ["A3UE_ResourceLevels", []];
private _entryIndex = _resourceLevels findIf {(_x select 0) isEqualTo _resourceSite};

if (_entryIndex >= 0) then {
    // Update existing entry
    (_resourceLevels select _entryIndex) set [1, _newLevel];
} else {
    // Add new entry if not found
    _resourceLevels pushBack [_resourceSite, _newLevel];
};

missionNamespace setVariable ["A3UE_ResourceLevels", _resourceLevels, true];

// Update total upgrades count
missionNamespace setVariable ["A3UE_TotalRebelUpgrades", _totalUpgrades + 1, true];

// Update total rebel resource upgrades count
missionNamespace setVariable ["A3UE_TotalRebelResourceUpgrades", _totalRebelResourceUpgrades + 1, true];

// Deduct resources
[0, -_upgradeCost] remoteExec ["A3A_fnc_resourcesFIA", 2];

// Commander menu upgrade success notification
[
    localize "STR_notifiers_success_type",
    localize "STR_notifiers_upgrade_assets_header",
    parseText format [localize "STR_notifiers_upgrade_assets_success", _name],
    30
] spawn SCRT_fnc_ui_showMessage;

// Notify players about successful upgrade
private _nameX = [_resourceSite] call A3A_fnc_localizar;
["TaskSucceeded", ["", format [localize "STR_notifiers_upgrade_assets_success", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];

Info_2("Resource Site %1 has been upgraded to level %2", _resourceSite, _newLevel);

// Update marker display to reflect new upgrade level
[_resourceSite] call A3A_fnc_mrkUpdate;

true