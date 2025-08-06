class CfgFunctions 
{
    //be careful when overwriting functions as version updates can break your extension
    class A3A 
    {
        class Missions 
        {
            class AS_Official 
            {
                file = QPATHTOFOLDER(Missions\fn_as_Official.sqf);
            };
        };
    };

    //your own functions should be kept here
    class ADDON
    {
        class Events 
        { //these two functions are used to demonstrate use of events
            file = QPATHTOFOLDER(Events);
            class addExampleEventListener { postInit = 1; };
            class AIVehInit {};
        };
    };
};
