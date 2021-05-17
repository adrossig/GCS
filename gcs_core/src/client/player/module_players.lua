cPlayers = class()

function cPlayers:__init()
	self.players_by_unique_id = {}
	self.received_data = false

	Network:Subscribe("__SyncConnectedPlayers", function(data)
		self:SyncConnectedPlayers(data, not self.received_data)
		self.received_data = true
	end)

	Network:Subscribe("__SyncConnectedPlayer", function(sync_data)
		if not self.players_by_unique_id[player_unique_id] then
			self:AddPlayer(sync_data)

			local player = self:GetByUniqueId(sync_data.unique_id)
			Events:Fire("PlayerJoined", {player = player})
		else
			self:AddPlayer(sync_data)
		end
	end)

	Network:Send("__RequestApiPlayerData")

	while not self.received_data do
		Wait(10)
	end
end

function cPlayers:__postLoad()
	
end

-- getting all the players from the server
function cPlayers:SyncConnectedPlayers(data, on_init)
	-- print("--- syncing Players ---")

	--for player_unique_id, sync_data in pairs(data) do
	for i = 1, #data do
		if not self.players_by_unique_id[i] then
			self:AddPlayer(data[i])

			local player = self:GetByUniqueId(data[i].unique_id)
			if not on_init then
				Events:Fire("PlayerJoined", {player = player})
			end

			-- print("Player Added: ", player)
		else
			self:AddPlayer(data[i])
		end
	end
	
	-- print("------------------------------------")
end

function cPlayers:GetLocalPlayer()
	--for player_unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		if LocalPlayer:IsPlayer(self.players_by_unique_id[i]) then
			return self.players_by_unique_id[i]
		end
	end
end

function cPlayers:GetNearestPlayer(position)
	local closest_player
	local closest_distance = 99999

	--for player_unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		local distance =  #(position - self.players_by_unique_id[i]:GetPosition())

		if distance < closest_distance then
			closest_distance = distance
			closest_player = self.players_by_unique_id[i]
		end
	end

	return closest_player, closest_distance
end

function cPlayers:AddPlayer(sync_data)
	local player = Player(sync_data.source_id, sync_data.steam_id, sync_data.source_id, sync_data.unique_id)
	player:SetName(sync_data.name)

	--for name, value in pairs(sync_data.network_values) do
	for i = 1, #sync_data.network_values do
		player:SetValue(i, sync_data.network_values[i])
	end

	self.players_by_unique_id[player:GetUniqueId()] = player
end

function cPlayers:RemovePlayer(player_unique_id)
	self.players_by_unique_id[player_unique_id] = nil
end

function cPlayers:GetByUniqueId(player_unique_id)
	return self.players_by_unique_id[player_unique_id]
end

function cPlayers:GetByPlayerId(id)
	--for player_unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		if self.players_by_unique_id[i]:GetPlayerId() == id then
			return self.players_by_unique_id[i]
		end
	end
end

function cPlayers:GetByServerId(server_id)
	--for player_unique_id, player in pairs(self.players_by_unique_id) do
	for i = 1, #self.players_by_unique_id do
		if self.players_by_unique_id[i]:GetId() == server_id then
			return self.players_by_unique_id[i]
		end
	end
end

function cPlayers:GetNumPlayers()
	return count_table(self.players_by_unique_id)
end

function cPlayers:GetPlayers()
	-- todo: write new iterator
	return self.players_by_unique_id
end

cPlayers = cPlayers()
