local didnt_check_already = true

script.on_event(defines.events.on_gui_opened,
  function(event)
	if didnt_check_already then
		for _, surface in pairs(game.surfaces) do
			if surface.name == "vulcanus" then
				local msg = surface.map_gen_settings
				local territory = msg and msg.territory_settings

				-- Only proceed if territory_settings exists
				if territory and territory.units then
					local didnt_found_demo = true
					for _, v in pairs(territory.units) do
						if v == "behemoth-demolisher" then
							didnt_found_demo = false
							break
						end
					end

					if didnt_found_demo then
						table.insert(territory.units, "behemoth-demolisher")
					end

					territory.territory_variation_expression = "demolisher_variation_expression"
					surface.map_gen_settings = msg
				else
				
					log("[Behemoth Enemies] Skipped surface '" .. surface.name .. "' because it lacks territory_settings or units.")
				end
			end
		end
		didnt_check_already = false
	end
  end
)