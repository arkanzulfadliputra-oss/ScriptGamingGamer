local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

local ScreenGui = Instance.new("ScreenGui")
pcall(function()
    ScreenGui.Parent = game.CoreGui
end)

ScreenGui.Name = "ScriptGamingExecutor"

local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0,45,0,120)
OpenButton.Position = UDim2.new(0,10,0.5,-60)
OpenButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
OpenButton.TextColor3 = Color3.fromRGB(255,255,255)
OpenButton.Font = Enum.Font.GothamBold
OpenButton.TextSize = 20
OpenButton.Text = ">"
OpenButton.ZIndex = 999

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,650,0,600)
Main.Position = UDim2.new(0.5,-325,0.5,-300)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Main
UIStroke.Thickness = 3

local Rainbow = 0

local TopBar = Instance.new("Frame")
TopBar.Parent = Main
TopBar.Size = UDim2.new(1,0,0,35)
TopBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
TopBar.BorderSizePixel = 0
TopBar.Active = true

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "ScriptGaming Executor"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255,255,255)

local TabsFrame = Instance.new("Frame")
TabsFrame.Parent = Main
TabsFrame.Position = UDim2.new(0,0,0,35)
TabsFrame.Size = UDim2.new(1,0,0,40)
TabsFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
TabsFrame.BorderSizePixel = 0

local ExecutorTab = Instance.new("TextButton")
ExecutorTab.Parent = TabsFrame
ExecutorTab.Size = UDim2.new(0,140,1,0)
ExecutorTab.Position = UDim2.new(0,0,0,0)
ExecutorTab.BackgroundColor3 = Color3.fromRGB(40,40,40)
ExecutorTab.Text = "Executor"
ExecutorTab.Font = Enum.Font.GothamBold
ExecutorTab.TextSize = 16
ExecutorTab.TextColor3 = Color3.fromRGB(255,255,255)

local SettingsTab = Instance.new("TextButton")
SettingsTab.Parent = TabsFrame
SettingsTab.Size = UDim2.new(0,140,1,0)
SettingsTab.Position = UDim2.new(0,145,0,0)
SettingsTab.BackgroundColor3 = Color3.fromRGB(35,35,35)
SettingsTab.Text = "Saves Script"
SettingsTab.Font = Enum.Font.GothamBold
SettingsTab.TextSize = 16
SettingsTab.TextColor3 = Color3.fromRGB(255,255,255)

local ExecutorFrame = Instance.new("Frame")
ExecutorFrame.Parent = Main
ExecutorFrame.Position = UDim2.new(0,0,0,75)
ExecutorFrame.Size = UDim2.new(1,0,1,-75)
ExecutorFrame.BackgroundTransparency = 1

local SavesFrame = Instance.new("ScrollingFrame")
SavesFrame.Parent = Main
SavesFrame.Position = UDim2.new(0,0,0,75)
SavesFrame.Size = UDim2.new(1,0,1,-75)
SavesFrame.BackgroundTransparency = 1
SavesFrame.Visible = false
SavesFrame.ScrollBarThickness = 6
SavesFrame.CanvasSize = UDim2.new(0,0,0,0)

local ScriptBox = Instance.new("TextBox")
ScriptBox.Parent = ExecutorFrame
ScriptBox.Position = UDim2.new(0,10,0,10)
ScriptBox.Size = UDim2.new(1,-20,0,180)
ScriptBox.BackgroundColor3 = Color3.fromRGB(25,25,25)
ScriptBox.ClearTextOnFocus = false
ScriptBox.MultiLine = true
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.Font = Enum.Font.Code
ScriptBox.TextSize = 16
ScriptBox.TextColor3 = Color3.fromRGB(255,255,255)
ScriptBox.Text = ""

