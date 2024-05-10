-- Create the Thread using FiveM's own Thread system
Citizen.CreateThread(
    function()

	-- Load the round Map texture
        RequestStreamedTextureDict("map", false)
        while not HasStreamedTextureDictLoaded("map") do
            Wait(500) -- Wait for completion
        end
	-- map is the name of the texture file in the stream folder
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "map", "radarmasksm")

	-- Set Minimap Size & Position
	-- Documentation: https://github.com/citizenfx/fivem/blob/c601baf1fb132677cd372559ee9dac09a8977b93/ext/native-decls/SetMinimapComponentPosition.md
        SetMinimapClipType(1)
        SetMinimapComponentPosition("minimap", "L", "B", -0.015, 0.0, 0.153, 0.24)
        SetMinimapComponentPosition("minimap_mask", "L", "B", -0.015, 0.05, 0.093, 0.164)
        SetMinimapComponentPosition("minimap_blur", "L", "B", -0.015, 0.05, 0.2304, 0.3033)
        
	-- Disable default map
        SetRadarBigmapEnabled(true, false)
	-- Variable containing the minimap as scaleform
	local map = RequestScaleformMovie("minimap")
	while true do
		BeginScaleformMovieMethod(map, "SETUP_HEALTH_ARMOUR")
        	ScaleformMovieMethodAddParamInt(3)
        	EndScaleformMovieMethod()
		-- mandatory wait
		-- DO NOT REMOVE OR THE CLIENT WILL CRASH!!
		Citizen.Wait(3)
	end
    end
)