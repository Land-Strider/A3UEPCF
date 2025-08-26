// note use of preInit & postInit will run for EVERY mission, use sparingly or with non a3a mission aborts in place, example check if the class (missionConfigFile >> "A3A") exists
class CfgFunctions 
{
    class A3A 
    {
        class SetupGUI 
        {
            class setupLoadgameTab 
            {
                file = QPATHTOFOLDER(functions\SetupGUI\fn_setupLoadgameTab.sqf);
            };
            class setupParamsTab {
                file = QPATHTOFOLDER(functions\SetupGUI\fn_setupParamsTab.sqf);
            };
        };
    };
};
