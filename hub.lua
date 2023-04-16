local function len(t)
    local count = 0

    for _,v in pairs(t) do
        count = count + 1
    end

    return count
end

local supportedGames = {
    plane_crazy = 166986752,
    doors = 6516141723,
    zombie_uprising = 4972091010
}

local matchesLeft = len(supportedGames)
local currentGame

print(matchesLeft)
local uiRepo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(uiRepo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(uiRepo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(uiRepo .. 'addons/SaveManager.lua'))()

for i,v in pairs(supportedGames) do
    if matchesLeft == 0 then
        Library:Notify("this game isn't supported", 2)
        print("hub is unloading")
        Library:Unload()

        return
    end

    if game.PlaceId ~= v then
        matchesLeft = matchesLeft - 1
    end
end

Library:Notify("welcome to the hub", 2)

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

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = false, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('fyrinesHub')
SaveManager:SetFolder('fyrinesHub/save')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()