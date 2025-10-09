--- Settings definitions for the Behemoth Enemies mod
--- These are startup settings that require a game restart to take effect

data:extend({
    {
        type = "double-setting",
        name = "gleba-evolution",
        setting_type = "startup",
        minimum_value = 1,
        maximum_value = 200,
        default_value = 100,
        order = "d"
        --- Controls at what evolution percentage behemoth enemies start spawning on Gleba
        --- Default 100 means behemoths spawn at 85-95% evolution (as defined in spawn tables)
        --- Lower values make behemoths spawn earlier (e.g., 50 = behemoths at 42.5-47.5% evolution)
        --- Higher values make behemoths spawn later (e.g., 200 = behemoths at 170-190% evolution, effectively never)
    },
    {
        type = "double-setting",
        name = "behemoth-scale",
        setting_type = "startup",
        minimum_value = 0.1,
        maximum_value = 4,
        default_value = 1,
        order = "a"
        --- Multiplier for the size of all behemoth enemies
        --- 1.0 = normal size, 2.0 = double size, 0.5 = half size
        --- Affects visual size but also hitbox and combat characteristics
    },
    {
        type = "int-setting",
        name = "vulcanus-behemoth-distance",
        setting_type = "startup",
        minimum_value = 1,
        maximum_value = 200,
        default_value = 100,
        order = "e"
        --- Controls how far from spawn behemoth demolishers appear on Vulcanus
        --- Default 100 means standard distance scaling
        --- Lower values make behemoth demolishers appear closer to spawn
        --- Higher values push behemoth demolishers farther from spawn
    },
    {
        type = "color-setting",
        name = "behemoth-color",
        setting_type = "startup",
        default_value = {r=150, g=0, b=150, a=255},
        order = "b"
        --- Primary color tint for behemoth enemies
        --- Applied to mask layers of pentapods and demolishers
        --- Default is purple (150, 0, 150)
    },
    {
        type = "color-setting",
        name = "behemoth-color2",
        setting_type = "startup",
        default_value = {r=150, g=100, b=150, a=255},
        order = "c"
        --- Secondary color tint for behemoth enemies
        --- Applied to thigh mask layers and secondary features
        --- Default is lighter purple (150, 100, 150)
    }
})