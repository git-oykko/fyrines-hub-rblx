function len(t)
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

uiLibRepo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

Library = loadstring(game:HttpGet(uiLibRepo .. 'Library.lua'))()

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
Library:Notify("press right control to open the menu", 2)

mainWindow = Library:CreateWindow({
    Title = "fyrine's hub",
    Center = true,
    Autoshow = true,
    TabPadding = 8
})

Tabs = {
    Game = mainWindow:AddTab(currentGame),
}

table.

ui = "https://raw.githubusercontent.com/git-oykko/fyrines-hub-rblx/main/ui/"
tabs = "https://raw.githubusercontent.com/git-oykko/fyrines-hub-rblx/main/ui/tabs/"

-- loads the selected game tab
loadstring(game:HttpGet(tabs.."games/"..currentGame..".lua"))()

-- loads other tabs
loadstring(game:HttpGet(tabs.."credits.lua"))()
loadstring(game:HttpGet(tabs.."misc.lua"))()
loadstring(game:HttpGet(tabs.."settings.lua"))
