#define MAINPREFIX x
#include "mod_name.hpp"

#include "common.inc"

#include "script_version.hpp"
#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define REQUIRED_VERSION 2.06

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT)
#endif

#ifndef AUTHOR
    #define AUTHOR "Antistasi Dev Team"
#endif
#ifndef AUTHORS
// sepperate authors with a comma
    #define AUTHORS "Antistasi Dev Team"
#endif

#include "script_macros.hpp"

#define CPATHTO_SYS(var1,var2,var3) MAINPREFIX\##var1\SUBPREFIX\##var2\##var3
#define CPATHTO(var1) CPATHTO_SYS(MODFOLDER,COMPONENT,var1)
#define QCPATHTO(var1) QUOTE(CPATHTO(var1))

#define ECPATHTO(var1,var2) CPATHTO_SYS(MODFOLDER,var1,var2)
#define EQCPATHTO(var1,var2) QUOTE(ECPATHTO(var1,var2))

#define PATHTOFOLDER_SYS(var1,var2,var3) \MAINPREFIX\##var1\SUBPREFIX\##var2\##var3
#define PATHTOFOLDER(var1) PATHTOFOLDER_SYS(MODFOLDER,COMPONENT,var1)
#define QPATHTOFOLDER(var1) QUOTE(PATHTOFOLDER(var1))

#define EPATHTOFOLDER(var1,var2) PATHTOFOLDER_SYS(MODFOLDER,var1,var2)
#define EQPATHTOFOLDER(var1,var2) QUOTE(EPATHTOFOLDER(var1,var2))
