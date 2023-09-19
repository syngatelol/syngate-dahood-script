local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "dahood tool scripted by syngatelol",
    LoadingTitle = "loading please wait...",
    LoadingSubtitle = "created by syngatelol",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "syngate's slient aim/resolver/dsync/aim viewer"
    },
    Discord = {
       Enabled = true,
       Invite = "RZGWxXKBFs", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("slient aimming", nill) -- Title, Image
 local MainSection = MainTab:CreateSection("slient aim's")
 
 Rayfield:Notify({
    Title = "working",
    Content = "discord.gg/eviction for help",
    Duration = 6.5,
    Image = nill,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })

 local Button = MainTab:CreateButton({
    Name = "syngate's slient aim",
    Callback = function()
        local Settings = {
            rewrittenmain = {
                Enabled = true,
                Key = "q",
                DOT = true,
                AIRSHOT = true,
                NOTIF = false,
                AUTOPRED = true,
                FOV = math.huge,
                RESOVLER = false
            }
        }
        
        local SelectedPart = "Head"
        local Prediction = true
        local PredictionValue = 0.113
        
        
            local AnchorCount = 0
            local MaxAnchor = 50
        
            local CC = game:GetService"Workspace".CurrentCamera
            local accomidationfactor = 0.11
            local mouse = game.Players.LocalPlayer:GetMouse()
            local placemarker = Instance.new("Part", game.Workspace)
            local enabled = false
            local Plr
        
            function makemarker(Parent, Adornee, Color, Size, Size2)
                local e = Instance.new("BillboardGui", Parent)
                e.Name = "PP"
                e.Adornee = Adornee
                e.Size = UDim2.new(Size, Size2, Size, Size2)
                e.AlwaysOnTop = Settings.rewrittenmain.DOT
                local a = Instance.new("Frame", e)
                if Settings.rewrittenmain.DOT == true then
                a.Size = UDim2.new(1, 0, 1, 0)
                else
                a.Size = UDim2.new(0, 0, 0, 0)
                end
                if Settings.rewrittenmain.DOT == true then
                a.Transparency = 0
                a.BackgroundTransparency = 0
                else
                a.Transparency = 1
                a.BackgroundTransparency = 1
                end
                a.BackgroundColor3 = Color
                local g = Instance.new("UICorner", a)
                if Settings.rewrittenmain.DOT == false then
                g.CornerRadius = UDim.new(0, 0)
                else
                g.CornerRadius = UDim.new(1, 1) 
                end
                return(e)
            end
        
            
            local data = game.Players:GetPlayers()
            function noob(player)
                local character
                repeat wait() until player.Character
                local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(107, 184, 255), 0.3, 3)
                handler.Name = player.Name
                player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
        
        
                spawn(function()
                    while wait() do
                        if player.Character then
                        end
                    end
                end)
            end
        
            for i = 1, #data do
                if data[i] ~= game.Players.LocalPlayer then
                    noob(data[i])
                end
            end
        
            game.Players.PlayerAdded:connect(function(Player)
                noob(Player)
            end)
        
            spawn(function()
                placemarker.Anchored = true
                placemarker.CanCollide = false
                if Settings.rewrittenmain.DOT == true then
                placemarker.Size = Vector3.new(8, 8, 8)
                else
                placemarker.Size = Vector3.new(0, 0, 0)
                end
                placemarker.Transparency = 0.75
                if Settings.rewrittenmain.DOT then
                makemarker(placemarker, placemarker, Color3.fromRGB(232, 186, 200), 0.40, 0)
                end
            end)
        
            game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
                if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
                    if enabled == true then
                        enabled = false
                        if Settings.rewrittenmain.NOTIF == true then
                            Plr = getClosestPlayerToCursor()
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "";
                            Text = "Unlocked :)",
                            Duration = 5
                        })
                    end
                    else
                        Plr = getClosestPlayerToCursor()
                        enabled = true
                        if Settings.rewrittenmain.NOTIF == true then
        
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "";
                                Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName),
                                Duration = 5
                            })
        
                        end
                    end
                end
            end)
        
        
        
            function getClosestPlayerToCursor()
                local closestPlayer
                local shortestDistance = Settings.rewrittenmain.FOV
        
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                        local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                        local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                        if magnitude < shortestDistance then
                            closestPlayer = v
                            shortestDistance = magnitude
                        end
                    end
                end
                return closestPlayer
            end
        
            local pingvalue = nil;
            local split = nil;
            local ping = nil;
        
            game:GetService"RunService".Stepped:connect(function()
                if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
                    placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
                else
                    placemarker.CFrame = CFrame.new(0, 9999, 0)
                end
                if Settings.rewrittenmain.AUTOPRED == true then
                     pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                     split = string.split(pingvalue,'(')
                     ping = tonumber(split[1])
                    if ping < 130 then
                        PredictionValue = 0.151
                    elseif ping < 125 then
                        PredictionValue = 0.149
                    elseif ping < 110 then
                        PredictionValue = 0.146
                    elseif ping < 105 then
                        PredictionValue = 0.138
                    elseif ping < 90 then
                        PredictionValue = 0.136
                    elseif ping < 80 then
                        PredictionValue = 0.134
                    elseif ping < 70 then
                        PredictionValue = 0.131
                    elseif ping < 60 then
                        PredictionValue = 0.1229
                    elseif ping < 50 then
                        PredictionValue = 0.1225
                    elseif ping < 40 then
                        PredictionValue = 0.1256
                    end
                end
            end)
        
            local mt = getrawmetatable(game)
            local old = mt.__namecall
            setreadonly(mt, false)
            mt.__namecall = newcclosure(function(...)
                local args = {...}
                if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then
        
                    -- args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
                    --[[
                    if Settings.rewrittenmain.AIRSHOT == true then
                        if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                            
                            --// Airshot
                            args[3] = Plr.Character.LeftFoot.Position+(Plr.Character.LeftFoot.Velocity*PredictionValue)
        
                        else
                            args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
        
                        end
                    else
                            args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
                    end
                    ]]
                    if Prediction == true then
                        
                    args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)
        
                    else
        
                    args[3] = Plr.Character[SelectedPart].Position
        
                    end
        
                    return old(unpack(args))
                end
                return old(...)
            end)
        
            game:GetService("RunService").RenderStepped:Connect(function()
                if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then
                if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then
                    
                    if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                        
                        --// Airshot
        
                        --// Anchor Check
        
                        if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                            AnchorCount = AnchorCount + 1
                            if AnchorCount >= MaxAnchor then
                                Prediction = false
                                wait(2)
                                AnchorCount = 0;
                            end
                        else
                            Prediction = true
                            AnchorCount = 0;
                        end
        
                        SelectedPart = "LeftFoot"
        
                    else
                        --// Anchor Check
        
                        if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                            AnchorCount = AnchorCount + 1
                            if AnchorCount >= MaxAnchor then
                                Prediction = false
                                wait(2)
                                AnchorCount = 0;
                            end
                        else
                            Prediction = true
                            AnchorCount = 0;
                        end
        
                        SelectedPart = "HumanoidRootPart"
        
                    end
                    else
        
                        --// Anchor Check
        
                        if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                            AnchorCount = AnchorCount + 1
                            if AnchorCount >= MaxAnchor then
                                Prediction = false
                                wait(2)
                                AnchorCount = 0;
                            end
                        else
                            Prediction = true
                            AnchorCount = 0;
                        end
        
                        SelectedPart = "HumanoidRootPart"
                    end
        
                else
                        SelectedPart = "HumanoidRootPart"
                end
            end)
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "anti lock",
    Callback = function()
        local Plr = game.Players.LocalPlayer

        Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
            if new == Enum.HumanoidStateType.Freefall == true then
                wait(0.27)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, -15, 0)
            end
        end)
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "underground resolver",
    Callback = function()
        local RunService = game:GetService("RunService")

        RunService.Heartbeat:Connect(function()
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        local hrp = v.Character.HumanoidRootPart
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)    
                        hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)   
                    end
                end
            end)
        end)
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "Dsync resolver",
    Callback = function()
        getgenv().VelocityChanger = true
        getgenv().Velocity = Vector3.new(0,-500,0)
        
        local Players     = game:GetService("Players")
        local RunService  = game:GetService("RunService")
        
        local LocalPlayer = Players.LocalPlayer
        local Character   = LocalPlayer.Character
        local RootPart    = Character:FindFirstChild("HumanoidRootPart")
        
        local Heartbeat, RStepped, Stepped = RunService.Heartbeat, RunService.RenderStepped, RunService.Stepped
        
        LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
           Character = NewCharacter
        end)
        
        local RVelocity, YVelocity = nil, 0.1
        
        while true do
           if VelocityChanger then
               if (not RootPart) or (not RootPart.Parent) or (not RootPart.Parent.Parent) then
                   warn("weird ahh died")
                   RootPart = Character:FindFirstChild("HumanoidRootPart")
               else
                   RVelocity = RootPart.Velocity
           
                   RootPart.Velocity = type(Velocity) == "vector" and Velocity or Velocity(RVelocity)
               
                   RStepped:wait()
               
                   RootPart.Velocity = RVelocity
               end
           end
           
           Heartbeat:wait()
        end
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "Aim viewer",
    Callback = function()
