local name = "Credits"

Tabs[name] = mainWindow:AddTab(name)

local CreditsTab = Tabs[name]

local CreditsLeftGroupbox = CreditsTab:AddLeftGroupbox("Credits")

CreditsLeftGroupbox:AddDivider()

CreditsLeftGroupbox:AddLabel("scripted by oykko https://github.com/git-oykko/fyrines-hub-rblx", true)
CreditsLeftGroupbox:AddDivider()
CreditsLeftGroupbox:AddLabel("uses Linoria Lib for ui https://github.com/violin-suzutsuki/LinoriaLib", true)