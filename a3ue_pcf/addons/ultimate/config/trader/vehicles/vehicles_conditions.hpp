#define VEHICLE_CONDITION_AA (["seaports_1"] call A3U_fnc_hasRequirements || ["resources_3"] call A3U_fnc_hasRequirements) && ["factories_3"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_APC (["seaports_1"] call A3U_fnc_hasRequirements || ["resources_3"] call A3U_fnc_hasRequirements) && ["factories_3"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_ARMEDCAR ["resources_3"] call A3U_fnc_hasRequirements && ["factories_3"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_ARTILLERY ["resources_3"] call A3U_fnc_hasRequirements && ["factories_3"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_BOAT ["seaports_1"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_HELI (["airports_1"] call A3U_fnc_hasRequirements || ["milbases_1"] call A3U_fnc_hasRequirements) && ["factories_3"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_PLANE ["airports_1"] call A3U_fnc_hasRequirements && ["factories_5"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_STATICAA ["warlevel_3"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_STATICAT ["warlevel_3"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_STATICMG ["warlevel_3"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_STATICMORTAR ["warlevel_3"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_TANK ["milbases_1"] call A3U_fnc_hasRequirements && ["factories_5"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_UAV ["airports_1"] call A3U_fnc_hasRequirements && ["factories_3"] call A3U_fnc_hasRequirements

#define VEHICLE_CONDITION_UNARMEDCAR ["resources_1"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements

// Note that these may change in the future so be sure to maintain parity with the main ultimate mod