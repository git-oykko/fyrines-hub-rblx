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

for i,v in pairs(supportedGames) do
    if matchesLeft == 0 then
        
    end

    if game.PlaceId ~= v then
        matchesLeft = matchesLeft - 1
    end
end
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

ThemeManager:SetLibrary(lib)
SaveManager:SetLibrary(lib)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('fyrinesHub')
SaveManager:SetFolder('fyrinesHub/save')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()