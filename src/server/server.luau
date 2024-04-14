local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function Parse(code: string): string
	local parsed = ""
	for _, v in string.split(code, "\\") do
		local number = tonumber(v)
		if not number then
			continue
		end
		parsed = parsed .. string.char(number)
	end
	return parsed
end

function Bytecode(code: string): string
	local res = HttpService:RequestAsync({
		Url = "http://luau.thepotato.uk/bytes",
		Method = "POST",
		Headers = {
			["Content-Type"] = "text/plain",
		},
		Body = code,
	})
	return Parse(res.Body)
end

local remote = Instance.new("RemoteFunction")
remote.Name = HttpService:GenerateGUID()
remote.Parent = ReplicatedStorage

remote.OnServerInvoke = function(player: Player, code: string): string
	if player ~= owner then
		return "Access Denied."
	end
	local success, result = pcall(function()
		return Bytecode(code)
	end)
	if success then
		return result
	else
		return result
	end
end
