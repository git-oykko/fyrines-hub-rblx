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

        task.spawn(function()
            repeat
                task.wait()

                local cam = game.Workspace.CurrentCamera
                local target = game.Players.LocalPlayer:GetMouse().Target

                if game.Players:GetPlayerFromCharacter(target.Parent) then
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