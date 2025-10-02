#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_site", "_position"];

private _leave = false;
private _antennaDead = objNull;

// PCF Start Variables Definition
private _economyDead = "";
private _repairTypes = ["Building", "House"];
// PCF Definition END

if (_site in outposts) then {
	_antennasDead = antennasDead select {_x inArea _site};
	if (count _antennasDead > 0) then {
		_antennaDead = _antennasDead select 0;
	};
};

// PCF Start
// Check if this is a destroyed economy site
if ((_site in factories || _site in resourcesX) && _site in destroyedSites) then {
	_economyDead = _site;
	Debug_1("Rebuilding Economic Site %1", str _economyDead);
};
// PCF END

switch (true) do {
	case (_site in citiesX): {
		[0, 10, _position] remoteExec ["A3A_fnc_citySupportChange",2];
		[Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
		[Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];

		destroyedSites deleteAt(destroyedSites find _site);
		publicVariable "destroyedSites";

		private _name = [_site] call A3A_fnc_localizar;
		[
			localize "STR_notifiers_success_type",
			localize "STR_notifiers_rebuild_assets_header",
			parseText format [localize "STR_notifiers_rebuild_assets_success", _name],
			30
		] spawn SCRT_fnc_ui_showMessage;
	};
	// PCF Start
	// Repair economy site
	case (PCF_EnableResourceRebuild && _economyDead != ""): {
		private _buildings = nearestObjects [_position, _repairTypes, 250,  true];
		Debug_1("Found %1 to repair", str _economyDead);
		{
			[_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2]; // Repair each building
		} forEach _buildings;
		Debug_1("Calling A3A_fnc_rebuildEconomicAssets for %1", str _economyDead);
		Debug_1("Function type check: %1", typeName A3A_fnc_rebuildEconomicAssets);
		[_economyDead] remoteExec ["A3A_fnc_rebuildEconomicAssets", 2];

		private _name = [_site] call A3A_fnc_localizar;
		[
			localize "STR_notifiers_success_type",
			localize "STR_notifiers_rebuild_assets_header",
			parseText format [localize "STR_notifiers_rebuild_assets_success", _name],
			30
		] spawn SCRT_fnc_ui_showMessage;
	};
	// PCF END

	case (!isNull _antennaDead): {
		private _militaryBuildings = nearestObjects [_position, A3A_buildingWhitelist, 500,  true];

		{
			[_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2]; 
		} forEach _militaryBuildings;

		[_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];

		private _name = [_site] call A3A_fnc_localizar;
		[
			localize "STR_notifiers_success_type",
			localize "STR_notifiers_rebuild_assets_header",
			parseText format [localize "STR_notifiers_rebuild_assets_radiotower_success", _name],
			30
		] spawn SCRT_fnc_ui_showMessage;
	};

	default {
		private _militaryBuildings = nearestObjects [_position, A3A_buildingWhitelist, 500,  true];
		private _Buildings = nearestObjects [_position, _repairTypes, 500,  true];

		{
			[_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
		} forEach (_militaryBuildings + _Buildings);

		private _name = [_site] call A3A_fnc_localizar;
		[
			localize "STR_notifiers_success_type",
			localize "STR_notifiers_rebuild_assets_header",
			parseText format [localize "STR_notifiers_rebuild_assets_success", _name],
			30
		] spawn SCRT_fnc_ui_showMessage;
	};
};

[0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
