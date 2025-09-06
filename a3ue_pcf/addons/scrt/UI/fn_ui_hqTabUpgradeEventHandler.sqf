params ["_mode"];

if(_mode isEqualTo "ADD") then {
    [
        "hqMap",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            private _site = [markersX, _pos] call BIS_fnc_nearestPosition;
            if (getMarkerPos _site distance _pos > 50) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_upgrade_assets_header",  
                    parseText (localize "STR_notifiers_rebuild_assets_friendly_marker"), 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            private _side = sidesX getVariable [_site, sideUnknown];
            if (_side != teamPlayer) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_upgrade_assets_header",  
                    parseText format [localize "STR_notifiers_rebuild_assets_not_belong", A3A_faction_reb get "name"], 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };
            
            // This shouldn't be needed anymore, keeping till confirmed unneeded
            /* private _resourcesFIA = server getVariable "resourcesFIA";
            if (_resourcesFIA < 10000) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_upgrade_assets_header",  
                    parseText format [localize "STR_notifiers_upgrade_assets_not_enough_money", A3A_faction_civ get "currencySymbol"], 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            }; */

            [_site, _pos] call A3A_fnc_upgradeAssets;
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["hqMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};