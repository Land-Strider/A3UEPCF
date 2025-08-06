/*
passed output from the function: A3A_Logistics_fnc_generateCargoOffset

Example of a function call
[
    _vehicle,                //the vehicle object that will load the cargo (needs to have nodes defined)
    _cargo,                //the object your defining as a valid cargo
    [
        _offset,            //cargos custom offset from the vehicle node, Array of 3 numbers
        _rotation,          //the cargo rotation, Array of 3 numbers
        _size,              //the size of the cargo (how many nodes it requires)
        _isWeapon,          //if the cargo is a weapon (static weapon like a turret)
        _recoil            //the recoil of the weapon (if it is one)
    ],
    _modelBased             //if the output should use the model or the class name
] call A3A_Logistics_fnc_generateCargoOffset;

example output bellow, you can modify it as you'd like by for example adding a blacklist as shown, rest can be modified in the arguments of the function when the data is generated.
*/

class Example_A3_static_f_Mortar_01_Mortar_01_F : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {-0.1,-0.5,0.74};
    rotation[] = {0,1,0};
    size = 2;
    recoil = 2000;
    isWeapon = 1;
    blackList[] = {"\A3\boat_f_gamma\Boat_Civil_01\Boat_Civil_01_F","\A3\boat_f\Boat_Transport_01\Boat_Transport_01_F.p3d","\A3\Boat_F_Exp\Boat_Transport_02\Boat_Transport_02_F.p3d"};
};