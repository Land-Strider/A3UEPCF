    /*
        Each addon entry can use these values:
        addons[] = {};
        weapons = traderWeapons entry;
        vehicles = traderVehicles entry;

        Essentially, this is the core file. It links to other files.
    */
    
    class addons_vanilla : addons_base
    {
        addons[] = {"A3_Armor_F", "A3_Weapons_F"};
        weapons = "my_extension_weapons_vanilla";
        vehicles = "my_extension_vehicles_vanilla";
    };