--- Flag to ensure the territory settings check only runs once
local didnt_check_already = true

--- Event handler that adds behemoth-demolisher to Vulcanus territory settings
--- This runs once when any GUI is opened, then disables itself
--- @param event EventData.on_gui_opened The GUI opened event data
script.on_event(defines.events.on_gui_opened,
  function(event)
    -- Only run this check once per game session
    if didnt_check_already then
      -- Iterate through all surfaces in the game
      for _, surface in pairs(game.surfaces) do
        -- Only modify the Vulcanus surface
        if surface.name == "vulcanus" then
          -- Get the map generation settings for this surface
          local msg = surface.map_gen_settings
          local territory = msg and msg.territory_settings
          
          -- Only proceed if territory_settings exists
          if territory and territory.units then
            local didnt_found_demo = true
            
            -- Check if behemoth-demolisher is already in the units list
            for _, v in pairs(territory.units) do
              if v == "behemoth-demolisher" then
                didnt_found_demo = false
                break
              end
            end
            
            -- Add behemoth-demolisher if it wasn't found
            if didnt_found_demo then
              table.insert(territory.units, "behemoth-demolisher")
            end
            
            -- Set the territory variation expression for demolishers
            territory.territory_variation_expression = "demolisher_variation_expression"
            
            -- Apply the modified settings back to the surface
            surface.map_gen_settings = msg
          else
            -- Log when a surface can't be modified due to missing settings
            log("[Behemoth Enemies] Skipped surface '" .. surface.name .. "' because it lacks territory_settings or units.")
          end
        end
      end
      
      -- Disable this check for future GUI open events
      didnt_check_already = false
    end
  end
)