--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

--// Workspace
local CriminalPad = workspace["Criminals Spawn"].SpawnLocation
local giver = workspace["Prison_ITEMS"].giver
local single = workspace["Prison_ITEMS"].single
local Remote = workspace.Remote

--// Remotes
local TeamEvent = Remote.TeamEvent
local ItemHandler = Remote.ItemHandler
local tazePlayer = Remote.tazePlayer
local arrest = Remote.arrest
local arrestPlayer = Remote.arrestPlayer

local ShootEvent = ReplicatedStorage.ShootEvent
local meleeEvent = ReplicatedStorage.meleeEvent

--// Tables
local Toggles = {
    AutoRespawn = true;
    AutoGuns = true;
    AntiTase = true;
    AntiArrest = true;
    AntiPunch = true;
    AntiTouch = true;
    Loopmeleekill = {};
    Loopgunkill = {};
}

local prefix = ";"

local Whitelists = {
    AntiTase = {};
    AntiArrest = {};
    AntiPunch = {}; 
    AntiTouch = {4172614104};
}

local Blacklists = {
    AntiTase = {};
    AntiArrest = {};
    AntiPunch = {};
    AntiTouch = {};
}

local Items = {
    [1] = "AK-47";
    [2] = "Remington 870";
    [3] = "M9";
    [4] = "Crude Knife";
    [5] = "Hammer"
}

--// Local functions
local function Crim()
    oldCFrame = CriminalPad.CFrame
    repeat
        task.wait()
        CriminalPad.CFrame = Player.Character.Head.CFrame
        CriminalPad.Transparency = 1
        CriminalPad.CanCollide = false
    until Player.TeamColor.Name == "Really red"
    CriminalPad.CFrame = oldCFrame
    CriminalPad.Transparency = 0
    CriminalPad.CanCollide = true
end

local function Arrest(Target)
    local Character = Target.Character
    oldCFrame = Character.HumanoidRootPart.CFrame
    repeat
        Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
        arrest:InvokeServer(Target)
    until Character.Head:FindFirstChild("handcuffedGui")
    Character.HumanoidRootPart.CFrame = oldCFrame
end

local function GetItem(Item)
    ItemHandler:InvokeServer({Position = Player.Character.Head.Position, Parent = giver:FindFirstChild(Item) or single:FindFirstChild(Item)})
end

local function GetItems()
    for i,v in pairs(Items) do
        task.wait(.25)
        GetItem(v)
    end
end

local function Spike(lag)
    GetItem("M9")
    for i = 1,lag do
        ShootEvent:FireServer({}, Player.Backpack:FindFirstChild("M9") or Player.Character:FindFirstChild("M9"))
    end
end

local function Crash()
    Spike(1000)
end

local function Meleekill(Target)
    if Player.Character then
        SavePosition = Player.Character.HumanoidRootPart.CFrame
        repeat task.wait() until not Target.Character:FindFirstChild("ForceField") and Target.Character:FindFirstChild("Humanoid") and Target.Character.Humanoid.Health > 0
        repeat
            task.wait()
            Player.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
            for i = 1,14 do
                meleeEvent:FireServer(Target)
            end
        until Target.Character.Humanoid.Health == 0
        Player.Character.HumanoidRootPart.CFrame = SavePosition
    end
end

local function GunKill(Target)
    local args = {}

    if Player.Character then
        GetItem("M9")
        repeat task.wait() until not Target.Character:FindFirstChild("ForceField") and Target.Character:FindFirstChild("Humanoid") and Target.Character.Humanoid.Health > 0
        for i = 1, math.ceil(Target.Character.Humanoid.Health / 10) do
            table.insert(args, {RayObject = Ray.new(), Distance = 0, CFrame = CFrame.new(), Hit = Target.Character.Head})
        end
        ShootEvent:FireServer(args, Player.Backpack:FindFirstChild("M9") or Player.Character:FindFirstChild("M9"))
    end
end

