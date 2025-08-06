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

//the pre proccessor ifs are there to make sure we overwrite/add to the correct config
class A3A 
{
    #if __A3_DEBUG__
        #include "CfgFunctions.hpp"
    #endif
};

#if __A3_DEBUG__
#else
    #include "CfgFunctions.hpp"
#endif
