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

class A3A 
{
    #include "Templates.hpp"
    #include "CfgLogistics.hpp" //this should be at the end of the config.cpp as it will redefine the macro ADDON
};

#include "CfgMarkers.hpp"