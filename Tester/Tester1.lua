--[[ 
    SCRIPT GAMING EXECUTOR V3.7 - WITH SETTINGS TAB
    FEATURES:
    - Syntax Highlight ON/OFF
    - Auto Complete ON/OFF (saran kata kunci)
    - UI Color Picker
    - Font Size slider
    - Reset Settings
]]

local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- ========== SETTINGS ==========
local settings = {
    SyntaxHighlight = true,
    AutoComplete = true,
    UIMainColor = Color3.fromRGB(0, 200, 255),
    UISecondaryColor = Color3.fromRGB(0, 150, 200),
    FontSize = 11,
    TextColor = Color3.fromRGB(0, 255, 200)
}

-- ========== AUTO COMPLETE KEYWORDS ==========
local keywords = {
    "print(", "warn(", "error(", "spawn(", "wait(", "task.wait(",
    "local ", "function ", "end", "if ", "then ", "else ", "elseif ",
    "for ", "while ", "do ", "return ", "break", "continue",
    "game.", "workspace.", "script.Parent", "player.",
    "Instance.new(", "Vector3.new(", "CFrame.new(",
    "Color3.fromRGB(", "UDim2.new(", "Enum.",
    "require(", "loadstring(", "getrenv()", "getgenv()"
}

-- ========== FILE PATH ==========
local savePath = "ScriptGamingExecutor/System/Saves/"
local hubPath = "ScriptGamingExecutor/System/Hub/"
local settingsPath = "ScriptGamingExecutor/System/settings.json"

-- ========== VARIABLES ==========
local sessionID = HttpService:GenerateGUID(false)
local scriptStartTime = tick()
local savesData = {}
local hubData = {}
local selectedHub = nil
local autoCompleteSuggestions = {}
local selectedSuggestion = 0

-- ========== FILE FUNCTIONS ==========
local function createFolder(path)
    local success = pcall(function()
        if makefolder then makefolder(path) end
    end)
    return success
end

local function writeFile(path, content)
    local success = pcall(function()
        if writefile then writefile(path, content) end
    end)
    return success
end

local function readFile(path)
    local success, content = pcall(function()
        if readfile then return readfile(path) end
    end)
    return success and content or nil
end

local function deleteFile(path)
    local success = pcall(function()
        if delfile then delfile(path) end
    end)
    return success
end

local function listFiles(path)
    local files = {}
    local success, result = pcall(function()
        if listfiles then return listfiles(path) end
    end)
    if success and result then
        for _, file in ipairs(result) do
            table.insert(files, file)
        end
    end
    return files
end

local function fileExists(path)
    local success, result = pcall(function()
        if listfiles then
            local files = listfiles(path)
            for _, file in ipairs(files) do
                if file == path then return true end
            end
        end
    end)
    return success and result or false
end

-- ========== SETTINGS FUNCTIONS ==========
local function loadSettings()
    if fileExists(settingsPath) then
        local content = readFile(settingsPath)
        if content then
            local success, data = pcall(function() return HttpService:JSONDecode(content) end)
            if success and data then
                settings.SyntaxHighlight = data.SyntaxHighlight ~= nil and data.SyntaxHighlight or true
                settings.AutoComplete = data.AutoComplete ~= nil and data.AutoComplete or true
                settings.UIMainColor = data.UIMainColor and Color3.fromRGB(data.UIMainColor[1], data.UIMainColor[2], data.UIMainColor[3]) or Color3.fromRGB(0, 200, 255)
                settings.UISecondaryColor = data.UISecondaryColor and Color3.fromRGB(data.UISecondaryColor[1], data.UISecondaryColor[2], data.UISecondaryColor[3]) or Color3.fromRGB(0, 150, 200)
                settings.FontSize = data.FontSize or 11
                settings.TextColor = data.TextColor and Color3.fromRGB(data.TextColor[1], data.TextColor[2], data.TextColor[3]) or Color3.fromRGB(0, 255, 200)
                return
            end
        end
    end
    saveSettings()
end

local function saveSettings()
    local data = {
        SyntaxHighlight = settings.SyntaxHighlight,
        AutoComplete = settings.AutoComplete,
        UIMainColor = {settings.UIMainColor.R*255, settings.UIMainColor.G*255, settings.UIMainColor.B*255},
        UISecondaryColor = {settings.UISecondaryColor.R*255, settings.UISecondaryColor.G*255, settings.UISecondaryColor.B*255},
        FontSize = settings.FontSize,
        TextColor = {settings.TextColor.R*255, settings.TextColor.G*255, settings.TextColor.B*255}
    }
    local jsonData = HttpService:JSONEncode(data)
    return writeFile(settingsPath, jsonData)
end

-- ========== CREATE FOLDERS ==========
createFolder("ScriptGamingExecutor")
createFolder("ScriptGamingExecutor/System")
createFolder(savePath)
createFolder(hubPath)
loadSettings()

-- ========== SAVES FUNCTIONS ==========
local function loadSaves()
    savesData = {}
    local files = listFiles(savePath)
    if not files then return end
    
    for _, filePath in ipairs(files) do
        if filePath:match("%.lua$") or filePath:match("%.txt$") or filePath:match("%.json$") then
            local content = readFile(filePath)
            if content then
                local success, data = pcall(function() return HttpService:JSONDecode(content) end)
                if success and data then
                    local fileName = filePath:match("([^/\\]+)$") or "Unknown"
                    table.insert(savesData, {
                        Name = fileName,
                        Script = data.Script or "",
                        Image = data.Image or "",
                        FullPath = filePath,
                        Size = string.len(data.Script or "")
                    })
                end
            end
        end
    end
end

local function saveScript(name, scriptText, imageId)
    if name == "" then return false end
    if not name:match("%.lua$") and not name:match("%.txt$") and not name:match("%.json$") then 
        name = name .. ".lua" 
    end
    local fullPath = savePath .. name
    local data = { Script = scriptText, Image = imageId or "" }
    local jsonData = HttpService:JSONEncode(data)
    local success = writeFile(fullPath, jsonData)
    if success then loadSaves() end
    return success
end

local function deleteScriptFile(name)
    local fullPath = savePath .. name
    local success = deleteFile(fullPath)
    if success then loadSaves() end
    return success
end

-- ========== HUB FUNCTIONS ==========
local function loadHubConfig()
    hubData = {}
    local hubFile = hubPath .. "hub_config.json"
    
    local fileExistsResult = false
    pcall(function()
        if listfiles then
            local files = listfiles(hubPath)
            for _, f in ipairs(files) do
                if f == hubFile then
                    fileExistsResult = true
                    break
                end
            end
        end
    end)
    
    if fileExistsResult then
        local content = readFile(hubFile)
        if content and content ~= "" then
            local success, data = pcall(function() 
                return HttpService:JSONDecode(content) 
            end)
            if success and data and type(data) == "table" then
                hubData = data
                return hubData
            end
        end
    end
    
    hubData = {
        { Name = "Hub1", Icon = "rbxasset://textures/ui/GuiImagePlaceholder.png", Scripts = {} },
        { Name = "Hub2", Icon = "rbxasset://textures/ui/GuiImagePlaceholder.png", Scripts = {} }
    }
    saveHubConfig()
    return hubData
end

local function saveHubConfig()
    local jsonData = HttpService:JSONEncode(hubData)
    local success, result = pcall(function()
        if writefile then
            writeFile(hubPath .. "hub_config.json", jsonData)
            return true
        end
        return false
    end)
    return success and result or false
end

