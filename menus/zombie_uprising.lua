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

                if target.Parent.Parent.Name == "Zombies" then
                    cam.CFrame = CFrame.lookAt(cam.CFrame.Position, target.Parent[AimPart].Position)
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

ESPCheats:AddToggle("VendingESP", {
    Text = "Vending Machine ESP",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        getgenv().VendingESP = v
    end
})

ESPCheats:AddToggle("TurretESP", {
    Text = "Turret ESP",
    Default = false,
    Tooltip = "",

    Callback = function()
        getgenv().TurretESP = v
    end
})

local AutoCheats = Tabs.Game:AddLeftGroupbox("Auto")

AutoCheats:AddDivider()

AutoCheats:AddDropdown("PowerUpDropdown", {
    Values = {
        "Insta Kill",
        "Defender",
        "2x Damage"
    },

    Default = 1,
    Text = "Select Power Up",
    Tooltip = "",

    Callback = function(v)
        print("PowerUpDropdown : "..v)
    end
})

AutoCheats:AddButton({
    Text = "Collect all powerups",
    Tooltip = "",

    Func = function()
        
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
        print("SpeedSlider : "..v)
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
        print("JumpSlider : "..v)
    end
})