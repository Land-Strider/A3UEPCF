//redefine the addon macro so we can use a3a tools for nodes and cargo
#ifdef ADDON
#undef ADDON
#endif
#define ADDON A3A_Logistics

class DOUBLES(ADDON,Nodes) 
{
    class TRIPLES(ADDON,Nodes,Base); //import base class from antistasi
    #include "Logistics\ModNameNodes.hpp" //include the nodes from the different mods here
};

class DOUBLES(ADDON,Cargo) 
{
    class TRIPLES(ADDON,Cargo,Base); //import base class from antistasi
    #include "Logistics\ModNameCargo.hpp" //include the cargo from the different mods here
};

//redefine the proper addon macro
#undef ADDON
#define ADDON DOUBLES(PREFIX,COMPONENT)