local function addHubToConfig(name, icon)
    if name == "" then return false, "Name cannot be empty" end
    
    for _, hub in ipairs(hubData) do
        if hub.Name == name then
            return false, "Hub already exists!"
        end
    end
    
    table.insert(hubData, {
        Name = name,
        Icon = icon or "rbxasset://textures/ui/GuiImagePlaceholder.png",
        Scripts = {}
    })
    
    local saved = saveHubConfig()
    if saved then
        return true, "Hub created!"
    else
        table.remove(hubData, #hubData)
        return false, "Failed to save hub!"
    end
end

local function removeHubFromConfig(name)
    for i, hub in ipairs(hubData) do
        if hub.Name == name then
            table.remove(hubData, i)
            saveHubConfig()
            return true
        end
    end
    return false
end

local function addScriptToHub(hubName, scriptName, scriptContent, icon)
    for _, hub in ipairs(hubData) do
        if hub.Name == hubName then
            table.insert(hub.Scripts, {
                Name = scriptName,
                Script = scriptContent,
                Icon = icon or "rbxasset://textures/ui/GuiImagePlaceholder.png"
            })
            saveHubConfig()
            return true
        end
    end
    return false
end

local function removeScriptFromHub(hubName, scriptIndex)
    for _, hub in ipairs(hubData) do
        if hub.Name == hubName then
            if scriptIndex >= 1 and scriptIndex <= #hub.Scripts then
                table.remove(hub.Scripts, scriptIndex)
                saveHubConfig()
                return true
            end
        end
    end
    return false
end

local function getHubScripts(hubName)
    for _, hub in ipairs(hubData) do
        if hub.Name == hubName then
            return hub.Scripts
        end
    end
    return {}
end

-- ========== AUTO COMPLETE FUNCTION ==========
local function getAutoCompleteSuggestions(text)
    local suggestions = {}
    local words = {}
    
    -- Ambil kata terakhir yang diketik
    local lastWord = ""
    for word in text:gmatch("%S+") do
        lastWord = word
    end
    
    if lastWord == "" then return {} end
    
    local lowerWord = lastWord:lower()
    for _, keyword in ipairs(keywords) do
        if keyword:lower():match("^" .. lowerWord) then
            table.insert(suggestions, keyword)
        end
    end
    
    return suggestions
end

-- ==============================================================
-- CREATE GUI
-- ==============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SGE_V3"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- ==============================================================
-- DIALOG FUNCTIONS
-- ==============================================================
local function createDeleteSuccessDialog(fileName)
    local darkBg = Instance.new("Frame", screenGui)
    darkBg.Size = UDim2.new(1,0,1,0)
    darkBg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    darkBg.BackgroundTransparency = 0.5
    darkBg.ZIndex = 99
    
    local dialogFrame = Instance.new("Frame", screenGui)
    dialogFrame.Size = UDim2.new(0,300,0,120)
    dialogFrame.AnchorPoint = Vector2.new(0.5,0.5)
    dialogFrame.Position = UDim2.new(0.5,0,0.5,0)
    dialogFrame.BackgroundColor3 = Color3.fromRGB(20,20,35)
    dialogFrame.BorderSizePixel = 2
    dialogFrame.BorderColor3 = Color3.fromRGB(0,255,100)
    dialogFrame.ZIndex = 100
    
    local title = Instance.new("TextLabel", dialogFrame)
    title.Size = UDim2.new(1,0,0,30)
    title.BackgroundColor3 = Color3.fromRGB(0,200,100)
    title.Text = "✅ DELETED!"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.ZIndex = 101
    
    local message = Instance.new("TextLabel", dialogFrame)
    message.Size = UDim2.new(1,-20,0,30)
    message.Position = UDim2.new(0,10,0,35)
    message.BackgroundTransparency = 1
    message.Text = "File \"" .. fileName .. "\" deleted!"
    message.TextColor3 = Color3.fromRGB(0,255,150)
    message.Font = Enum.Font.Gotham
    message.TextWrapped = true
    message.ZIndex = 101
    
    local okBtn = Instance.new("TextButton", dialogFrame)
    okBtn.AnchorPoint = Vector2.new(0.5,1)
    okBtn.Size = UDim2.new(0,100,0,30)
    okBtn.Position = UDim2.new(0.5,0,1,-10)
    okBtn.BackgroundColor3 = Color3.fromRGB(0,200,100)
    okBtn.Text = "OK"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.Font = Enum.Font.GothamBold
    okBtn.ZIndex = 101
    okBtn.MouseButton1Click:Connect(function() dialogFrame:Destroy() darkBg:Destroy() end)
end

local function createOverwriteDialog(fileName, callback)
    local darkBg = Instance.new("Frame", screenGui)
    darkBg.Size = UDim2.new(1,0,1,0)
    darkBg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    darkBg.BackgroundTransparency = 0.6
    darkBg.ZIndex = 99
    
    local dialogFrame = Instance.new("Frame", screenGui)
    dialogFrame.Size = UDim2.new(0,320,0,160)
    dialogFrame.AnchorPoint = Vector2.new(0.5,0.5)
    dialogFrame.Position = UDim2.new(0.5,0,0.5,0)
    dialogFrame.BackgroundColor3 = Color3.fromRGB(20,20,35)
    dialogFrame.BorderSizePixel = 2
    dialogFrame.BorderColor3 = Color3.fromRGB(255,200,0)
    dialogFrame.ZIndex = 100
    
    local title = Instance.new("TextLabel", dialogFrame)
    title.Size = UDim2.new(1,0,0,30)
    title.BackgroundColor3 = Color3.fromRGB(200,150,0)
    title.Text = "⚠️ OVERWRITE?"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.ZIndex = 101
    
    local message = Instance.new("TextLabel", dialogFrame)
    message.Size = UDim2.new(1,-20,0,40)
    message.Position = UDim2.new(0,10,0,40)
    message.BackgroundTransparency = 1
    message.Text = "File \"" .. fileName .. "\" exists!\nOverwrite?"
    message.TextColor3 = Color3.fromRGB(255,220,150)
    message.Font = Enum.Font.Gotham
    message.TextWrapped = true
    message.ZIndex = 101
    
    local yesBtn = Instance.new("TextButton", dialogFrame)
    yesBtn.AnchorPoint = Vector2.new(0,1)
    yesBtn.Size = UDim2.new(0.4,0,0,30)
    yesBtn.Position = UDim2.new(0,20,1,-10)
    yesBtn.BackgroundColor3 = Color3.fromRGB(200,150,0)
    yesBtn.Text = "YES"
    yesBtn.TextColor3 = Color3.fromRGB(255,255,255)
    yesBtn.Font = Enum.Font.GothamBold
    yesBtn.ZIndex = 101
    yesBtn.MouseButton1Click:Connect(function() if callback then callback(true) end dialogFrame:Destroy() darkBg:Destroy() end)
    
    local noBtn = Instance.new("TextButton", dialogFrame)
    noBtn.AnchorPoint = Vector2.new(1,1)
    noBtn.Size = UDim2.new(0.4,0,0,30)
    noBtn.Position = UDim2.new(1,-20,1,-10)
    noBtn.BackgroundColor3 = Color3.fromRGB(60,60,80)
    noBtn.Text = "NO"
    noBtn.TextColor3 = Color3.fromRGB(255,255,255)
    noBtn.Font = Enum.Font.GothamBold
    noBtn.ZIndex = 101
    noBtn.MouseButton1Click:Connect(function() if callback then callback(false) end dialogFrame:Destroy() darkBg:Destroy() end)
end

local function createDeleteDialog(fileName, callback)
    local darkBg = Instance.new("Frame", screenGui)
    darkBg.Size = UDim2.new(1,0,1,0)
    darkBg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    darkBg.BackgroundTransparency = 0.6
    darkBg.ZIndex = 99
    
    local dialogFrame = Instance.new("Frame", screenGui)
    dialogFrame.Size = UDim2.new(0,280,0,140)
    dialogFrame.AnchorPoint = Vector2.new(0.5,0.5)
    dialogFrame.Position = UDim2.new(0.5,0,0.5,0)
    dialogFrame.BackgroundColor3 = Color3.fromRGB(20,20,35)
    dialogFrame.BorderSizePixel = 2
    dialogFrame.BorderColor3 = Color3.fromRGB(255,50,50)
    dialogFrame.ZIndex = 100
    
    local title = Instance.new("TextLabel", dialogFrame)
    title.Size = UDim2.new(1,0,0,30)
    title.BackgroundColor3 = Color3.fromRGB(200,50,50)
    title.Text = "⚠️ DELETE?"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.ZIndex = 101
    
    local message = Instance.new("TextLabel", dialogFrame)
    message.Size = UDim2.new(1,-20,0,35)
    message.Position = UDim2.new(0,10,0,38)
    message.BackgroundTransparency = 1
    message.Text = "Delete \"" .. fileName .. "\"?"
    message.TextColor3 = Color3.fromRGB(255,200,200)
    message.Font = Enum.Font.Gotham
    message.TextWrapped = true
    message.ZIndex = 101
    
    local yesBtn = Instance.new("TextButton", dialogFrame)
    yesBtn.AnchorPoint = Vector2.new(0,1)
    yesBtn.Size = UDim2.new(0.4,0,0,30)
    yesBtn.Position = UDim2.new(0,20,1,-10)
    yesBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
    yesBtn.Text = "YES"
    yesBtn.TextColor3 = Color3.fromRGB(255,255,255)
    yesBtn.Font = Enum.Font.GothamBold
    yesBtn.ZIndex = 101
    yesBtn.MouseButton1Click:Connect(function() if callback then callback(true) end dialogFrame:Destroy() darkBg:Destroy() end)
    
    local noBtn = Instance.new("TextButton", dialogFrame)
    noBtn.AnchorPoint = Vector2.new(1,1)
    noBtn.Size = UDim2.new(0.4,0,0,30)
    noBtn.Position = UDim2.new(1,-20,1,-10)
    noBtn.BackgroundColor3 = Color3.fromRGB(60,60,80)
    noBtn.Text = "NO"
    noBtn.TextColor3 = Color3.fromRGB(255,255,255)
    noBtn.Font = Enum.Font.GothamBold
    noBtn.ZIndex = 101
    noBtn.MouseButton1Click:Connect(function() if callback then callback(false) end dialogFrame:Destroy() darkBg:Destroy() end)
end

local function createEditDialog(fileName, currentScript, currentImage, callback)
    local darkBg = Instance.new("Frame", screenGui)
    darkBg.Size = UDim2.new(1,0,1,0)
    darkBg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    darkBg.BackgroundTransparency = 0.6
    darkBg.ZIndex = 99
    
    local dialogFrame = Instance.new("Frame", screenGui)
    dialogFrame.Size = UDim2.new(0,450,0,300)
    dialogFrame.AnchorPoint = Vector2.new(0.5,0.5)
    dialogFrame.Position = UDim2.new(0.5,0,0.5,0)
    dialogFrame.BackgroundColor3 = Color3.fromRGB(15,15,28)
    dialogFrame.BorderSizePixel = 2
    dialogFrame.BorderColor3 = settings.UIMainColor
    dialogFrame.ZIndex = 100
    
    local title = Instance.new("TextLabel", dialogFrame)
    title.Size = UDim2.new(1,0,0,30)
    title.BackgroundColor3 = settings.UISecondaryColor
    title.Text = "✏️ EDIT: " .. fileName
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.ZIndex = 101
    
    local closeEditBtn = Instance.new("TextButton", dialogFrame)
    closeEditBtn.Size = UDim2.new(0,25,0,25)
    closeEditBtn.Position = UDim2.new(1,-30,0,3)
    closeEditBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
    closeEditBtn.Text = "✕"
    closeEditBtn.TextColor3 = Color3.fromRGB(255,255,255)
    closeEditBtn.Font = Enum.Font.GothamBold
    closeEditBtn.ZIndex = 101
    closeEditBtn.MouseButton1Click:Connect(function() dialogFrame:Destroy() darkBg:Destroy() if callback then callback(false, nil, nil) end end)
    
    local editScroll = Instance.new("ScrollingFrame", dialogFrame)
    editScroll.Size = UDim2.new(1,-20,0,170)
    editScroll.Position = UDim2.new(0,10,0,40)
    editScroll.BackgroundColor3 = Color3.fromRGB(8,8,18)
    editScroll.BorderColor3 = Color3.fromRGB(40,40,60)
    editScroll.ScrollBarThickness = 6
    editScroll.ZIndex = 101
    editScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    local editTextBox = Instance.new("TextBox", editScroll)
    editTextBox.Size = UDim2.new(1,0,1,0)
    editTextBox.BackgroundTransparency = 0
    editTextBox.BackgroundColor3 = Color3.fromRGB(20,20,30)
    editTextBox.TextColor3 = settings.TextColor
    editTextBox.Text = currentScript
    editTextBox.TextWrapped = false
    editTextBox.MultiLine = true
    editTextBox.ClearTextOnFocus = false
    editTextBox.TextEditable = true
    editTextBox.TextScaled = false
    editTextBox.Font = Enum.Font.Code
    editTextBox.TextSize = settings.FontSize
    editTextBox.TextXAlignment = Enum.TextXAlignment.Left
    editTextBox.TextYAlignment = Enum.TextYAlignment.Top
    editTextBox.ZIndex = 101
    
    local editImageInput = Instance.new("TextBox", dialogFrame)
    editImageInput.Size = UDim2.new(0.5,0,0,25)
    editImageInput.Position = UDim2.new(0,95,0,220)
    editImageInput.BackgroundColor3 = Color3.fromRGB(10,10,22)
    editImageInput.TextColor3 = Color3.fromRGB(200,200,200)
    editImageInput.PlaceholderText = "Image ID (optional)"
    editImageInput.Text = currentImage or ""
    editImageInput.Font = Enum.Font.Code
    editImageInput.ZIndex = 101
    editImageInput.MultiLine = false
    editImageInput.ClearTextOnFocus = false
    editImageInput.TextEditable = true
    editImageInput.TextScaled = false
    
    local saveEditBtn = Instance.new("TextButton", dialogFrame)
    saveEditBtn.AnchorPoint = Vector2.new(1,1)
    saveEditBtn.Size = UDim2.new(0,120,0,30)
    saveEditBtn.Position = UDim2.new(1,-20,1,-10)
    saveEditBtn.BackgroundColor3 = Color3.fromRGB(0,200,100)
    saveEditBtn.Text = "SAVE"
    saveEditBtn.TextColor3 = Color3.fromRGB(255,255,255)
    saveEditBtn.Font = Enum.Font.GothamBold
    saveEditBtn.ZIndex = 101
    saveEditBtn.MouseButton1Click:Connect(function()
        if editTextBox.Text == "" then 
            print("❌ Script cannot be empty!") 
            return 
        end
        dialogFrame:Destroy() 
        darkBg:Destroy() 
        if callback then callback(true, editTextBox.Text, editImageInput.Text) end
    end)

    local cancelEditBtn = Instance.new("TextButton", dialogFrame)
    cancelEditBtn.AnchorPoint = Vector2.new(1,1)
    cancelEditBtn.Size = UDim2.new(0,80,0,30)
    cancelEditBtn.Position = UDim2.new(1,-150,1,-10)
    cancelEditBtn.BackgroundColor3 = Color3.fromRGB(60,60,80)
    cancelEditBtn.Text = "CANCEL"
    cancelEditBtn.TextColor3 = Color3.fromRGB(255,255,255)
    cancelEditBtn.Font = Enum.Font.GothamBold
    cancelEditBtn.ZIndex = 101
    cancelEditBtn.MouseButton1Click:Connect(function() dialogFrame:Destroy() darkBg:Destroy() if callback then callback(false, nil, nil) end end)
end

local function createEditSuccessDialog(fileName)
    local darkBg = Instance.new("Frame", screenGui)
    darkBg.Size = UDim2.new(1,0,1,0)
    darkBg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    darkBg.BackgroundTransparency = 0.5
    darkBg.ZIndex = 99
    
    local dialogFrame = Instance.new("Frame", screenGui)
    dialogFrame.Size = UDim2.new(0,300,0,120)
    dialogFrame.AnchorPoint = Vector2.new(0.5,0.5)
    dialogFrame.Position = UDim2.new(0.5,0,0.5,0)
    dialogFrame.BackgroundColor3 = Color3.fromRGB(20,20,35)
    dialogFrame.BorderSizePixel = 2
    dialogFrame.BorderColor3 = settings.UIMainColor
    dialogFrame.ZIndex = 100
    
    local title = Instance.new("TextLabel", dialogFrame)
    title.Size = UDim2.new(1,0,0,30)
    title.BackgroundColor3 = settings.UISecondaryColor
    title.Text = "✅ UPDATED!"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.ZIndex = 101
    
    local message = Instance.new("TextLabel", dialogFrame)
    message.Size = UDim2.new(1,-20,0,30)
    message.Position = UDim2.new(0,10,0,35)
    message.BackgroundTransparency = 1
    message.Text = "File \"" .. fileName .. "\" updated!"
    message.TextColor3 = settings.UIMainColor
    message.Font = Enum.Font.Gotham
    message.TextWrapped = true
    message.ZIndex = 101
    
    local okBtn = Instance.new("TextButton", dialogFrame)
    okBtn.AnchorPoint = Vector2.new(0.5,1)
    okBtn.Size = UDim2.new(0,100,0,30)
    okBtn.Position = UDim2.new(0.5,0,1,-10)
    okBtn.BackgroundColor3 = settings.UISecondaryColor
    okBtn.Text = "OK"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.Font = Enum.Font.GothamBold
    okBtn.ZIndex = 101
    okBtn.MouseButton1Click:Connect(function() dialogFrame:Destroy() darkBg:Destroy() end)
end

-- ==============================================================
-- MAIN FRAME
-- ==============================================================
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0,480,0,370)
mainFrame.AnchorPoint = Vector2.new(0.5,0.5)
mainFrame.Position = UDim2.new(0.5,0,0.5,0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15,15,28)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = settings.UIMainColor
mainFrame.Visible = false

