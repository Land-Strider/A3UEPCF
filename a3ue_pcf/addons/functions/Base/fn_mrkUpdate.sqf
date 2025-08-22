#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _mrkD = format ["Dum%1",_marker];
private _mrkSide = sidesX getVariable _marker;
private _faction = Faction(_mrkSide);

if (_marker in airportsX) then {
    _mrkD setMarkerTypeLocal (_faction get "flagMarkerType");
    _mrkD setMarkerColorLocal "Default";
} else {
    if (_marker in destroyedSites and _marker in citiesX) exitWith { _mrkD setMarkerColorLocal "ColorBlack" };
    if (_mrkSide == teamPlayer) exitWith {
        if (_marker in milbases) then {
            _mrkD setMarkerTypeLocal "n_hq";
        };
        if (_marker in seaports) then {
            _mrkD setMarkerTypeLocal "n_naval";
        };
        _mrkD setMarkerColorLocal colorTeamPlayer;
    };

    if (_marker in milbases) then {
        private _markerType = if (_mrkSide == Invaders) then {"o_hq"} else {"b_hq"};
        _mrkD setMarkerTypeLocal _markerType;
    };
    if (_marker in seaports) then {
        private _markerType = if (_mrkSide == Invaders) then {"o_naval"} else {"b_naval"};
        _mrkD setMarkerTypeLocal _markerType;
    };

    _mrkD setMarkerColorLocal ([colorOccupants, colorInvaders] select (_mrkSide == Invaders));
};

private _mrkText = call {
    private _nearestTown = [citiesX, _marker] call BIS_Fnc_nearestPosition;
    if (_marker in airportsX) exitWith { format [localize "STR_airbase", _faction get "name", _nearestTown] };
    if (_marker in outposts) exitWith { format [localize "STR_outpost", _faction get "name", _nearestTown] };
    if (_marker in resourcesX) exitWith {format [localize "STR_resources", _nearestTown]};
    if (_marker in factories) exitWith {format [localize "STR_factory", _nearestTown]};
    if (_marker in milbases) exitWith { format [localize "STR_milbase", _faction get "name", _nearestTown] };
    if (_marker in seaports) exitWith {
        if (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker"]) then {
            format [localize "STR_port_river", _nearestTown]
        } else {
            format [localize "STR_port_sea", _nearestTown]
        };
    };
    ""; // city
};

if (_mrkSide == teamPlayer) then {
    private _numTroops = count (garrison getVariable [_marker, []]);
    private _limit = [_marker] call A3A_fnc_getGarrisonLimit;
    if (_numTroops > 0) then {
        _mrkText = format ["%1: %2%3",
            _mrkText,
            _numTroops,
            if (_limit != -1) then {format ["/%1", _limit]} else {""}
        ];
    };
};
_mrkD setMarkerText _mrkText;
