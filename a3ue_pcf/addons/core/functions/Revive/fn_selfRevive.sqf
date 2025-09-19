/*
    A3A_fnc_selfRevive
    Attempt to self-revive the local player (needs FAK, 5min timeout) 

    // Credit: https://github.com/official-antistasi-community/A3-Antistasi/blob/unstable/A3A/addons/core/functions/Revive/fn_selfRevive.sqf

    No arguments, no return

    Environment: Player-local
*/

if !(player getVariable ["incapacitated", false]) exitWith {};

private _firstAidKits = ["FirstAidKit"] + (A3A_faction_reb get "firstAidKits");
private _hasFAKs = _firstAidKits arrayIntersect items player;

private _hintTitle = localize "STR_A3A_selfRevive_title";
if (_hasFAKs isEqualTo []) exitWith {
    [_hintTitle, localize "STR_A3A_selfRevive_noFAK"] call A3A_fnc_customHint;
};

if (time < player getVariable ["A3A_selfReviveTimeout", -1]) exitWith {
    [_hintTitle, localize "STR_A3A_selfRevive_recent"] call A3A_fnc_customHint;
};

// ok so now we actually do it...
player setVariable ["incapacitated", false, true];
player setDamage 0.5;
player removeItem selectRandom _hasFAKs;

// PCF Clean up any existing postprocess effect first
if (!isNil "A3A_selfRevivePPHandle") then {
    A3A_selfRevivePPHandle ppEffectEnable false;
    ppEffectDestroy A3A_selfRevivePPHandle;
    A3A_selfRevivePPHandle = nil;
};

// PCF Terminate any existing timer
if (!isNil "A3A_selfRevivePPTimer") then {
    terminate A3A_selfRevivePPTimer;
    A3A_selfRevivePPTimer = nil;
};

// PCF Medic Role shorter revive cooldown start
private _type = typeOf player;
private _timeout = missionNamespace getVariable ["A3A_selfReviveTimeout", 300];

if (_type isEqualTo "I_G_medic_F") then {
    player setVariable ["A3A_selfReviveTimeout", (_timeout - PCF_MoreRoleSpecializations) + time];
} else {
    player setVariable ["A3A_selfReviveTimeout", _timeout + time];
};
// PCF Medic Role shorter revive cooldown end

[_hintTitle, localize "STR_A3A_selfRevive_success"] call A3A_fnc_customHint;

private _aimCoef = missionNamespace getVariable ["A3A_selfReviveAimCoef", 3];
player setCustomAimCoef _aimCoef;

// Some bog standard desaturation
private _handle = ppEffectCreate ["ColorCorrections", 1537];
_handle ppEffectEnable true;
_handle ppEffectAdjust [1, 1, 0,
	[0, 0, 0, 0],
	[1, 1, 1, 0.5],
	[0.299, 0.587, 0.114, 0]
];
_handle ppEffectCommit 5;
A3A_selfRevivePPHandle = _handle;

// PCF Store the timer handle so we can terminate it if needed
A3A_selfRevivePPTimer = 300 spawn {
    sleep _this;
    [false] call A3A_fnc_selfReviveReset;
    A3A_selfRevivePPTimer = nil;
};