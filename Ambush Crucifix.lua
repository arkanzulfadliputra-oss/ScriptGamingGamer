loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local tool = LoadCustomInstance("rbxassetid://12017043527")
tool.Parent = game:GetService("Players").LocalPlayer.Backpack

local anim1 = Instance.new("Animation")
anim1.Name = "CrucifixAnim1"
anim1.AnimationId = "rbxassetid://6516424098"
anim1.Parent = tool

local anim2 = Instance.new("Animation")
anim2.Name = "CrucifixAnim2"
anim2.AnimationId = "rbxassetid://97939285526557"
anim2.Parent = tool

local anim3 = Instance.new("Animation")
anim3.Name = "CrucifixAnim3"
anim3.AnimationId = "rbxassetid://73237356814157"
anim3.Parent = tool

local tracks = {}
local isPlaying = false

tool.Equipped:Connect(function()
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator")
    
    if not tracks[1] then
        tracks[1] = animator:LoadAnimation(anim1)
        tracks[2] = animator:LoadAnimation(anim2)
        tracks[3] = animator:LoadAnimation(anim3)
    end
    
    if not isPlaying then
        isPlaying = true
        tracks[1]:Play()
        tracks[2]:Play()
        tracks[3]:Play()
    end
end)

tool.Unequipped:Connect(function()
    if isPlaying and tracks[1] then
        isPlaying = false
        tracks[1]:Stop()
        tracks[2]:Stop()
        tracks[3]:Stop()
    end
end)
