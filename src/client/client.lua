local Fiu = require("../Packages/Fiu")
local UI = require("./UI.luau")

local Remote = ...

local ui = UI()
ui.screenGui.Parent = script

local luauSettings = Fiu.luau_newsettings()

luauSettings.callHooks.panicHook = function(message, stack, debugging)
	print(debugging.name, message)
	for i, v in stack do
		print(i, v)
	end
end
luauSettings.callHooks.interruptHook = function(stack, debugging)
	print(debugging.name, "interrupted!")
end

ui.enterButton.MouseButton1Click:Connect(function()
	local code = ui.scriptBox.Text
	local success, result = pcall(function()
		return Remote:InvokeServer(code)
	end)
	if success then
		local luau_execute = Fiu.luau_load(result, getfenv(), luauSettings)
		luau_execute()
	else
		print(result)
	end
end)
