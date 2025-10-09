local space_age_sounds = require("__space-age__.prototypes.entity.sounds")


local make_enemy = function(name, zoom)
  return
    [[
    game.simulation.camera_zoom = ]]..zoom..[[
    game.simulation.camera_position = {0, 0}
    game.surfaces[1].build_checkerboard{{-40, -40}, {40, 40}}

    enemy = game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}

    step_0 = function()
      if enemy.valid then
          game.simulation.camera_position = {enemy.position.x, enemy.position.y - 0.5}
      end

      script.on_nth_tick(1, function()
          step_0()
      end)
    end

    step_0()
  ]]
end
local make_worm_enemy = function(name, zoom)
  return
    [[
    game.simulation.camera_zoom = ]]..zoom..[[
    game.simulation.camera_position = {0, 0}
    game.surfaces[1].build_checkerboard{{-180, -180}, {180, 180}}

    for x = -5, 4, 1 do
      for y = -5, 4 do
        game.surfaces[1].set_chunk_generated_status({x, y}, defines.chunk_generated_status.entities)
      end
    end

    enemy = game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}

    step_0 = function()
      if enemy.valid then
          game.simulation.camera_position = {enemy.position.x, enemy.position.y - 0.5}
      end

      script.on_nth_tick(1, function()
          step_0()
      end)
    end

    step_0()
  ]]
end
--make_demolisher(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, factoriopedia_simulation, sounds)

local function from_color(a)
  return {a.r, a.g, a.b, a.a}
end

local function lerp_color(a, b, amount)
  return {
	r=a.r + amount * (b.r - a.r), 
	g=a.g + amount * (b.g - a.g),
    b=a.b + amount * (b.b - a.b),
    a=a.a + amount * (b.a - a.a),
  }
end

local function fade(tint, amount) -- fades to minimal opacity grey. Low opacity is good for the mask to let the base layer show htough (instead of having a grey mask)
  return from_color(lerp_color(tint, {r=1, g=1, b=1, a=2}, amount))
end

local function grey_overlay(tint, amount) -- fades to opaque grey. Full opacity is required for body.
  return lerp_color(tint, {r=127, g=127, b=127, a=255}, amount)
end


local gleba_body_tint = {r=117,g=116,b=104,a=255}
local behemoth_wriggler_body_tint = gleba_body_tint
local behemoth_color = {r=150,g=0,b=150,a=255}
local behemoth_color2 = {r=150,g=100,b=150,a=255}
--local behemoth_color = settings.startup["behemoth-color"].value
--local behemoth_color2 = settings.startup["behemoth-color2"].value
local behemoth_scale = settings.startup["behemoth-scale"].value


new_tier_list = {"behemoth"}
local gleba_mask_tints = {behemoth_color}
local gleba_mask_tints2 = {behemoth_color2}