-- Dragging
local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function() 
            if input.UserInputState == Enum.UserInputState.End then 
                dragging = false 
            end 
        end)
    end
end)
mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
        dragInput = input 
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Open Button
local openBtn = Instance.new("TextButton", screenGui)
openBtn.Size = UDim2.new(0,40,0,40)
openBtn.Position = UDim2.new(0,10,0.5,-20)
openBtn.BackgroundColor3 = settings.UIMainColor
openBtn.Text = "▶"
openBtn.TextColor3 = Color3.fromRGB(255,255,255)
openBtn.Font = Enum.Font.GothamBold

openBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    openBtn.Text = mainFrame.Visible and "◀" or "▶"
    if mainFrame.Visible then 
        loadSaves()
        refreshSavesList()
        updateHomeTab()
        loadHubConfig()
        refreshHubList()
        updateSettingsUI()
    end
end)

-- Top Bar
local topBar = Instance.new("Frame", mainFrame)
topBar.Size = UDim2.new(1,0,0,30)
topBar.BackgroundColor3 = settings.UISecondaryColor

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1,-35,1,0)
title.Position = UDim2.new(0,8,0,0)
title.BackgroundTransparency = 1
title.Text = "🎮 SGE V3.7"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0,22,0,22)
closeBtn.Position = UDim2.new(1,-27,0,4)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.MouseButton1Click:Connect(function() 
    mainFrame.Visible = false 
    openBtn.Text = "▶"
end)

-- Sidebar
local sidebarFrame = Instance.new("Frame", mainFrame)
sidebarFrame.Size = UDim2.new(0,100,1,-30)
sidebarFrame.Position = UDim2.new(0,0,0,30)
sidebarFrame.BackgroundColor3 = Color3.fromRGB(10,10,20)
sidebarFrame.BorderSizePixel = 0

-- Tab Buttons
local tabHome = Instance.new("TextButton", sidebarFrame)
tabHome.Size = UDim2.new(1,-10,0,22)
tabHome.Position = UDim2.new(0,5,0,5)
tabHome.BackgroundColor3 = settings.UIMainColor
tabHome.Text = "🏠 HOME"
tabHome.TextColor3 = Color3.fromRGB(255,255,255)
tabHome.Font = Enum.Font.GothamBold
tabHome.TextSize = 11

local tabHub = Instance.new("TextButton", sidebarFrame)
tabHub.Size = UDim2.new(1,-10,0,22)
tabHub.Position = UDim2.new(0,5,0,30)
tabHub.BackgroundColor3 = Color3.fromRGB(30,30,40)
tabHub.Text = "🌐 HUB"
tabHub.TextColor3 = Color3.fromRGB(200,200,200)
tabHub.Font = Enum.Font.GothamBold
tabHub.TextSize = 11

local tabExecuted = Instance.new("TextButton", sidebarFrame)
tabExecuted.Size = UDim2.new(1,-10,0,22)
tabExecuted.Position = UDim2.new(0,5,0,55)
tabExecuted.BackgroundColor3 = Color3.fromRGB(30,30,40)
tabExecuted.Text = "📜 EXEC"
tabExecuted.TextColor3 = Color3.fromRGB(200,200,200)
tabExecuted.Font = Enum.Font.GothamBold
tabExecuted.TextSize = 11

local tabSaves = Instance.new("TextButton", sidebarFrame)
tabSaves.Size = UDim2.new(1,-10,0,22)
tabSaves.Position = UDim2.new(0,5,0,80)
tabSaves.BackgroundColor3 = Color3.fromRGB(30,30,40)
tabSaves.Text = "💾 SAVES"
tabSaves.TextColor3 = Color3.fromRGB(200,200,200)
tabSaves.Font = Enum.Font.GothamBold
tabSaves.TextSize = 11

local tabConsole = Instance.new("TextButton", sidebarFrame)
tabConsole.Size = UDim2.new(1,-10,0,22)
tabConsole.Position = UDim2.new(0,5,0,105)
tabConsole.BackgroundColor3 = Color3.fromRGB(30,30,40)
tabConsole.Text = "💻 CONSOLE"
tabConsole.TextColor3 = Color3.fromRGB(200,200,200)
tabConsole.Font = Enum.Font.GothamBold
tabConsole.TextSize = 11

local tabSettings = Instance.new("TextButton", sidebarFrame)
tabSettings.Size = UDim2.new(1,-10,0,22)
tabSettings.Position = UDim2.new(0,5,0,130)
tabSettings.BackgroundColor3 = Color3.fromRGB(30,30,40)
tabSettings.Text = "⚙️ SETTINGS"
tabSettings.TextColor3 = Color3.fromRGB(200,200,200)
tabSettings.Font = Enum.Font.GothamBold
tabSettings.TextSize = 11

local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1,-110,1,-38)
contentFrame.Position = UDim2.new(0,105,0,34)
contentFrame.BackgroundTransparency = 1

-- ==============================================================
-- HOME TAB
-- ==============================================================
local homeFrame = Instance.new("Frame", contentFrame)
homeFrame.Size = UDim2.new(1,0,1,0)
homeFrame.BackgroundTransparency = 1
homeFrame.Visible = true

local homeBg = Instance.new("Frame", homeFrame)
homeBg.Size = UDim2.new(1,-10,1,-10)
homeBg.Position = UDim2.new(0,5,0,5)
homeBg.BackgroundColor3 = Color3.fromRGB(10,10,22)
homeBg.BorderColor3 = Color3.fromRGB(40,40,60)

local usernameLabel = Instance.new("TextLabel", homeBg)
usernameLabel.Size = UDim2.new(1,0,0,22)
usernameLabel.Position = UDim2.new(0,8,0,8)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Text = "👤 " .. player.Name
usernameLabel.TextColor3 = settings.TextColor
usernameLabel.Font = Enum.Font.GothamBold
usernameLabel.TextSize = 12
usernameLabel.TextXAlignment = Enum.TextXAlignment.Left

