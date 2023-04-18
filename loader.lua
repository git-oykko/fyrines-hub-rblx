-- Variables
uiLibRepo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

Library = loadstring(game:HttpGet(uiLibRepo .. 'Library.lua'))()


ui = "https://raw.githubusercontent.com/git-oykko/fyrines-hub-rblx/main/ui/"
tabs = ui.."tabs/"


local mainWindow = Library:CreateWindow({
    Title = "fyrine's hub",
    Center = true,
    Autoshow = true,
    TabPadding = 8
})

local supportedGames = {
    plane_crazy = 166986752,
    doors = 6516141723,
    zombie_uprising = 4972091010,
    wtrb = 2897155393
}

local matchesLeft = len(supportedGames)
local currentGame

-- Functions

function len(t)
    local count = 0

    for _,v in pairs(t) do
        count = count + 1
    end

    return count
end

-- Checks if the game is supported
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


Tabs = {
    game = mainWindow:AddTab(currentGame),

    Misc = mainWindow:AddTab("Misc"),
    Credits = mainWindow:AddTab("Credits"),

    ['UI Settings'] = mainWindow:AddTab('UI Settings')
}

gameTab = tabs.game

miscTab = tabs.Misc
creditsTab = tabs.Misc

Library:Notify("welcome to the hub, "..game.Players.LocalPlayer.DisplayName.." (@"..game.Players.LocalPlayer.Name..")", 2)
Library:Notify("press right control to open the menu", 2)

-- loads the selected game tab
loadstring(game:HttpGet(tabs.."games/"..currentGame..".lua"))()

-- loads other tabs
loadstring(game:HttpGet(tabs.."credits.lua"))()
loadstring(game:HttpGet(tabs.."misc.lua"))()
loadstring(game:HttpGet(tabs.."settings.lua"))
