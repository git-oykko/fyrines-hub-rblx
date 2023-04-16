local AimCheats = Tabs.Game:AddLeftGroupbox("Aim")

AimCheats:AddDivider()

AimCheats:AddLabel('Keybind'):AddKeyPicker('Hold to aim', {
    Default = 'E',
    SyncToggleState = false,

    Mode = 'Hold',

    Text = 'Aim',
    NoUI = false,

    Callback = function(v)

    end,
})

AimCheats:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Tooltip = "",

    Callback = function(v)
        
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