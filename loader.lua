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
    zombie_uprising = 4972091010,
    wtrb = 2897155393
}

local matchesLeft = len(supportedGames)
local currentGame

local uiRepo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

Library = loadstring(game:HttpGet(uiRepo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(uiRepo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(uiRepo .. 'addons/SaveManager.lua'))()

for i,v in pairs(supportedGames) do
    if game.PlaceId ~= v then
        matchesLeft = matchesLeft - 1
    else
        currentGame = i
    end

    if matchesLeft == 0 then
        Library:Notify("this game isn't supported (self-destruct initiated)", 2)
        task.wait(2.5)
        Library:Unload()

        return
    end
end

Library:Notify("welcome to the hub, "..game.Players.LocalPlayer.DisplayName.." (@"..game.Players.LocalPlayer.Name..")", 2)
Library:Notify("press right shift to open the menu", 2)

local hubWindow = Library:CreateWindow({
    Title = "fyrine's hub",
    Center = true,
    Autoshow = true,
    TabPadding = 8
})

Tabs = {
    Game = hubWindow:AddTab(currentGame),
    Misc = hubWindow:AddTab("Misc"),
    Credits = hubWindow:AddTab("Credits"),
    ['UI Settings'] = hubWindow:AddTab('UI Settings'),
}

-- make the horrible code look better and optimize this code up if possible tmmrw
if currentGame == "plane_crazy" then
    Library:Notify("Loading the menu", 2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/git-oykko/fyrines-hub-rblx/main/menus/plane_crazy.lua"))()
    Library:Notify("Loaded!", 2)
elseif currentGame == "zombie_uprising" then
    Library:Notify("Loading the menu", 2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/git-oykko/fyrines-hub-rblx/main/menus/zombie_uprising.lua"))()
    Library:Notify("Loaded!", 2)
elseif currentGame == "wtrb" then
    Library:Notify("Loading the menu", 2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/git-oykko/fyrines-hub-rblx/main/menus/wtrb.lua"))()
    Library:Notify("Loaded!", 2)
end

local misc = Tabs.Misc:AddLeftGroupbox("nothing yet")
local credits = Tabs.Credits:AddLeftGroupbox("Credits")

credits:AddLabel("scripted by oykko https://github.com/git-oykko/fyrines-hub-rblx")
credits:AddLabel("uses Linoria Lib for ui https://github.com/violin-suzutsuki/LinoriaLib")

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = false, Text = 'Menu keybind' })

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