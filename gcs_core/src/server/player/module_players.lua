sPlayers = class()

function sPlayers:__init()
	self.players_by_unique_id = {}

	--for _, player_id in pairs(GetPlayers()) do
	for i = 1, #GetPlayers() do
		self:AddPlayer(GetPlayers()[i], true)
	end
end

-- !! this function must be __loadFirst compatible. ask Dev_34 if confused
function sPlayers:AddPlayer(source, already_connected)
	if self:GetById(source) then return end

	local ids = self:GetPlayerIdentifiers(source)

	-- Getting license failed
	if not ids.license then
		DropPlayer(source, "Could not retrieve license id")
		return
	end

	local player = Player(tonumber(source), ids) -- Player is an immediate_class
	local player_unique_id = player:GetUniqueId()

	if self.players_by_unique_id[player_unique_id] then
		DropPlayer(source, "A player with your unique id already exists on the server")
		return
	end

	self.players_by_unique_id[player_unique_id] = player

	if not already_connected then
		print(string.format("%s%s (%i | %s | %s) joined the server.%s", 
			Colors.Console.Yellow, player:GetName(), player:GetId(), player:GetUniqueId(), player:GetIP(), Colors.Console.Default))
		Events:Fire("PlayerJoined", {player = player})
	end
end

function sPlayers:RemovePlayer(player_unique_id)
	assert(self.players_by_unique_id[player_unique_id] ~= nil, "sPlayers:RemovePlayer tried to remove player that wasn't stored")

	self.players_by_unique_id[player_unique_id] = nil
end

function sPlayers:GetPlayerSyncData(player)
	return {
		source_id = player:GetId(), 
		steam_id = player:GetSteamId(), 
		unique_id = player:GetUniqueId(), 
		name = player:GetName(),
		network_values = player:GetNetworkValues()
	}
end

-- return the sync data for every player we have stored
function sPlayers:GetAllSyncData()
	local sync_data = {}

	--for unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		sync_data[i] = self:GetPlayerSyncData(self.players_by_unique_id[i])
	end

	return sync_data
end

-- !! must be __loadFirst compatible. ask Dev_34 if confused
function sPlayers:GetPlayerIdentifiers(source)
	local ids = 
	{
		steam = "",
		license = "",
		live = "",
		discord = "",
		fivem = "",
		ip = ""
	}
	local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
	
	--for _, v in pairs(identifiers) do
	for i = 1, #identifiers do
		if string.find(identifiers[i], "steam") then
			ids.steam = identifiers[i]:gsub("steam:", "")
		end
		if string.find(identifiers[i], "license") then
			ids.license = identifiers[i]:gsub("license:", "")
		end
		if string.find(identifiers[i], "live") then
			ids.live = identifiers[i]:gsub("live:", "")
		end
		if string.find(identifiers[i], "discord") then
			ids.discord = identifiers[i]:gsub("discord:", "")
		end
		if string.find(identifiers[i], "fivem") then
			ids.fivem = identifiers[i]:gsub("fivem:", "")
		end
		if string.find(identifiers[i], "ip") then
			ids.ip = identifiers[i]:gsub("ip:", "")
		end
	end
	
	return ids
end

function sPlayers:GetPlayers()
	return self.players_by_unique_id
end

function sPlayers:GetNumPlayers()
	return count_table(self.players_by_unique_id)
end

-- "source" id: number
function sPlayers:GetById(id)
	id = tonumber(id)
	--for player_unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		if self.players_by_unique_id[i]:GetId() == id then
			return self.players_by_unique_id[i]
		end
	end
end

function sPlayers:GetByUniqueId(unique_id)
	return self.players_by_unique_id[unique_id]
end

-- Return the player steam id
function sPlayers:GetBySteamId(steam_id)
	--for player_unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		if self.players_by_unique_id[i]:GetSteamId() == steam_id then
			return self.players_by_unique_id[i]
		end
	end
end

-- Return the player license
function sPlayers:GetByLicense(license_id)
	--for player_unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		if self.players_by_unique_id[i]:GetLicense() == license_id then
			return self.players_by_unique_id[i]
		end
	end
end

sPlayers = sPlayers()
