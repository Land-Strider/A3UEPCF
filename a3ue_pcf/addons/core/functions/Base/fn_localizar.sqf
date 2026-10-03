if !assert(params[
    ["_siteX", nil, [""]]
]) exitWith {""};

// Early exits for simple site names
if (_siteX in citiesX) exitWith { _siteX };
if (_siteX == "Synd_HQ") exitWith { localize "STR_a3ue_pcf_localizar_Synd_HQ" };
if (_siteX in ["CSAT_carrier", "NATO_carrier"]) exitWith { localize "STR_a3ue_pcf_localizar_supportcorridor" };

// Watchposts handling (appends nearest city name)
if (_siteX in watchpostsFIA) exitWith {
    private _pos = getMarkerPos _siteX;
    private _city = [citiesX, _pos] call BIS_fnc_nearestPosition;
    format [localize "STR_a3ue_pcf_localizar_watchpost", _city];
};

[_siteX, true] call A3A_fnc_getLocationName;