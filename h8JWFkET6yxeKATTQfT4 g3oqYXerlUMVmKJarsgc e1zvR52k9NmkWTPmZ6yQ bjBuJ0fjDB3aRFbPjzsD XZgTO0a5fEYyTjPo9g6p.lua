---@diagnostic disable: undefined-global
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WetCheezit/Bracket-V2/main/src.lua"))()
-- global toggles
_G.ESPOn = false
_G.ShowClass = false
_G.FlyOn = false

-- Window
local Window, MainGUI = Library:CreateWindow("wabware v1")

-- Tabs
local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("Misc")

local Groupbox1 = Tab1:CreateGroupbox("Main", "Left")

local Groupbox3 = Tab2:CreateGroupbox("Misc", "Left")

local ExampleToggle2 = Groupbox1:CreateToggle("Player ESP", function(state)
    _G.ESPOn = state

    function WTS(part)
    local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
    return Vector2.new(screen.x, screen.y)
    end

    function ESPText(part, color)
    local name = Drawing.new("Text")

    local plrs = part.Parent.Name
    local firstn = game.Players[plrs].leaderstats.FirstName.Value
    local lastn = game.Players[plrs].leaderstats.LastName.Value
    local ign = firstn .. " " .. lastn
    if lastn == "HOUSELESS" then
        ign = firstn
    end
    local ign2 = plrs .. " (" .. ign .. ")"
    local class = "Freshie"
    local bp = game.Players[plrs].Backpack
    local char = game.Players[plrs].Character
    --[[
    local maxhp = game.Players[part.Parent.Name].Character.Humanoid.MaxHealth
    local hp = game.Players[part.Parent.Name].Character.Humanoid.Health
    local studs = (part.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
    local roundst = math.round(studs)
    local roundhe = math.round(hp)
    ]]--
    -- below checks the users class

    if
    bp:FindFirstChild("Ignite") or bp:FindFirstChild("Heat Barrage") or bp:FindFirstChild("Ember Palm") or
    bp:FindFirstChild("Blazing Retriever")
    then
        class = "Phoenix"
    elseif bp:FindFirstChild("Lightning Slash") or bp:FindFirstChild("Blink") then
        class = "Piandao"
    elseif bp:FindFirstChild("Lanuae") or bp:FindFirstChild("Regular Casus") or bp:FindFirstChild("Trabem") then
        class = "Lumen"
    elseif
        bp:FindFirstChild("Hindered Flick") or bp:FindFirstChild("Dancing Strike") or bp:FindFirstChild("Unseen Fury")
        then
        class = "Vigilante"
        elseif bp:FindFirstChild("Rising Cyclone") or bp:FindFirstChild("Gale Blast") or bp:FindFirstChild("Soaring Leap") then
        class = "Breeze"
        elseif bp:FindFirstChild("Swift Kick") or bp:FindFirstChild("Rib Crusher") or bp:FindFirstChild("Bruising Drop") then
        class = "Brawler"
        elseif
        bp:FindFirstChild("Deadly Cascade") or bp:FindFirstChild("Deep Slash") or bp:FindFirstChild("Favor From Fang")
        then
            class = "Ronin"
        elseif bp:FindFirstChild("Toxic Slice") or bp:FindFirstChild("Death Bound") or bp:FindFirstChild("True Trickery") then
            class = "Assassin"
        elseif bp:FindFirstChild("Heart Thrust") or bp:FindFirstChild("Earth Shaker") then
            class = "Greatsword"
        elseif bp:FindFirstChild("Mortem") or bp:FindFirstChild("Divello") or bp:FindFirstChild("Obcillo") then
            class = "Amon"
        elseif bp:FindFirstChild("Piercing Strike") or bp:FindFirstChild("Grip Shove") or bp:FindFirstChild("Earth Impale") then
            class = "Pierce"
        elseif
            bp:FindFirstChild("Crescent Slash") or bp:FindFirstChild("Swirl Outburst") or
            bp:FindFirstChild("Ocherous Chain")
            then
            class = "Wraith"
            end
            name.Color = color
            name.Position = WTS(part)
            name.Size = 20.0
            name.Outline = true
            name.Center = true
            game:GetService("RunService").Stepped:connect(
            function()
            pcall(
            function()
                local maxhp = game.Players[part.Parent.Name].Character.Humanoid.MaxHealth
                local hp = game.Players[part.Parent.Name].Character.Humanoid.Health
                local studs = (part.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                local roundst = math.round(studs)
                local roundhe = math.round(hp)
                local destroyed = not part:IsDescendantOf(workspace)
                if destroyed and name ~= nil then
                    name:Remove()
                end
                if part ~= nil then
                name.Position = WTS(part)
                end
                local _, screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                if screen and _G.ESPOn == true then
                    name.Visible = true
                    name.Text = ign2.. " / ".. class.. "\n[".. roundhe.. "/".. maxhp.. "]".. " | ".. roundst
                elseif _G.ESPOn == false then
                    name:Remove()
                end
            end
            )
            end
            )
        end

        local players = game.Players:getChildren()
        for i = 1, #players do
            if players[i] ~= game.Players.LocalPlayer then
            if players[i].Character:FindFirstChild("HumanoidRootPart") then
                ESPText(players[i].Character.HumanoidRootPart, Color3.new(255, 255, 255))
            end
            players[i].CharacterAdded:connect(
            function(char)
                local hrp = char:WaitForChild("HumanoidRootPart")
                ESPText(hrp, Color3.new(255, 255, 255))
            end
            )
            end
        end

        game.Players.PlayerAdded:Connect(
        function(plr)
            plr.CharacterAdded:connect(
            function(char)
            local hrp = char:WaitForChild("HumanoidRootPart")
            ESPText(hrp, Color3.new(255, 255, 255))
            end
            )
        end
        )
    end)
    ExampleToggle2:CreateKeyBind()
    local ExampleToggle3 = Groupbox1:CreateToggle("Holding ESP", function(state)
    _G.Toggle = state

    function WTS(part)
        local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
        return Vector2.new(screen.x, screen.y + -55)
    end

    function ESPText(part, color)
        local name = Drawing.new("Text")
        name.Text = "[None]"
        game.Players[part.Parent.Name].Character.ChildAdded:Connect(function(instance)
            if instance:IsA("Tool") then
                hld = instance.Name
                name.Text = "[".. hld.. "]"
                print("added ".. instance.Name)
            end
        end)
        
        game.Players[part.Parent.Name].Character.ChildRemoved:Connect(function(instance)
            if instance:IsA("Tool") then
                hld = "None"
                name.Text = "[".. hld.. "]"
                print("removed ".. instance.Name)
            end
        end)
        name.Color = color
        name.Position = WTS(part)
        name.Size = 20.0
        name.Outline = true
        name.Center = true
        name.Visible = true
        game:GetService("RunService").Stepped:Connect(
            function()
                pcall(
                    function()
                        local destroyed = not part:IsDescendantOf(workspace)
                        if destroyed and name ~= nil then
                            name:Remove()
                        end
                        if part ~= nil then
                            name.Position = WTS(part)
                        end
                        local _, screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                        if screen and _G.Toggle == true then
                            name.Visible = true
                        else
                            name.Visible = false
                            name:Remove()
                        end
                    end
                )
            end
        )
    end

    game.Players.PlayerAdded:Connect(
        function(plr)
            plr.CharacterAdded:Connect(
                function(char)
                    local hrp = char:WaitForChild("Head")
                    ESPText(hrp, Color3.new(255,255,255))
                end
            )
        end
    )


    local players = game.Players:GetChildren()
    for i = 1, #players do
        if players[i] ~= game.Players.LocalPlayer then
            if players[i].Character:findFirstChild("Head") then
                ESPText(players[i].Character.Head, Color3.new(255,255,255))
            end
            players[i].CharacterAdded:connect(
                function(char)
                    local hrp = char:WaitForChild("Head")
                    ESPText(hrp, Color3.new(255,255,255))
                end
            )
        end
    end
end)
ExampleToggle3:CreateKeyBind()
local ExampleToggle4 = Groupbox1:CreateButton("Streamer Mode (Gives Random Name)", function(state)
        -- local usergui = game:GetService("Players").LocalPlayer.PlayerGui.Bar.Health.IGN

    local names = {
        "One",
        "Two",
        "Three",
        "Four",
        "Five",
        "Six",
        "Seven",
        "Eight",
        "Nine",
        "Ten",
        "Eleven",
        "Twelve",
        "Thirteen",
        "Fourteen",
        "Fifteen",
        "Sixteen",
        "Seventeen",
        "Eighteen",
        "Nineteen",
        "Twenty",
        "Hal",
        "Hamilton",
        "Hamish",
        "Hamlet",
        "Hank",
        "Hannibal",
        "Hans",
        "Harley",
        "Harry",
        "Harold",
        "Harvey",
        "Havelock",
        "Havel",
        "Hawk",
        'Hayes',
        "Heathcliff",
        "Herbert",
        "Hermes",
        "Hershel",
        "Henry",
        "Homer",
        "Horatio",
        "Howl",
        "Hubert",
        "Huey",
        "Hugh",
        "Hugo",
        "Humphrey",
        "Hutch",
        "Iago",
        "Ian",
        "Icarus",
        "Igor",
        "Ike",
        "Isaac",
        "Isaiah",
        "Ivan",
        "Jack",
        "Percival",
        "Peter",
        "Philip",
        "Pierro",
        "Plato",
        "Prospero",
        "Pyron",
        "Quan",
        "Quake",
        "Quenton",
        "Ragnar",
        "Samson",
        "Samuel",
        "Scar",
        "Scott",
        "Sean",
        "Wolfram",
        "Woodrow",
        "Xander",
        "Xerxes",
        "Xavier",
        "Ywain",
        "Zachary",
        "Zephyr",
        "Zuko"
    }

    local housename = {
        "Pro",
        "Kazakh",
        "Agamemnon",
        "Megamen",
        "Pogfish",
        "Altar",
        "Archivist",
        "Mudock",
        "Meats",
        "Trackstars",
        "Skyrian",
        "BabyStomper",
        "Intelligere",
        "Foxnews",
        "Bounced",
        "Flow",
        "Judgement",
    }

    local firstnam = math.random(1, #names)
    local lastnam = math.random(1, #housename)
    -- local hiddenname = names[firstnam].. " ".. housename[lastnam]
    local firstign = game:GetService("Players").LocalPlayer.leaderstats.FirstName
    local lastign = game:GetService("Players").LocalPlayer.leaderstats.LastName
    local title = game:GetService("Players").LocalPlayer.leaderstats.Title
    firstign.Value = names[firstnam]
    lastign.Value = housename[lastnam]
    game.Players.LocalPlayer.Name = ""
end)
_G.FlySpeed = 50
local ExampleButton = Groupbox1:CreateToggle("Fly", function(state)
    _G.FlyOn = state
    local player = game:GetService'Players'.LocalPlayer;
    local mouse = player:GetMouse();
    local camera = workspace.CurrentCamera;
    local runservice = game:GetService'RunService';
    local uis = game:GetService'UserInputService';
    local root = player.Character.HumanoidRootPart;
    local hum = player.Character:FindFirstChildOfClass'Humanoid';
    local PartIgnore = {};

    local fly = true;
    local flySpeed = _G.FlySpeed;
    local maxSpeed = 150;
    local disp;


    while _G.FlyOn == true do
        local start = mouse.Hit.p;
        local dir = (start - camera.CFrame.p);

        root.Velocity = dir.unit * (math.random((flySpeed - 1) * 1000, (flySpeed + 2.5) * 1000) / 1000); -- adds random speed so the velocity doesn't always measure to a certain amount (prevents detection)

        local ray = Ray.new(root.Position, dir.unit * 50);
        local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, camera, unpack(PartIgnore)});

        runservice.RenderStepped:wait();
    end
end)

ExampleButton:CreateKeyBind()
