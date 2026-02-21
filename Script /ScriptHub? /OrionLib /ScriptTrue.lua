local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Tower Of Classic", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
   Name = "Main",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
   Name = "Player"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddSlider({
   Name = "Walk",
   Min = 0,
   Max = 20,
   Default = 5,
   Color = Color3.fromRGB(255,255,255),
   Increment = 1,
   ValueName = "WalkSpeed",
   Callback = function(Value)
      _G.Speed = Value
    
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
    
    if not _G.SpeedFix then
        _G.SpeedFix = true
        game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
            Char:WaitForChild("Humanoid").WalkSpeed = _G.Speed
        end)
    end
   end    
})

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]

Tab:AddSlider({
   Name = "JumpPower",
   Min = 0,
   Max = 20,
   Default = 5,
   Color = Color3.fromRGB(255,255,255),
   Increment = 1,
   ValueName = "JumpPower",
   Callback = function(Value)
     _G.JumpPowerValue = Value
      
      local Humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
      Humanoid.UseJumpPower = true -- WAJIB agar JumpPower kustom berfungsi
      Humanoid.JumpPower = _G.JumpPowerValue

      if not _G.JumpFix then
         _G.JumpFix = true
         game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
            local NewHumanoid = Char:WaitForChild("Humanoid")
            NewHumanoid.UseJumpPower = true
            NewHumanoid.JumpPower = _G.JumpPowerValue
         end)
      end
   end    
})

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]

Tab:AddToggle({
   Name = "NOCLIP",
   Default = false,
   Callback = function(Value)
      _G.Noclip = Value
      
      game:GetService("RunService").Stepped:Connect(function()
         if _G.Noclip then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
               if part:IsA("BasePart") then
                  part.CanCollide = false
               end
            end
         else
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
            end
         end
      end)
   end
   end    
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

Tab:AddToggle({
   Name = "No Acceleration",
   Default = false,
   Callback = function(Value)
     _G.NoAccel = Value
      
      game:GetService("RunService").RenderStepped:Connect(function()
         if _G.NoAccel then
            local Character = game.Players.LocalPlayer.Character
            if Character and Character:FindFirstChild("Humanoid") then
               Character.Humanoid.WalkSpeed = _G.Speed or 16
            end
         end
      end)
   end    
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

Tab:AddLabel("ESP PLAYER")

Tab:AddToggle({
   Name = "ESP PLAYER",
   Default = false,
   Callback = function(Value)
      _G.FullESP = Value
        
        local function AddESP(Player)
            local Box = Drawing.new("Square")
            local Name = Drawing.new("Text")
            local Tracer = Drawing.new("Line")

            local Connection
            Connection = game:GetService("RunService").RenderStepped:Connect(function()
                if _G.FullESP and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 then
                    
                    local RootPart = Player.Character.HumanoidRootPart
                    local Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(RootPart.Position)

                    if OnScreen then
                        Box.Visible = true
                        Box.Size = Vector2.new(2000 / Position.Z, 3000 / Position.Z) -- Skala berdasarkan jarak
                        Box.Position = Vector2.new(Position.X - Box.Size.X / 2, Position.Y - Box.Size.Y / 2)
                        Box.Color = Color3.fromRGB(255, 0, 0)
                        Box.Thickness = 1
                        
                        Name.Visible = true
                        Name.Text = Player.Name
                        Name.Position = Vector2.new(Position.X, Position.Y - Box.Size.Y / 2 - 15)
                        Name.Color = Color3.fromRGB(255, 255, 255)
                        Name.Center = true
                        Name.Outline = true
                        Name.Size = 16

                        Tracer.Visible = true
                        Tracer.From = Vector2.new(game:GetService("Workspace").CurrentCamera.ViewportSize.X / 2, game:GetService("Workspace").CurrentCamera.ViewportSize.Y)
                        Tracer.To = Vector2.new(Position.X, Position.Y + Box.Size.Y / 2)
                        Tracer.Color = Color3.fromRGB(255, 255, 0)
                        Tracer.Thickness = 1
                    else
                        Box.Visible = false
                        Name.Visible = false
                        Tracer.Visible = false
                    end
                else
                    Box.Visible = false
                    Name.Visible = false
                    Tracer.Visible = false
                    
                    if not _G.FullESP then
                        Box:Remove()
                        Name:Remove()
                        Tracer:Remove()
                        Connection:Disconnect()
                    end
                end
            end)
        end

        if _G.FullESP then
            for _, p in pairs(game:GetService("Players"):GetPlayers()) do
                if p ~= game:GetService("Players").LocalPlayer then
                    AddESP(p)
                end
            end
        end
   end    
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

Tab:AddBind({
   Name = "ESP PLAYER KEYBIND",
   Default = Enum.KeyCode.P,
   Hold = false,
   Callback = function()
     _G.FullESP = not _G.FullESP
   end    
})

--[[
Name = <string> - The name of the bind.
Default = <keycode> - The default value of the bind.
Hold = <bool> - Makes the bind work like: Holding the key > The bind returns true, Not holding the key > Bind returns false.
Callback = <function> - The function of the bind.
]]

Tab:AddLabel("COMING SOON")

OrionLib:Init()
