local imports = {}

function import(rsc, path)
	if path == nil then
		path = rsc
		rsc = GetCurrentResourceName()
	end

	local key = rsc .. path
	local module = imports[key]

	if module then
		return module
	else
		local code = LoadResourceFile(rsc, path .. ".lua")

		if code then
			local f, err = load(code, rsc .. "/" .. path .. ".lua")

			if f then
				print("\27[32m[ OK ] The module " .. rsc .. "/" .. path .. ".lua" .. " has been loaded correctly\27[0m")
				local ok, res = xpcall(f, debug.traceback)

				if ok then
					imports[key] = res
					return res
				else
					error("error loading module ".. rsc .. "/" .. path .. ":" .. res)
				end

			else
				error("error parsing module ".. rsc .. "/" .. path .. ":" .. debug.traceback(err))
			end
		else
			error("resource file " .. rsc .. "/" .. path .. ".lua not found")
		end
	end
end
