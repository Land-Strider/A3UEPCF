#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        magazines[] = {QGVAR(LockpickKit_MultiUse), QGVAR(LockpickKit_SingleUse)};
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_events"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CBA_Extended_EventHandlers_base; // Needed for CfgVehicles.hpp

#include "\x\A3A\addons\ultimate\CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

class A3U
{
    #include "\x\A3A\addons\ultimate\config\plane\cfgPlaneLoadouts.hpp"
    #include "\x\A3A\addons\ultimate\config\cfgForbiddenItems.hpp"
    #include "\x\A3A\addons\ultimate\config\trader\cfgTraderMods.hpp"
};

class CfgMagazines
{
    #include "\x\A3A\addons\ultimate\CfgMagazines.hpp"
};

class CfgSounds
{
    #include "\x\A3A\addons\ultimate\CfgSounds.hpp"
};

class CfgEditorCategories
{
	class A3U_EditorCategory
	{
		displayName = "Antistasi Ultimate";
	};
};

class CfgEditorSubcategories
{
	class A3U_EditorSubcategoryStatics
	{
		displayName = "Static Holders";
	};
};

class CfgVehicles
{
    #include "\x\A3A\addons\ultimate\CfgVehicles.hpp"
};

class CfgMarkerClasses
{
    class A3AU_MRK
    {
        displayName="Antistasi Ultimate Markers";
    };
};

class CfgMarkers
{
    #include "\x\A3A\addons\ultimate\CfgMarkers.hpp"
};

class CfgMarkerColors
{
    #include "\x\A3A\addons\ultimate\CfgMarkerColors.hpp"
};