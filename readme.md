# Antistasi Ultimate Extender Example
This is an example of how you could extend Antistasi Ultimate with new maps and templates or overwrite existing ones.
This is a fork of [A3AExtender](https://github.com/official-antistasi-community/A3AExtender) made by [Antistasi Official Community Arma 3](https://github.com/official-antistasi-community)

# Requirements
  - Arma 3
  - Arma 3 Tools
    
  Arma 3 and Arma 3 Tools need to be run once from steam.

  ## Useful Things

  - [Advanced Developer Tools](https://steamcommunity.com/sharedfiles/filedetails/?id=2369477168)
  - https://paa.gruppe-adler.de/ (Image > PAA. If converting multiple files, use `ImageToPAA` included in Arma 3 Tools)

  - Ability to debug.
  The ability to debug is acquired with experience. A good thing to remember is:

  `"If you can't un-break the code you broke, it isn't code. It's a bunch of useless characters."` - Silence

# How to get started:
- Do not use both methods at once. It overcomplicates things!
### .ps1 Method
- Run the `Install.ps1` script and follow the instructions on screen.
- Run the `Build.ps1` script. This will create a folder in the root folder called build and compile your extension into it.

### Visual Studio Code Method
- This assumes you already have [VSCode](https://code.visualstudio.com/download) installed and set up. 
> Yes, there is a difference between Visual Studio and Visual Studio Code. You should not be using Visual Studio for this unless you genuinely know and understand its limitations, and are fine with them. (It won't change the fact that you're wrong, however.)

- Download the [Arma Dev](https://marketplace.visualstudio.com/items?itemName=ole1986.arma-dev) extension.
- Download the [Arma 3 - Open Last RPT](https://marketplace.visualstudio.com/items?itemName=bux578.vscode-openlastrpt) extension.
> Optional, but will help immensely with debugging. You will need to do a lot of debugging. You are not 'that guy'.
- Open the whole project in VSCode. 

  - You can do this by right clicking the root folder and clicking "Open with Code". 

- Your VSCode should generally look like this once opened:
> Note: My file tree is on the right side, but will probably be on the left by default.
![image](https://github.com/Westalgie/A3UExtender/assets/78276788/7bdd3cc3-c839-4a7e-b580-4bddc996eab5)

- Press `CTRL+Shift+P` and type "Arma 3". Navigate to "Arma 3: Configure" and run it. This should take you to an `arma-dev.json` file.
- Grab the example .json from [the Ultimate wiki](https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/wiki/Developer-Documentation#vscode-stuff). Make sure to change things accordingly. Most importantly, make sure the `"clientDirs"` matches your `extension_name/addons/` folders. This should be something like:
```
  "clientDirs": [
      "A3UE/addons/core",
      "A3UE/addons/functions",
      "A3UE/addons/hals",
      "A3UE/addons/maps",
      "A3UE/addons/templates",
      "A3UE/addons/ultimate"
  ],
```
> Be sure to fact check this as these may not always match.

- You should now pretty much be ready to pack. Once again use `CTRL+Shift+P` and type "Arma 3". Navigate to "Arma 3: Build" and run it.

  - You should now have a folder with the same name as the value used in the .json for `"buildPath"`. This should be `build` by default.
  - If you do have the folder, you can now follow the rest of the steps below!

## Applies to both methods:

- DO NOT CHANGE ANYTHING IN THE `addons` DIRECTORY UNTIL YOU HAVE BUILT THE ADDON AND CONFIRMED IT WORKS. 

  - This will save you the despair of going "why no work?!" after changing 20 files. 
  
  - A clean base is good to work off of, because you know exactly what you changed when you inevitably break something.
  
- Start the Arma 3 launcher and do the following:
  1) Under `Mods` -> `...More` select `add watched folder...` then `add custom folder...`.
      Navigate to your extensions root folder and select the newly created build folder.
      If successful it will have added that folder in the list of watched folders and a green box would have shown
      stating that a mod has been installed.

  2) Load `Antistasi Ultimate - Mod` and the newly installed `A3 Antistasi Ultimate Extender example` mod.
  3) Start the game and confirm that the new template is loaded by starting a local host session under multiplayer. Then start a game of antistasi and confirm that the
      new and overwritten templates are there (these are the example templates provided with the extender).

      Also confirm that the arms dealer is selling everything vanilla for free, and selling a free quadbike.

      The new templates are `AAF` and `AAF_New`.

  Assuming everything went well you are now ready to make your own modifications.
  Remember to remove unused content and read thoroughly through the files while making any edits.
  As a hint all content is added from the config.cpp files located within each of the addons so you can follow that down to the files that govern the different parts like templates and functions etc.


# Example additions
- Note: If dealing with file paths, always use the correct macros UNLESS you can't due to it being in another mod.

  - Macros are essentially a function in how they work - these ones in particular append your parameter to a predefined path.

    - The benefit of this is that you only have to change this path once (if you need to change it at all.)

  - Some relevant macros for paths are `QPATHTOFOLDER`, `QCPATHTO`, etc.

## Maps
- Antistasi now supports 3rd party map porting.

- There are two examples added for working with maps. Adding a new map and overwriting/applying additions for an existing map.

  - In this examples there are also demonstrations of mission specific overwrites of `mapInfo` and `navGrid` data as well as global overwrite/addition.

  - You will find all the information regarding this under `your extension mod/addons/maps`.

  - Take care to study all the files in the addon to not miss crucial porting steps.

## Templates
- Antistasi now supports 3rd party template additions/overwrites.

  - To add new templates or overwrite existing ones follow the demonstration given in `your extension mod/addons/templates/Templates/Templates.hpp`.

  - Note that while you can add addon vehicle templates to Antistasi at this time, it should be noted that it is still a limited system and you shouldn't expect full functionality from them atm.

  - Again it's important to read through all the files in the `templates` addon to not miss important steps.

## Functionality
- Antistasi now has events that you can listen to and extend existing functionality.
  A list of all events and their parameters can be found in the in game config under: `A3A >> Events`.
- In addition you can overwrite any of Antistasi's functions to add, change or remove functionality. This includes full systems (be aware that this is more complex and can break on updates).
  To do so, simply add a function to the `A3A` and/or `A3U` and/or `A3UE` class of `CfgFunctions.hpp` under the addon functions (you can also replicate the config.cpp to allow this in any other addon).

## Arms Dealer
- Navigate to `addons` and read the `README.md` file.

# Releasing your extension
Now that you have added the content/functionality you wanted its time to release the extension.

You should first make sure that any example content not being used is removed, you can do so either carefully by removing lines from the configs, or by removing an addon folder completely.
  * **Note that you can not remove the `core` addon.**

Next update the mod.cpp file to contain the correct information for you (for steam release you can delete the meta.cpp from the build folder afterwards).

Now simply run the `Build` script in the root folder (Or the VSCode equivalent) to build it and use Arma 3 Tools for signing and publishing the extension.

- *(Note: it will not sign it for you (unless using VSCode and a key is given in the .json), this needs to be done manually before publishing with `Arma 3 Tools` -> `DSUtils` & `Publisher`)*.

You can also distribute it in other ways other than the steam workshop simply by sending the build output to the users.

## Small disclaimer:

When you want other Antistasi players to easily find your extension, give it a descriptive name including the abbreviation `A3UE` like for example `A3UE - My Awesome Antistasi Ultimate Extension`.

## Need more advice?

Read the [Developer Advice](https://github.com/Westalgie/A3UExtender/wiki/Developer-Advice) page.