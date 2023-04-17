local AimCheats = Tabs.Game:AddLeftGroupbox("Basic")

AimCheats:AddDivider()

AimCheats:AddLabel('Aimbot Keybind'):AddKeyPicker('ToggleAim', {
    Default = 'E',
    SyncToggleState = false,

    Mode = 'Toggle',

    Text = 'Aim',
    NoUI = false,

    Callback = function(v)
        getgenv().Aim = v
        
        task.spawn(function()
            repeat
                task.wait()

                local cam = game.Workspace.CurrentCamera
                local target = game.Players.LocalPlayer:GetMouse().Target

                if target.Parent.Parent.Name == "Zombies" then
                    cam.CFrame = CFrame.lookAt(cam.CFrame.Position, target.Parent.Head.Position)
                end
            until getgenv().Aim == false or getgenv().Aimbot == false
        end)
    end
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
        local zombies = game.Workspace.Zombies

        if v then
            for i,v in pairs(zombies) do
                local box = Instance.new("Highlight")
            
                box.Parent = zombies
                box.Adornee = v
            end
        else
            for i,v in pairs(zombies) do
                if v:IsA("Highlight") then
                    v:Destroy()
                end
            end
        end
    end
})

AimCheats:AddToggle("Tracers", {
    Text = "Tracers",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        
    end
})