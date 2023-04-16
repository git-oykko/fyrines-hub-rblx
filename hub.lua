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
local lib = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(lib .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(lib .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(lib .. 'addons/SaveManager.lua'))()

for i,v in pairs(supportedGames) do
    if matchesLeft == 0 then
        lib:Notify("this game isn't supported", 2)
        lib:Unload()
    end

    if game.PlaceId ~= v then
        matchesLeft = matchesLeft - 1
    end
end

lib:Notify("welcome to da hub!", 2)

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

ThemeManager:SetLibrary(lib)
SaveManager:SetLibrary(lib)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('fyrinesHub')
SaveManager:SetFolder('fyrinesHub/save')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()