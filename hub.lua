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

local Tabs = {
    Game = hubWindow:AddTab(currentGame),
    ['UI Settings'] = hubWindow:AddTab('UI Settings'),
}

-- plane_crazy

if currentGame == "plane_crazy" then
    local PartTeleporter = Tabs.Game:AddLeftGroupbox("Part Teleporter")

    local targetPlr

    PartTeleporter:AddDivider()


    PartTeleporter:AddDropdown("SelectPlayerDropdown", {
        SpecialType = "Player",
        Text = "Select the player",
        Tooltip = "select the player",

        Callback = function(value)
            targetPlr = value
        end,
    })

    local targetPart

    local selectPartButton

    local function tp()
        if targetPart and workspace[targetPlr]:FindFirstChild("HumanoidRootPart") then
            if not targetPart.Anchored then
                targetPart.Anchored = true -- hehe it looks like a pp
                targetPart.Position = workspace[targetPlr].HumanoidRootPart.Position
                targetPart.Anchored = false
            else
                selectPartButton.Label.Text = "Part's anchored"
    
                task.wait(2)
    
                selectPartButton.Label.Text = "Selected part : "..targetPart.Name
            end
        else
            Library:Notify("Player died or part doesn't exist")
        end
    end

    PartTeleporter:AddDivider()

    selectPartButton = PartTeleporter:AddButton({
        Text = "Select part",
        Tooltip = "Select the part",
        DoubleClick = false,
        Func = function()
            selectPartButton.Label.Text = "Click on a part"
            game.Players.LocalPlayer:GetMouse().Button1Down:Once(function()
                targetPart = game.Players.LocalPlayer:GetMouse().Target

                if targetPart then
                    selectPartButton.Label.Text = "Selected part : "..targetPart.Name
                else
                    selectPartButton.Label.Text = "Part's anchored"

                    task.wait(2)

                    selectPartButton.Label.Text = "Selected part : "..targetPart.Name
                end
            end)
        end
    })

    PartTeleporter:AddButton({
        Text = "Teleport part",
        Tooltip = "Teleports the part to the selected player",
        DoubleClick = false,
        Func = tp
    })

    getgenv().SpamTp = false

    local del

    PartTeleporter:AddInput("DelayBox", {
        Default = "",
        Numeric = true,
        Finished = true,
    
        Text = 'Delay',
        Tooltip = '0.025 is recommended',
    
        Placeholder = 'sec(s)',

        Callback = function(v)
            del = v
        end
    })

    PartTeleporter:AddToggle("SpamTp", {
        Text = "Spam Teleport",
        Default = false,
        Tooltip = "Spams teleport with a selected delay",

        Callback = function(v)
            getgenv().SpamTp = v

            task.spawn(function()
                repeat
                    if not del then return end
                    task.wait(del)
                    tp()
                until getgenv().SpamTp == false
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