local Highlight = Instance.new("TextLabel")
Highlight.Parent = ExecutorFrame
Highlight.Position = ScriptBox.Position
Highlight.Size = ScriptBox.Size
Highlight.BackgroundTransparency = 1
Highlight.TextXAlignment = Enum.TextXAlignment.Left
Highlight.TextYAlignment = Enum.TextYAlignment.Top
Highlight.Font = Enum.Font.Code
Highlight.TextSize = 16
Highlight.RichText = true
Highlight.Text = ""
Highlight.ZIndex = 1
Highlight.TextTransparency = 0.4

ScriptBox.ZIndex = 2

local function HighlightLua(Text)
    Text = Text:gsub("&","&amp;")
    Text = Text:gsub("<","&lt;")
    Text = Text:gsub(">","&gt;")
    Text = Text:gsub("%-%-[^\n]*", '<font color="rgb(120,120,120)">%0</font>')
    Text = Text:gsub("(local)", '<font color="rgb(255,80,80)">%1</font>')
    Text = Text:gsub("(:)", '<font color="rgb(255,255,80)">%1</font>')
    Text = Text:gsub("(;)", '<font color="rgb(255,80,255)">%1</font>')
    return Text
end

local function UpdateHighlight()
    Highlight.Text = HighlightLua(ScriptBox.Text)
end

ScriptBox:GetPropertyChangedSignal("Text"):Connect(UpdateHighlight)
UpdateHighlight()

local Execute = Instance.new("TextButton")
Execute.Parent = ExecutorFrame
Execute.Position = UDim2.new(0,10,0,200)
Execute.Size = UDim2.new(0.48,-5,0,35)
Execute.BackgroundColor3 = Color3.fromRGB(40,170,255)
Execute.Text = "Execute"
Execute.Font = Enum.Font.GothamBold
Execute.TextSize = 16
Execute.TextColor3 = Color3.fromRGB(255,255,255)

local Copy = Instance.new("TextButton")
Copy.Parent = ExecutorFrame
Copy.Position = UDim2.new(0.52,5,0,200)
Copy.Size = UDim2.new(0.48,-5,0,35)
Copy.BackgroundColor3 = Color3.fromRGB(60,60,60)
Copy.Text = "Copy"
Copy.Font = Enum.Font.GothamBold
Copy.TextSize = 16
Copy.TextColor3 = Color3.fromRGB(255,255,255)

local Console = Instance.new("ScrollingFrame")
Console.Parent = ExecutorFrame
Console.Position = UDim2.new(0,10,0,250)
Console.Size = UDim2.new(1,-20,1,-260)
Console.BackgroundColor3 = Color3.fromRGB(15,15,15)
Console.CanvasSize = UDim2.new(0,0,0,0)
Console.ScrollBarThickness = 4

local ConsoleList = Instance.new("UIListLayout")
ConsoleList.Parent = Console
ConsoleList.Padding = UDim.new(0,3)

local function AddConsole(Type,Text)
    local Log = Instance.new("TextLabel")
    Log.Parent = Console
    Log.Size = UDim2.new(1,-5,0,22)
    Log.BackgroundColor3 = Color3.fromRGB(22,22,22)
    Log.BorderSizePixel = 0
    Log.Font = Enum.Font.Code
    Log.TextSize = 14
    Log.TextXAlignment = Enum.TextXAlignment.Left
    if Type == "ERROR" then
        Log.TextColor3 = Color3.fromRGB(255,80,80)
        Log.Text = "[ERROR] "..Text
    elseif Type == "SUCCESS" then
        Log.TextColor3 = Color3.fromRGB(80,255,120)
        Log.Text = "[SUCCESS] "..Text
    elseif Type == "WARN" then
        Log.TextColor3 = Color3.fromRGB(255,200,80)
        Log.Text = "[WARN] "..Text
    else
        Log.TextColor3 = Color3.fromRGB(255,255,255)
        Log.Text = "[NORMAL] "..Text
    end
    Console.CanvasSize = UDim2.new(0,0,0,ConsoleList.AbsoluteContentSize.Y + 10)
end

