// Repairs a resource site.
// Parameter should be a resource site marker that is present in destroyedSites array
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_resourceSite"];

if !(_resourceSite in destroyedSites) exitWith { Error("Attempted to rebuild invalid resource site") };
Info_1("Repairing Resource Site %1", str _resourceSite);

// Remove from destroyed sites
destroyedSites = destroyedSites - [_resourceSite]; 
publicVariable "destroyedSites";

// Repair resource buildings at the site
private _resourcePosition = getMarkerPos _resourceSite;
private _resourceBuildings = nearestObjects [_resourcePosition, A3A_buildingWhitelist, 500, true];
{
    [_x] call A3A_fnc_repairRuinedBuilding;
} forEach _resourceBuildings;

// Notify players about successful rebuild
private _nameX = [_resourceSite] call A3A_fnc_localizar;
["TaskSucceeded", ["", format [localize "STR_notifiers_rebuild_assets_success", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];

Info_1("Resource Site %1 has been rebuilt", _resourceSite);
