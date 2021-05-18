Creator = class()

-- Create the database table if it does not exist
MySQL.ready(function()
	MySQL.Async.execute('CREATE TABLE IF NOT EXISTS `player_skins` (`id` int(11) NOT NULL auto_increment, `identifier` varchar(128) NOT NULL, `skin` LONGTEXT NULL DEFAULT NULL, PRIMARY KEY  (`id`), UNIQUE(`identifier`))',{}, 
	function() end)
end)

RegisterServerEvent('cui_character:save')
AddEventHandler('cui_character:save', function(data)
	local _source = source
	local license = player:GetLicense()

	if license then
		--local query = 'INSERT INTO `player_skins` (`identifier`, `skin`) VALUES (@identifier, @skin) ON DUPLICATE KEY UPDATE `skin` = @skin'
		--local params = {['@skin'] = json.encode(data), ['@identifier'] = license}
		local query_outfit = 'UPDATE Outfit INNER JOIN CharacterOutfit ON Outfit.id = CharacterOutfit.Outfit_id INNER JOIN Character ON CharacterOutfit.Character_id = Character.id'
		local querSet_outfit = 'SET data.shirt=@tshirt.txt, data.jacket=@jacket_txt, data.pants=@pants_txt, data.shoes=@shoes_txt, data.glasses=@glasses_txt, data.hat=@hat_txt, data.mask=@mask_txt, data.shield=@shield_txt, data.ears=@ears_txt'
		SQL:Execute(query_outfit .. querSet_outfit, params)

		local query_skin = 'UPDATE Skin INNER JOIN CharacterOutfit ON Skin.id = CharacterOutfit.skin_id INNER JOIN Character ON CharacterOutfit.Character_id = Character.id'
		local querSet_skin = 'SET data.dad=@dad, data.mom=@mom, data.parents_percent=@parents_percent, data.body_color=@body_color, data.eye_color=@eye_color, data.acne=@acne, data.skin_problem=@skin_problem, data.freckle=@freckle, data.wrinkle=@wrinkle, data.wrinkle_opacity=@hair, data.hair_color=@hair_color, data.beard=@beard, data.beard_color=@beard_color, data.beard_opacity=@beard_opacity, data.eyebrow=@eyebrow, data.eyebrow_color=@eyebrow_color, data.eyebrow_opacity=@eyebrow_opacity, data.makeup=@makeup, data.makeup_color=@makeup_color, datalipstick=@lipstick, data.lipstick_color=@lipstick_color'
		SQL:Execute(query_skin .. querSet_skin, params)
		
	else
		print("creator -> License not found")
	end
end)

RegisterServerEvent('cui_character:requestPlayerData')
AddEventHandler('cui_character:requestPlayerData', function()
	local _source = source
	local license = player:GetLicense()

	if license then
		local query = 'SELECT skin FROM player_skins WHERE identifier = @identifier'
		local params = {['@identifier'] = license}

		SQL:Fetch(query, params, function(users)
			local playerData = { skin = nil, newPlayer = true}
				if users and users[1] ~= nil and users[1].skin ~= nil then
					playerData.skin = json.decode(users[1].skin)
					playerData.newPlayer = false
				end
				TriggerClientEvent('cui_character:recievePlayerData', _source, playerData)
			end)
		end)
	else
		print("creator -> License not found")
	end
end)

Creator = Creator()