--[[
    Information:

    - This shows you where people are aiming.
    - By default: red = aiming at you = danger, green = aiming away from you = safe
]]

-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- // Vars
local Terrain = Workspace.Terrain
local LocalPlayer = Players.LocalPlayer
local Beams = {}

local Colours = {
    At = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0, 0)),
    Away = ColorSequence.new(Color3.new(0, 1, 0), Color3.new(0, 1, 0))
}

-- // Checks if the beam is hitting our character and can't go through walls
local function IsBeamHit(Beam: Beam, MousePos: Vector3)
    -- // Get our character
    local Character = LocalPlayer.Character
    local Attachment = Beam.Attachment1

    -- // Workout the direction
    local Origin = Beam.Attachment0.WorldPosition
    local Direction = MousePos - Origin

    -- // Fire the ray, making sure it hits something (should unless aiming at sky?)
    local raycastParms = RaycastParams.new()
    raycastParms.FilterDescendantsInstances = {Character, Workspace.CurrentCamera}
    local RaycastResult = Workspace:Raycast(Origin, Direction * 2, raycastParms) -- // Multiplied by 2 as ray might fall too short
    if (not RaycastResult) then
        Beam.Color = Colours.Away
        Attachment.WorldPosition = MousePos
        return
    end

    -- // Set the colour based upon if aiming at us or not
    if (Character) then
        Beam.Color = RaycastResult.Instance:IsDescendantOf(Character) and Colours.At or Colours.Away
    end

    -- // Set the position so the beam can't go through walls
    Attachment.WorldPosition = RaycastResult.Position
