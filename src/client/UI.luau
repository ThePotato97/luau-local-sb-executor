return function()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "Executor"
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local main = Instance.new("CanvasGroup")
	main.Name = "main"
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	main.BackgroundTransparency = 1
	main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	main.BorderSizePixel = 0
	main.Position = UDim2.fromScale(0.5, 0.5)
	main.Size = UDim2.fromOffset(500, 500)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "uICorner"
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = main

	local scriptBox = Instance.new("TextBox")
	scriptBox.Name = "scriptBox"
	scriptBox.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Light)
	scriptBox.Text = ""
	scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	scriptBox.TextSize = 14
	scriptBox.TextXAlignment = Enum.TextXAlignment.Left
	scriptBox.TextYAlignment = Enum.TextYAlignment.Top
	scriptBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	scriptBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scriptBox.BorderSizePixel = 0
	scriptBox.TextWrapped = true
	scriptBox.ClearTextOnFocus = false
	scriptBox.Size = UDim2.fromScale(1, 0.9)
	scriptBox.Parent = main

	local enterButton = Instance.new("TextButton")
	enterButton.Name = "enterButton"
	enterButton.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
	enterButton.Text = "Run Script"
	enterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	enterButton.TextScaled = true
	enterButton.TextSize = 14
	enterButton.TextWrapped = true
	enterButton.AnchorPoint = Vector2.new(0.5, 1)
	enterButton.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
	enterButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	enterButton.BorderSizePixel = 0
	enterButton.Position = UDim2.fromScale(0.5, 1)
	enterButton.Size = UDim2.fromScale(1, 0.1)
	enterButton.Parent = main

	main.Parent = screenGui
	return {
		screenGui = screenGui,
		scriptBox = scriptBox,
		enterButton = enterButton,
	}
end
