#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_core", "A3A_ultimate"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A 
{
    #include "Params.hpp"
    #if __A3_DEBUG__
        #include "CfgFunctions.hpp"
    #endif
};

#if __A3_DEBUG__
#else
    #include "CfgFunctions.hpp"
#endif