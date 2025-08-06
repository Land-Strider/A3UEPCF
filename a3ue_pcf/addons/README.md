- Read this file on github for nice formatting.

- Note: This is for Antistasi Ultimate 10.9.0+

    - This guide will not work on versions of Antistasi Ultimate below 10.9.0.
    
# Adding things to the Arms Dealer.

- When referencing `my_extension`, this can be whatever you want to (or have) called it. Keep it short and simple!

- When referencing `something_mod`, this will be the name of the mod that you're using to do something.

    - For example, if I am creating a weapon stock for RHS, I would name the class `addons_rhs`

- To start, you'll want to add a new entry in `ultimate/config/trader/cfgTraderAddons.hpp` and create a new class.

    - It is recommended to call this class `addons_mod`.

        - Make sure this class inherits from `addons_base`. Use the existing entry as an example.

    - This will allow you to link addons to the weapon and vehicle dealers respectively.

    - You do not need to link both weapon and vehicle entries, you can have a class that only adds weapons or vehicles.

    - Make sure that the `addons[]` entry correctly lists the CfgPatches entries that your weapons/vehicles needs in order to work.

        - You can use the config viewer to find these. [Advanced Developer Tools](https://steamcommunity.com/sharedfiles/filedetails/?id=2369477168) makes this much easier by allowing you to search for CfgPatches and specific entries.

            - An alternate way to do this (at least for vehicles) is to place down the object in the editor, right click on it and find in config viewer. At the bottom it should list the "addons" it requires, pick the one that relates most to the addon it comes from.

## Weapons

- Navigate to `hals/Addons/config.hpp`

    - This is where you create the "stock". It essentially links weapon categories.

    - Start by creating a new .hpp file in `config`. Ideally name it something unique, the mod name usually also works fine.

        - `mod.hpp`

        - Use the `vanilla.hpp` file in `config` as a basis for your new file.

        - This file handles the items that are added to your "stock".

        - A good practice when adding weapons is to leave the classname of the magazine you want that weapon to use as a comment on the same line as that weapon for when you get to the magazine config.

        - Fill in each class as you see fit and delete classes you don't need.

    - Once you've done your `mod.hpp` file, you can now add a new "stock" entry in the main `config.hpp` under the following config path `cfgHALsStore >> stores >> my_extension_stock_mod`

        - Make sure to `#include` your `mod.hpp` file in `cfgHALsStore >> categories`

        - Make sure that the `categories[]` value correctly lists each class in your `mod.hpp` file. Use the `config/vanilla.hpp` and `config.hpp >> my_extension_stock_vanilla` entries as a guide for this if you get stuck.

### Linking the "stock"

- Now that you have a class called `my_extension_stock_mod` that links each class, you can move onto allowing the game to load your "stock".

    - Navigate back to `ultimate/config/trader` and open `cfgTraderAddons.hpp`.

        - If you followed the first step, you should already have a class there called `addons_mod`.

    - In your `addons_mod` class, replace the `weapons = ""` entry with `weapons = "my_extension_stock_mod"` (Add this entry if you don't already have it.)
    
        - This line will link your "stock" made earlier with the addons required for it to load, giving Antistasi a complete idea of what it should load and when.

## Vehicles

- Navigate to `ultimate/config/trader/vehicles` and create a new `vehicles_mod.hpp` file. 

    - Create a new class named `my_extension_vehicles_mod`.

        - Make sure this class inherits from `vehicles_base`. Use the existing entry as an example.

        - Inside of this class, you can use the `ITEM` macro to add a vehicle to the dealer.

            - Use the existing `my_extension_vehicles_vanilla` class if you get stuck.

    - Navigate to `ultimate/config/trader/vehicles/vehicles_includes.hpp`

        - Add a new line that uses `#include ""` to include your new `vehicles_mod.hpp` file. Note that `#include` does not need a `;` at the end of the line.

### Linking the vehicles

- Now that you have a class called `my_extension_vehicles_mod`, you can move onto allowing the game to load your vehicles.

    - Navigate back to `ultimate/config/trader` and open `cfgTraderAddons.hpp`.

        - If you followed the first step, you should already have a class there called `addons_mod`.

    - In your `addons_mod` class, replace the `vehicles = ""` entry with `vehicles = "my_extension_vehicles_mod"` (Add this entry if you don't already have it.)
    
        - This line will link your vehicles made earlier with the addons required for it to load, giving Antistasi a complete idea of what it should load and when.

# Test, Cry, Debug

- In theory you've done everything needed to link weapons and/or vehicles to the addons that they require, and Antistasi should now recognise this and load them accordingly.

    - It's time to test! Pack the addon, load the mods needed, and see if your new entries work.

        - If they don't work, it's okay to cry. Or be angry, it's your monitor that will get broken!

            - Now that you have all the emotion out of your system (if you continue to develop, you won't have any left soon enough) it's time to debug!

                - This section needs to be done. I haven't got past the Cry stage as of writing and testing this.