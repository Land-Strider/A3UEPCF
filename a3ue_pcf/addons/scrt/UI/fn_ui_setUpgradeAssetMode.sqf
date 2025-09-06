//Keeping the old static cost define for reference
//#define COST 10000
upgradeAssetCost = (1 + (missionNamespace getVariable ["A3UE_TotalRebelUpgrades", 0])) * PCF_ResourceUpgradeCost;

["hqMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_hqTabUpgradeEventHandler;

[
    localize "STR_notifiers_info_type",
    localize "STR_notifiers_upgrade_assets_header",  
    parseText format [(localize "STR_notifiers_upgrade_assets_info"), str upgradeAssetCost, A3A_faction_civ get "currencySymbol"], 
    60
] spawn SCRT_fnc_ui_showMessage;