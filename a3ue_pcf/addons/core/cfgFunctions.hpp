class CfgFunctions 
{
    //be careful when overwriting functions as version updates can break your extension
    class A3A 
    {
        class Base 
        {
            class localizar 
            {
                file = QPATHTOFOLDER(functions\Base\fn_localizar.sqf);
            };
            class mrkUpdate {
                file = QPATHTOFOLDER(functions\Base\fn_mrkUpdate.sqf);
            };
        };
        class init 
        {
            class initVarServer 
            {
                file = QPATHTOFOLDER(functions\init\fn_initVarServer.sqf);
            };
            
            class initClient
            {
                file = QPATHTOFOLDER(functions\init\fn_initClient.sqf);
            };
        };

        class OrgPlayers {
            class unitTraits {
                file = QPATHTOFOLDER(functions\OrgPlayers\fn_unitTraits.sqf);
            };
        };


        class Revive 
        {
            class selfRevive 
            {
                file = QPATHTOFOLDER(functions\Revive\fn_selfRevive.sqf);
            };
        };

        class Dialogs 
        {
            class fastTravelRadio 
            {
                file = QPATHTOFOLDER(functions\Dialogs\fn_fastTravelRadio.sqf);
            };
        };

        class reload_repack_turret_magazines {
            file = QPATHTOFOLDER(Scripts\RRTurretMagazines\scripts);
            //class postInit {};
            class reloadTurret {};
            class monitorMagazines {};
        };
    };
};
