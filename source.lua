local CoreXLoader = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Credits = Instance.new("TextButton")
local CreditsFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Title_2 = Instance.new("TextLabel")
local SupportedGames = Instance.new("Folder")
local PrisonLife = Instance.new("TextButton")
local MM2 = Instance.new("TextButton")
local Title_3 = Instance.new("TextLabel")

CoreXLoader.Name = "CoreX Loader"
CoreXLoader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
CoreXLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = CoreXLoader
Background.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Background.Position = UDim2.new(0.336762398, 0, 0.199519232, 0)
Background.Size = UDim2.new(0.324999988, 0, 0.600000024, 0)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Background

Credits.Name = "Credits"
Credits.Parent = Background
Credits.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.794314384, 0, 0.897435904, 0)
Credits.Size = UDim2.new(0, 56, 0, 17)
Credits.Font = Enum.Font.Ubuntu
Credits.Text = "Credits"
Credits.TextColor3 = Color3.fromRGB(204, 204, 204)
Credits.TextSize = 14.000

CreditsFrame.Name = "CreditsFrame"
CreditsFrame.Parent = Background
CreditsFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
CreditsFrame.Size = UDim2.new(1, 0, 1, 0)
CreditsFrame.Visible = false
CreditsFrame.ZIndex = 3

UICorner_2.CornerRadius = UDim.new(0, 12)
UICorner_2.Parent = CreditsFrame

TextLabel.Parent = CreditsFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0179168656, 0, 0.885416687, 0)
TextLabel.Size = UDim2.new(0, 166, 0, 23)
TextLabel.Font = Enum.Font.Ubuntu
TextLabel.Text = "Made by MemoryEd1tor"
TextLabel.TextColor3 = Color3.fromRGB(204, 204, 204)
TextLabel.TextSize = 15.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = CreditsFrame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.0507644527, 0, 0.136217952, 0)
TextLabel_2.Size = UDim2.new(0, 305, 0, 122)
TextLabel_2.Font = Enum.Font.Ubuntu
TextLabel_2.Text = "I made this script hub for new exploiters that don't know how to script to learn scripting so that's why all the code is open source. I do not like to call people skids just because they want to use the source code to learn, but if you will use something from my script hub, I ask you to give me some credit, thanks for using my script hub and have fun exploiting!"
TextLabel_2.TextColor3 = Color3.fromRGB(204, 204, 204)
TextLabel_2.TextSize = 15.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top

Title.Name = "Title"
Title.Parent = CreditsFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0507644527, 0, 0, 0)
Title.Size = UDim2.new(0, 305, 0, 34)
Title.ZIndex = 2
Title.Font = Enum.Font.Ubuntu
Title.Text = "CoreX Credits"
Title.TextColor3 = Color3.fromRGB(204, 204, 204)
Title.TextSize = 25.000
Title.TextWrapped = true

Close.Name = "Close"
Close.Parent = CreditsFrame
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.Position = UDim2.new(0.017916888, 0, 0.0200320482, 0)
Close.Size = UDim2.new(0, 24, 0, 23)
Close.Font = Enum.Font.Ubuntu
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(204, 204, 204)
Close.TextSize = 20.000
Close.TextWrapped = true

Title_2.Name = "Title"
Title_2.Parent = Background
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(0.0388198756, 0, 0, 0)
Title_2.Size = UDim2.new(0, 310, 0, 34)
Title_2.Font = Enum.Font.Ubuntu
Title_2.Text = "CoreX Loader"
Title_2.TextColor3 = Color3.fromRGB(204, 204, 204)
Title_2.TextSize = 25.000
Title_2.TextWrapped = true

SupportedGames.Name = "SupportedGames"
SupportedGames.Parent = Background

PrisonLife.Name = "Prison Life"
PrisonLife.Parent = SupportedGames
PrisonLife.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
PrisonLife.BorderSizePixel = 0
PrisonLife.Position = UDim2.new(0.0388198756, 0, 0.228365391, 0)
PrisonLife.Size = UDim2.new(0, 94, 0, 20)
PrisonLife.Font = Enum.Font.Ubuntu
PrisonLife.Text = "Prison Life"
PrisonLife.TextColor3 = Color3.fromRGB(204, 204, 204)
PrisonLife.TextSize = 15.000
PrisonLife.TextWrapped = true

MM2.Name = "MM2"
MM2.Parent = SupportedGames
MM2.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
MM2.BorderSizePixel = 0
MM2.Position = UDim2.new(0.349378884, 0, 0.228365377, 0)
MM2.Size = UDim2.new(0, 53, 0, 20)
MM2.Font = Enum.Font.Ubuntu
MM2.Text = "MM2"
MM2.TextColor3 = Color3.fromRGB(204, 204, 204)
MM2.TextSize = 15.000
MM2.TextWrapped = true

Title_3.Name = "Title"
Title_3.Parent = Background
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.Position = UDim2.new(0, 0, 0.136217952, 0)
Title_3.Size = UDim2.new(0, 130, 0, 23)
Title_3.Font = Enum.Font.Ubuntu
Title_3.Text = "Supported Games"
Title_3.TextColor3 = Color3.fromRGB(204, 204, 204)
Title_3.TextSize = 15.000
Title_3.TextWrapped = true

local function DWXSLG_fake_script()
	local script = Instance.new('LocalScript', Credits)

	local credits = script.Parent
	local frame = credits.Parent.CreditsFrame
	local close = frame.Close
	
	credits.MouseButton1Click:Connect(function()
		frame.Visible = true
	end)
	
	close.MouseButton1Click:Connect(function()
		frame.Visible = false
	end)
end
coroutine.wrap(DWXSLG_fake_script)()
local function AGUEO_fake_script()
	local script = Instance.new('LocalScript', SupportedGames)

	local supportedGamesFolder = script.Parent
	local MM2 = supportedGamesFolder.MM2
	local PrisonLife = supportedGamesFolder["Prison Life"]
	
	MM2.MouseButton1Click:Connect(function()
		if game.PlaceId == 142823291 then
			print("MM2")
		end
	end)
	
	PrisonLife.MouseButton1Click:Connect(function()
		if game.PlaceId == 155615604 then
			loadstring(game:HttpGet(("https://raw.githubusercontent.com/MemoryEditor/CoreX-Hub/main/Games/Prison%20Life/source.lua")))()
		end
	end)
end
coroutine.wrap(AGUEO_fake_script)()
local function AXMMN_fake_script()
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
coroutine.wrap(AXMMN_fake_script)()
