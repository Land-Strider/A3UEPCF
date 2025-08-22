class CfgFunctions 
{
    //be careful when overwriting functions as version updates can break your extension
    class A3A 
    {
        class Base 
        {
            class localizar 
            {
                file = QPATHTOFOLDER(Base\fn_localizar.sqf)
            };
            class mrkUpdate {
                file = QPATHTOFOLDER(Base\fn_mrkUpdate.sqf)
            };
        };
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

        class Dialogs 
        {
            class fastTravelRadio 
            {
                file = QPATHTOFOLDER(Dialogs\fn_fastTravelRadio.sqf);
            };
        };
            
    };
};
