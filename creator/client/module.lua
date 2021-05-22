Creator = class()

function Creator:__init()
	self.previewPed = nil
	self.currentTab = nil
	self.currentIdentity = nil
	self.isCancelable = true
	self.isFirstSpawn = true
	self.isFirstSpawn = true
	self.isFirstSpawn = true
	self.preparingSkin = true
	self.isInterfaceOpening = false
	self.isModelLoaded = false
	self.isPlayerReady = false
	self.initialized = false
	self.isVisible = false
	self.playerLoaded = false
	self.identityLoaded = false
	self.isPlayerNew = false
	self.visible = false
	self.openTabs = {}
	self.currentChar = {}
	self.oldChar = {}
	self.ui = UI:Create({name = "Creator", path = 'creator/html/index.html', self.visible})
end

function Creator:PreparePlayer()
	if not Camera:IsFadedOut() then
		Camera:FadeOut(0)
	end

	while not self.isModelLoaded do 
		Wait(0)
	end

	local playerPed = LocalPlayer:GetPedId()
	SwitchOutPlayer(playerPed, 0, 1)

	while GetPlayerSwitchState() ~= 5 do
		Wait(0)
	end

	Camera:FadeIn(500)
	if not Camera:IsFadedIn() then
		Wait(0)
	end

	SwitchInPlayer(playerPed)
	while GetPlayerSwitchState() ~= 12 do
		Wait(0)
	end

	self.isPlayerReady = true
end

-- Prepare le joueur a entrez dans la creation perso
function Creator:BeginCharacterPreview()
	for index, value in pairs(self.currentChar) do
		self.oldChar[index] = value
	end

	local playerPed = LocalPlayer:GetPedId()
	local playerHeading = Entity:GetHeading(playerPed)
	self.previewPed = ClonePed(playerPed, playerHeading, false, true)
	LocalPlayer:SetTotallyInvincible(true)
	FreezPedCameraRotation(self.previewPed, true)
	Entity:SetKinematic(true)
	PlayIdleAnimation(self.previewPed)
end

-- @args data : Données du joueur
-- Fini la creation personnage
function Creator:EndCharacterPreview(data)
	if self.previewPed then
		if data then
			local newModel = GetHashKey('mp_m_freemode_01')
			
			if self.currentChar.sex == 1 then
				newModel = GetHashKey('mp_f_freemode_01')
			end

			if Entity:GetModel() ~= newModel then
				LoadModel(newModel)
			end

			ClonePedToTarget(self.previewPed, LocalPlayer:GetPedId())
		else
			for index, value in pairs(self.oldChar) do
				self.currentChar[index] = value
			end
		end

		ClearAllAnimations(self.previewPed)
		Entity:Remove()
	end
end

-- Réinitialise toutes les pages de la creation
function Creator:ResetAllTabs()
	local clothes = nil

	for index, value in pairs(self.openTabs) do
		if self.openTabs[index] == 'apparel' then
			clothes = Creator:GetClothesData()
		end
	end

	self.ui:CallEvent({
		action = 'enableTabs',
		tabs = self.openTabs,
		character = self.currentChar,
		clothes = clothes,
		identity = self.currentIdentity
	})
end

