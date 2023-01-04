local CoreXMM2 = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local MurdererLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local SheriffLabel = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local FarmCoinsButton = Instance.new("TextButton")

CoreXMM2.Name = "CoreX MM2"
CoreXMM2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
CoreXMM2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = CoreXMM2
Background.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Background.Position = UDim2.new(0.294060558, 0, 0.199519232, 0)
Background.Size = UDim2.new(0, 421, 0, 249)
Background.ZIndex = math.huge

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Background

Title.Name = "Title"
Title.Parent = Background
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0316939168, 0, 0, 0)
Title.Size = UDim2.new(0, 394, 0, 34)
Title.Font = Enum.Font.Ubuntu
Title.Text = "CoreX MM2"
Title.TextColor3 = Color3.fromRGB(204, 204, 204)
Title.TextSize = 25.000
Title.TextWrapped = true

MurdererLabel.Name = "MurdererLabel"
MurdererLabel.Parent = Background
MurdererLabel.BackgroundColor3 = Color3.fromRGB(188, 0, 0)
MurdererLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
MurdererLabel.BorderSizePixel = 0
MurdererLabel.Position = UDim2.new(0.643705428, 0, 0.168674693, 0)
MurdererLabel.Size = UDim2.new(0, 136, 0, 21)
MurdererLabel.Font = Enum.Font.Ubuntu
MurdererLabel.Text = ""
MurdererLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
MurdererLabel.TextSize = 15.000
MurdererLabel.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = MurdererLabel

SheriffLabel.Name = "SheriffLabel"
SheriffLabel.Parent = Background
SheriffLabel.BackgroundColor3 = Color3.fromRGB(0, 3, 188)
SheriffLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
SheriffLabel.BorderSizePixel = 0
SheriffLabel.Position = UDim2.new(0.643705428, 0, 0.277108431, 0)
SheriffLabel.Size = UDim2.new(0, 136, 0, 21)
SheriffLabel.Font = Enum.Font.Ubuntu
SheriffLabel.Text = ""
SheriffLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
SheriffLabel.TextSize = 15.000
SheriffLabel.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = SheriffLabel

FarmCoinsButton.Name = "FarmCoinsButton"
FarmCoinsButton.Parent = Background
FarmCoinsButton.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
FarmCoinsButton.BorderSizePixel = 0
FarmCoinsButton.Position = UDim2.new(0.0294688344, 0, 0.158480108, 0)
FarmCoinsButton.Size = UDim2.new(0, 76, 0, 17)
FarmCoinsButton.Font = Enum.Font.Ubuntu
FarmCoinsButton.Text = "Farm Coins"
FarmCoinsButton.TextColor3 = Color3.fromRGB(204, 204, 204)
FarmCoinsButton.TextSize = 14.000

local function SFDQVB_fake_script()
	local script = Instance.new('LocalScript', Background)

	local Drag = script.Parent
	local gsCoreGui = game:GetService("CoreGui")
	local gsTween = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		local dragTime = 0.04
		local SmoothDrag = {}
		SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
		dragSmoothFunction:Play()
	end
	Drag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Drag.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Drag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging and Drag.Size then
			update(input)
		end
	end)

end
coroutine.wrap(SFDQVB_fake_script)()
local function XCLAYHJ_fake_script()
	local script = Instance.new('LocalScript', FarmCoinsButton)

	local farmCoinsButton = script.Parent

	local player = game.Players.LocalPlayer
	local character = player.Character

	local enabled = false

	farmCoinsButton.MouseButton1Click:Connect(function()
		if enabled == false then
			enabled = true
			_G.farmCoins = true

			while _G.farmCoins == true do
				wait()
				for i,v in ipairs(workspace:GetChildren()) do
					if v:FindFirstChild("CoinContainer") then
						for _,coin in pairs(v.CoinContainer:GetChildren()) do
							if coin.Name == "Coin_Server" then
								wait(2.5)
								character.HumanoidRootPart.CFrame = coin.CFrame
							end
						end
					end
				end
			end
		else
			enabled = false
			_G.farmCoins = false
		end
	end)
end
coroutine.wrap(XCLAYHJ_fake_script)()
local function SNIMI_fake_script()
	local script = Instance.new('LocalScript', Background)

	local back = script.Parent
	local murdererLabel = back.MurdererLabel
	local sheriffLabel = back.SheriffLabel

	local players = game:GetService("Players")

	while wait() do
		for i,v in ipairs(players:GetChildren()) do
			local character = v.Character

			if v.Backpack:FindFirstChild("Knife") or character:FindFirstChild("Knife") then
				murdererLabel.Text = v.Name
			elseif v.Backpack:FindFirstChild("Gun") or character:FindFirstChild("Gun") then
				sheriffLabel.Text = v.Name
			end
		end
	end
end
coroutine.wrap(SNIMI_fake_script)()

local function AUIQW_fake_script()
	local script = Instance.new("LocalScript", game.Players.LocalPlayer.PlayerScripts)
	
	while wait() do
		if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("CoreXMM2") then
			loadstring(game:HttpGet(("https://raw.githubusercontent.com/MemoryEditor/CoreX-Hub/main/Games/MM2/source.lua")))()
			return	
		end
	end
end
coroutine.wrap(AUIQW_fake_script)()
