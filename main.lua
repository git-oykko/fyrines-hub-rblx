local lib = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(lib .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(lib .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(lib .. 'addons/SaveManager.lua'))()

local hubWindow = Library:CreateWindow({
    Title = "fyrine's hub",
    Center = true,
    Autoshow = false,
})