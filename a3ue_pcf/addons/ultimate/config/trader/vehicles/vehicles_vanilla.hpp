/*
    VEHICLE_TYPE = What type the vehicle is.
        types : ['AA', 'APC', 'ARMEDCAR', 'ARTILLERY', 'BOAT', 'HELI', 'PLANE', 'STATICAA', 'STATICAT', 'STATICMG', 'STATICMORTAR', 'TANK', 'UAV', 'UNARMEDCAR']

    VEHICLE_CONDITION = Condition to show.
        VEHICLE_CONDITION_X : VEHICLE_CONDITION + VEHICLE_TYPE

    VEHICLE_CONDITION_X can also be replaced with a string to add your own condition.

    ITEM(CLASSNAME, PRICE, VEHICLE_TYPE, VEHICLE_CONDITION_X);
*/

class my_extension_vehicles_vanilla : vehicles_base
{
    ITEM(B_Quadbike_01_F, 0, ARMEDCAR, VEHICLE_CONDITION_ARMEDCAR);
};