-- @args data : Tableau contenant les infos sur la tenue du joueur
-- Cette function va uniquement charger les infos sur les vêtements et les mettre à jours
function Creator:UpdateClothes(data)
	local playerPed = LocalPlayer:GetPedId()

	for index, value in pairs(data) do
		self.currentChar[index] = value
	end

	SetPedComponentVariation(playerPed, 8,  self.currentChar.tshirt_1,   self.currentChar.tshirt_2,   2)
	SetPedComponentVariation(playerPed, 11, self.currentChar.torso_1,    self.currentChar.torso_2,    2)
	SetPedComponentVariation(playerPed, 10, self.currentChar.decals_1,   self.currentChar.decals_2,   2)
	SetPedComponentVariation(playerPed, 3,  self.currentChar.arms,       self.currentChar.arms_2,     2)
	SetPedComponentVariation(playerPed, 4,  self.currentChar.pants_1,    self.currentChar.pants_2,    2)
	SetPedComponentVariation(playerPed, 6,  self.currentChar.shoes_1,    self.currentChar.shoes_2,    2)
	SetPedComponentVariation(playerPed, 1,  self.currentChar.mask_1,     self.currentChar.mask_2,     2)
	SetPedComponentVariation(playerPed, 9,  self.currentChar.bproof_1,   self.currentChar.bproof_2,   2)
	SetPedComponentVariation(playerPed, 7,  self.currentChar.neckarm_1,  self.currentChar.neckarm_2,  2)
	SetPedComponentVariation(playerPed, 5,  self.currentChar.bags_1,     self.currentChar.bags_2,     2)

	if self.currentChar.helmet_1 == -1 then
		ClearPedProp(playerPed, 0)
	else
		SetPedPropIndex(playerPed, 0, self.currentChar.helmet_1, self.currentChar.helmet_2, 2)
	end

	if self.currentChar.glasses_1 == -1 then
		ClearPedProp(playerPed, 1)
	else
		SetPedPropIndex(playerPed, 1, self.currentChar.glasses_1, self.currentChar.glasses_2, 2)
	end

	if self.currentChar.lefthand_1 == -1 then
		ClearPedProp(playerPed, 6)
	else
		SetPedPropIndex(playerPed, 6, self.currentChar.lefthand_1, self.currentChar.lefthand_2, 2)
	end

	if self.currentChar.righthand_1 == -1 then
		ClearPedProp(playerPed,	7)
	else
		SetPedPropIndex(playerPed, 7, self.currentChar.righthand_1, self.currentChar.righthand_2, 2)
	end

	if self.currentChar.ears_1 == -1 then
		ClearPedProp(playerPed, 2)
	else
		SetPedPropIndex(playerPed, 2, self.currentChar.ears_1, self.currentChar.ears_2, 2)
	end
end

-- Opening the character creator
Network:Subscribe('creator:open', function(tabs, cancelable)
	if self.isInterfaceOpening then
		return
	end
	self.isInterfaceOpening = true

	if cancelable ~= nil then
		self.isCancelable = cancelable
	end

	while (not self.initialized) or (not self.isModelLoaded) or (not self.isPlayerReady) do
		Wait(100)
	end

	local maleModelHash = GetHashKey('mp_m_freemode_01')
	local femaleModelHash = GetHashKey('mp_f_freemode_01')
	LoadModel(maleModelHash)
	LoadModel(femaleModelHash)
	RequestStreamedTextureDict('mparrow')
	RequestStreamedTextureDict('mpleaderboard')

	while not HasStreamedTextureDictLoaded('mparrow') or 
			not HasStreamedTextureDictLoaded('mpleaderboard') or 
			not HasModelLoaded(maleModelHash) or
			not HasModelLoaded(femaleModelHash) do
		Wait(100)
	end

	Creator:BeginCharacterPreview()
	self.ui:CallEvent('clearAllTabs')
	local firstName = ""
	local clothes = nil

	for i = 0, #self.openTabs do
		self.openTabs = nil
	end

	for index, value in pairs(tabs) do
		if index == 1 then
			firstName = value
		end

		self.openTabs[index] = tabs[index]
		if tabs[index] == 'identity' then
			if not self.identityLoaded then
				RequestStreamedTextureDict('pause_menu_pages_char_mom_dad')
				RequestStreamedTextureDict('char_creator_portraits')
			
				while not HasStreamedTextureDictLoaded('pause_menu_pages_char_mom_dad') or not HasStreamedTextureDictLoaded('char_creator_portraits') do
					Wait(100)
				end
				self.identityLoaded = true
			end
		elseif tabName == 'apparel' then
			-- load clothes data from natives here
			clothes = GetClothesData()
		end
	end

	self.ui:CallEvent('enabledTabs', {
		tabs = tabs,
		character = self.currentChar,
		clothes = clothes,
		identity = self.currentIdentity
	})
	self.ui:CallEvent('activateTabs', {
		tabs = tabs,
		character = self.currentChar,
		clothes = clothes,
		identity = self.currentIdentity
	})
end)

Creator = Creator()
