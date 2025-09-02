// Repairs a factory site.
// Parameter should be a factory site marker that is present in destroyedSites array
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_factorySite"];

if !(_factorySite in destroyedSites) exitWith { Error("Attempted to rebuild invalid factory site") };
Info_1("Repairing Factory Site %1", str _factorySite);

// Remove from destroyed sites
destroyedSites = destroyedSites - [_factorySite]; 
publicVariable "destroyedSites";

// Repair factory buildings at the site
private _factoryPosition = getMarkerPos _factorySite;
private _factoryBuildings = nearestObjects [_factoryPosition, A3A_buildingWhitelist, 500, true];
{
    [_x] call A3A_fnc_repairRuinedBuilding;
} forEach _factoryBuildings;

// Notify players about successful rebuild
private _nameX = [_factorySite] call A3A_fnc_localizar;
["TaskSucceeded", ["", format [localize "STR_notifiers_rebuild_assets_success", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];

Info_1("Factory Site %1 has been rebuilt", _factorySite);
