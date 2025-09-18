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