for i,k in pairs(new_tier_list) do
	gleba_mask_tint = gleba_mask_tints[i]
	gleba_mask_tint2 = gleba_mask_tints2[i]
	local behemoth_wriggler_mask_tint = fade(gleba_mask_tint, 0.4)
	
	factoriopedia_vulcanus_enemy_demolisher = { init = make_worm_enemy(k.."-demolisher", 1.0) }
	factoriopedia_gleba_enemy_stomper = { init = make_enemy(k.."-stomper-pentapod", 0.8) }
	factoriopedia_gleba_enemy_strafer = { init = make_enemy(k.."-strafer-pentapod", 0.8) }
	factoriopedia_gleba_enemy_wriggler = { init = make_enemy(k.."-wriggler-pentapod", 1.8) }
	factoriopedia_gleba_enemy_wriggler_premature = { init = make_enemy(k.."-wriggler-pentapod-premature", 1.8) }
	
	make_demolisher(k.."-demolisher", "s-k", 1.5*behemoth_scale, 3.5, 1000000, 1000, 0.75, factoriopedia_vulcanus_enemy_demolisher, space_age_sounds.demolisher.big)
	make_strafer(k.."-", 2.0*behemoth_scale, 4000, 2.4, 7.0,  30, 35, 40,{
		mask = fade(gleba_mask_tint, 0.4),
		mask_thigh = fade(gleba_mask_tint2, 0.2),
		body = from_color(grey_overlay(gleba_body_tint, 0.1)),
		projectile_mask = behemoth_wriggler_mask_tint, -- same as wriggler mask tint
		projectile = behemoth_wriggler_body_tint  -- same as wriggler body tint
	  }, factoriopedia_gleba_enemy_strafer, space_age_sounds.strafer_pentapod.big)
	make_stomper(k.."-", 2.3*behemoth_scale, 30000, 2.4, 2.8,{
		mask = fade(gleba_mask_tint, 0.4),
		mask_thigh = fade(gleba_mask_tint2, 0.3),
		body = from_color(grey_overlay(gleba_body_tint, 0.1)),
		body_thigh = lerp_color(gleba_body_tint, grey_overlay({r=250,g=108,b=0,a=255}, 0.7), 0.1) -- more orange/yellow
	  }, factoriopedia_gleba_enemy_stomper, space_age_sounds.stomper_pentapod.big)
	  
	make_wriggler(k.."-", 1.2*behemoth_scale, 600, 2.6,{
		mask = fade(gleba_mask_tint, 0.5),
		body = gleba_body_tint
	  }, factoriopedia_gleba_enemy_wriggler, factoriopedia_gleba_enemy_wriggler_premature, space_age_sounds.wriggler_pentapod.big)
	  
	  
	 data.raw["segmented-unit"][k.."-demolisher"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-demolisher.png"
	 data.raw["segmented-unit"][k.."-demolisher"].vision_distance = math.min(100, data.raw["segmented-unit"][k.."-demolisher"].vision_distance)
	 data.raw["spider-unit"][k.."-strafer-pentapod"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-strafer.png"
	 data.raw["spider-unit"][k.."-stomper-pentapod"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-stomper.png"
	 data.raw["simple-entity"][k.."-stomper-shell"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-stomper.png"
	 data.raw["unit"][k.."-wriggler-pentapod-premature"].icon = "__behemoth-enemies__/graphics/icons/".. k .."-wriggler.png"
	 data.raw["unit"][k.."-wriggler-pentapod"].icon = "__behemoth-enemies__/graphics/icons/".. k .."-wriggler.png"
	 data.raw["corpse"][k .. "-wriggler-pentapod-corpse"].icon = "__behemoth-enemies__/graphics/icons/".. k .."-wriggler-corpse.png"
	 data.raw["corpse"][k .. "-stomper-corpse"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-stomper.png"
	 data.raw["corpse"][k .. "-strafer-corpse"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-strafer.png"
	 data.raw["spider-leg"][k .. "-stomper-pentapod-leg"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-stomper.png"
	 data.raw["spider-leg"][k .. "-strafer-pentapod-leg"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-strafer.png"
	 data.raw["simple-entity"][k .. "-demolisher-corpse"].icon = "__behemoth-enemies__/graphics/icons/"..k.."-demolisher-remains.png"
end


spawner = data.raw["unit-spawner"]["gleba-spawner"].result_units
spawner[7] = {"big-wriggler-pentapod", {{0.6, 0}, {0.85, 0.4}, {1.5, 0}}}
spawner[8] = {"big-strafer-pentapod", {{0.6, 0}, {0.85, 0.4}, {1.5, 0}}}
spawner[9] = {"big-stomper-pentapod", {{0.6, 0}, {0.85, 0.2}, {1.5, 0}}}
table.insert(spawner, {"behemoth-wriggler-pentapod", {{0.85, 0}, {0.95, 0.4}, {1.0, 0.4}}})
table.insert(spawner, {"behemoth-strafer-pentapod", {{0.85, 0}, {0.95, 0.4}, {1.0, 0.4}}})
table.insert(spawner, {"behemoth-stomper-pentapod", {{0.85, 0}, {0.95, 0.2}, {1.0, 0.2}}})

spawner_small = data.raw["unit-spawner"]["gleba-spawner-small"].result_units
spawner_small[3] = {"big-wriggler-pentapod", {{0.6, 0}, {0.85, 0.9}, {1, 0.45}}} 
table.insert(spawner_small, {"behemoth-wriggler-pentapod", {{0.85, 0}, {0.95, 0.9}, {1, 0.9}}})




local gleba_evolution = settings.startup["gleba-evolution"].value
for k,v in pairs(spawner) do
	for k2,v2 in pairs(v[2]) do
		data.raw["unit-spawner"]["gleba-spawner"].result_units[k][2][k2][1] = v2[1] * (100.0 / gleba_evolution)
	end
end
for k,v in pairs(spawner_small) do
	for k2,v2 in pairs(v[2]) do
		data.raw["unit-spawner"]["gleba-spawner-small"].result_units[k][2][k2][1] = v2[1] * (100.0 / gleba_evolution)
	end
end
local vulcanus_size = settings.startup["vulcanus-behemoth-distance"].value
data.raw["noise-expression"]["demolisher_variation_expression"].expression = "floor(clamp((distance * (100.0/"..vulcanus_size..")) / (18 * 32) - 0.25, 0, 4)) + (-99 * no_enemies_mode)"
table.insert(data.raw["planet"]["vulcanus"].map_gen_settings.territory_settings.units, "behemoth-demolisher")
-- compatibility with older versions
data.raw["planet"]["vulcanus"].map_gen_settings.territory_settings.territory_variation_expression = "demolisher_variation_expression"
data:extend({
{
    type = "noise-expression",
    name = "demolisher_variation_expression_"..vulcanus_size,
    expression = "floor(clamp((distance * (100.0/"..vulcanus_size..")) / (18 * 32) - 0.25, 0, 4)) + (-99 * no_enemies_mode)"
  }
})

--data:extend{{
--    type = "kill-achievement",
--    name = "size-doesnt-matter-2",
--    order = "f[kill]-l[size-doesnt-matter-2]",
--    to_kill = {"behemoth-demolisher"},
--    personally = false,
--    amount = 1,
--   icon = "__space-age__/graphics/achievement/size-doesnt-matter.png",
--    icon_size = 128
--  }
--}
 