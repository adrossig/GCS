Keymap = class()

-- See https://cookbook.fivem.net/2020/01/06/using-the-new-console-key-bindings/ for details
function Keymap:__init()

	self.maps = {}
	self.id_pool = IdPool()

end

function Keymap:Register(key, keytype, name, cb)

	local id = self.id_pool:GetNextId()

	if not self.maps[key] then
		self.maps[key] = {}

		local keymap_name = string.format("keymap_%s", name:gsub(" ", "_"))
		RegisterKeyMapping("+" .. keymap_name, name, keytype, key)

		RegisterCommand("+" .. keymap_name, function()
			--for id, callback in pairs(self.maps[key]) do
			for i = 1, #self.maps[key] do
				self.maps[key][i]({down = true})
			end
		end)

		RegisterCommand("-" .. keymap_name, function()
			for i = 1, #self.maps[key] do
				self.maps[key][i]({up = true})
			end
		end)

	end

	self.maps[key][id] = cb

	return id

end

function Keymap:Unregister(key, id)
	if self.maps[key] and self.maps[key][id] then
		self.maps[key][id] = nil
	end
end

Keymap = Keymap()
