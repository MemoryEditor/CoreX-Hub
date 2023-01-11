local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local character = player.Character

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

commands.taze = function(arguments)
	for i,v in pairs(arguments) do
		for _,p in pairs(game:GetService("Players"):GetPlayers()) do
			if string.match(p.Name, v, 1) then
				local Taser = game:GetService("Workspace")[player.Name]:WaitForChild("Taser")
				print(Taser)

				local ReloadEvent = game:GetService("ReplicatedStorage").ReloadEvent
				ReloadEvent:FireServer(Taser)

				local A_1 = {
					[1] =  {
						["RayObject"] = Ray.new(Vector3.new(927.3883666992188, 101.48998260498047, 2385.08447265625), Vector3.new(66.51451110839844, -2.4309113025665283, 74.63182830810547)), 
						["Distance"] = 2.6539480686187744, 
						["Cframe"] = CFrame.new(929.468567, 101.260002, 2387.52026, 0.711526573, -0.0635519177, 0.699779212, 0, 0.995901346, 0.0904448777, -0.70265913, -0.0643539354, 0.708610356), 
						["Hit"] = game:GetService("Workspace")[p.Name].Head
					}
				}

				local Event = game:GetService("ReplicatedStorage").ShootEvent
				Event:FireServer(A_1, Taser)	
			end
		end
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

commands.arrest = function(arguments)
	for i,v in pairs(arguments) do
		for _,p in pairs(game:GetService("Players"):GetPlayers()) do
			local _p = string.lower(p.Name)
			if string.match(_p, v, 1) then
				local repeatTP = 10

				while repeatTP >= 0 do
					local Character = workspace[player.Name]
					local HumanoidRootPart = Character.HumanoidRootPart
					HumanoidRootPart.CFrame = workspace[p.Name].HumanoidRootPart.CFrame
					repeatTP -= 1

					local A_1 = game:GetService("Workspace")[p.Name].Torso
					local Event = game:GetService("Workspace").Remote.arrest
					Event:InvokeServer(A_1)
				end
			end
		end
	end
end

commands.looptaze = function(arguments)
	_G.tazePlayers = {}

	for i,v in pairs(arguments) do
		for _,p in pairs(game:GetService("Players"):GetPlayers()) do
			local _p = string.lower(p.Name)
			if string.match(_p, v, 1) then
				print(p.Name)
				table.insert(_G.tazePlayers, p.Name)
				while table.find(_G.tazePlayers, p.Name) do
					wait()

					local Taser = game:GetService("Workspace")[player.Name]:WaitForChild("Taser")

					local ReloadEvent = game:GetService("ReplicatedStorage").ReloadEvent
					ReloadEvent:FireServer(Taser)

					local A_1 = {
						[1] =  {
							["RayObject"] = Ray.new(Vector3.new(927.3883666992188, 101.48998260498047, 2385.08447265625), Vector3.new(66.51451110839844, -2.4309113025665283, 74.63182830810547)), 
							["Distance"] = 2.6539480686187744, 
							["Cframe"] = CFrame.new(929.468567, 101.260002, 2387.52026, 0.711526573, -0.0635519177, 0.699779212, 0, 0.995901346, 0.0904448777, -0.70265913, -0.0643539354, 0.708610356), 
							["Hit"] = game:GetService("Workspace")[p.Name].Head
						}
					}

					local Event = game:GetService("ReplicatedStorage").ShootEvent
					Event:FireServer(A_1, Taser)
				end
			end
		end
	end
end

commands.unlooptaze = function(arguments)
	for i,v in pairs(arguments) do
		for _,p in pairs(game:GetService("Players"):GetPlayers()) do
			if table.find(_G.tazePlayers, v.Name) then
				local k = table.find(_G.tazePlayers, v.Name)
				if k then
					table.remove(_G.tazePlayers, k)
				end
			end
		end
	end
end

--[[

commands.opguns = function()
	_G.giveGuns = true
	
	while _G.giveGuns == true do
		local AK = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP
		local Event = game:GetService("Workspace").Remote.ItemHandler
		Event:InvokeServer(AK)
		
		local Remington = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP
		Event:InvokeServer(Remington)
		
		repeat wait() until backpack:FindFirstChild("AK-47") or character:FindFirstChild("AK-47") and backpack:FindFirstChild("Remington 870") or character:FindFirstChild("Remington 870")
		
		local AKGunStates = require(backpack["AK-47"].GunStates) or require(character["AK-47"].GunStates)
		local RemingtonGunStates = require(backpack["Remington 870"].GunStates) or require(character["Remington 870"].GunStates)

		AKGunStates.CurrentAmmo = 9000000000
		AKGunStates.MaxAmmo = 9000000000
		AKGunStates.StoredAmmo = 9000000000
		AKGunStates.ReloadTime = 1
		AKGunStates.FireRate = 1
	end
end

commands.loopreload = function(arguments)
	_G.loopReloadWeapons = {}
	
	for i,v in ipairs(arguments) do
		table.insert(_G.loopReloadWeapons, v)
		while table.find(_G.loopReloadWeapons, v) do
			if game:GetService("Players"):FindFirstChild(v) then
				wait()
				local Gun = game:GetService("Workspace")[player.Name]:WaitForChild(v)
				local Event = game:GetService("ReplicatedStorage").ReloadEvent
				Event:FireServer(Gun)
			end
		end	
	end
end

commands.unloopreload = function(arguments)
	for i,v in pairs(arguments) do
		if table.find(_G.loopReloadWeapons, v) then
			local k = table.find(_G.loopReloadWeapons, v)
			if k then
				table.remove(_G.loopReloadWeapons, k)
			end
		end
	end
end

--]]

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

		print(message)

		commands[commandName](args)
	end
end)
