local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
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

commands.goto = function(arguments)
	for i,v in ipairs(arguments) do
		for _,p in pairs(game:GetService("Players"):GetPlayers()) do
			local _p = string.lower(p.Name)
			if string.match(_p, v, 1) then
				local Character = workspace[player.Name]
				local HumanoidRootPart = Character.HumanoidRootPart
				HumanoidRootPart.CFrame = workspace[p.Name].HumanoidRootPart.CFrame
			end
		end
	end
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
