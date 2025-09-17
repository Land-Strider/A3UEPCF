<div align="center">
  <h1>Point Campfire</h1>
  <h3>An Antistasi Ultimate Extender</h3>
  <p>
    <i>An Arma 3 Antistasi Ultimate Extender mod designed to suit the needs of our own friends-group <br> and hopefully useful for small servers with fewer than 10 players.</i>
    <br/>
  </p>
</div>

<p align="center">
  <img src="images/A3UE_PCF_Wide.png">
</p>

## Scope
An AU Extension made with **small squads and private friends-only servers in mind**. While some changes might seem to simplify gameplay, nearly all are **optional and can be toggled via parameters**. The goal is to empower smaller teams to tackle a wider range of activities, reducing the disadvantages of a low player count.

This project also introduces quality-of-life features we found useful, like adding town names to map markers. We strive to make everything optional, allowing you to customize your experience.

**Important:** This extension heavily modifies the base Antistasi Ultimate code. Consequently, it may break or fail to reflect new content when the base mod is updated. We are exploring ways to make it more robust against updates, but for now, expect a delay of a few days for compatibility patches after a new Antistasi Ultimate version is released.

---

## Features

### Table of Contents
- [Scope](#scope)
- [Features](#features)
  - [Table of Contents](#table-of-contents)
  - [All Traits for All Roles](#all-traits-for-all-roles)
  - [Enhanced Persistent Saving](#enhanced-persistent-saving)
  - [Better Rebel AA Emplacements](#better-rebel-aa-emplacements)
  - [Factory \& Resource Management](#factory--resource-management)
  - [Map Enhancements](#map-enhancements)
  - [Limited Fast Travel Improvements](#limited-fast-travel-improvements)
- [Future Plans](#future-plans)

---

### All Traits for All Roles
-   **Description:** Allows all roles to have the Engineer, Medic, and UAV Hacker traits.
-   **Goal:** Enables small squads to be more versatile and handle diverse situations without needing more players for specialized roles.

### Enhanced Persistent Saving
-   **Persistent Build Box Saving:** Persistently save constructions from the Build Box anywhere on the map, not just near bases or mission areas. This helps small teams fortify frequently contested locations like convoy ambush spots without repetitive setup.
-   **Persistent Zeus Saving:** Save more types of Zeus-placed objects (Buildings, Things, Statics) and in much larger quantities (up to 5000). Perfect for adding character to your bases with details like coffee shops or barbecue grills.

### Better Rebel AA Emplacements
-   **Description:** A parameter option allows rebel AA emplacements to spawn up to 5x farther out around all enemy aircraft, including fixed-wing CAS and paradrop planes.
-   **Goal:** This parameter multiplies the value of the "Spawn Distance" option in the Basic Parameters menu, giving you more control over your anti-air defense radius.

### Factory & Resource Management
-   **Rebuilding:** Reconstruct destroyed rebel factories and resources for a flat cost of 5,000 money units using the "Rebuild Assets" button in the Commander Menu (`Y` > Commander > HQ Tab). You no longer have to wait for the enemy to retake the location before you can rebuild.
-   **Upgrading:** A new "Upgrade Assets" feature allows you to increase the yield of your factories and resources, making a "tall" gameplay strategy (holding a few highly-developed locations) more viable.
    -   **Mechanics:**
        -   Factories and resources start at Level 0 and can be upgraded to Level 3. Each level adds a 100% yield bonus, up to a 400% total yield.
        -   The cost of each upgrade increases globally with every purchase. This prevents exponential economic growth in the late game.
        -   Losing an upgraded marker reduces your total upgrade count, lowering the cost of the next upgrade.
        -   To encourage holding territory, a marker's upgrade level decreases by one if lost to the enemy. The level is not lost if you recapture it.

### Map Enhancements
-   **Town Names on Markers:** A parameter option to append the nearest town's name to map markers (e.g., "AAF Outpost" becomes "AAF Neochori Outpost"). This also updates related text, like convoy descriptions, for better clarity.
-   **Shorter Emplacement Names:** An optional feature to shorten emplacement map markers to a simple icon and text (e.g., "Roadblock", "OP", "AA"). This helps reduce map clutter, especially when combined with the town names feature.

### Limited Fast Travel Improvements
-   **New Travel Network:** Fast travel is now limited to travel between strongholds (HQ, Airbases, Military Bases, Outposts) and Observation Posts. This increases the strategic importance of AI garrisons for holding key points.
-   **Quality of Life:**
    -   The Fast Travel menu now immediately checks if you are in a valid departure zone, preventing unnecessary clicks.
    -   If you are not in a valid zone, the UI will now show you the nearest valid departure point and the distance to it.

---

## Future Plans
For a list of planned features and to report issues, please visit the [**Issues**](https://github.com/Land-Strider/A3UEPCF/issues) page on GitHub.

<div>
<h2> Current changes this extender brings are:</h2>

 - **_All Traits for All Roles:_** Allowing all roles to have the Engineer, Medic and the UAV hacker traits, so that small squads can handle more situations without needing more people.
   
 - **_More Persistent Build Box Saving:_** Allowing persistent saving of Build Box constructions anywhere, not just near bases or mission areas, so that small teams can spend less time fortifying frequent battle grounds repeatedly. (e.g convoy ambush positions).
   
 - **_More Persistent Zeus Saving:_** Allowing persistent saving of more types (Building + Things, ThingX, Static) of Zeus objects and much larger amount (..., 300 max plus 500, 750, 1000, 5000 options) of them, so that you can have your Mediterranean coffee shops or barbecue grills to give character to your bases.
   
 - **_Better Rebel AA Emplacements:_**
Tied to a parameter option, rebel AA emplacements can now spawn in up to x5 larger ditance around all enemy aircraft, inlcuding the fixed-wing CAS and paradrop planes. This new parameter multiplies the value of the Spawn Distance parameter option under Basic Parameters menu.

 - **_Factory/Resource Rebuilding:_** Allowing reconstruction of destroyed rebel factories and resources using the built in "Rebuild Assets" commander button for the same 5.000 money cost, so that you no longer have to wait for the enemy to attack and retake your factory or resource markers for reconstruction (Battle Menu (Y key by default) > Commander > Commander Menu > HQ Tab > Rebuild Assets button)
   
 - **_Factory/Resource Upgrading:_** Completely new feature allowing upgrading of rebel-held factories and resources using a new button "Upgrade Assets" in Battle Menu (Y key by default) > Commander > Commander Menu > HQ Tab > Upgrade Assets.
   - This feature allows spending increasing amounts of money to upgrade rebel factories and resources to increase their yields, making tall gameplay (holding a few quality locations only) instead of wide gameplay (conquering more and more locations) more viable for stable economic gains.
   - In summary, any rebel factory or resource marker can be upgraded for increasing cost steps set by a the related parameter to yield up to 400% gains of an unupgraded marker.
   - In details: 
     - All factories and resources start at level 0 and rebels can upgrade theirs up to level 3, getting the base yield + 100% more yield with each upgrade, up to 3 upgrades for any marker. 
     - Each upgrde increases the cost of the next upgrade by the increment amount set by the parameter and this applies globally for all rebel markers, not just separately for any factory or resource marker. For example, if your first upgrade is on a L0 resource to L1 for 10.000 money units (increment step being 10.000), your next one will cost 20.000 whether it is the L1 to L2 upgrade on the same resource marker or any other marker, even if that marker gets from L0 to L1, or L2 to L3. This is implemented to lower the reward/cost ratio in the late game when you can have a lot of factories and resources, so you shouldn't profit exponentially.
     - Upgrade costs being the total upgrade count + the next increment amount, a lost factory or resource marker with upgrade levels in it will lower your current total upgrade count, thus the upgrade price for the next one.
     - Losing a factory or resource marker does not reset their upgrade level so as not to throw away all those mid game upgrade expenses, but still lower the upgrade level by one, so that holding on to an upgraded marker is encouraged. This level decrease happens only when the marker changes sides from the rebels to occupants or invaders. It does not happen when rebels take a leveled marker back, or occupants/invaders take a leveled marker from each other.
       
 - **_Town Names on Map Markers:_** Tied to a parameter, marker names on the map now show the nearest town name for convenience. For example, a simple marker name "AAF Outpost" now appears as "AAF Neochori Outpost" on the map. This was already present for Airbases, but now include all markers. Accordingly, any text field that used a string like "outpost near Neochori" now displays as "Neochori outpost" (Convoy task descriptions for example).

 - **_Shorter Emplacement Names:_** Tied to a parameter, emplacement names on the map are now displayed very briefly as their relevant type icon + "Roadblock","OP","AA","AT","HMG" text. This is intended to be used for reducing the map screen clutter, especially with use along Town Names on Map Markers point above.
   
 - **_New Limited Fast Travel option:_** Only between strongholds (HQ, Airbases, Military Bases, Outposts) and Observation Posts. This aims to increase the importance of needing AI garrissons for POIs desired to be held, rather than spamming Fast Travel from HQ and AA/AT weapons from the nearest town or emplacement to the attacked positions.
   
 - **_Limited FT QoL:_** Limited Fast Travel options (the new one above and the one implemented in Antistasi itself) now check if the player is within a valid departure zone immediately upon clicking on the Battle Menu > Fast Travel button, instead of making the player first select a target location on the map even when the player can't depart from their current position. A QoL feature that reduces unnecessary menu clicks.
   
 - **_More Limited FT QoL:_** Limited Fast Travel options now show the distance to the nearest valid departure marker name and the distance to it when the player isn't within one upon clicking Battle Menu > Fast Travel button.
</div>

For now, that's all. Please check the [Issues](https://github.com/Land-Strider/A3UEPCF/issues) to see what more is planned.
