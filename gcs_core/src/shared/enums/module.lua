--[[
	Copyright (c) 2020 Judah Caruso (0px.moe)
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
--]]

local table_sort = table.sort
local Enum = {}

local function _sort(table_t)
	local keys_t = {}
	for key_s, key_v in pairs(table_t) do
		if type(key_v) ~= "function" then
			keys_t[#keys_t+1] = key_s
		end
	end

	table_sort(keys_t, function(left, right)
		return table_t[left] < table_t[right]
	end)

	return keys_t
end

function Enum.Ordered(key_s, value_v)
	return { key_s, value_v }
end

function Enum.new(...)
	local enum_t       = {}
	local iota_i       = 0
	local length_i     = 0
	local widest_key_i = 0

	local values_t = (type(...) == "table" and ... or { ... })
	for _, table_value_v in pairs(values_t) do
		local name_s = table_value_v

		if type(_) == "string" then
			name_s = _

			local converted_value = tonumber(table_value_v)
			if converted_value == nil then
				error(("Invalid value for enum. Expected number but found '%s'"):format(table_value_v))
			end

			iota_i = converted_value
		elseif type(table_value_v) == "table" then
			assert(#table_value_v == 2,
				"Malformed ordered enum value. Use Enum.Ordered instead.")

			assert(type(table_value_v[1]) == "string",
				("Expected value to be of type string but found '%s'"):format(type(table_value_v[1])))

			assert(tonumber(table_value_v[2]) ~= nil,
				("Expected enum value to be of type number but found '%s'"):format(type(table_value_v[2])))

			name_s = table_value_v[1]
			iota_i = table_value_v[2]
		end

		local len_i = name_s:len()
		if len_i > widest_key_i then
			widest_key_i = len_i
		end

		if enum_t[name_s] ~= nil then
			error(("Attempt to re-define enum value '%s'."):format(name_s), 2)
		end

		enum_t[name_s] = iota_i
		iota_i         = iota_i + 1
		length_i       = length_i + 1
	end

	enum_t.tostring = function(self, value_v)
		-- Support both ('.' and ':') calling conventions.
		if type(self) ~= "table" then
			value_v = self
			self    = enum_t
		end

		for enum_name_s, enum_value_v in pairs(self) do
			if enum_value_v == value_v then
				return enum_name_s
			end
		end

		error(("Attempt to convert nonexistent enum value '%s' into a string."):format(value_v), 2)
	end

	local metatable_t = {
		sorted_t = _sort(enum_t),

		__len = function(self)
			return length_i
		end,

		__index = function(self, key_s)
			if enum_t[key_s] ~= nil then return enum_t[key_s] end

			local err_s    = ("Attempt to index invalid enum value '%s'.\nExpected one of:"):format(key_s)
			local sorted_t = getmetatable(self).sorted_t

			local index_i = 0
			for _, enum_name_s in pairs(sorted_t) do
				local delimiter_s = (index_i < #sorted_t and "\n  * " or '')
				err_s   = err_s .. ("%s%s"):format(delimiter_s, enum_name_s)
				index_i = index_i + 1
			end

			error(err_s, 2)
		end,

		__newindex = function(self, key_s, value_v)
			error(("Attempt to change immutable enum value '%s' from '%s' to '%s'."):format(key_s, self[key_s], value_v), 2)
		end,

		__pairs = function(self)
			local iteration_i = 1
			local sorted_t    = getmetatable(self).sorted_t

			local function iter_fn(table, next)
				local enum_name_s = table[iteration_i]
				if enum_name_s == nil then
					return nil, nil
				end

				iteration_i = iteration_i + 1
				return enum_name_s, self[enum_name_s]
			end

			return iter_fn, sorted_t, iteration_i
		end,

		__tostring = function(self)
			local str      = "{\n"
			local sorted_t = getmetatable(self).sorted_t

			for index_i, enum_name_s in pairs(sorted_t) do
				local enum_value_s = self[enum_name_s]
				local newline_s    = (index_i < #sorted_t and '\n' or '')
				local spaces_s     = (" "):rep(widest_key_i - enum_name_s:len())
				str = str .. ("  %s%s = %s%s"):format(enum_name_s, spaces_s, enum_value_s, newline_s)
			end

			return str .. "\n}"
		end,

		__concat = function(left_v, right_v)
			return left_v .. tostring(right_v)
		end,
	}

	return setmetatable({}, metatable_t)
end

return setmetatable(Enum, {
	__call = function(_, ...)
		return Enum.new(...)
	end,
})
