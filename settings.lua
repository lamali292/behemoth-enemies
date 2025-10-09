data:extend({
    {
        type = "double-setting",
        name = "gleba-evolution",
        setting_type = "startup",
        minimum_value = 1,
		maximum_value = 200,
        default_value = 100,
		order = "d"
    },{
        type = "double-setting",
        name = "behemoth-scale",
        setting_type = "startup",
        minimum_value = 0.1,
		maximum_value = 4,
        default_value = 1,
		order = "a"
    },
	{
        type = "int-setting",
        name = "vulcanus-behemoth-distance",
        setting_type = "startup",
        minimum_value = 1,
		maximum_value = 200,
        default_value = 100,
		order = "e"
    },
	{
        type = "color-setting",
        name = "behemoth-color",
        setting_type = "startup",
        default_value = {r=150,g=0,b=150,a=255},
		order = "b"
    },
	{
        type = "color-setting",
        name = "behemoth-color2",
        setting_type = "startup",
        default_value = {r=150,g=100,b=150,a=255},
		order = "c"
    }
})
