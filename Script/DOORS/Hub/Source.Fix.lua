local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SCRIPT GAMING HUB V20",
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

local Tab = Window:CreateTab("Spawner Custom Entities", 12932323187) -- Title, Image

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
   Name = "Hungered By Me",
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

local Button = Tab:CreateButton({
   Name = "TrollFace",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Troll%20Face.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "White",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/White.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Smiler",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Smiler.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Trauma",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Trauma.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Hungered",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Hungered.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rage",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Rage.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Terror",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Terror.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "FireAmbush",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/CUSTOM%20ENTITIES/Fire.lua"))()
   end,
})

local Tab = Window:CreateTab("Entities", 4483362458) -- Title, Image

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

local Button = Tab:CreateButton({
    Name = "Spawn Siren Head",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Siren Head",
                Asset = "rbxassetid://5780187857",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Siren Head spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Siren Head started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Siren Head despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Siren Head spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Struggle",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Struggle",
                Asset = "rbxassetid://78595044382471",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Struggle spawned")
			local cue1 = Instance.new("Sound")
	cue1.Parent = workspace
	cue1.Name = "Scream"
	cue1.SoundId = "rbxassetid://1546975842"
	cue1.Volume = 10
	cue1.TimePosition = 0
	cue1.PlaybackSpeed = 0.6
	cue1:Play()

	local eq = Instance.new("EqualizerSoundEffect")
	eq.Parent = cue1
	eq.HighGain = 0
	eq.LowGain = -20
	eq.MidGain = -10
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Struggle started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Struggle despawned")
			local s = Instance.new("Sound", workspace)
	s.SoundId = "rbxassetid://1837829565"
	s.Volume = 9999
	s.PlaybackSpeed = 0.5
	s:Play()
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Struggle spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Tackle",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Tackle",
                Asset = "rbxassetid://86243481114565",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Tackle spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Tackle started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Tackle despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Tackle spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Tackle 2",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Tackle 2",
                Asset = "rbxassetid://115089991213771",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Tackle 2 spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Tackle 2 started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Tackle 2 despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Tackle 2 spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Depth",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Depth",
                Asset = "rbxassetid://81639855613054",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Depth spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Depth started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Depth despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Depth spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Photon",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Photon",
                Asset = "rbxassetid://116627708198891",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Photon spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Photon started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Photon despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Photon spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn A-60",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "A-60",
                Asset = "rbxassetid://135442171475499",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("A-60 spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("A-60 started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("A-60 despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "A-60 spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn A-60 2",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "A-60 2",
                Asset = "rbxassetid://114407358864275",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("A-60 2 spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("A-60 2 started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("A-60 2 despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "A-60 spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Surge Nightmare 1",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Surge Nightmare 1",
                Asset = "rbxassetid://122542838282462",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Surge Nightmare 1 spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Surge Nightmare 1 started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Surge Nightmare 1 despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Surge Nightmare 1 spawned!",
        })
    end,
})

local Button2 = Tab:CreateButton({
    Name = "Spawn Surge Nightmare 2",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Surge Nightmare 2",
                Asset = "rbxassetid://128864507301833",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Surge Nightmare 2 spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Surge Nightmare 2 started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Surge Nightmare 2 despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Surge Nightmare 2 spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn A-200",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "A-200",
                Asset = "rbxassetid://127980558682704",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("A-200 spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("A-200 started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("A-200 despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "A-200 spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn A-60 But Kawaii",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "A-60 But Kawaii",
                Asset = "rbxassetid://105484357403429",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("A-60 But Kawaii spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("A-60 But Kawaii started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("A-60 But Kawaii despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "A-60 But Kawaii spawned!",
        })
    end,
})

local Button2 = Tab:CreateButton({
    Name = "Spawn Eyes Entity",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Eyes Entity",
                Asset = "rbxassetid://88822764648201",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Eyes Entity spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Eyes Entity started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Eyes Entity despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Eyes Entity spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Dread",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Dread",
                Asset = "rbxassetid://110312255104527",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Dread spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Dread started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Dread despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Dread spawned!",
        })
    end,
})

local Button2 = Tab:CreateButton({
    Name = "Spawn Noobies",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local entity = spawner.Create({
            Entity = {
                Name = "Noobies",
                Asset = "rbxassetid://75407496748423",
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Noobies spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Noobies started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Noobies despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Noobies spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Big Games",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createBigGamesModel()
            local model = Instance.new("Model")
            model.Name = "Big Games"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://11359538252"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Big Games",
                CustomModel = createBigGamesModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Big Games spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Big Games started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Big Games despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Big Games spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Baller",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createBallerModel()
            local model = Instance.new("Model")
            model.Name = "Baller"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://11151804223"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Baller",
                CustomModel = createBallerModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Baller spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Baller started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Baller despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Baller spawned!",
        })
    end,
})
local Button = Tab:CreateButton({
    Name = "Spawn Noob",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createNoobModel()
            local model = Instance.new("Model")
            model.Name = "Noob"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://753015087"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Noob",
                CustomModel = createNoobModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Noob spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Noob started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Noob despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Noob spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn You Are Idiot",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createModel()
            local model = Instance.new("Model")
            model.Name = "You Are Idiot"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://10794664885"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            local faceIndex = 1
            local faces = {"10794664885", "10418960920"}
            
            task.spawn(function()
                while model.Parent do
                    task.wait(0.5)
                    faceIndex = faceIndex % #faces + 1
                    faceParticle.Texture = "rbxassetid://" .. faces[faceIndex]
                    faceParticle:Emit(1)
                end
            end)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "You Are Idiot",
                CustomModel = createModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("You Are Idiot spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("You Are Idiot started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("You Are Idiot despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "You Are Idiot spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Freddy",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createFreddyModel()
            local model = Instance.new("Model")
            model.Name = "Freddy"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://179446620"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Freddy",
                CustomModel = createFreddyModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Freddy spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Freddy started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Freddy despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Freddy spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Verify",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createVerifyModel()
            local model = Instance.new("Model")
            model.Name = "Verify"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://11478378840"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Verify",
                CustomModel = createVerifyModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Verify spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Verify started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Verify despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Verify spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Alternate",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createModel()
            local model = Instance.new("Model")
            model.Name = "Alternate"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://107085704492533"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://82109464162950"
            sound.Looped = true
            sound.Volume = 0.5
            sound.Parent = model
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Alternate",
                CustomModel = createModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Alternate spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Alternate started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Alternate despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Alternate spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Grudge",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createModel()
            local model = Instance.new("Model")
            model.Name = "Grudge"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://10528077663"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            local pointLight = Instance.new("PointLight")
            pointLight.Parent = rushNew
            pointLight.Color = Color3.fromRGB(128, 0, 255)
            pointLight.Range = 20
            pointLight.Brightness = 10
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Grudge",
                CustomModel = createModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Grudge spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Grudge started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Grudge despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Grudge spawned!",
        })
    end,
})

local Button = Tab:CreateButton({
    Name = "Spawn Slendrina",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createModel()
            local model = Instance.new("Model")
            model.Name = "Slendrina"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://1801062657"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            local sound1 = Instance.new("Sound")
            sound1.SoundId = "rbxassetid://81403549714833"
            sound1.Volume = 0.5
            sound1.Parent = model
            
            local sound2 = Instance.new("Sound")
            sound2.SoundId = "rbxassetid://6497805517"
            sound2.Volume = 0.5
            sound2.Parent = model
            
            local sound3 = Instance.new("Sound")
            sound3.SoundId = "rbxassetid://112689364582190"
            sound3.Volume = 0.5
            sound3.Parent = model
            
            task.spawn(function()
                while model.Parent do
                    sound1:Play()
                    sound1.Ended:Wait()
                    sound2:Play()
                    sound2.Ended:Wait()
                    sound3:Play()
                    sound3.Ended:Wait()
                end
            end)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Slendrina",
                CustomModel = createModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Slendrina spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Slendrina started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Slendrina despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Slendrina spawned!",
        })
    end,
})

local Button2 = Tab:CreateButton({
    Name = "Spawn Granny",
    Callback = function()
        local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

        local function createModel()
            local model = Instance.new("Model")
            model.Name = "Granny"
            
            local rushNew = Instance.new("Part")
            rushNew.Name = "RushNew"
            rushNew.Size = Vector3.new(5, 5, 5)
            rushNew.Anchored = true
            rushNew.CanCollide = false
            rushNew.Transparency = 1
            rushNew.Parent = model
            
            local attachment = Instance.new("Attachment")
            attachment.Name = "FaceAttachment"
            attachment.Position = Vector3.new(0, 0, 2.5)
            attachment.Parent = rushNew
            
            local faceParticle = Instance.new("ParticleEmitter")
            faceParticle.Name = "Face"
            faceParticle.Parent = attachment
            faceParticle.Texture = "rbxassetid://2024252742"
            faceParticle.Rate = 0
            faceParticle.Lifetime = NumberRange.new(999)
            faceParticle.Size = NumberSequence.new(6)
            faceParticle.Transparency = NumberSequence.new(0)
            faceParticle.LockedToPart = true
            faceParticle.Speed = NumberRange.new(0)
            faceParticle.Enabled = true
            faceParticle:Emit(1)
            
            local sound1 = Instance.new("Sound")
            sound1.SoundId = "rbxassetid://7173976933"
            sound1.Volume = 0.5
            sound1.Parent = model
            
            local sound2 = Instance.new("Sound")
            sound2.SoundId = "rbxassetid://1591860783"
            sound2.Volume = 0.5
            sound2.Parent = model
            
            local sound3 = Instance.new("Sound")
            sound3.SoundId = "rbxassetid://1591860029"
            sound3.Volume = 0.5
            sound3.Parent = model
            
            local sound4 = Instance.new("Sound")
            sound4.SoundId = "rbxassetid://7168357522"
            sound4.Volume = 0.5
            sound4.Parent = model
            
            task.spawn(function()
                while model.Parent do
                    sound1:Play()
                    sound1.Ended:Wait()
                    sound2:Play()
                    sound2.Ended:Wait()
                    sound3:Play()
                    sound3.Ended:Wait()
                    sound4:Play()
                    sound4.Ended:Wait()
                end
            end)
            
            return model
        end

        local entity = spawner.Create({
            Entity = {
                Name = "Granny",
                CustomModel = createModel,
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
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 20, 0.1, 1}
            },
            Movement = {
                Speed = 200,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 2,
                Delay = 2
            },
            Damage = {
                Enabled = false,
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
                Type = "Guiding",
                Hints = {"Run", "Hide"},
                Cause = ""
            }
        })

        entity:SetCallback("OnSpawned", function()
            print("Granny spawned")
        end)

        entity:SetCallback("OnStartMoving", function()
            print("Granny started moving")
        end)

        entity:SetCallback("OnDespawned", function()
            print("Granny despawned")
        end)

        entity:Run()

        Rayfield:Notify({
            Title = "Spawned",
            Content = "Granny spawned!",
        })
    end,
})

local Tab = Window:CreateTab("Crucifix", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Crucifix")

local Button = Tab:CreateButton({
   Name = "Eyes Crucifix",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/Eyes%20Crucifix.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Figure Crucifix",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Script/DOORS/Figure.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Crucifix Old Or New",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Fazedrab/Utilities-1/main/Crucifix"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "??? Crucifix",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/%3F%3F%3F%20Crucifix.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Ambush Crucifix",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Ambush%20Crucifix.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "??? Crucifix",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/Crucifix%20Blue.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Crucifix Seek",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/ScriptGamingGamer/refs/heads/main/seek%20Crucifix.lua"))()
   end,
})

local Tab = Window:CreateTab("Credit", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Credit")

local Label = Tab:CreateLabel("Credit By Script Gaming", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

local Label = Tab:CreateLabel("Version 1.9", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

Rayfield:LoadConfiguration()
