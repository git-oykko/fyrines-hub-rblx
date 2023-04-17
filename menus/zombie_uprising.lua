local AimCheats = Tabs.Game:AddLeftGroupbox("Basic")

AimCheats:AddDivider()

AimCheats:AddLabel('Aimbot Keybind'):AddKeyPicker('HoldAim', {
    Default = 'E',
    SyncToggleState = false,

    Mode = 'Hold',

    Text = 'Aim',
    NoUI = false,

    Callback = function(v)
        getgenv().Aim = v
        print("test 2")

        task.spawn(function()
            repeat
                task.wait()
                print("Is this urnning?")

                local cam = game.Workspace.CurrentCamera
                local target = game.Players.LocalPlayer:GetMouse().Target

                if target.Parent.Parent.Name == "Zombies" then
                    cam.CFrame = CFrame.lookAt(cam.CFrame.Position, target.Head.Position)
                end
            until getgenv().Aim == false or getgev().Aimbot == false
        end)
    end,
})

AimCheats:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Tooltip = "Tracers",

    Callback = function(v)
        getgenv().Aimbot = v
        print("aimbot : "..v)
    end
})

AimCheats:AddToggle("ESP", {
    Text = "ESP",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        
    end
})

AimCheats:AddToggle("Tracers", {
    Text = "Tracers",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        
    end
})