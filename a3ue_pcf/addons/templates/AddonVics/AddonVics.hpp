class AddonVics
{
    /*
    class Modset
    {
        path = QPATHTOFOLDER(Templates\AddonVics); // location of the addon file
        requiredAddons[] = {"ToDo: Find patches entry"}; // CfgPatchs class from the addon this is from
        files[] = { {"Civ", "d3s_Civ.sqf"} }; // the files this addon chould load, stucture is for each element: { side, file }
        Nodes[] {"d3s_Logi_Nodes.sqf"}; // compatibility file for logistics nodes (temporary pending switch to class based logistics data)
        displayName = ""; // name to be displayed in the campaign setup menu (to be implemented)
        description = ""; // a short description of the addon
        loadedMessage = ""; // a short description of the effects of loading the mod
    };
    */
    class RDS
    {
        path = QPATHTOFOLDER(Templates\AddonVics);
        requiredAddons[] = {"rds_A2_Civilians"};
        files[] = { {"Civ", "rds_Civ.sqf"} };
        Nodes[] = {"rds_Logi_Nodes.sqf"};
        displayName = "RDS Car pack";
        description = "A car pack that extends the civilian vehicle pool";
        loadedMessage = "RDS loaded, civilian car pool expanded";
    };
};
