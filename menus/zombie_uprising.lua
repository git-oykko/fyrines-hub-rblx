local AimCheats = Tabs.Game:AddLeftGroupbox("Aimbot, ESP and tracers")

AimCheats:AddDivider()

AimCheats:AddLabel('Keybind'):AddKeyPicker('Hold to aim', {
    Default = 'E',
    SyncToggleState = false,

    Mode = 'Hold',

    Text = 'Aim',
    NoUI = false,

    Callback = function(Value)
        print('[cb] Keybind clicked!', Value)
    end,
})

AimCheats:AddToggle({
    Text = "Aimbot",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        
    end
})

AimCheats:AddToggle({
    Text = "ESP",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        
    end
})

AimCheats:AddToggle({
    Text = "Tracers",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        
    end
})