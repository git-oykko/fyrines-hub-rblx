Tabs = {}

Tabs['UI Settings'] = mainWindow:AddTab('UI Settings')

local ThemeManager = loadstring(game:HttpGet(uiLibRepo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(uiLibRepo .. 'addons/SaveManager.lua'))()

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = false, Text = 'Menu keybind' })

Library.ToggleKeybind = Options

Library.KeybindFrame.Visible = true

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('fyrinesHub')
SaveManager:SetFolder('fyrinesHub/save')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()

Library:Notify("Loaded settings tab", 2)