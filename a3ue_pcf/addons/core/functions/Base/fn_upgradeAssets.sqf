#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_site", "_position"];

private _leave = false;
private _resourceDead = "";
private _factoryDead = "";
private _resourceToUpgrade = "";
private _factoryToUpgrade = "";

private _positionholder = _position; // To avoid unused variable warning

Info("Entered the A3A_fnc_upgradeAssets function");

/*PCF Turned off till upgrade function is implemented first. Later will be used to check if the site needs rebuilding first on an upgrade click
// Check if this is a destroyed resource site
if (_site in resourcesX && _site in destroyedSites) then {
	_resourceDead = _site;
};

// Check if this is a destroyed factory site
if (_site in factories && _site in destroyedSites) then {
	_factoryDead = _site;
};
*/

// Check if this is a resource to upgrade
if (_site in resourcesX) then {
	_resourceToUpgrade = _site;
};
// Check if this is a factory to upgrade
if (_site in factories) then {
	_factoryToUpgrade = _site;
};


switch (true) do {
	Info("Entered the switch case");
		case (_resourceToUpgrade != ""): {
			Info("calling the A3A_fnc_upgradeResource");
			[_resourceToUpgrade] remoteExecCall ["A3A_fnc_upgradeResource", 2];

			// Add a local debug call to verify function exists
			if (isNil "A3A_fnc_upgradeResource") then {
			Info("Error: A3A_fnc_upgradeResource function not found!");
			};
		};

		case (_factoryToUpgrade != ""): {
			Info("calling the A3A_fnc_upgradeFactory");
			[_factoryToUpgrade] remoteExec ["A3A_fnc_upgradeFactory", 2];

			// Add a local debug call to verify function exists
			if (isNil "A3A_fnc_upgradeFactory") then {
			Info("Error: A3A_fnc_upgradeFactory function not found!");
			};
		};

	default {
		[
			"Couldn't find a factory or resource to upgrade!",
			30
		] spawn SCRT_fnc_ui_showMessage;
	};
};