local useridLabel = Instance.new("TextLabel", homeBg)
useridLabel.Size = UDim2.new(1,0,0,22)
useridLabel.Position = UDim2.new(0,8,0,33)
useridLabel.BackgroundTransparency = 1
useridLabel.Text = "🆔 " .. player.UserId
useridLabel.TextColor3 = settings.TextColor
useridLabel.Font = Enum.Font.GothamBold
useridLabel.TextSize = 12
useridLabel.TextXAlignment = Enum.TextXAlignment.Left

local sessionLabel = Instance.new("TextLabel", homeBg)
sessionLabel.Size = UDim2.new(1,0,0,22)
sessionLabel.Position = UDim2.new(0,8,0,58)
sessionLabel.BackgroundTransparency = 1
sessionLabel.Text = "🔑 " .. string.sub(sessionID, 1, 20) .. "..."
sessionLabel.TextColor3 = Color3.fromRGB(255,200,100)
sessionLabel.Font = Enum.Font.Code
sessionLabel.TextSize = 10
sessionLabel.TextXAlignment = Enum.TextXAlignment.Left

local timeLabel = Instance.new("TextLabel", homeBg)
timeLabel.Size = UDim2.new(1,0,0,22)
timeLabel.Position = UDim2.new(0,8,0,83)
timeLabel.BackgroundTransparency = 1
timeLabel.Text = "⏱️ 0s"
timeLabel.TextColor3 = Color3.fromRGB(100,200,255)
timeLabel.Font = Enum.Font.GothamBold
timeLabel.TextSize = 12
timeLabel.TextXAlignment = Enum.TextXAlignment.Left

local ageLabel = Instance.new("TextLabel", homeBg)
ageLabel.Size = UDim2.new(1,0,0,22)
ageLabel.Position = UDim2.new(0,8,0,108)
ageLabel.BackgroundTransparency = 1
ageLabel.Text = "📅 0 days"
ageLabel.TextColor3 = Color3.fromRGB(255,200,150)
ageLabel.Font = Enum.Font.GothamBold
ageLabel.TextSize = 12
ageLabel.TextXAlignment = Enum.TextXAlignment.Left

local copyUserIDBtn = Instance.new("TextButton", homeBg)
copyUserIDBtn.Size = UDim2.new(0,100,0,25)
copyUserIDBtn.Position = UDim2.new(0,8,0,140)
copyUserIDBtn.BackgroundColor3 = Color3.fromRGB(0,150,255)
copyUserIDBtn.Text = "📋 Copy ID"
copyUserIDBtn.TextColor3 = Color3.fromRGB(255,255,255)
copyUserIDBtn.Font = Enum.Font.GothamBold
copyUserIDBtn.TextSize = 11

local copyUsernameBtn = Instance.new("TextButton", homeBg)
copyUsernameBtn.Size = UDim2.new(0,100,0,25)
copyUsernameBtn.Position = UDim2.new(0,115,0,140)
copyUsernameBtn.BackgroundColor3 = Color3.fromRGB(0,200,100)
copyUsernameBtn.Text = "📋 Copy Name"
copyUsernameBtn.TextColor3 = Color3.fromRGB(255,255,255)
copyUsernameBtn.Font = Enum.Font.GothamBold
copyUsernameBtn.TextSize = 11

local statusLabel = Instance.new("TextLabel", homeBg)
statusLabel.Size = UDim2.new(1,0,0,20)
statusLabel.Position = UDim2.new(0,8,0,175)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "✅ Ready"
statusLabel.TextColor3 = Color3.fromRGB(150,255,150)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

updateHomeTab = function()
    local elapsed = math.floor(tick() - scriptStartTime)
    local minutes = math.floor(elapsed / 60)
    local seconds = elapsed % 60
    if minutes > 0 then
        timeLabel.Text = "⏱️ " .. minutes .. "m " .. seconds .. "s"
    else
        timeLabel.Text = "⏱️ " .. seconds .. "s"
    end
    local ageInDays = math.floor((os.time() - player.AccountAge) / 86400)
    ageLabel.Text = "📅 " .. ageInDays .. " days"
end

spawn(function()
    while wait(1) do
        if mainFrame.Visible then updateHomeTab() end
    end
end)

copyUserIDBtn.MouseButton1Click:Connect(function()
    pcall(function() if setclipboard then setclipboard(tostring(player.UserId)) end end)
    statusLabel.Text = "✅ Copied!"
    statusLabel.TextColor3 = Color3.fromRGB(150,255,150)
    wait(1.5)
    statusLabel.Text = "✅ Ready"
    statusLabel.TextColor3 = Color3.fromRGB(150,255,150)
end)

copyUsernameBtn.MouseButton1Click:Connect(function()
    pcall(function() if setclipboard then setclipboard(player.Name) end end)
    statusLabel.Text = "✅ Copied!"
    statusLabel.TextColor3 = Color3.fromRGB(150,255,150)
    wait(1.5)
    statusLabel.Text = "✅ Ready"
    statusLabel.TextColor3 = Color3.fromRGB(150,255,150)
end)

-- ==============================================================
-- HUB TAB
-- ==============================================================
local hubFrame = Instance.new("Frame", contentFrame)
hubFrame.Size = UDim2.new(1,0,1,0)
hubFrame.BackgroundTransparency = 1
hubFrame.Visible = false

local hubBg = Instance.new("Frame", hubFrame)
hubBg.Size = UDim2.new(1,-10,1,-10)
hubBg.Position = UDim2.new(0,5,0,5)
hubBg.BackgroundColor3 = Color3.fromRGB(10,10,22)
hubBg.BorderColor3 = Color3.fromRGB(40,40,60)

local hubScroll = Instance.new("ScrollingFrame", hubBg)
hubScroll.Size = UDim2.new(0.48,-5,0.85,-5)
hubScroll.Position = UDim2.new(0,3,0,0)
hubScroll.BackgroundColor3 = Color3.fromRGB(8,8,18)
hubScroll.BorderColor3 = Color3.fromRGB(40,40,60)
hubScroll.ScrollBarThickness = 5
hubScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local hubList = Instance.new("Frame", hubScroll)
hubList.Size = UDim2.new(1,-5,0,0)
hubList.Position = UDim2.new(0,3,0,0)
hubList.BackgroundTransparency = 1

local scriptScroll = Instance.new("ScrollingFrame", hubBg)
scriptScroll.Size = UDim2.new(0.48,-5,0.85,-5)
scriptScroll.Position = UDim2.new(0.52,0,0,0)
scriptScroll.BackgroundColor3 = Color3.fromRGB(8,8,18)
scriptScroll.BorderColor3 = Color3.fromRGB(40,40,60)
scriptScroll.ScrollBarThickness = 5
scriptScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local scriptList = Instance.new("Frame", scriptScroll)
scriptList.Size = UDim2.new(1,-5,0,0)
scriptList.Position = UDim2.new(0,3,0,0)
scriptList.BackgroundTransparency = 1

local hubControlFrame = Instance.new("Frame", hubBg)
hubControlFrame.Size = UDim2.new(0.48,-5,0,50)
hubControlFrame.Position = UDim2.new(0,3,1,-55)
hubControlFrame.BackgroundColor3 = Color3.fromRGB(8,8,18)

local hubNameInput = Instance.new("TextBox", hubControlFrame)
hubNameInput.Size = UDim2.new(0.5,-3,0,22)
hubNameInput.Position = UDim2.new(0,0,0,2)
hubNameInput.BackgroundColor3 = Color3.fromRGB(10,10,22)
hubNameInput.TextColor3 = Color3.fromRGB(200,200,200)
hubNameInput.PlaceholderText = "Hub Name"
hubNameInput.Text = ""
hubNameInput.Font = Enum.Font.Code
hubNameInput.TextSize = 10
hubNameInput.MultiLine = false
hubNameInput.ClearTextOnFocus = false
hubNameInput.TextEditable = true
hubNameInput.TextScaled = false

local hubIconInput = Instance.new("TextBox", hubControlFrame)
hubIconInput.Size = UDim2.new(0.25,-3,0,22)
hubIconInput.Position = UDim2.new(0.52,0,0,2)
hubIconInput.BackgroundColor3 = Color3.fromRGB(10,10,22)
hubIconInput.TextColor3 = Color3.fromRGB(200,200,200)
hubIconInput.PlaceholderText = "Icon"
hubIconInput.Text = ""
hubIconInput.Font = Enum.Font.Code
hubIconInput.TextSize = 10
hubIconInput.MultiLine = false
hubIconInput.ClearTextOnFocus = false
hubIconInput.TextEditable = true
hubIconInput.TextScaled = false

local addHubBtn = Instance.new("TextButton", hubControlFrame)
addHubBtn.Size = UDim2.new(0.18,-3,0,22)
addHubBtn.Position = UDim2.new(0.79,0,0,2)
addHubBtn.BackgroundColor3 = settings.UIMainColor
addHubBtn.Text = "➕ ADD"
addHubBtn.TextColor3 = Color3.fromRGB(255,255,255)
addHubBtn.Font = Enum.Font.GothamBold
addHubBtn.TextSize = 10

local delHubBtn = Instance.new("TextButton", hubControlFrame)
delHubBtn.Size = UDim2.new(0.18,-3,0,22)
delHubBtn.Position = UDim2.new(0.79,0,0,26)
delHubBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
delHubBtn.Text = "🗑️ DEL"
delHubBtn.TextColor3 = Color3.fromRGB(255,255,255)
delHubBtn.Font = Enum.Font.GothamBold
delHubBtn.TextSize = 10

local scriptControlFrame = Instance.new("Frame", hubBg)
scriptControlFrame.Size = UDim2.new(0.48,-5,0,50)
scriptControlFrame.Position = UDim2.new(0.52,0,1,-55)
scriptControlFrame.BackgroundColor3 = Color3.fromRGB(8,8,18)

local scriptNameInput = Instance.new("TextBox", scriptControlFrame)
scriptNameInput.Size = UDim2.new(0.75,-3,0,22)
scriptNameInput.Position = UDim2.new(0,0,0,2)
scriptNameInput.BackgroundColor3 = Color3.fromRGB(10,10,22)
scriptNameInput.TextColor3 = Color3.fromRGB(200,200,200)
scriptNameInput.PlaceholderText = "Script Name"
scriptNameInput.Text = ""
scriptNameInput.Font = Enum.Font.Code
scriptNameInput.TextSize = 10
scriptNameInput.MultiLine = false
scriptNameInput.ClearTextOnFocus = false
scriptNameInput.TextEditable = true
scriptNameInput.TextScaled = false

