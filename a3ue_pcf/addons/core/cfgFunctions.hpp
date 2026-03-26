class CfgFunctions 
{
    //be careful when overwriting functions as version updates can break your extension
    class A3A {
        class Base {
            class distance {
                file = \x\a3ue_pcf\addons\core\functions\Base\fn_distance.sqf;
            };
            class localizar {
                file = \x\a3ue_pcf\addons\core\functions\Base\fn_localizar.sqf;
            };
            class markerChange {
                file = \x\a3ue_pcf\addons\core\functions\Base\fn_markerChange.sqf;
            };
            class mrkUpdate {
                file = \x\a3ue_pcf\addons\core\functions\Base\fn_mrkUpdate.sqf;
            };
            class upgradeAssets {
                file = \x\a3ue_pcf\addons\core\functions\Base\fn_upgradeAssets.sqf;
            };
            class upgradeFactory {
                file = \x\a3ue_pcf\addons\core\functions\Base\fn_upgradeFactory.sqf;
            };
            class upgradeResource {
                file = \x\a3ue_pcf\addons\core\functions\Base\fn_upgradeResource.sqf;
            };
        };

        class Dialogs {
            class fastTravelRadio {
                file = \x\a3ue_pcf\addons\core\functions\Dialogs\fn_fastTravelRadio.sqf;
            };
        };

        class init {
            class initVarServer {
                file = \x\a3ue_pcf\addons\core\functions\init\fn_initVarServer.sqf;
            };
            class initClient {
                file = \x\a3ue_pcf\addons\core\functions\init\fn_initClient.sqf;
            };
            class resourcecheck {
                file = \x\a3ue_pcf\addons\core\functions\init\fn_resourcecheck.sqf;
            };
        };

        class Missions {
            class convoy {
                file = \x\a3ue_pcf\addons\core\functions\Missions\fn_convoy.sqf;
            };
        };

        class OrgPlayers {
            class unitTraits {
                file = \x\a3ue_pcf\addons\core\functions\OrgPlayers\fn_unitTraits.sqf;
            };
        };

        class Revive {
            class selfRevive {
                file = \x\a3ue_pcf\addons\core\functions\Revive\fn_selfRevive.sqf;
            };
        };

        class Save {
            class loadServer {
                file = \x\a3ue_pcf\addons\core\functions\Save\fn_loadServer.sqf;
            };
            class loadStat {
                file = \x\a3ue_pcf\addons\core\functions\Save\fn_loadStat.sqf;
            };
            class saveLoop {
                file = \x\a3ue_pcf\addons\core\functions\Save\fn_saveLoop.sqf;
            };
        };

        // class reload_repack_turret_magazines {
        //     file = \x\a3ue_pcf\addons\core\Scripts\RRTurretMagazines\scripts;
        //     //class postInit {};
        //     class reloadTurret {};
        //     class monitorMagazines {};
        // };
    };
};