end

-- // Creates a beam with the default properties
local function CreateBeam(Character: Model)
    -- // Create beam
    local Beam = Instance.new("Beam", Character)

    -- // Set important properties
    Beam.Attachment0 = Character:WaitForChild("Head"):WaitForChild("FaceCenterAttachment")
    Beam.Enabled = Character:FindFirstChild("GunScript", true) ~= nil

    -- // Set visual properties
    Beam.Width0 = 0.1
    Beam.Width1 = 0.1

    -- // Add to beam table so can modify all at once
    table.insert(Beams, Beam)

    -- // Return
    return Beam
end

-- // Apply whenever we get a new character
local function OnCharacter(Character: Model | nil)
    -- // Make sure character exists
    if (not Character) then
        return
    end

    -- // Wait for the MousePos
    local MousePos = Character:WaitForChild("BodyEffects"):WaitForChild("MousePos")

    -- // Create the beam
    local Beam = CreateBeam(Character)

    -- // Attachment for the mouse position
    local Attachment = Instance.new("Attachment", Terrain)
    Beam.Attachment1 = Attachment

    -- // Constantly update when MousePos updates
    IsBeamHit(Beam, MousePos.Value)
    MousePos.Changed:Connect(function()
        IsBeamHit(Beam, MousePos.Value)
    end)

    -- // See whenever they equip a gun
    Character.DescendantAdded:Connect(function(Descendant)
        -- // Check if it is a gun, set enabled
        if (Descendant.Name == "GunScript") then
            Beam.Enabled = true
        end
    end)

    -- // See whenever they unequip a gun
    Character.DescendantRemoving:Connect(function(Descendant)
        -- // Check if it is a gun, set disabled
        if (Descendant.Name == "GunScript") then
            Beam.Enabled = false
        end
    end)
end

-- // Apply on each player
local function OnPlayer(Player: Player)
    OnCharacter(Player.Character)
    Player.CharacterAdded:Connect(OnCharacter)
end

for _, v in ipairs(Players:GetPlayers()) do
    OnPlayer(v)
end

-- // Redo for each new player
Players.PlayerAdded:Connect(OnPlayer)
    end,
 })
