local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SPAWNER HUB V1.9",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Script Gaming",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab = Window:CreateTab("Spawner Custom Entities", rbxassetid://12932323187) -- Title, Image

local Section = Tab:CreateSection("Spawner")

local Button = Tab:CreateButton({
   Name = "Rebound Remake (Killable)",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/Z0j2p7Un"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rebound Remake (Unkillable)",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/aDnvLtc0"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Ripper",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/duAAB2tp"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "A-60",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/A-60.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Depth",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/Dg1sFrQm"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Silence",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/FRs4rBed"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "X-60",
   Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/rCS3K95T"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "B-60",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/EyH5nC1t"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Surge",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/yuQDrnUJ"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "AMBUSH NIGHTMARE",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/StsBUgzF"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rush Nightmare",
   Callback = function()
         loadstring(game:HttpGet("https://pastebin.com/raw/1Y20rMQg"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Matcher",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/ke2LsQcH"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rebound Endless",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/6KtmYCAQ"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Greed",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/3mquCrkF"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "A-60 Remake",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/UGZVqiQ5"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rebound Hardcore New",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/2RwQUQRt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rebound Old",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/MqUhjTVJ"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Kawaii Ambush",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/VHqii3zx"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Troll Ambush",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/TROLL%20AMBUSH.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "OLD AMBUSH",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/OLD%20AMBUSH.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "OLD RUSH",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/OLD%20RUSH.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Hunger",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Hunger.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Cease",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/CEASE.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "E-146",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/E-146.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "A-60 V2",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/A-60%20V2.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Depth Original",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Depth%20Original.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "A-60 Hardcore",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/A-60%20HARDCORE.lua"))()
   end,
})

local Label = Tab:CreateLabel("OLD ENTITIES", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

local Button = Tab:CreateButton({
   Name = "LSPLASH",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/LSPLASH.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Happy Munci",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/HAPPY%20MUNCI.lua"))()
   end,
})

local Tab = Window:CreateTab("Entities", rbxassetid://10890175548) -- Title, Image

local Section = Tab:CreateSection("Entities")

local Button = Tab:CreateButton({
   Name = "Rush",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Doors/Entity%20Spawner/V2/Example.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Ambush",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Ambush.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "A-60",
   Callback = function()
       local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "A-60",
		Asset = "rbxassetid://110578752745266",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 2
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"Death", "Hints", "Go", "Here"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
   end,
})

local Tab = Window:CreateTab("Crucifix (patched)", rbxassetid://12434169015) -- Title, Image

local Section = Tab:CreateSection("Crucifix")

local Button = Tab:CreateButton({
   Name = "Eyes Crucifix",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/7s5z96vK"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Figure Crucifix",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBloxYT/ok/main/Okay"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Crucifix Old Or New",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Fazedrab/Utilities-1/main/Crucifix"))(
   end,
})

local Button = Tab:CreateButton({
   Name = "Seek Crucifix",
   Callback = function()
          --// New Seek Crucifix (Execute in prerun shop)

function FullVersion() do

local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

-- Create your tool here

local exampleTool = game:GetObjects("rbxassetid://11780280932")[1]

exampleTool.Parent = game.Players.LocalPlayer.Backpack

local Players = game:GetService("Players")

local UIS = game:GetService("UserInputService")

local tool = exampleTool

local Plr = Players.LocalPlayer

local Char = Plr.Character or Plr.CharacterAdded:Wait()

local Hum = Char:WaitForChild("Humanoid")

local RightArm = Char:WaitForChild("RightUpperArm")

local LeftArm = Char:WaitForChild("LeftUpperArm")

local RightC1 = RightArm.RightShoulder.C1

local LeftC1 = LeftArm.LeftShoulder.C1

        local function setupCrucifix(tool)

        RightArm.Name = "R_Arm"

        LeftArm.Name = "L_Arm"

        

        RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)

        LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))

        for _, v in next, Hum:GetPlayingAnimationTracks() do

            v:Stop()

        end

        end

tool.Equipped:Connect(function()

    setupCrucifix(exampleTool)

    game.Players.LocalPlayer:SetAttribute("Hidden", true)

	UIS.InputBegan:Connect(function(input)	    if input.UserInputType == Enum.UserInputType.MouseButton1 then

		    if tool.Parent == game.Players.LocalPlayer.Character then

                   if game.Workspace:FindFirstChild("Lookman") then

                      local eyes = game.Workspace:FindFirstChild("Lookman").Core

                      local crucifixed = Instance.new("BoolValue")

                      crucifixed.Parent = eyes

                      crucifixed.Name = "GettingCrucifixed"

                      eyes.Ambience.Playing = false

                      eyes.Repent.Looped = true

                      eyes.Repent:Play()

                      local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)

camara.CFrame = camara.CFrame * shakeCf

end)

camShake:Start()

camShake:ShakeOnce(3.5, 10, 0.1, 1.5)

wait(1.2)

                      local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)

camara.CFrame = camara.CFrame * shakeCf

end)

camShake:Start()

camShake:ShakeOnce(3.5, 10, 0.1, 1.5)

wait(1.2)

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)

camara.CFrame = camara.CFrame * shakeCf

end)

camShake:Start()

camShake:ShakeOnce(3.5, 10, 0.1, 1.5)

wait(1.2)

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)

camara.CFrame = camara.CFrame * shakeCf

end)

camShake:Start()

camShake:ShakeOnce(3.5, 10, 0.1, 1.5)

                      wait(1.2)

                      local ClonedMesh = tool.NewOneBro:Clone()

                      ClonedMesh.Parent = game.Workspace

                      ClonedMesh.Anchored = true

                      tool:Destroy()

                      eyes.Repent.Playing = false

                      eyes.Scream:Play()

                      eyes.PointLight.Enabled = false

                      eyes.PointLight.Enabled = false

                      local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)

camara.CFrame = camara.CFrame * shakeCf

end)

camShake:Start()

camShake:ShakeOnce(6, 10, 0.1, 4.5)

                      loadstring(game:HttpGet(("https://raw.githubusercontent.com/lolthatseazy/KillEyes/main/Source.lua"),true))()

                      wait(0.3)

                      game.Workspace:FindFirstChild("Lookman"):Destroy()

               end

               end

              end

	end)

    end)

tool.Unequipped:Connect(function()

    game.Players.LocalPlayer:SetAttribute("Hidden", false)

        RightArm.Name = "RightUpperArm"

        LeftArm.Name = "LeftUpperArm"

        

        RightArm.RightShoulder.C1 = RightC1

        LeftArm.LeftShoulder.C1 = LeftC1

end)

local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)

local Achievements = debug.getupvalue(Unlock, 1)

local custom = {

    Title = "Unlock The Seek Crucifix", 

    Desc = "How did you..",  --first line

    Reason = "You Unlock Seek Crucifix", --change this for second line of the badgs desc

    BadgeId = 2127965951, --change badge id for image

    Category = 0,

}

local old = {}

for i, v in next, Achievements.Join do

    old[i] = v

end

for i, v in next, custom do

    Achievements.Join[i] = v

end

Unlock(nil, "Join")

for i, v in next, old do

    Achievements.Join[i] = v

end

end

end

FullVersion()
   end,
})
  
local Tab = Window:CreateTab("Credit", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Credit")

local Label = Tab:CreateLabel("Credit By Script Gaming", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

local Label = Tab:CreateLabel("Version 1.9", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

Rayfield:LoadConfiguration()