local function Respawn(Team)
    Position = Player.Character:WaitForChild("HumanoidRootPart").CFrame
    if Team == "Really red" then
        if Teams.Guards:GetPlayers() == 8 then
            Crim()
            Player.CharacterAdded:Once(function()
                Player.Character:WaitForChild("HumanoidRootPart").CFrame = Position
            end)
        else
            TeamEvent:FireServer("Bright blue")
            Player.CharacterAdded:Once(function()
                Crim()
                Player.Character:WaitForChild("HumanoidRootPart").CFrame = Position
            end)
        end
    else
        TeamEvent:FireServer(Team)

        Player.CharacterAdded:Once(function()
            Player.Character:WaitForChild("HumanoidRootPart").CFrame = Position
        end)
    end
end

local function Tase(Target)
    Respawn(Teams.Guards.Name)
    local args = {RayObject = Ray.new(), Distance = 0, CFrame = CFrame.new(), Hit = Target.Character.Head}
    
    ShootEvent:FireServer(args, Player.Backpack:WaitForChild("Taser") or Player.Character:WaitForChild("Taser"))
end

--// Functions
function CharacterAdded(Character)
    if Character then
        if Toggles.AutoRespawn == true then
            local Team = Player.TeamColor.Name
    
            Character:WaitForChild("Humanoid").Died:Connect(function()
                Respawn(Team)
            end)
        end
    
        if Toggles.AutoGuns == true then
            Player.ChildAdded:Connect(function(child)
                if child:IsA("Backpack") then
                    GetItems()
                end
            end)
        end

        if Toggles.AntiTouch == true then
            Player.Character.Torso.Touched:Connect(function(Hit)
                if Hit.Parent:FindFirstChild("Humanoid") then
                    local Target = Players:FindFirstChild(Hit.Parent.Name)

                    if not table.find(Whitelists.AntiTouch, Target.UserId) and not Player:IsFriendsWith(Target.UserId) or table.find(Blacklists.AntiTouch, Target.UserId) then
                        for i = 1,14 do
                            meleeEvent:FireServer(Target)
                        end
                    end
                end
            end)
        end

        if Toggles.AntiArrest == true then
            arrestPlayer:Clone()
            arrestPlayer:Destroy()

            Player.Character.Head.ChildAdded:Connect(function(child)
                OldTeam = Player.TeamColor.Name
                OldPosition = Player.Character.HumanoidRootPart.CFrame

                if child.Name == "handcuffedGui" then
                    Player.CharacterAdded:Once(function()
                        Respawn(OldTeam)
                        Player.CharacterAdded:Once(function()
                            if OldTeam == "Bright orange" then
                                Player.Character.HumanoidRootPart.CFrame = OldPosition
                            else
                                Player.CharacterAdded:Once(function()
                                    Player.Character.HumanoidRootPart.CFrame = OldPosition
                                end)
                            end
                        end)
                    end)
                end
            end)
        end

        if Toggles.AntiTase == true and tazePlayer then
            pcall(function()
                tazePlayer:Clone()
                tazePlayer:Destroy()
            end)
        end
    end
end