ExecutorTab.MouseButton1Click:Connect(function()
    ExecutorFrame.Visible = true
    SavesFrame.Visible = false
end)

SettingsTab.MouseButton1Click:Connect(function()
    ExecutorFrame.Visible = false
    SavesFrame.Visible = true
    RefreshScriptList()
end)

SavesTab.MouseButton1Click:Connect(function()
    ExecutorFrame.Visible = false; SettingsFrame.Visible = false; SavesFrame.Visible = true
    ExecutorTab.BackgroundColor3 = Color3.fromRGB(35,35,35); SettingsTab.BackgroundColor3 = Color3.fromRGB(35,35,35); SavesTab.BackgroundColor3 = Color3.fromRGB(40,40,40)
    ExecutorTab.TextColor3 = Color3.fromRGB(200,200,200); SettingsTab.TextColor3 = Color3.fromRGB(200,200,200); SavesTab.TextColor3 = Color3.fromRGB(255,255,255)
    RefreshSaves()
end)

Execute.MouseButton1Click:Connect(function()
    local success,err = pcall(function()
        loadstring(ScriptBox.Text)()
    end)
    if success then
        AddConsole("SUCCESS","Executed")
    else
        AddConsole("ERROR",tostring(err))
    end
end)

Copy.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(ScriptBox.Text)
        AddConsole("NORMAL","Copied")
    end
end)

local Opened = true
OpenButton.MouseButton1Click:Connect(function()
    Opened = not Opened
    Main.Visible = Opened
    OpenButton.Text = Opened and ">" or "<"
end)

RunService.RenderStepped:Connect(function(dt)
    Rainbow = (Rainbow + dt * 0.25) % 1
    UIStroke.Color = Color3.fromHSV(Rainbow,1,1)
    OpenButton.Position = UDim2.new(0,Main.AbsolutePosition.X - 50,0,Main.AbsolutePosition.Y)
end)

local Dragging = false
local DragInput = nil
local DragStart = nil
local StartPos = nil

local function Update(input)
    local Delta = input.Position - DragStart
    Main.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        DragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        Update(input)
    end
end)

local yOffset = 10

local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Parent = SettingsFrame
SettingsTitle.Size = UDim2.new(1,-20,0,40)
SettingsTitle.Position = UDim2.new(0,10,0,yOffset)
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Text = "⚙️ EXECUTOR SETTINGS"
SettingsTitle.TextColor3 = Color3.fromRGB(255,200,100)
SettingsTitle.TextSize = 20
SettingsTitle.Font = Enum.Font.GothamBold
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
yOffset = yOffset + 50

local aaFrame = Instance.new("Frame")
aaFrame.Parent = SettingsFrame
aaFrame.Size = UDim2.new(1,-20,0,50)
aaFrame.Position = UDim2.new(0,10,0,yOffset)
aaFrame.BackgroundColor3 = Color3.fromRGB(28,28,32)
local aaCorner = Instance.new("UICorner"); aaCorner.CornerRadius = UDim.new(0,8); aaCorner.Parent = aaFrame
local aaLabel = Instance.new("TextLabel"); aaLabel.Parent = aaFrame; aaLabel.Size = UDim2.new(0.7,0,1,0); aaLabel.Position = UDim2.new(0,15,0,0); aaLabel.BackgroundTransparency = 1; aaLabel.Text = "⚡ Auto Attach (No Lag)"; aaLabel.TextColor3 = Color3.fromRGB(255,255,255); aaLabel.TextSize = 14; aaLabel.Font = Enum.Font.Gotham; aaLabel.TextXAlignment = Enum.TextXAlignment.Left
local aaToggle = Instance.new("TextButton"); aaToggle.Parent = aaFrame; aaToggle.Size = UDim2.new(0,80,0,35); aaToggle.Position = UDim2.new(1,-95,0.5,-17.5); aaToggle.BackgroundColor3 = Color3.fromRGB(200,60,60); aaToggle.Text = "OFF"; aaToggle.TextColor3 = Color3.fromRGB(255,255,255); aaToggle.TextSize = 14; aaToggle.Font = Enum.Font.GothamBold
local aaCorner2 = Instance.new("UICorner"); aaCorner2.CornerRadius = UDim.new(0,6); aaCorner2.Parent = aaToggle
local aaStatus = false
aaToggle.MouseButton1Click:Connect(function() aaStatus = not aaStatus; if aaStatus then aaToggle.BackgroundColor3 = Color3.fromRGB(0,180,90); aaToggle.Text = "ON"; AddConsole("SUCCESS","Auto Attach: ON") else aaToggle.BackgroundColor3 = Color3.fromRGB(200,60,60); aaToggle.Text = "OFF"; AddConsole("WARN","Auto Attach: OFF") end end)
yOffset = yOffset + 60

