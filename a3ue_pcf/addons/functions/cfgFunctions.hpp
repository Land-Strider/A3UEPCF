class CfgFunctions 
{
    //be careful when overwriting functions as version updates can break your extension
    class A3A 
    {
        class init 
        {
            class initVarServer 
            {
                file = QPATHTOFOLDER(init\fn_initVarServer.sqf);
            };
        };

        class OrgPlayers {
            class unitTraits {
            file = QPATHTOFOLDER(OrgPlayers\fn_unitTraits.sqf);

            };
        };


        class Revive 
        {
            class selfRevive 
            {
                file = QPATHTOFOLDER(Revive\fn_selfRevive.sqf);
            };
        };        
    };
};