function Chatted(message)
    message = message:lower()
    local args = message:split(" ")
    local command = args[1]
    local Argument1 = args[2]
    local Argument2 = args[3]

    function Command(command)
        return prefix .. command
    end

    function GetPlayerFromString(String)
        local Target = nil
        for i,player in pairs(Players:GetPlayers()) do
            if string.find(string.lower(player.Name), String) or string.find(string.lower(player.DisplayName), String) then
                print(player)
                Target = player
            end
        end
        return Target
    end

    if command == Command("gunkill") or command == Command("kill") or command == Command("k") then
        local Target = GetPlayerFromString(Argument1)
        if Target ~= nil then
            GunKill(Target)
        end
    end

    if command == Command("loopmeleekill") or command == Command("lmk") or command == Command("looptorture") then
        local Target = GetPlayerFromString(Argument1)
        if Target ~= nil and not table.find(Toggles.Loopmeleekill, GetPlayerFromString(Argument1)) then
            table.insert(Toggles.Loopmeleekill, Target.UserId)
            Meleekill(Target)
        end
    end

    if command == Command("unloopmeleekill") or command == Command("unlmk") or command == Command("unlooptorture") then
        local Target = GetPlayerFromString(Argument1)
        if Target ~= nil and table.find(Toggles.Loopmeleekill, Target.UserId) then
            table.remove(Toggles.Loopmeleekill, Target.UserId)
        end
    end

    if command == Command("meleekill") or command == Command("mk") or command == Command("torture") then
        local Target = GetPlayerFromString(Argument1)
        if Target ~= nil then
            Meleekill(Target)
        end
    end

    if command == Command("respawn") or command == Command("re") then
        Respawn(Player.TeamColor.Name)
    end

    if command == Command("antitouch") then
        if Toggles.AntiTouch == true then
            Toggles.AntiTouch = false
        else
            Toggles.AntiTouch = true
        end
    end

    if command == Command("whitelist") then
        local Target = GetPlayerFromString(Argument2)
        if table.find(Whitelists[Argument1]) and Target ~= nil then
            table.insert(Whitelists[Argument1], Target.UserId)
        end
    end

    if command == Command("blacklist") then
        local Target = GetPlayerFromString(Argument2)
        if table.find(Blacklists[Argument1]) and Target ~= nil then
            table.insert(Blacklists[Argument1], Target.UserId)
        end
    end

    if command == Command("autoguns") then
        if Toggles.AutoGuns == true then
            Toggles.AutoGuns = false
        else
            Toggles.AutoGuns = true
        end
    end

    if command == Command("spike") then
        Spike(tonumber(Argument1))
    end

    if command == Command("crash") then
        Crash()
    end

    if command == Command("tase") then
        local Target = GetPlayerFromString(Argument1)
        if Target ~= nil then
            Tase(GetPlayerFromString(Argument1))
        end
    end

    if command == Command("loopkill") or command == Command("loopgunkill") or command == Command("lk") or command == Command("lgk") then
        local Target = GetPlayerFromString(Argument1)
        if Target ~= nil and not table.find(Toggles.Loopgunkill, Target.UserId) then
            table.insert(Toggles.Loopgunkill, Target.UserId)
            GunKill(Target)
        end
    end

    if command == Command("unloopkill") or command == Command("unloopgunkill") or command == Command("unlk") or command == Command("unlgk") then
        local Target = GetPlayerFromString(Argument1)
        if Target ~= nil and table.find(Toggles.Loopgunkill, Target.UserId) then
            table.remove(Toggles.Loopgunkill, Target.UserId)
        end
    end

    if command == Command("t") or command == Command("team") then
        if Argument1 == "c" or Argument1 == "criminals" then
            Respawn("Really red")
        end
        if Argument1 == "i" or Argument1 == "inmates" then
            Respawn("Bright orange")
        end
        if Argument1 == "g" or Argument1 == "guards" then
            Respawn("Bright blue")
        end
    end
end

function GetPlayerFromUserId(id)
    local Target = nil
    for _,player in pairs(Players:GetPlayers()) do
        if player.UserId == id then
            Target = player
        end
    end
    return Target
end

Respawn(Player.TeamColor.Name)

Player.CharacterAdded:Connect(CharacterAdded)
Player.Chatted:Connect(Chatted)

--// Task Functions
task.spawn(function()
    RunService.Heartbeat:Connect(function()
        for i,v in Toggles.Loopmeleekill do
            local player = GetPlayerFromUserId(v)
            if player ~= nil and Player.Character then
                player.CharacterAppearanceLoaded:Connect(function()
                    pcall(function()
                        Meleekill(player)
                    end)
                end)
            end
        end
    
        for i,v in Toggles.Loopgunkill do
            local player = GetPlayerFromUserId(v)
            if player ~= nil and Player.Character then
                player.CharacterAppearanceLoaded:Connect(function()
                    pcall(function()
                        GunKill(player)
                    end)
                end)
            end
        end
    end)
end)
