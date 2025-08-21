params ["_siteX"];

private _pos = getMarkerPos _siteX;
private _textX = "";

if (_siteX in citiesX) then {
	_textX = format ["%1",_siteX];
} else {
	private _city = [citiesX, _pos] call BIS_fnc_nearestPosition;

	switch (true) do {
		case (_siteX in "Synd_HQ"): {
			_textX = format [localize "STR_localizar_Synd_HQ"];
		};
		case (_siteX in airportsX): {
			_textX = format [localize "STR_localizar_airbase",_city];
		};
		case (_siteX in milbases): {
			_textX = format [localize "STR_localizar_milbase",_city];
		};
		case (_siteX in resourcesX): {
			_textX = format [localize "STR_localizar_resource",_city];
		};
		case (_siteX in factories): {
			_textX = format [localize "STR_localizar_factory",_city];
		};
		case (_siteX in outposts): {
			_textX = format [localize "STR_localizar_outpost",_city];
		};
		case (_siteX in seaports): {
			if (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker", "sefrouramal"]) then {
				_textX = format [localize "STR_localizar_riverport",_city];
			} else {
				_textX = format [localize "STR_localizar_seaport",_city];
			};
		};
		case (_siteX in controlsX): {
			if (isOnRoad getMarkerPos _siteX) then {
				_textX = format [localize "STR_localizar_roadblock",_city];
			} else {
				_textX = format [localize "STR_localizar_outskirts",_city];
			};
		};
		case (_siteX in milAdministrationsX): {
			_textX = format [localize "STR_milAdministration",_city];
		};
		case (_siteX == "CSAT_carrier");
		case (_siteX == "NATO_carrier"): {
			_textX = localize "STR_localizar_supportcorridor";
		};
	};
};


_textX