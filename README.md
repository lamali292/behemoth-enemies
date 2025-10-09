# Behemoth Enemies

A Factorio Space Age mod that adds fearsome behemoth-tier enemies to Vulcanus and Gleba planets.

## Features

### New Enemy Types
- **Behemoth Demolisher** - Massive segmented worm on Vulcanus with 1,000,000 HP
- **Behemoth Stomper Pentapod** - Giant heavy pentapod on Gleba with 30,000 HP
- **Behemoth Strafer Pentapod** - Large ranged pentapod on Gleba with 4,000 HP
- **Behemoth Wriggler Pentapod** - Enhanced wriggler with 600 HP

### Customization Options

All settings are configurable in the mod startup settings:

- **Behemoth Scale** (0.1 - 4.0, default: 1.0)
  - Adjusts the size of all behemoth enemies
  
- **Primary Color** (default: Purple RGB 150,0,150)
  - Main color tint for behemoth enemies
  
- **Secondary Color** (default: Light Purple RGB 150,100,150)
  - Secondary color for details and highlights

- **Gleba Evolution** (1 - 200%, default: 100%)
  - Controls when behemoths spawn on Gleba
  - Lower = earlier spawns, Higher = later spawns
  - At 100%, behemoths appear around 85-95% evolution

- **Vulcanus Behemoth Distance** (1 - 200%, default: 100%)
  - Controls how far from spawn behemoth demolishers appear
  - Lower = closer to spawn, Higher = farther away

## Installation

1. Download the mod from the Factorio mod portal or GitHub releases
2. Place the mod folder in your Factorio mods directory
3. Enable the mod in the game's mod menu
4. Restart Factorio (required for startup settings)

## Compatibility

- **Required:** Factorio 2.0+, Space Age DLC
- **Compatible with:** Most mods that don't heavily modify enemy spawning
- **May conflict with:** Mods that override Vulcanus/Gleba map generation or enemy spawning systems

### Mod Removal

As of version 0.0.8:
- The mod can be safely removed after Vulcanus has been generated
- **Note:** Behemoth demolishers cannot spawn on already-generated Vulcanus chunks after mod removal
- Vulcanus map generation settings will remain altered even after mod removal
- Missing territories will not be regenerated

## Balance Notes

Behemoth enemies are designed as extreme late-game challenges:

- **Demolishers** have 1 million HP and 3.5x damage multiplier
- **Stompers** are heavily armored bruisers
- **Strafers** provide dangerous ranged support
- **Wrigglers** swarm in numbers

Prepare advanced weapons, shields, and defenses before engaging!

## Technical Details

### Spawn Mechanics

**Gleba Pentapods:**
- Spawn from both regular and small spawners
- Evolution-based spawn rates (85-100% evolution by default)
- All three pentapod types (Stomper, Strafer, Wriggler)

**Vulcanus Demolishers:**
- Distance-based spawning using territory variation
- Scales with the vulcanus-behemoth-distance setting
- Added to planet map generation settings
- **Important:** For existing saves (as of v0.0.8), behemoth demolishers will only spawn in newly generated chunks

### Known Issues

- Behemoth demolishers require chunks to be generated to spawn properly
- Very high scale values (>3.0) may cause graphical glitches
- If Vulcanus surface lacks territory_settings (due to other mods), Behemoth Demolishers will not spawn
- After mod removal, Vulcanus map generation remains altered and missing territories won't regenerate

## Version History

### Recent Updates

**v1.0.0** (2025-10-09)
- Official stable release
- Complete documentation with comments and LuaDoc
- Full project structure and locale files

**v0.0.8** (2025-07-17)
- Fixed crash from leftover variables after mod removal
- Fixed crash when Vulcanus has no territory_settings
- Mod now safely removable after surface generation

**v0.0.7** (2025-07-16)
- Fixed missing demolisher corpse graphic for Factorio 2.0.60

**v0.0.6** (2024-11-18)
- Added settings for spawn distance and evolution timing

**v0.0.5** (2024-11-13)
- Fixed Factoriopedia integration

**v0.0.4** (2024-11-13)
- Added Vulcanus map generation compatibility
- Added changelog

**v0.0.3** (2024-11-13)
- Code cleanup and optimization
- Removed duplicate base game code

**v0.0.2** (2024-11-13)
- Enabled spawning on already-generated Vulcanus

**v0.0.1** (2024-11-13)
- Initial release

For complete changelog, see [CHANGELOG.md](CHANGELOG.md)

## Credits

- Based on Factorio Space Age enemy prototypes
- Uses Space Age sound assets
- Color system inspired by entity tinting mechanics

## License

This mod is released under the MIT License. See [LICENSE](LICENSE) file for details.

## Support

Report bugs and request features on the [GitHub Issues page](https://github.com/yourusername/behemoth-enemies/issues).

### Reporting Bugs

When reporting bugs, please include:
- Factorio version
- Mod version
- List of other active mods
- Steps to reproduce the issue
- Screenshots or log files if applicable

## Development

### Project Structure