local bbFrame = Instance.new("Frame")
bbFrame.Parent = SettingsFrame
bbFrame.Size = UDim2.new(1,-20,0,50)
bbFrame.Position = UDim2.new(0,10,0,yOffset)
bbFrame.BackgroundColor3 = Color3.fromRGB(28,28,32)
local bbCorner = Instance.new("UICorner"); bbCorner.CornerRadius = UDim.new(0,8); bbCorner.Parent = bbFrame
local bbLabel = Instance.new("TextLabel"); bbLabel.Parent = bbFrame; bbLabel.Size = UDim2.new(0.7,0,1,0); bbLabel.Position = UDim2.new(0,15,0,0); bbLabel.BackgroundTransparency = 1; bbLabel.Text = "🔓 Bypass Ban (⚠️ Fake Only)"; bbLabel.TextColor3 = Color3.fromRGB(255,200,100); bbLabel.TextSize = 14; bbLabel.Font = Enum.Font.Gotham; bbLabel.TextXAlignment = Enum.TextXAlignment.Left
local bbToggle = Instance.new("TextButton"); bbToggle.Parent = bbFrame; bbToggle.Size = UDim2.new(0,80,0,35); bbToggle.Position = UDim2.new(1,-95,0.5,-17.5); bbToggle.BackgroundColor3 = Color3.fromRGB(200,60,60); bbToggle.Text = "OFF"; bbToggle.TextColor3 = Color3.fromRGB(255,255,255); bbToggle.TextSize = 14; bbToggle.Font = Enum.Font.GothamBold
local bbCorner2 = Instance.new("UICorner"); bbCorner2.CornerRadius = UDim.new(0,6); bbCorner2.Parent = bbToggle
local bbStatus = false
bbToggle.MouseButton1Click:Connect(function() bbStatus = not bbStatus; if bbStatus then bbToggle.BackgroundColor3 = Color3.fromRGB(255,150,0); bbToggle.Text = "ON"; AddConsole("WARN","Bypass Ban: ON (FAKE ONLY)") else bbToggle.BackgroundColor3 = Color3.fromRGB(200,60,60); bbToggle.Text = "OFF"; AddConsole("WARN","Bypass Ban: OFF") end end)
yOffset = yOffset + 60

