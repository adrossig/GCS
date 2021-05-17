ChatUtility = class()

function ChatUtility:__init()

end

---Formats a message.
---@param msg string Message sent by the player.
---@param player Player Player who sent the message.
---@param color RGB Color of the message, only used by system messages.
---@param args object Additional arguments for the message, such as channel or timeout.
---@return object Returns formatted message.
function ChatUtility:FormatMessage(args)
	if args.player ~= nil then
		return self:FormatPlayerMessage(args)
	else
		args.color = args.color or Colors.White
		return self:FormatSystemMessage(args)
	end
end

--Formats a message sent by the server.
--Can't put msg in the HTML in case players are using <i> or [#ffffff] things
---@param msg string Message sent by the player.
---@param c RGB Color of the message.
---@param args object Additional arguments for the message, such as channel or timeout.
---@return object Returns formatted message.
function ChatUtility:FormatSystemMessage(args)
	local color_s = string.format('color:rgb(%i,%i,%i)', args.color.r, args.color.g, args.color.b)

	if args == nil then
		return
		{
			html = self:FormatChatMessage(string.format('<span class="message-body" style="%s;" id="m_">%s</span>', color_s, args.text))
		}
	else
		local obj = {}

		-- If we don't use any vulnerable player names, just make it the HTML
		if args.use_name == nil then
			obj.html = self:FormatChatMessage(string.format('<span class="message-body" style="%s;" id="m_">%s</span>', color_s, args.text))
		else
			obj.html = self:FormatChatMessage(string.format('<span class="message-body" style="%s;" id="m_"></span>', color_s))
			obj.msg = args.text
		end

		if args.timeout ~= nil then
			obj.timeout = args.timeout
		end

		if args.channel ~= nil then
			obj.channel = args.channel
		end

		if args.style ~= nil then
			obj.style = args.style
		end

		return obj
	end
end

---Formats a message sent by a player.
---@param msg string Message sent by the player.
---@param player Player Player who sent the message.
---@param channel string Channel that the player sent the message on.
---@return object Returns formatted message.
function ChatUtility:FormatPlayerMessage(args)
	local html = ''
	local obj = {
		html = html,
		name = args.player:GetName(),
		msg = args.text,
		channel = args.channel,
		pid = args.player:GetId()
	}

	local isAdmin = false

	local htmlTags = ""
	if args.player:GetValue('Nametags') ~= nil then
		--for k,v in pairs(args.player:GetValue('Nametags')) do
		for i = 1, #args.player:GetValue('Nametags') do
			local tag = args.player:GetValue('Nametags')[i]
			htmlTags = htmlTags .. string.format('<span id="tag" style="background-color:%s;">%s</span>', tag.color, tag.name)

			isAdmin = string.upper(tag.name.toUpperCase()) == "ADMIN"
		end
	end

	local color = args.player:GetColor()

	html = string.format('%s<span class="player-name" style="color: %s;" id="n_%i"></span>[#FFFFFF]: <span class="message-body" id="m_"></span>',
		htmlTags, tostring(color), args.player:GetId())

	if string.find(args.text, '@everyone') ~= nil and isAdmin then
		obj.everyone = true
	end

	html = self:FormatChatMessage(html);
	obj.html = html;

	return obj
end

--Formats hex tags [#ffffff] into HTML.
---@param msg string Message to format for hex tags.
---@return string Returns formatted HTML string.
-- Credit to Jan Christophersen for the original hex tag formatter (this one has been ported to lua)
function ChatUtility:FormatChatMessage(msg) -- Formats messages with [#FFFFFF] tags
	local i = 0
	local pos = msg:find('%[#')

	while pos ~= nil do
		local start_pos = pos - 1
		local end_pos = pos + 8;

		if msg[end_pos] ~= ']' then
			pos = msg:find('%[#', pos + 1)
		else
			local color = msg:sub(start_pos + 2, end_pos - 1)
			local buf = msg:sub(0, start_pos)
			if i == 0 then
				buf = buf .. string.format('<font style="color: %s">', color)
			else
				buf = buf .. string.format('</font><font style="color: %s">', color);
			end
			buf = buf .. msg:sub(end_pos + 1, string.len(msg));

			msg = buf
			pos = msg:find('%[#', end_pos)
			i = i + 1
		end
	end
	
	msg = msg .. "</font>"
	return msg
end
