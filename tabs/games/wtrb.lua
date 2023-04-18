local Tab = gameTab

local PartTeleporter = Tab:AddLeftGroupbox("Part Teleporter")

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
                for i,v in pairs(targetPart.Parent:GetChildren()) do
                    if v.Name == "Spikes" then
                        selectPartButton.Label.Text = "Selected part : "..v.Name
                        targetPart = v
                    elseif v.Name == "Seat" then
                        selectPartButton.Label.Text = "Selected part : "..v.Name
                        targetPart = v
                    end
                end
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

PartTeleporter:AddDivider()

local isViewing = false

PartTeleporter:AddButton({
    Text = "View player",
    Tooltip = "Views the player selected",
    DoubleClick = false,

    Func = function()
        isViewing = not isViewing

        if isViewing then
            if game.Workspace.CurrentCamera then
                if game.Workspace[targetPlr] then
                    game.Workspace.CurrentCamera.CameraSubject = game.Workspace[targetPlr].Humanoid
                end
            end
        else
            if game.Workspace.CurrentCamera then
                if game.Players.LocalPlayer.Character then
                    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                end
            end
        end
    end
})
