local AimCheats = Tabs.Game:AddLeftGroupbox("Aim")

AimCheats:AddDivider()

local AimPart = "Head"

AimCheats:AddLabel('Aimbot Keybind'):AddKeyPicker('ToggleAim', {
    Default = 'E',
    SyncToggleState = false,

    Mode = 'Toggle',

    Text = 'Aim',
    NoUI = false,

    Callback = function(v)
        getgenv().Aim = v

        if getgenv().Aimbot == false then
            Library:Notify("You must enable Aimbot before using the Aim keybind", 2)
        end
        
        task.spawn(function()
            repeat
                task.wait()

                local cam = game.Workspace.CurrentCamera
                local target = game.Players.LocalPlayer:GetMouse().Target

                if target then
                    if target.Parent.Parent.Name == "Zombies" then
                        cam.CFrame = CFrame.lookAt(cam.CFrame.Position, target.Parent[AimPart].Position)
                    end
                end
            until getgenv().Aim == false or getgenv().Aimbot == false
        end)
    end
})

AimCheats:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Tooltip = "Enables aimbot",

    Callback = function(v)
        getgenv().Aimbot = v
    end
})

AimCheats:AddDropdown("AimPart", {
    Values = {
        "Head",
        "Torso",
        "RightHand",
        "LeftHand",
        "RightLeg",
        "LeftFoot"
    },

    Default = 1,

    Text = "Select the part to aim at",
    Tooltip = "",

    Callback = function(v)
        AimPart = v
    end
})

local ESPCheats = Tabs.Game:AddLeftGroupbox("ESP")

ESPCheats:AddDivider()

local Zombies = game.Workspace.Zombies

ESPCheats:AddToggle("ZombieESP", {
    Text = "Zombie ESP",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        getgenv().ZombieESP = v

        task.spawn(function()
            repeat
                task.wait()

                for i,v in pairs(Zombies:GetChildren()) do
                    if not v:FindFirstChild("Highlight") then
                        local esp = Instance.new("Highlight")
    
                        esp.Parent = v
                        esp.Adornee = v

                        esp.FillColor = Color3.fromRGB(255, 0, 0)
                        esp.OutlineColor = Color3.fromRGB(255, 0, 0)

                        esp.FillTransparency = 0.75
                        esp.OutlineTransparency = 0.5
                    end
                end
            until getgenv().ZombieESP == false

            
            for i,v in pairs(Zombies:GetChildren()) do
                if v:FindFirstChild("Highlight") then
                    v.Highlight:Destroy()
                end
            end
        end)
    end
})

local PerkMachines = game.Workspace.Map.PerkMachines

ESPCheats:AddToggle("PerkESP", {
    Text = "Perk Machine ESP",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        getgenv().VendingESP = v

        task.spawn(function()
            repeat
                task.wait()

                for i,v in pairs(PerkMachines:GetChildren()) do
                    if not v:FindFirstChild("Highlight") then
                        local esp = Instance.new("Highlight")
    
                        esp.Parent = v
                        esp.Adornee = v

                        local colors = {
                            ["Bloxilicious Gum"] =  Color3.fromRGB(173, 141, 5),
                            ["Bloxy Cola"] = Color3.fromRGB(124, 92, 70),
                            ["Goala Cola"] = Color3.fromRGB(51, 88, 130),
                            ["Juggerblox"] = Color3.fromRGB(119, 16, 10),
                            ["Witches Brew"] = Color3.fromRGB(75, 151, 75),
                            ["Quick Revive"] = Color3.fromRGB(255, 255, 255)
                        }

                        for _, color in pairs(colors) do
                            if v.Name == _ then
                                esp.FillColor = color
                                esp.OutlineColor = color
                            end
                        end

                        esp.FillTransparency = 0.5
                        esp.OutlineTransparency = 0.25
                    end
                end
            until getgenv().VendingESP == false

            
            for i,v in pairs(PerkMachines:GetChildren()) do
                if v:FindFirstChild("Highlight") then
                    v.Highlight:Destroy()
                end
            end

            return
        end)
    end
})

local Turrets = game.Workspace.Map.Turrets

ESPCheats:AddToggle("TurretESP", {
    Text = "Turret ESP",
    Default = false,
    Tooltip = "",

    Callback = function()
        getgenv().TurretESP = v

        task.spawn(function()
            repeat
                task.wait()

                for i,v in pairs(Turrets:GetChildren()) do
                    if not v:FindFirstChild("Highlight") then
                        local esp = Instance.new("Highlight")
    
                        esp.Parent = v
                        esp.Adornee = v

                        esp.FillColor = Color3.fromRGB(75, 151, 75)
                        esp.OutlineColor = Color3.fromRGB(75, 151, 75)

                        esp.FillTransparency = 0.5
                        esp.OutlineTransparency = 0.25
                    end
                end
            until getgenv().TurretESP == false

            
            for i,v in pairs(Turrets:GetChildren()) do
                if v:FindFirstChild("Highlight") then
                    v.Highlight:Destroy()
                end
            end

            return
        end)
    end
})

local AutoCheats = Tabs.Game:AddLeftGroupbox("Auto")

AutoCheats:AddDivider()

AutoCheats:AddDropdown("PowerUpDropdown", {
    Values = {
        "Coming soon!"
    },

    Default = 1,
    Text = "Select Power Up",
    Tooltip = "",

    Callback = function(v)
        print("PowerUpDropdown : "..v)
    end
})

local powerups = game.Workspace.Ignore.PowerUps
local originalCFrame = CFrame.new(0, 0, 0)

AutoCheats:AddButton({
    Text = "Collect all powerups",
    Tooltip = "",

    Func = function()
        originalCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

        for i,v in pairs(powerups:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end

        if #powerups:GetChildren() == 0 then
            Library:Notify("No powerups right now", 2)
        end
    end
})

AutoCheats:AddButton({
    Text = "Board everything",
    Tooltip = "",

    Func = function()
        
    end
})

AutoCheats:AddDropdown("WeaponDropdown", {
    Values = {
        "Nothing yet",
    },

    Default = 1,
    Text = "Select weapon",
    Tooltip = "",

    Callback = function(v)
        print("WeaponDropdown : "..v)
    end
})

AutoCheats:AddButton({
    Text = "Weapon machine",
    Tooltip = "",
    
    Func = function()

    end
})

local GunCheats = Tabs.Game:AddRightGroupbox("Gun Mods")

GunCheats:AddDivider()

GunCheats:AddDropdown("InventoryDropdown", {
    Values = {
        "Modifies the weapon on hand",
    },

    Default = 1,
    Text = "Select weapon",
    Tooltip = "",

    Callback = function(v)
        print("InventoryDropdown : "..v)
    end
})

GunCheats:AddInput("RPMBox", {
    Default = "1000",
    Numeric = true,
    Finished = true,

    Text = "RPM",
    Tooltip = "Changes the RPM of the weapon",

    Placeholder = "RPM",

    Callback = function(v)
        print("RPM : "..tostring(v))
    end
})

local playerCheats = Tabs.Game:AddRightGroupbox("LocalPlayer")

playerCheats:AddDivider()

playerCheats:AddSlider("SpeedSlider", {
    Text = "Speed",
    Default = 16,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = math.floor(v)
    end
})

playerCheats:AddSlider("JumpSlider", {
    Text = "Jump",
    Default = 50,
    Min = 0,
    Max = 150,
    Rounding = 1,
    Compact = false,

    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = math.floor(v)
    end
})