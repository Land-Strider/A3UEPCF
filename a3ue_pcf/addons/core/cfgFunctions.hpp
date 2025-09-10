class CfgFunctions 
{
    //be careful when overwriting functions as version updates can break your extension
    class A3A 
    {
        class Base 
        {
            class distance 
            {
                file = QPATHTOFOLDER(functions\Base\fn_distance.sqf);
            };

            class garbageCleaner 
            {
                file = QPATHTOFOLDER(functions\Base\fn_garbageCleaner.sqf);
            };

            class localizar 
            {
                file = QPATHTOFOLDER(functions\Base\fn_localizar.sqf);
            };

            class markerChange {
                file = QPATHTOFOLDER(functions\Base\fn_markerChange.sqf);
            };

            class mrkUpdate {
                file = QPATHTOFOLDER(functions\Base\fn_mrkUpdate.sqf);
            };

            class rebuildAssets {
                file = QPATHTOFOLDER(functions\Base\fn_rebuildAssets.sqf);
            };
            
            class rebuildResource {
                file = QPATHTOFOLDER(functions\Base\fn_rebuildResource.sqf);
            };

            class rebuildFactory {
                file = QPATHTOFOLDER(functions\Base\fn_rebuildFactory.sqf);
            };

            class upgradeAssets {
                file = QPATHTOFOLDER(functions\Base\fn_upgradeAssets.sqf);
            };

            class upgradeFactory {
                file = QPATHTOFOLDER(functions\Base\fn_upgradeFactory.sqf);
            };

            class upgradeResource {
                file = QPATHTOFOLDER(functions\Base\fn_upgradeResource.sqf);
            };
        };
        class Dialogs 
        {
            class fastTravelRadio 
            {
                file = QPATHTOFOLDER(functions\Dialogs\fn_fastTravelRadio.sqf);
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

            class resourcecheck
            {
                file = QPATHTOFOLDER(functions\init\fn_resourcecheck.sqf);
            };
        };

        class Missions {
            class convoy {
                file = QPATHTOFOLDER(functions\Missions\fn_convoy.sqf);
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
        class Save 
        {
            class LoadServer 
            {
                file = QPATHTOFOLDER(functions\Save\fn_LoadServer.sqf);
            };

            class saveLoop 
            {
                file = QPATHTOFOLDER(functions\Save\fn_saveLoop.sqf);
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
