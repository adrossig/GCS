Character = class()

function Character:__init(id, name, level, xp, groups, inventory)
	self.player_id = tonumber(id)
	self.name = name
	self.level = level or 1
	self.exprience = xp or 0
	self.groups = groups or {}
	self.inventory = inventory or {}
end

function Character:GetId()
	return (self.id)
end

function Character:GetName()
	return (self.name)
end

function Character:GetLevel()
	return (self.level)
end

function Character:GetExperience()
	return (self.exprience)
end

function Character:HasGroups(group)
	return (self.groups[group] ~= nil)
end

function Character:GetInventory()
	return (self.inventory)
end

function Character:GetMoney()
	return (self.inventory:GetItemAmount('generic_money'))
end

function Character:GetContinentalCoin()
	return (self.inventory:GetItemAmount('continental_coin'))
end

function Character:AddMoney(amount)
	return (self.inventory:AddItemAmount('generic_money', tonumber(amount)))
end

function Character:AddContinentalCoin(amount)
	return (self.inventory:AddItemAmount('continental_coin', tonumber(amount)))
end

function Character:AddExperience(amount)
	self.exprience = tonumber(self.exprience) + tonumber(amount)
end
