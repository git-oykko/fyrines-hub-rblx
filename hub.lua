local lib = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(lib .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(lib .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(lib .. 'addons/SaveManager.lua'))()

local hubWindow = Library:CreateWindow({
    Title = "fyrine's hub",
    Center = true,
    Autoshow = true,
    TabPadding = 8
})

local Tabs = {
    Game = hubWindow:AddTab("Game"),
    ['UI Settings'] = hubWindow:AddTab('UI Settings'),
}

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = false, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()