local acFrame = Instance.new("Frame")
acFrame.Parent = SettingsFrame
acFrame.Size = UDim2.new(1,-20,0,50)
acFrame.Position = UDim2.new(0,10,0,yOffset)
acFrame.BackgroundColor3 = Color3.fromRGB(28,28,32)
local acCorner = Instance.new("UICorner"); acCorner.CornerRadius = UDim.new(0,8); acCorner.Parent = acFrame
local acLabel = Instance.new("TextLabel"); acLabel.Parent = acFrame; acLabel.Size = UDim2.new(0.7,0,1,0); acLabel.Position = UDim2.new(0,15,0,0); acLabel.BackgroundTransparency = 1; acLabel.Text = "🛡️ Bypass Anti Cheat (Delete AntiDex)"; acLabel.TextColor3 = Color3.fromRGB(100,200,255); acLabel.TextSize = 14; acLabel.Font = Enum.Font.Gotham; acLabel.TextXAlignment = Enum.TextXAlignment.Left
local acToggle = Instance.new("TextButton"); acToggle.Parent = acFrame; acToggle.Size = UDim2.new(0,80,0,35); acToggle.Position = UDim2.new(1,-95,0.5,-17.5); acToggle.BackgroundColor3 = Color3.fromRGB(200,60,60); acToggle.Text = "OFF"; acToggle.TextColor3 = Color3.fromRGB(255,255,255); acToggle.TextSize = 14; acToggle.Font = Enum.Font.GothamBold
local acCorner2 = Instance.new("UICorner"); acCorner2.CornerRadius = UDim.new(0,6); acCorner2.Parent = acToggle
local acStatus = false
local function DelAntiDex() pcall(function() if game.CoreGui:FindFirstChild("AntiDex") then game.CoreGui.AntiDex:Destroy() end if game.Players.LocalPlayer.PlayerGui:FindFirstChild("AntiDex") then game.Players.LocalPlayer.PlayerGui.AntiDex:Destroy() end for _,v in pairs(game:GetDescendants()) do if v.Name and (v.Name:lower():find("antidex") or v.Name:lower():find("dex")) then pcall(function() v:Destroy() end) end end end) end
acToggle.MouseButton1Click:Connect(function() acStatus = not acStatus; if acStatus then acToggle.BackgroundColor3 = Color3.fromRGB(0,180,90); acToggle.Text = "ON"; AddConsole("SUCCESS","Bypass AC: ON"); DelAntiDex(); task.spawn(function() while acStatus do DelAntiDex(); task.wait(2) end end) else acToggle.BackgroundColor3 = Color3.fromRGB(200,60,60); acToggle.Text = "OFF"; AddConsole("WARN","Bypass AC: OFF") end end)
yOffset = yOffset + 60

local NoteFrame = Instance.new("Frame")
NoteFrame.Parent = SettingsFrame
NoteFrame.Size = UDim2.new(1,-20,0,80)
NoteFrame.Position = UDim2.new(0,10,0,yOffset)
NoteFrame.BackgroundColor3 = Color3.fromRGB(25,20,35)
local noteCorner = Instance.new("UICorner"); noteCorner.CornerRadius = UDim.new(0,8); noteCorner.Parent = NoteFrame
local NoteText = Instance.new("TextLabel"); NoteText.Parent = NoteFrame; NoteText.Size = UDim2.new(1,-10,1,0); NoteText.Position = UDim2.new(0,5,0,5); NoteText.BackgroundTransparency = 1; NoteText.Text = "⚠️ NOTE:\n• Auto Attach = Fast injection without lag\n• Bypass Ban = FAKE ONLY, not guaranteed\n• Bypass Anti Cheat = Deletes AntiDex every 2s"; NoteText.TextColor3 = Color3.fromRGB(200,180,100); NoteText.TextSize = 11; NoteText.Font = Enum.Font.Gotham; NoteText.TextXAlignment = Enum.TextXAlignment.Left; NoteText.TextYAlignment = Enum.TextYAlignment.Top; NoteText.TextWrapped = true
yOffset = yOffset + 90
SettingsFrame.CanvasSize = UDim2.new(0,0,0,yOffset)

local function GetFolder() return "ScriptExecutor/SavesScript/" end
local function ReadFile(f) local s,e = pcall(function() return readfile and readfile(GetFolder() .. f) end); if s and e then return e end return nil end
local function WriteFile(f,c) pcall(function() if writefile then writefile(GetFolder() .. f, c) end end) end
local function DelFile(f) pcall(function() if delfile then delfile(GetFolder() .. f) end end) end
local function ListFiles() local t = {}; local s,l = pcall(function() return listfiles and listfiles(GetFolder()) end); if s and l then for _,p in ipairs(l) do local n = p:match("([^/]+)$"); if n and n:match("%.txt$") then table.insert(t, n) end end end; return t end
pcall(function() if makefolder then makefolder("ScriptExecutor"); makefolder("ScriptExecutor/SavesScript") end end)

