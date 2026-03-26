class Params
{
    class AllParams {};

    // class AIParams : AllParams { type = "AI"; };
    // class RebelBalanceParams : AIParams { type = "RebelBalance"; };

    //     class limitedFT: RebelBalanceParams
    //     {
    //         title = $STR_params_allowFT;
    //         tooltip = $STR_params_allowFT_desc;
    //         values[] = {0,1,2,3,4}; // PCF 3rd option added as strongholds and watchposts only
    //         texts[] = {$STR_params_allowFT_0, $STR_params_allowFT_1, $STR_params_allowFT_2, $STR_a3ue_pcf_params_allowFT_3, $STR_params_civ_traffic_none};
    //         class difficulty
    //         {
    //             class solo
    //             {
    //                 easy = 0;
    //                 medium = 1;
    //                 hard = 3;
    //             };
    //             class small
    //             {
    //                 easy = 0;
    //                 medium = 2;
    //                 hard = 3;
    //             };
    //             class medium : small {};
    //             class large
    //             {
    //                 easy = 1;
    //                 medium = 2;
    //                 hard = 3;
    //             };
    //         };
    //         default = 0;
    //         lockInGame = 1;
    //         class dependencies
    //         {
    //             class fastTravelEnemyCheck
    //             {
    //                 value = 3;
    //                 lockedByDependency = 1;
    //             };
    //         };
    // };

    // class BuilderParams : AllParams { type = "Builder"; };
    //     class maxConstructions: BuilderParams
    //     {
    //         title = $STR_params_maxConstructions;
    //         tooltip = $STR_params_maxConstructions_desc;
    //         values[] = {0,50,100,250,355,500,750,1000,5000};                    //PCF added 500, 750, 1000 and 5000.
    //         texts[] = {"0","50","100","250","355","500","750","1000","5000"};   //PCF added 500, 750, 1000 and 5000.
    //         default = 100;
    //     };

    class ExtenderParams : AllParams {};
        // PCF Params start
        class PCF_ParametersSpacer1 : AllParams {};
        class TitlePCF : ExtenderParams
        {
            title = $STR_a3ue_pcf_dialogs_setup_params_pcf_label;
        };
        class PCF_LimitedFTDepartureDistance : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_limitedFT_departure_distance;
            values[] = {25,50,75,100,150};
            texts[]  = {"25","50","75","100","150"};
            default  = 50;
            lockOnSave = 0;
        };
        class PCF_ExtendedTraits : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_extended_traits;
            values[] = {0,1};
            texts[]  = {"No","Yes"};
            default  = 1;
            lockOnSave = 0;
        };
        class PCF_MoreRoleSpecializations : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_more_role_specializations;
            values[] = {0,60,120,180,240};
            texts[]  = {"5","4","3","2","1"};
            default  = 120;
            lockOnSave = 0;
        };
        class PCF_EnableResourceUpgrade : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_enable_resource_upgrade;
            values[] = {0,1};
            texts[]  = {"No","Yes"};
            default  = 1;
            lockOnSave = 1;
        };
        class PCF_ResourceUpgradeCost : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_resource_upgrade_cost;
            values[] = {3000,5000,10000,15000,20000};
            texts[]  = {"3000","5000","10000","15000","20000"};
            default  = 10000;
            lockOnSave = 0;
        };
        class PCF_ConvoyStartDelay : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_convoy_start_delay;
            values[] = {1,2,3,4,5};
            texts[]  = {"5 /10 (Default)","10 / 15","15 / 20","20 / 25","25 / 30"};
            default  = 2;
            lockOnSave = 0;
        };
        class PCF_AAPostSpawnDistance : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_aa_post_spawn_distance;
            values[] = {1,2,3,4,5};
            texts[]  = {"1x","2x","3x","4x","5x"};
            default  = 2;
            lockOnSave = 0;
        };
        class PCF_MapMarkerVerboseName : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_map_marker_verbose_name;
            values[] = {0,1};
            texts[]  = {"No","Yes"};
            default  = 1;
            lockOnSave = 0;
        };
        class PCF_EmplacementShortName : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_emplacement_short_name;
            values[] = {0,1};
            texts[]  = {"No","Yes"};
            default  = 1;
            lockOnSave = 0;
        };
        class PCF_hrGainMultiplier : ExtenderParams
        {
            title = $STR_a3ue_pcf_params_hr_gain_multiplier;
            values[] = {25,50,75,100,125,150,200};
            texts[]  = {"25%","50%","75%","100%","125%","150%","200%"};
            default  = 100;
            lockOnSave = 0;
        };
        class PCF_ParametersSpacer2 : AllParams {};
        // PCF Params end
};
