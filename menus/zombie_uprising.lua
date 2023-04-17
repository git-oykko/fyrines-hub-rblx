local AimCheats = Tabs.Game:AddLeftGroupbox("Basic")

AimCheats:AddDivider()

AimCheats:AddLabel('Aimbot Keybind'):AddKeyPicker('HoldAim', {
    Default = 'E',
    SyncToggleState = false,

    Mode = 'Toggle',

    Text = 'Aim',
    NoUI = false,

    Callback = function(v)
        getgenv().Aim = v
        print("test 2")
    end
})

AimCheats:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Tooltip = "Tracers",

    Callback = function(v)
        getgenv().Aimbot = v
        print("aimbot : "..tostring(v))
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