local addScriptBtn = Instance.new("TextButton", scriptControlFrame)
addScriptBtn.Size = UDim2.new(0.2,-3,0,22)
addScriptBtn.Position = UDim2.new(0.77,0,0,2)
addScriptBtn.BackgroundColor3 = settings.UIMainColor
addScriptBtn.Text = "➕ ADD"
addScriptBtn.TextColor3 = Color3.fromRGB(255,255,255)
addScriptBtn.Font = Enum.Font.GothamBold
addScriptBtn.TextSize = 10

refreshHubList = function()
    for _, child in pairs(hubList:GetChildren()) do child:Destroy() end
    loadHubConfig()
    
    if #hubData == 0 then
        local emptyLabel = Instance.new("TextLabel", hubList)
        emptyLabel.Size = UDim2.new(1,0,0,25)
        emptyLabel.BackgroundTransparency = 1
        emptyLabel.Text = "🌐 No hubs"
        emptyLabel.TextColor3 = Color3.fromRGB(150,150,150)
        emptyLabel.Font = Enum.Font.Gotham
        emptyLabel.TextSize = 11
        hubList.Size = UDim2.new(1,-5,0,30)
        return
    end
    
    local yPos = 0
    for i, hub in ipairs(hubData) do
        local hubFrameItem = Instance.new("TextButton", hubList)
        hubFrameItem.Size = UDim2.new(1,0,0,28)
        hubFrameItem.Position = UDim2.new(0,0,0,yPos)
        hubFrameItem.BackgroundColor3 = Color3.fromRGB(20,20,35)
        hubFrameItem.BorderColor3 = Color3.fromRGB(40,40,60)
        
        local iconLabel = Instance.new("ImageLabel", hubFrameItem)
        iconLabel.Size = UDim2.new(0,18,0,18)
        iconLabel.Position = UDim2.new(0,3,0.5,-9)
        iconLabel.BackgroundColor3 = Color3.fromRGB(30,30,40)
        iconLabel.BackgroundTransparency = 0.5
        iconLabel.Image = hub.Icon or "rbxasset://textures/ui/GuiImagePlaceholder.png"
        iconLabel.ScaleType = Enum.ScaleType.Fit
        
        local hubLabel = Instance.new("TextLabel", hubFrameItem)
        hubLabel.Size = UDim2.new(1,-30,1,0)
        hubLabel.Position = UDim2.new(0,24,0,0)
        hubLabel.BackgroundTransparency = 1
        hubLabel.Text = hub.Name .. " (" .. #hub.Scripts .. ")"
        hubLabel.TextColor3 = settings.TextColor
        hubLabel.Font = Enum.Font.GothamBold
        hubLabel.TextSize = 10
        hubLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        hubFrameItem.MouseButton1Click:Connect(function()
            selectedHub = hub.Name
            refreshScriptList(hub.Name)
            print("📂 Selected: " .. hub.Name)
        end)
        
        yPos = yPos + 33
    end
    hubList.Size = UDim2.new(1,-5,0,yPos + 10)
end

refreshScriptList = function(hubName)
    for _, child in pairs(scriptList:GetChildren()) do child:Destroy() end
    
    local scripts = getHubScripts(hubName)
    
    if #scripts == 0 then
        local emptyLabel = Instance.new("TextLabel", scriptList)
        emptyLabel.Size = UDim2.new(1,0,0,25)
        emptyLabel.BackgroundTransparency = 1
        emptyLabel.Text = "📜 Empty"
        emptyLabel.TextColor3 = Color3.fromRGB(150,150,150)
        emptyLabel.Font = Enum.Font.Gotham
        emptyLabel.TextSize = 11
        scriptList.Size = UDim2.new(1,-5,0,30)
        return
    end
    
    local yPos = 0
    for i, script in ipairs(scripts) do
        local scriptFrame = Instance.new("Frame", scriptList)
        scriptFrame.Size = UDim2.new(1,0,0,28)
        scriptFrame.Position = UDim2.new(0,0,0,yPos)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(20,20,35)
        scriptFrame.BorderColor3 = Color3.fromRGB(40,40,60)
        
        local scriptLabel = Instance.new("TextLabel", scriptFrame)
        scriptLabel.Size = UDim2.new(0.55,-10,1,0)
        scriptLabel.Position = UDim2.new(0,3,0,0)
        scriptLabel.BackgroundTransparency = 1
        scriptLabel.Text = script.Name
        scriptLabel.TextColor3 = Color3.fromRGB(200,255,200)
        scriptLabel.Font = Enum.Font.Gotham
        scriptLabel.TextSize = 10
        scriptLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local runScriptBtn = Instance.new("TextButton", scriptFrame)
        runScriptBtn.Size = UDim2.new(0,22,0,18)
        runScriptBtn.Position = UDim2.new(0.65,0,0.5,-9)
        runScriptBtn.BackgroundColor3 = settings.UIMainColor
        runScriptBtn.Text = "▶"
        runScriptBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runScriptBtn.Font = Enum.Font.GothamBold
        runScriptBtn.TextSize = 10
        runScriptBtn.MouseButton1Click:Connect(function()
            if script.Script ~= "" then
                executeScript(script.Script)
                print("▶ Running: " .. script.Name)
            else
                print("⚠️ Empty script!")
            end
        end)
        
        local delScriptBtn = Instance.new("TextButton", scriptFrame)
        delScriptBtn.Size = UDim2.new(0,18,0,18)
        delScriptBtn.Position = UDim2.new(0.78,0,0.5,-9)
        delScriptBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
        delScriptBtn.Text = "✕"
        delScriptBtn.TextColor3 = Color3.fromRGB(255,255,255)
        delScriptBtn.Font = Enum.Font.GothamBold
        delScriptBtn.TextSize = 10
        delScriptBtn.MouseButton1Click:Connect(function()
            createDeleteDialog(script.Name, function(confirmed)
                if confirmed then
                    if removeScriptFromHub(hubName, i) then
                        refreshScriptList(hubName)
                        refreshHubList()
                        print("🗑️ Removed: " .. script.Name)
                        createDeleteSuccessDialog(script.Name)
                    end
                end
            end)
        end)
        
        yPos = yPos + 33
    end
    scriptList.Size = UDim2.new(1,-5,0,yPos + 10)
end

addHubBtn.MouseButton1Click:Connect(function()
    local name = hubNameInput.Text
    local icon = hubIconInput.Text
    
    if name == "" then 
        print("❌ Enter hub name!") 
        return 
    end
    
    local success, msg = addHubToConfig(name, icon)
    if success then
        refreshHubList()
        hubNameInput.Text = ""
        hubIconInput.Text = ""
        print("✅ " .. msg)
    else
        print("❌ " .. msg)
    end
end)

delHubBtn.MouseButton1Click:Connect(function()
    if not selectedHub then print("❌ Select a hub!") return end
    
    createDeleteDialog(selectedHub, function(confirmed)
        if confirmed then
            if removeHubFromConfig(selectedHub) then
                selectedHub = nil
                refreshHubList()
                for _, child in pairs(scriptList:GetChildren()) do child:Destroy() end
                print("🗑️ Hub deleted!")
            end
        end
    end)
end)

addScriptBtn.MouseButton1Click:Connect(function()
    if not selectedHub then print("❌ Select a hub!") return end
    local name = scriptNameInput.Text
    if name == "" then print("❌ Enter script name!") return end
    
    if addScriptToHub(selectedHub, name, textBox.Text, "") then
        refreshScriptList(selectedHub)
        refreshHubList()
        scriptNameInput.Text = ""
        print("✅ Script added to: " .. selectedHub)
    else
        print("❌ Failed to add script!")
    end
end)

-- ==============================================================
-- EXECUTE TAB
-- ==============================================================
local executedFrame = Instance.new("Frame", contentFrame)
executedFrame.Size = UDim2.new(1,0,1,0)
executedFrame.BackgroundTransparency = 1
executedFrame.Visible = false

local scriptScrollExec = Instance.new("ScrollingFrame", executedFrame)
scriptScrollExec.Size = UDim2.new(1,-10,0.72,0)
scriptScrollExec.Position = UDim2.new(0,5,0,0)
scriptScrollExec.BackgroundColor3 = Color3.fromRGB(8,8,18)
scriptScrollExec.BorderColor3 = Color3.fromRGB(40,40,60)
scriptScrollExec.ScrollBarThickness = 5
scriptScrollExec.AutomaticCanvasSize = Enum.AutomaticSize.Y

local textBox = Instance.new("TextBox", scriptScrollExec)
textBox.Size = UDim2.new(1,0,1,0)
textBox.BackgroundTransparency = 0
textBox.BackgroundColor3 = Color3.fromRGB(20,20,30)
textBox.TextColor3 = settings.TextColor
textBox.Text = "--// Put your script here\nprint(\"Hello from SGE V3.7!\")"
textBox.TextWrapped = false
textBox.MultiLine = true
textBox.ClearTextOnFocus = false
textBox.TextEditable = true
textBox.TextScaled = false
textBox.Font = Enum.Font.Code
textBox.TextSize = settings.FontSize
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top

-- Auto Complete Popup
local autoCompleteFrame = Instance.new("Frame", scriptScrollExec)
autoCompleteFrame.Size = UDim2.new(0,200,0,0)
autoCompleteFrame.Position = UDim2.new(0,10,0,10)
autoCompleteFrame.BackgroundColor3 = Color3.fromRGB(15,15,30)
autoCompleteFrame.BorderColor3 = settings.UIMainColor
autoCompleteFrame.Visible = false
autoCompleteFrame.ZIndex = 10

