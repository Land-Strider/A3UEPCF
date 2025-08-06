#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QDOUBLES(PREFIX,core)};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3U
{
    #include "config\cfgForbiddenItems.hpp"
    #include "config\plane\cfgPlaneLoadouts.hpp"
    #include "config\trader\cfgTraderMods.hpp"
};