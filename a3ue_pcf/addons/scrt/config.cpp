#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "defines.hpp"
#include "UILayouts\commanderMenu.hpp"
#include "UILayouts\rebelMenu.hpp"
#include "UILayouts\menu.hpp"

#if __A3_DEBUG__
    class A3A {
        #include "CfgFunctions.hpp"
    };
#else
    #include "CfgFunctions.hpp"
#endif