local autoCompleteList = Instance.new("ScrollingFrame", autoCompleteFrame)
autoCompleteList.Size = UDim2.new(1,0,1,0)
autoCompleteList.BackgroundTransparency = 1
autoCompleteList.ScrollBarThickness = 3
autoCompleteList.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- Function buat update auto complete
local function updateAutoComplete(text)
    if not settings.AutoComplete then 
        autoCompleteFrame.Visible = false
        return 
    end
    
    local suggestions = getAutoCompleteSuggestions(text)
    if #suggestions == 0 then
        autoCompleteFrame.Visible = false
        return
    end
    
    autoCompleteFrame.Visible = true
    autoCompleteFrame.Size = UDim2.new(0,200,0,math.min(#suggestions * 22 + 10, 150))
    
    for _, child in pairs(autoCompleteList:GetChildren()) do child:Destroy() end
    
    local yPos = 0
    for _, suggestion in ipairs(suggestions) do
        local btn = Instance.new("TextButton", autoCompleteList)
        btn.Size = UDim2.new(1,0,0,22)
        btn.Position = UDim2.new(0,0,0,yPos)
        btn.BackgroundColor3 = Color3.fromRGB(25,25,45)
        btn.Text = suggestion
        btn.TextColor3 = settings.TextColor
        btn.TextSize = settings.FontSize
        btn.Font = Enum.Font.Code
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.ZIndex = 11
        
        btn.MouseButton1Click:Connect(function()
            -- Replace last word with suggestion
            local lines = textBox.Text:split("\n")
            local lastLine = lines[#lines] or ""
            local words = {}
            for word in lastLine:gmatch("%S+") do
                table.insert(words, word)
            end
            if #words > 0 then
                words[#words] = suggestion
            else
                words[1] = suggestion
            end
            lines[#lines] = table.concat(words, " ")
            textBox.Text = table.concat(lines, "\n")
            autoCompleteFrame.Visible = false
        end)
        
        yPos = yPos + 22
    end
    autoCompleteList.Size = UDim2.new(1,0,0,yPos + 5)
end

-- TextBox events untuk auto complete
textBox:GetPropertyChangedSignal("Text"):Connect(function()
    scriptScrollExec.CanvasSize = UDim2.new(0,0,0,textBox.TextBounds.Y + 50)
    updateAutoComplete(textBox.Text)
end)

textBox.Focused:Connect(function()
    if settings.AutoComplete then
        updateAutoComplete(textBox.Text)
    end
end)

textBox.FocusLost:Connect(function()
    wait(0.3)
    autoCompleteFrame.Visible = false
end)

-- Keyboard events untuk auto complete
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Tab and autoCompleteFrame.Visible then
        input:Stop()
        -- Pilih suggestion pertama
        local children = autoCompleteList:GetChildren()
        if #children > 0 then
            local btn = children[1]
            btn:Activate()
        end
    end
end)

local execBtn = Instance.new("TextButton", executedFrame)
execBtn.Size = UDim2.new(1,-10,0,28)
execBtn.Position = UDim2.new(0,5,0.78,0)
execBtn.BackgroundColor3 = settings.UIMainColor
execBtn.Text = "⚡ EXECUTE"
execBtn.TextColor3 = Color3.fromRGB(255,255,255)
execBtn.Font = Enum.Font.GothamBold
execBtn.TextSize = 12

-- ==============================================================
-- SAVES TAB
-- ==============================================================
local savesFrame = Instance.new("Frame", contentFrame)
savesFrame.Size = UDim2.new(1,0,1,0)
savesFrame.BackgroundTransparency = 1
savesFrame.Visible = false

local savesScroll = Instance.new("ScrollingFrame", savesFrame)
savesScroll.Size = UDim2.new(1,-10,0.70,0)
savesScroll.Position = UDim2.new(0,5,0,0)
savesScroll.BackgroundColor3 = Color3.fromRGB(8,8,18)
savesScroll.BorderColor3 = Color3.fromRGB(40,40,60)
savesScroll.ScrollBarThickness = 5
savesScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local savesList = Instance.new("Frame", savesScroll)
savesList.Size = UDim2.new(1,-5,0,0)
savesList.Position = UDim2.new(0,3,0,0)
savesList.BackgroundTransparency = 1

local saveNameInput = Instance.new("TextBox", savesFrame)
saveNameInput.Size = UDim2.new(0.40,-5,0,24)
saveNameInput.Position = UDim2.new(0,5,0.78,0)
saveNameInput.BackgroundColor3 = Color3.fromRGB(10,10,22)
saveNameInput.TextColor3 = Color3.fromRGB(200,200,200)
saveNameInput.PlaceholderText = "Filename.lua"
saveNameInput.Text = ""
saveNameInput.Font = Enum.Font.Code
saveNameInput.TextSize = 10
saveNameInput.MultiLine = false
saveNameInput.ClearTextOnFocus = false
saveNameInput.TextEditable = true
saveNameInput.TextScaled = false

local imageIdInput = Instance.new("TextBox", savesFrame)
imageIdInput.Size = UDim2.new(0.25,-5,0,24)
imageIdInput.Position = UDim2.new(0.43,0,0.78,0)
imageIdInput.BackgroundColor3 = Color3.fromRGB(10,10,22)
imageIdInput.TextColor3 = Color3.fromRGB(200,200,200)
imageIdInput.PlaceholderText = "Image ID"
imageIdInput.Text = ""
imageIdInput.Font = Enum.Font.Code
imageIdInput.TextSize = 10
imageIdInput.MultiLine = false
imageIdInput.ClearTextOnFocus = false
imageIdInput.TextEditable = true
imageIdInput.TextScaled = false

local saveBtn = Instance.new("TextButton", savesFrame)
saveBtn.Size = UDim2.new(0.22,-5,0,24)
saveBtn.Position = UDim2.new(0.71,0,0.78,0)
saveBtn.BackgroundColor3 = settings.UIMainColor
saveBtn.Text = "💾 SAVE"
saveBtn.TextColor3 = Color3.fromRGB(255,255,255)
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 10

refreshSavesList = function()
    for _, child in pairs(savesList:GetChildren()) do child:Destroy() end
    
    loadSaves()
    
    if #savesData == 0 then
        local emptyLabel = Instance.new("TextLabel", savesList)
        emptyLabel.Size = UDim2.new(1,0,0,25)
        emptyLabel.BackgroundTransparency = 1
        emptyLabel.Text = "📁 No saved files"
        emptyLabel.TextColor3 = Color3.fromRGB(150,150,150)
        emptyLabel.Font = Enum.Font.Gotham
        emptyLabel.TextSize = 11
        savesList.Size = UDim2.new(1,-5,0,30)
        return
    end
    
    local yPos = 0
    for _, data in ipairs(savesData) do
        local fileFrame = Instance.new("Frame", savesList)
        fileFrame.Name = data.Name
        fileFrame.Size = UDim2.new(1,0,0,32)
        fileFrame.Position = UDim2.new(0,0,0,yPos)
        fileFrame.BackgroundColor3 = Color3.fromRGB(20,20,35)
        fileFrame.BorderColor3 = Color3.fromRGB(40,40,60)
        
        local imageLabel = Instance.new("ImageLabel", fileFrame)
        imageLabel.Size = UDim2.new(0,22,0,22)
        imageLabel.Position = UDim2.new(0,3,0.5,-11)
        imageLabel.BackgroundColor3 = Color3.fromRGB(30,30,40)
        imageLabel.BackgroundTransparency = 0.5
        imageLabel.Image = data.Image ~= "" and data.Image or "rbxasset://textures/ui/GuiImagePlaceholder.png"
        imageLabel.ScaleType = Enum.ScaleType.Fit
        
        local fileNameBtn = Instance.new("TextButton", fileFrame)
        fileNameBtn.Size = UDim2.new(0.35,-20,1,0)
        fileNameBtn.Position = UDim2.new(0,28,0,0)
        fileNameBtn.BackgroundTransparency = 1
        fileNameBtn.Text = data.Name
        fileNameBtn.TextColor3 = settings.TextColor
        fileNameBtn.Font = Enum.Font.GothamBold
        fileNameBtn.TextSize = 9
        fileNameBtn.TextXAlignment = Enum.TextXAlignment.Left
        fileNameBtn.MouseButton1Click:Connect(function() 
            textBox.Text = data.Script 
            print("✅ Loaded: " .. data.Name) 
        end)
        
        local editBtn = Instance.new("TextButton", fileFrame)
        editBtn.Size = UDim2.new(0,22,0,18)
        editBtn.Position = UDim2.new(0.65,0,0.5,-9)
        editBtn.BackgroundColor3 = Color3.fromRGB(0,150,255)
        editBtn.Text = "✏️"
        editBtn.TextColor3 = Color3.fromRGB(255,255,255)
        editBtn.Font = Enum.Font.GothamBold
        editBtn.TextSize = 10
        editBtn.MouseButton1Click:Connect(function()
            createEditDialog(data.Name, data.Script, data.Image, function(saved, newScript, newImage)
                if saved and newScript then
                    if saveScript(data.Name, newScript, newImage) then
                        refreshSavesList() 
                        print("✅ Updated!") 
                        createEditSuccessDialog(data.Name)
                    else 
                        print("❌ Failed!") 
                    end
                end
            end)
        end)
        
        local runBtn = Instance.new("TextButton", fileFrame)
        runBtn.Size = UDim2.new(0,22,0,18)
        runBtn.Position = UDim2.new(0.75,0,0.5,-9)
        runBtn.BackgroundColor3 = settings.UIMainColor
        runBtn.Text = "▶"
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Font = Enum.Font.GothamBold
        runBtn.TextSize = 10
        runBtn.MouseButton1Click:Connect(function() 
            if data.Script ~= "" then 
                executeScript(data.Script) 
                print("▶ Running: " .. data.Name) 
            else 
                print("⚠️ Empty!") 
            end 
        end)
        
        local deleteBtn = Instance.new("TextButton", fileFrame)
        deleteBtn.Size = UDim2.new(0,18,0,18)
        deleteBtn.Position = UDim2.new(0.88,0,0.5,-9)
        deleteBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
        deleteBtn.Text = "✕"
        deleteBtn.TextColor3 = Color3.fromRGB(255,255,255)
        deleteBtn.Font = Enum.Font.GothamBold
        deleteBtn.TextSize = 10
        deleteBtn.MouseButton1Click:Connect(function()
            createDeleteDialog(data.Name, function(confirmed)
                if confirmed then
                    if deleteScriptFile(data.Name) then 
                        refreshSavesList() 
                        print("🗑️ Deleted: " .. data.Name) 
                        createDeleteSuccessDialog(data.Name) 
                    end
                end
            end)
        end)
        
        yPos = yPos + 37
    end
    savesList.Size = UDim2.new(1,-5,0,yPos + 10)
end

saveBtn.MouseButton1Click:Connect(function()
    local name, script, image = saveNameInput.Text, textBox.Text, imageIdInput.Text
    if name == "" then print("❌ Enter filename!") return end
    if script == "" then print("❌ Script empty!") return end
    
    if saveScript(name, script, image) then 
        refreshSavesList() 
        print("✅ Saved!") 
        saveNameInput.Text = "" 
        imageIdInput.Text = "" 
    end
end)

-- ==============================================================
-- CONSOLE TAB
-- ==============================================================
local consoleFrame = Instance.new("Frame", contentFrame)
consoleFrame.Size = UDim2.new(1,0,1,0)
consoleFrame.BackgroundTransparency = 1
consoleFrame.Visible = false

local consoleBox = Instance.new("ScrollingFrame", consoleFrame)
consoleBox.Size = UDim2.new(1,-10,0.75,0)
consoleBox.Position = UDim2.new(0,5,0,0)
consoleBox.BackgroundColor3 = Color3.fromRGB(6,6,14)
consoleBox.BorderColor3 = Color3.fromRGB(40,40,60)
consoleBox.ScrollBarThickness = 5
consoleBox.AutomaticCanvasSize = Enum.AutomaticSize.Y

local consoleText = Instance.new("TextLabel", consoleBox)
consoleText.Size = UDim2.new(1,-5,1,-5)
consoleText.Position = UDim2.new(0,3,0,3)
consoleText.BackgroundTransparency = 1
consoleText.Text = ">>> Console Ready"
consoleText.TextColor3 = settings.TextColor
consoleText.Font = Enum.Font.Code
consoleText.TextSize = 10
consoleText.TextXAlignment = Enum.TextXAlignment.Left
consoleText.TextYAlignment = Enum.TextYAlignment.Top

local consoleInput = Instance.new("TextBox", consoleFrame)
consoleInput.Size = UDim2.new(1,-10,0,24)
consoleInput.Position = UDim2.new(0,5,0.80,0)
consoleInput.BackgroundColor3 = Color3.fromRGB(10,10,22)
consoleInput.TextColor3 = Color3.fromRGB(200,200,200)
consoleInput.PlaceholderText = ">> Command..."
consoleInput.Text = ""
consoleInput.Font = Enum.Font.Code
consoleInput.TextSize = 10
consoleInput.TextXAlignment = Enum.TextXAlignment.Left
consoleInput.MultiLine = false
consoleInput.ClearTextOnFocus = false
consoleInput.TextEditable = true
consoleInput.TextScaled = false

local clearBtn = Instance.new("TextButton", consoleFrame)
clearBtn.Size = UDim2.new(0,40,0,18)
clearBtn.Position = UDim2.new(1,-48,0,2)
clearBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
clearBtn.Text = "CLEAR"
clearBtn.TextColor3 = Color3.fromRGB(255,255,255)
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 9

-- ========== CONSOLE LOG ==========
local consoleLines = {}
addConsoleLog = function(message, logType)
    local prefix, color = "", Color3.fromRGB(200, 200, 200)
    local timestamp = os.date("%H:%M:%S")
    if logType == "print" or logType == "default" then prefix, color = "[📝]", Color3.fromRGB(200, 200, 200)
    elseif logType == "warn" then prefix, color = "[⚠️]", Color3.fromRGB(255, 200, 0)
    elseif logType == "error" then prefix, color = "[❌]", Color3.fromRGB(255, 50, 50)
    elseif logType == "success" then prefix, color = "[✅]", Color3.fromRGB(0, 255, 100)
    elseif logType == "info" then prefix, color = "[ℹ️]", Color3.fromRGB(0, 200, 255)
    else prefix, color = "[📌]", Color3.fromRGB(180, 180, 180) end
    
    consoleText.Text = consoleText.Text .. "\n" .. string.format("[%s] %s %s", timestamp, prefix, tostring(message))
    consoleText.TextColor3 = color
end

local oldPrint, oldWarn, oldError = print, warn, error
print = function(...) local args = {...} addConsoleLog(table.concat(args, " "), "print") oldPrint(...) end
warn = function(...) local args = {...} addConsoleLog("⚠️ " .. table.concat(args, " "), "warn") oldWarn(...) end
error = function(msg, level) addConsoleLog("❌ " .. tostring(msg), "error") oldError(msg, level) end

_G.Console = {
    Print = function(msg) addConsoleLog(tostring(msg), "print") end,
    Warn = function(msg) addConsoleLog(tostring(msg), "warn") end,
    Error = function(msg) addConsoleLog(tostring(msg), "error") end,
    Success = function(msg) addConsoleLog(tostring(msg), "success") end,
    Info = function(msg) addConsoleLog(tostring(msg), "info") end,
    Clear = function() consoleText.Text = ">>> Console Cleared" end
}
clearBtn.MouseButton1Click:Connect(_G.Console.Clear)

-- ==============================================================
-- SETTINGS TAB
-- ==============================================================
local settingsFrame = Instance.new("Frame", contentFrame)
settingsFrame.Size = UDim2.new(1,0,1,0)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false

local settingsBg = Instance.new("Frame", settingsFrame)
settingsBg.Size = UDim2.new(1,-10,1,-10)
settingsBg.Position = UDim2.new(0,5,0,5)
settingsBg.BackgroundColor3 = Color3.fromRGB(10,10,22)
settingsBg.BorderColor3 = Color3.fromRGB(40,40,60)

local settingsTitle = Instance.new("TextLabel", settingsBg)
settingsTitle.Size = UDim2.new(1,0,0,30)
settingsTitle.Position = UDim2.new(0,10,0,5)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "⚙️ SETTINGS"
settingsTitle.TextColor3 = settings.UIMainColor
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextSize = 14
settingsTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Syntax Highlight Toggle
local syntaxLabel = Instance.new("TextLabel", settingsBg)
syntaxLabel.Size = UDim2.new(0.5,0,0,25)
syntaxLabel.Position = UDim2.new(0,10,0,45)
syntaxLabel.BackgroundTransparency = 1
syntaxLabel.Text = "🔵 Syntax Highlight"
syntaxLabel.TextColor3 = Color3.fromRGB(255,255,255)
syntaxLabel.Font = Enum.Font.Gotham
syntaxLabel.TextSize = 12
syntaxLabel.TextXAlignment = Enum.TextXAlignment.Left

local syntaxToggle = Instance.new("TextButton", settingsBg)
syntaxToggle.Size = UDim2.new(0,80,0,25)
syntaxToggle.Position = UDim2.new(0.5,0,0,45)
syntaxToggle.BackgroundColor3 = settings.SyntaxHighlight and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
syntaxToggle.Text = settings.SyntaxHighlight and "ON" or "OFF"
syntaxToggle.TextColor3 = Color3.fromRGB(255,255,255)
syntaxToggle.Font = Enum.Font.GothamBold
syntaxToggle.TextSize = 12

-- Auto Complete Toggle
local autoLabel = Instance.new("TextLabel", settingsBg)
autoLabel.Size = UDim2.new(0.5,0,0,25)
autoLabel.Position = UDim2.new(0,10,0,80)
autoLabel.BackgroundTransparency = 1
autoLabel.Text = "📝 Auto Complete"
autoLabel.TextColor3 = Color3.fromRGB(255,255,255)
autoLabel.Font = Enum.Font.Gotham
autoLabel.TextSize = 12
autoLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoToggle = Instance.new("TextButton", settingsBg)
autoToggle.Size = UDim2.new(0,80,0,25)
autoToggle.Position = UDim2.new(0.5,0,0,80)
autoToggle.BackgroundColor3 = settings.AutoComplete and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
autoToggle.Text = settings.AutoComplete and "ON" or "OFF"
autoToggle.TextColor3 = Color3.fromRGB(255,255,255)
autoToggle.Font = Enum.Font.GothamBold
autoToggle.TextSize = 12

-- Font Size Slider
local fontLabel = Instance.new("TextLabel", settingsBg)
fontLabel.Size = UDim2.new(0.5,0,0,25)
fontLabel.Position = UDim2.new(0,10,0,115)
fontLabel.BackgroundTransparency = 1
fontLabel.Text = "📏 Font Size: " .. settings.FontSize
fontLabel.TextColor3 = Color3.fromRGB(255,255,255)
fontLabel.Font = Enum.Font.Gotham
fontLabel.TextSize = 12
fontLabel.TextXAlignment = Enum.TextXAlignment.Left

local fontSlider = Instance.new("TextBox", settingsBg)
fontSlider.Size = UDim2.new(0,100,0,25)
fontSlider.Position = UDim2.new(0.5,0,0,115)
fontSlider.BackgroundColor3 = Color3.fromRGB(20,20,35)
fontSlider.TextColor3 = Color3.fromRGB(255,255,255)
fontSlider.Text = tostring(settings.FontSize)
fontSlider.Font = Enum.Font.GothamBold
fontSlider.TextSize = 12
fontSlider.TextXAlignment = Enum.TextXAlignment.Center
fontSlider.MultiLine = false
fontSlider.ClearTextOnFocus = true

-- UI Color Picker
local colorLabel = Instance.new("TextLabel", settingsBg)
colorLabel.Size = UDim2.new(0.5,0,0,25)
colorLabel.Position = UDim2.new(0,10,0,150)
colorLabel.BackgroundTransparency = 1
colorLabel.Text = "🎨 UI Color"
colorLabel.TextColor3 = Color3.fromRGB(255,255,255)
colorLabel.Font = Enum.Font.Gotham
colorLabel.TextSize = 12
colorLabel.TextXAlignment = Enum.TextXAlignment.Left

local colorPicker = Instance.new("TextBox", settingsBg)
colorPicker.Size = UDim2.new(0,100,0,25)
colorPicker.Position = UDim2.new(0.5,0,0,150)
colorPicker.BackgroundColor3 = settings.UIMainColor
colorPicker.Text = ""
colorPicker.Font = Enum.Font.GothamBold
colorPicker.TextSize = 12
colorPicker.MultiLine = false
colorPicker.ClearTextOnFocus = true
colorPicker.PlaceholderText = "R,G,B"

-- Reset Button
local resetBtn = Instance.new("TextButton", settingsBg)
resetBtn.Size = UDim2.new(0,120,0,30)
resetBtn.Position = UDim2.new(0.5,-60,1,-45)
resetBtn.BackgroundColor3 = Color3.fromRGB(200,100,0)
resetBtn.Text = "🔄 Reset Settings"
resetBtn.TextColor3 = Color3.fromRGB(255,255,255)
resetBtn.Font = Enum.Font.GothamBold
resetBtn.TextSize = 11

-- Close Settings Button
local closeSettingsBtn = Instance.new("TextButton", settingsBg)
closeSettingsBtn.Size = UDim2.new(0,80,0,30)
closeSettingsBtn.Position = UDim2.new(1,-90,1,-45)
closeSettingsBtn.BackgroundColor3 = settings.UIMainColor
closeSettingsBtn.Text = "✅ APPLY"
closeSettingsBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeSettingsBtn.Font = Enum.Font.GothamBold
closeSettingsBtn.TextSize = 11

-- Status label di settings
local settingsStatus = Instance.new("TextLabel", settingsBg)
settingsStatus.Size = UDim2.new(1,0,0,20)
settingsStatus.Position = UDim2.new(0,10,1,-20)
settingsStatus.BackgroundTransparency = 1
settingsStatus.Text = "✅ Settings saved!"
settingsStatus.TextColor3 = Color3.fromRGB(150,255,150)
settingsStatus.Font = Enum.Font.Gotham
settingsStatus.TextSize = 10
settingsStatus.TextXAlignment = Enum.TextXAlignment.Left
settingsStatus.Visible = false

-- ========== SETTINGS FUNCTIONS ==========
local function applySettings()
    -- Update textBox
    textBox.TextSize = settings.FontSize
    textBox.TextColor3 = settings.TextColor
    
    -- Update UI colors
    mainFrame.BorderColor3 = settings.UIMainColor
    openBtn.BackgroundColor3 = settings.UIMainColor
    topBar.BackgroundColor3 = settings.UISecondaryColor
    tabHome.BackgroundColor3 = settings.UIMainColor
    addHubBtn.BackgroundColor3 = settings.UIMainColor
    addScriptBtn.BackgroundColor3 = settings.UIMainColor
    execBtn.BackgroundColor3 = settings.UIMainColor
    saveBtn.BackgroundColor3 = settings.UIMainColor
    runScriptBtn.BackgroundColor3 = settings.UIMainColor
    closeSettingsBtn.BackgroundColor3 = settings.UIMainColor
    
    -- Update toggle buttons
    syntaxToggle.BackgroundColor3 = settings.SyntaxHighlight and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
    syntaxToggle.Text = settings.SyntaxHighlight and "ON" or "OFF"
    autoToggle.BackgroundColor3 = settings.AutoComplete and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
    autoToggle.Text = settings.AutoComplete and "ON" or "OFF"
    colorPicker.BackgroundColor3 = settings.UIMainColor
    
    saveSettings()
end

local function resetSettings()
    settings.SyntaxHighlight = true
    settings.AutoComplete = true
    settings.UIMainColor = Color3.fromRGB(0, 200, 255)
    settings.UISecondaryColor = Color3.fromRGB(0, 150, 200)
    settings.FontSize = 11
    settings.TextColor = Color3.fromRGB(0, 255, 200)
    
    fontLabel.Text = "📏 Font Size: " .. settings.FontSize
    fontSlider.Text = tostring(settings.FontSize)
    colorPicker.BackgroundColor3 = settings.UIMainColor
    
    applySettings()
    settingsStatus.Text = "✅ Settings reset to default!"
    settingsStatus.TextColor3 = Color3.fromRGB(150,255,150)
    settingsStatus.Visible = true
    wait(2)
    settingsStatus.Visible = false
end

local function updateSettingsUI()
    syntaxToggle.BackgroundColor3 = settings.SyntaxHighlight and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
    syntaxToggle.Text = settings.SyntaxHighlight and "ON" or "OFF"
    autoToggle.BackgroundColor3 = settings.AutoComplete and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
    autoToggle.Text = settings.AutoComplete and "ON" or "OFF"
    fontLabel.Text = "📏 Font Size: " .. settings.FontSize
    fontSlider.Text = tostring(settings.FontSize)
    colorPicker.BackgroundColor3 = settings.UIMainColor
end

-- ========== SETTINGS EVENTS ==========
syntaxToggle.MouseButton1Click:Connect(function()
    settings.SyntaxHighlight = not settings.SyntaxHighlight
    applySettings()
    updateSettingsUI()
    settingsStatus.Text = "✅ Syntax Highlight " .. (settings.SyntaxHighlight and "ON" or "OFF")
    settingsStatus.TextColor3 = Color3.fromRGB(150,255,150)
    settingsStatus.Visible = true
    wait(2)
    settingsStatus.Visible = false
end)

autoToggle.MouseButton1Click:Connect(function()
    settings.AutoComplete = not settings.AutoComplete
    applySettings()
    updateSettingsUI()
    settingsStatus.Text = "✅ Auto Complete " .. (settings.AutoComplete and "ON" or "OFF")
    settingsStatus.TextColor3 = Color3.fromRGB(150,255,150)
    settingsStatus.Visible = true
    wait(2)
    settingsStatus.Visible = false
end)

fontSlider.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newSize = tonumber(fontSlider.Text)
        if newSize and newSize >= 8 and newSize <= 20 then
            settings.FontSize = newSize
            applySettings()
            updateSettingsUI()
            settingsStatus.Text = "✅ Font size set to " .. newSize
            settingsStatus.TextColor3 = Color3.fromRGB(150,255,150)
            settingsStatus.Visible = true
            wait(2)
            settingsStatus.Visible = false
        else
            fontSlider.Text = tostring(settings.FontSize)
        end
    end
end)

colorPicker.FocusLost:Connect(function(enterPressed)
    if enterPressed and colorPicker.Text ~= "" then
        local r, g, b = colorPicker.Text:match("(%d+),%s*(%d+),%s*(%d+)")
        if r and g and b then
            r, g, b = tonumber(r), tonumber(g), tonumber(b)
            if r and g and b and r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
                settings.UIMainColor = Color3.fromRGB(r, g, b)
                settings.UISecondaryColor = Color3.fromRGB(math.max(0, r-50), math.max(0, g-50), math.max(0, b-50))
                applySettings()
                updateSettingsUI()
                settingsStatus.Text = "✅ UI Color updated!"
                settingsStatus.TextColor3 = Color3.fromRGB(150,255,150)
                settingsStatus.Visible = true
                wait(2)
                settingsStatus.Visible = false
                colorPicker.Text = ""
                return
            end
        end
        settingsStatus.Text = "❌ Invalid color! Use R,G,B (0-255)"
        settingsStatus.TextColor3 = Color3.fromRGB(255,50,50)
        settingsStatus.Visible = true
        wait(2)
        settingsStatus.Visible = false
        colorPicker.Text = ""
    end
end)

resetBtn.MouseButton1Click:Connect(function()
    createDeleteDialog("ALL SETTINGS", function(confirmed)
        if confirmed then
            resetSettings()
        end
    end)
end)

closeSettingsBtn.MouseButton1Click:Connect(function()
    applySettings()
    settingsStatus.Text = "✅ Settings applied!"
    settingsStatus.TextColor3 = Color3.fromRGB(150,255,150)
    settingsStatus.Visible = true
    wait(1.5)
    settingsStatus.Visible = false
    -- Switch ke tab sebelumnya
    tabExecuted.MouseButton1Click:Connect()
end)

-- ========== EXECUTE FUNCTION ==========
executeScript = function(scriptText)
    if scriptText == "" then print("⚠️ Script empty!") return end
    local success, result = pcall(function()
        local func, syntaxError = loadstring(scriptText)
        if func then 
            func() 
            print("✅ Executed!") 
        else 
            print("❌ Syntax Error: "..tostring(syntaxError)) 
        end
    end)
    if not success then print("❌ Runtime Error: "..tostring(result)) end
end

execBtn.MouseButton1Click:Connect(function() executeScript(textBox.Text) end)
consoleInput.FocusLost:Connect(function(enterPressed) 
    if enterPressed and consoleInput.Text ~= "" then 
        addConsoleLog(">>> "..consoleInput.Text, "info") 
        executeScript(consoleInput.Text) 
        consoleInput.Text = "" 
    end 
end)

-- ========== TAB SWITCHING ==========
tabHome.MouseButton1Click:Connect(function()
    homeFrame.Visible = true
    hubFrame.Visible = false
    executedFrame.Visible = false
    savesFrame.Visible = false
    consoleFrame.Visible = false
    settingsFrame.Visible = false
    tabHome.BackgroundColor3 = settings.UIMainColor
    tabHub.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabExecuted.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSaves.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabConsole.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSettings.BackgroundColor3 = Color3.fromRGB(30,30,40)
    updateHomeTab()
end)

tabHub.MouseButton1Click:Connect(function()
    homeFrame.Visible = false
    hubFrame.Visible = true
    executedFrame.Visible = false
    savesFrame.Visible = false
    consoleFrame.Visible = false
    settingsFrame.Visible = false
    tabHub.BackgroundColor3 = settings.UIMainColor
    tabHome.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabExecuted.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSaves.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabConsole.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSettings.BackgroundColor3 = Color3.fromRGB(30,30,40)
    loadHubConfig()
    refreshHubList()
end)

tabExecuted.MouseButton1Click:Connect(function()
    homeFrame.Visible = false
    hubFrame.Visible = false
    executedFrame.Visible = true
    savesFrame.Visible = false
    consoleFrame.Visible = false
    settingsFrame.Visible = false
    tabExecuted.BackgroundColor3 = settings.UIMainColor
    tabHome.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabHub.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSaves.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabConsole.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSettings.BackgroundColor3 = Color3.fromRGB(30,30,40)
end)

tabSaves.MouseButton1Click:Connect(function()
    homeFrame.Visible = false
    hubFrame.Visible = false
    executedFrame.Visible = false
    savesFrame.Visible = true
    consoleFrame.Visible = false
    settingsFrame.Visible = false
    tabSaves.BackgroundColor3 = settings.UIMainColor
    tabHome.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabHub.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabExecuted.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabConsole.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSettings.BackgroundColor3 = Color3.fromRGB(30,30,40)
    refreshSavesList()
end)

tabConsole.MouseButton1Click:Connect(function()
    homeFrame.Visible = false
    hubFrame.Visible = false
    executedFrame.Visible = false
    savesFrame.Visible = false
    consoleFrame.Visible = true
    settingsFrame.Visible = false
    tabConsole.BackgroundColor3 = settings.UIMainColor
    tabHome.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabHub.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabExecuted.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSaves.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSettings.BackgroundColor3 = Color3.fromRGB(30,30,40)
end)

tabSettings.MouseButton1Click:Connect(function()
    homeFrame.Visible = false
    hubFrame.Visible = false
    executedFrame.Visible = false
    savesFrame.Visible = false
    consoleFrame.Visible = false
    settingsFrame.Visible = true
    tabSettings.BackgroundColor3 = settings.UIMainColor
    tabHome.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabHub.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabExecuted.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabSaves.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tabConsole.BackgroundColor3 = Color3.fromRGB(30,30,40)
    updateSettingsUI()
end)

-- ========== INITIALIZE ==========
loadHubConfig()
refreshHubList()
loadSaves()
refreshSavesList()
applySettings()

print("🎮 SGE V3.7 READY!")
print("📁 Saves: " .. savePath)
print("📁 Hub: " .. hubPath)
print("⚙️ Settings loaded!")
print("✅ Auto Complete: " .. (settings.AutoComplete and "ON" or "OFF"))
print("✅ Syntax Highlight: " .. (settings.SyntaxHighlight and "ON" or "OFF"))
