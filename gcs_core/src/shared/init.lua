-- executes class instances of the first frame
Citizen.CreateThread(function()

	print(string.format(
		"%s\n-------------------------\n\n" ..
		"%sInitializing GCS...\n" ..
		"%s\n-------------------------\n%s", 
		Colors.Console.LightBlue,
		Colors.Console.LightBlue,
		Colors.Console.LightBlue,
		Colors.Console.Default
	))

	if not IsRedM and not IsFiveM then
		error("IsRedM and IsFiveM both set to false. Please load one file from gcs_core/src/shared/game to set game.")
	elseif IsRedM and IsFiveM then
		error("IsRedM and IsFiveM both set to true. Please only load one file from gcs_core/src/shared/game to set game.")
	end

	print(string.format(
		"%sGame set to %s%s\n%s",
		Colors.Console.LightBlue,
		IsRedM and Colors.Console.DarkRed or (IsFiveM and Colors.Console.Yellow or Colors.Console.Red),
		IsRedM and "RedM" or (IsFiveM and "FiveM" or "NONE"),
		Colors.Console.Default
	))

	if __collect_inits then
		-- do not collect inits beyond the initial frame & do not collect nested init's
		__collect_inits = false

		-- wait until we're ready to do networking (only runs on the Client)
		if IsClient then
			while not NetworkIsSessionActive() do
				Wait(0)
			end

			Wait(1000)
		end

		-- execute the inits in the order we received them
		--for index, init_function_data in ipairs(__init_list) do
		for i = 1, #__init_list do
			local init_function = __init_list[i][2]
			init_function()
			-- inits created inside of the init_function (nested inits) will immediately come into existance as instances
		end

		---------
		-- Execute the postLoads
		---------

		--for index, init_function_data in ipairs(__init_list) do
		for i = 1, #__init_list do
			local instance = __init_list[i][1]

			if instance.__postLoad then
				instance.__postLoad()
			end
		end

		if IsClient then
			Network:Send("__ClientReady")
			Events:Fire("ModulesLoaded")
		else
			Events:Fire("ModulesLoaded")
		end

		__init_list = nil
	end

	print(string.format(
		"%s\n-------------------------\n\n" ..
		"%sGCS initialized successfully!\n" ..
		"%s\n-------------------------\n%s", 
		Colors.Console.LightBlue,
		Colors.Console.Green,
		Colors.Console.LightBlue,
		Colors.Console.Default
	))
end)
