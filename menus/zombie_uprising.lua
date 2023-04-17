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

ESPCheats:AddToggle("ZombieESP", {
    Text = "Zombie ESP",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        getgenv().ZombieESP = v
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