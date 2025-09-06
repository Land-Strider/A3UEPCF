#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("Entered the A3A_fnc_upgradeFactory function");
params ["_factorySite"];
Info_1("Starting upgrade for factory site: %1", _factorySite);
private _name = [_factorySite] call A3A_fnc_localizar;

// Check total rebel upgrades so far
private _totalUpgrades = missionNamespace getVariable ["A3UE_TotalRebelUpgrades", 0];

// Get current level and check maximum, also check total rebel factory upgrades count
private _currentLevel = missionNamespace getVariable [format["A3UE_FactoryUpgradeLevel_%1", _factorySite], 0];
private _maxLevel = 3;
private _totalRebelFactoryUpgrades = missionNamespace getVariable ["A3UE_TotalRebelFactoryUpgrades", 0];

if (_currentLevel >= _maxLevel) exitWith {
    Info_1("Factory %1 already at max level", _factorySite);
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
    Info_2("Not enough resources to upgrade %1. Need: %2", _factorySite, _upgradeCost);
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
missionNamespace setVariable [format["A3UE_FactoryUpgradeLevel_%1", _factorySite], _newLevel, true];

// Update master array - find and update the entry
private _factoryLevels = missionNamespace getVariable ["A3UE_FactoryLevels", []];
private _entryIndex = _factoryLevels findIf {(_x select 0) isEqualTo _factorySite};

if (_entryIndex >= 0) then {
    // Update existing entry
    (_factoryLevels select _entryIndex) set [1, _newLevel];
} else {
    // Add new entry if not found
    _factoryLevels pushBack [_factorySite, _newLevel];
};

missionNamespace setVariable ["A3UE_FactoryLevels", _factoryLevels, true];

// Update total upgrades count
missionNamespace setVariable ["A3UE_TotalRebelUpgrades", _totalUpgrades + 1, true];

// Update total rebel factory upgrades count
missionNamespace setVariable ["A3UE_TotalRebelFactoryUpgrades", _totalRebelFactoryUpgrades + 1, true];

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
private _nameX = [_factorySite] call A3A_fnc_localizar;
["TaskSucceeded", ["", format [localize "STR_notifiers_upgrade_assets_success", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];

Info_2("Factory Site %1 has been upgraded to level %2", _factorySite, _newLevel);

// Update marker display to reflect new upgrade level
[_factorySite] call A3A_fnc_mrkUpdate;

true