local function RefreshSaves()
    for _,c in pairs(SavesFrame:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    local files = ListFiles()
    local yOff = 5
    if #files == 0 then
        local em = Instance.new("TextLabel"); em.Parent = SavesFrame; em.Size = UDim2.new(1,-20,0,50); em.Position = UDim2.new(0,10,0,yOff); em.BackgroundColor3 = Color3.fromRGB(30,30,35); em.BackgroundTransparency = 0.5; em.Text = "📂 No saved scripts! Save script from Executor tab"; em.TextColor3 = Color3.fromRGB(150,150,150); em.TextSize = 14; em.Font = Enum.Font.Gotham; local ec = Instance.new("UICorner"); ec.CornerRadius = UDim.new(0,8); ec.Parent = em
        SavesFrame.CanvasSize = UDim2.new(0,0,0,60); return
    end
    for _,f in ipairs(files) do
        local name = f:gsub("%.txt$", "")
        local fr = Instance.new("Frame"); fr.Parent = SavesFrame; fr.Size = UDim2.new(1,-20,0,70); fr.Position = UDim2.new(0,10,0,yOff); fr.BackgroundColor3 = Color3.fromRGB(28,28,33)
        local cor = Instance.new("UICorner"); cor.CornerRadius = UDim.new(0,10); cor.Parent = fr
        local nl = Instance.new("TextLabel"); nl.Parent = fr; nl.Size = UDim2.new(1,-20,0,25); nl.Position = UDim2.new(0,10,0,5); nl.BackgroundTransparency = 1; nl.Text = "📜 " .. name; nl.TextColor3 = Color3.fromRGB(255,200,100); nl.TextSize = 14; nl.Font = Enum.Font.GothamBold; nl.TextXAlignment = Enum.TextXAlignment.Left
        local pl = Instance.new("TextLabel"); pl.Parent = fr; pl.Size = UDim2.new(1,-20,0,18); pl.Position = UDim2.new(0,10,0,30); pl.BackgroundTransparency = 1; pl.Text = "📁 " .. GetFolder() .. f; pl.TextColor3 = Color3.fromRGB(100,100,120); pl.TextSize = 10; pl.Font = Enum.Font.Code; pl.TextXAlignment = Enum.TextXAlignment.Left
        local cp = Instance.new("TextButton"); cp.Parent = fr; cp.Size = UDim2.new(0,70,0,30); cp.Position = UDim2.new(1,-165,0,35); cp.BackgroundColor3 = Color3.fromRGB(55,55,80); cp.Text = "📋 COPY"; cp.TextColor3 = Color3.fromRGB(255,255,255); cp.TextSize = 12; cp.Font = Enum.Font.GothamBold; local cpc = Instance.new("UICorner"); cpc.CornerRadius = UDim.new(0,6); cpc.Parent = cp
        local ex = Instance.new("TextButton"); ex.Parent = fr; ex.Size = UDim2.new(0,80,0,30); ex.Position = UDim2.new(1,-85,0,35); ex.BackgroundColor3 = Color3.fromRGB(0,170,90); ex.Text = "⚡ EXECUTE"; ex.TextColor3 = Color3.fromRGB(255,255,255); ex.TextSize = 12; ex.Font = Enum.Font.GothamBold; local exc = Instance.new("UICorner"); exc.CornerRadius = UDim.new(0,6); exc.Parent = ex
        local dl = Instance.new("TextButton"); dl.Parent = fr; dl.Size = UDim2.new(0,50,0,30); dl.Position = UDim2.new(1,-45,0,35); dl.BackgroundColor3 = Color3.fromRGB(200,60,60); dl.Text = "🗑️"; dl.TextColor3 = Color3.fromRGB(255,255,255); dl.TextSize = 14; dl.Font = Enum.Font.GothamBold; local dlc = Instance.new("UICorner"); dlc.CornerRadius = UDim.new(0,6); dlc.Parent = dl
        cp.MouseButton1Click:Connect(function() local c = ReadFile(f); if c and setclipboard then setclipboard(c); AddConsole("SUCCESS","Copied: "..name) else AddConsole("ERROR","Failed copy") end end)
        ex.MouseButton1Click:Connect(function() local c = ReadFile(f); if c then local s,e = pcall(function() loadstring(c)() end); if s then AddConsole("SUCCESS","Executed: "..name) else AddConsole("ERROR",tostring(e)) end else AddConsole("ERROR","Failed load") end end)
        dl.MouseButton1Click:Connect(function() DelFile(f); RefreshSaves(); AddConsole("WARN","Deleted: "..name) end)
        yOff = yOff + 80
    end
    SavesFrame.CanvasSize = UDim2.new(0,0,0,yOff)
end

local SaveNewFrame = Instance.new("Frame")
SaveNewFrame.Parent = SavesFrame
SaveNewFrame.Size = UDim2.new(1,-20,0,50)
SaveNewFrame.Position = UDim2.new(0,10,0,5)
SaveNewFrame.BackgroundColor3 = Color3.fromRGB(25,30,40)
local snCorner = Instance.new("UICorner"); snCorner.CornerRadius = UDim.new(0,10); snCorner.Parent = SaveNewFrame
local snLabel = Instance.new("TextLabel"); snLabel.Parent = SaveNewFrame; snLabel.Size = UDim2.new(0.5,0,1,0); snLabel.Position = UDim2.new(0,10,0,0); snLabel.BackgroundTransparency = 1; snLabel.Text = "💾 Save current script as new file"; snLabel.TextColor3 = Color3.fromRGB(200,200,200); snLabel.TextSize = 13; snLabel.Font = Enum.Font.Gotham; snLabel.TextXAlignment = Enum.TextXAlignment.Left
local snBtn = Instance.new("TextButton"); snBtn.Parent = SaveNewFrame; snBtn.Size = UDim2.new(0,120,0,35); snBtn.Position = UDim2.new(1,-130,0.5,-17.5); snBtn.BackgroundColor3 = Color3.fromRGB(0,150,100); snBtn.Text = "➕ SAVE NEW"; snBtn.TextColor3 = Color3.fromRGB(255,255,255); snBtn.TextSize = 13; snBtn.Font = Enum.Font.GothamBold; local snbc = Instance.new("UICorner"); snbc.CornerRadius = UDim.new(0,6); snbc.Parent = snBtn
local rfBtn = Instance.new("TextButton"); rfBtn.Parent = SaveNewFrame; rfBtn.Size = UDim2.new(0,80,0,35); rfBtn.Position = UDim2.new(1,-220,0.5,-17.5); rfBtn.BackgroundColor3 = Color3.fromRGB(70,70,90); rfBtn.Text = "🔄 REFRESH"; rfBtn.TextColor3 = Color3.fromRGB(255,255,255); rfBtn.TextSize = 12; rfBtn.Font = Enum.Font.Gotham; local rfc = Instance.new("UICorner"); rfc.CornerRadius = UDim.new(0,6); rfc.Parent = rfBtn
snBtn.MouseButton1Click:Connect(function() if ScriptBox.Text ~= "" then local n = "Script_"..os.time()..".txt"; WriteFile(n, ScriptBox.Text); AddConsole("SUCCESS","Saved: "..n); RefreshSaves() else AddConsole("WARN","No script to save") end end)
rfBtn.MouseButton1Click:Connect(RefreshSaves)
RefreshSaves()

AddConsole("SUCCESS","Settings + Saves Script Loaded")
AddConsole("SUCCESS","Tab Order: Executor > Settings > Saves Script")
