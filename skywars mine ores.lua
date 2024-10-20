local player = game.Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character.HumanoidRootPart
local cpos = humanoidRootPart.CFrame

local function hasAxeEquipped()
    return character:FindFirstChild("Axe")
end

while not hasAxeEquipped() do
    wait(1)
end

cpos = humanoidRootPart.CFrame

local stuff = workspace:GetDescendants()
for i = 1, #stuff do
    if stuff[i].Name == "Block" and stuff[i].Parent.Name == "Ores" then
        repeat
            wait()
            humanoidRootPart.CFrame = stuff[i].CFrame
            character.Axe.RemoteEvent:FireServer(stuff[i])
        until stuff[i].Name ~= "Block" or not hasAxeEquipped()
    end
end

humanoidRootPart.CFrame = cpos
