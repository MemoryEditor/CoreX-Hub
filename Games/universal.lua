local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character.Humanoid
local backpack = player:WaitForChild("Backpack")

local prefix = ";"

local commands = {}

-- Functions --
commands.prefix = function()
	print("The current prefix is " .. prefix)
end

commands.setprefix = function(arguments)
	for i,v in pairs(arguments) do
		prefix = v
	end
end

commands.changeprefix = commands.setprefix

commands.walkspeed = function(arguments)
	for i,v in pairs(arguments) do
		humanoid.WalkSpeed = tonumber(v)
	end
end

commands.speed = commands.walkspeed

commands.jumpheight = function(arguments)
	for i,v in pairs(arguments) do
		humanoid.JumpHeight = tonumber(v)
	end
end

commands.jh = commands.jumpheight

commands.hipheight = function(arguments)
	for i,v in pairs(arguments) do
		humanoid.HipHeight = tonumber(v)
	end
end

commands.sit = function()
	humanoid.Sit = true
end

--[[
commands.god = function()
	local appearanceId = game.Players:GetHumanoidDescriptionFromUserId(player.CharacterAppearanceId)
	
	if character:FindFirstChild("Humanoid").RigType == Enum.HumanoidRigType.R15 then
		local rig = game.Players:CreateHumanoidModelFromDescription(appearanceId, Enum.HumanoidRigType.R15)
		rig:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
		rig.Name = player.Name
		character = rig
		rig.Parent = workspace
	elseif character:FindFirstChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
		local rig = game.Players:CreateHumanoidModelFromDescription(appearanceId, Enum.HumanoidRigType.R6)
		rig:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
		rig.Name = player.Name
		character = rig
		rig.Parent = workspace
	end
end
--]]

commands.goto = function(arguments)
	for i,v in ipairs(arguments) do
		for _,p in pairs(game:GetService("Players"):GetPlayers()) do
			local _p = string.lower(p.Name)
			local _pDisplay = string.lower(p.DisplayName)
			if string.match(_p, v, 1) or string.match(_pDisplay, v, 1) then
				local Character = workspace[player.Name]
				local HumanoidRootPart = Character.HumanoidRootPart
				HumanoidRootPart.CFrame = workspace[p.Name].HumanoidRootPart.CFrame
			end
		end
	end
end

commands.loopgoto = function(arguments)
	_G.loopGoto = true

	for i,v in ipairs(arguments) do
		while _G.loopGoto == true do
			wait()
			for _,p in pairs(game:GetService("Players"):GetPlayers()) do
				local _p = string.lower(p.Name)
				local _pDisplay = string.lower(p.DisplayName)
				if string.match(_p, v, 1) or string.match(_pDisplay, v, 1) then
					local Character = workspace[player.Name]
					local HumanoidRootPart = Character.HumanoidRootPart
					HumanoidRootPart.CFrame = workspace[p.Name].HumanoidRootPart.CFrame
				end
			end
		end
	end
end

commands.unloopgoto = function(arguments)
	_G.loopGoto = false
end

commands.noclip = function()
	_G.noclip = true

	RunService.Stepped:Connect(function()
		if _G.noclip == true then
			for i,v in pairs(player.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
		end
	end)
end

commands.clip = function()
	if _G.noclip == true then
		_G.noclip = false
	end
end

player.Chatted:Connect(function(message, recipient)
	message = string.lower(message)

	local split = message:split(" ")

	local splitPrefix = split[1]

	local command = splitPrefix:split(prefix)

	local commandName = command[2]

	if commands[commandName] then
		local args = {}

		for i = 2, #split, 1 do
			table.insert(args,split[i])
		end

		commands[commandName](args)
	end
end)
