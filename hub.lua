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

local uiRepo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(uiRepo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(uiRepo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(uiRepo .. 'addons/SaveManager.lua'))()

for i,v in pairs(supportedGames) do
    if game.PlaceId ~= v then
        matchesLeft = matchesLeft - 1
    else
        currentGame = i
    end

    if matchesLeft == 0 then
        Library:Notify("this game isn't supported", 2)
        task.wait(2.5)
        Library:Unload()

        return
    end
end

Library:Notify("welcome to the hub, "..game.Players.LocalPlayer.DisplayName.." (@"..game.Players.LocalPlayer.Name..")", 2)

local hubWindow = Library:CreateWindow({
    Title = "fyrine's hub",
    Center = true,
    Autoshow = true,
    TabPadding = 8
})

local Tabs = {
    Game = hubWindow:AddTab(currentGame),
    ['UI Settings'] = hubWindow:AddTab('UI Settings'),
}

-- plane_crazy

if currentGame == "plane_crazy" then
    local PartTeleporter = Tabs.Game:AddLeftGroupbox("Groupbox")

    local targetPlr

    PartTeleporter:AddDropDown("SelectPlayerDropdown", {
        SpecialType = "Player",
        Text = "Select the player to teleport the part to",
        Tooltip = "Players",

        Callback = function(value)
            print(value)

            targetPlr = value
        end
    })

    local targetPart

    PartTeleporter:AddButton("SelectPartButton",{
        Text = "Select part",
        Tooltip = "Select the part to teleport to the player",
        Func = function()
            game.Players.LocalPlayer:GetMouse().Button1Down:Once(function()
                targetPart = game.Players.LocalPlayer:GetMouse().Target
            end)
        end
    })
end

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = false, Text = 'Menu keybind' })

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