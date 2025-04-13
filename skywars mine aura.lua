-- Mine Aura v1 (Undermine Aura v1)
-- made by hash_lol

-- Controlador global
getgenv().script = true

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local detectionRange = 25 -- detection range

while getgenv().script do
    wait(0.6)
    for _, item in pairs(workspace:GetDescendants()) do
        if item:IsA("Part") and item.Name == "Block" then
            local distance = (humanoidRootPart.Position - item.Position).magnitude
            if distance <= detectionRange then
                local axe = player.Backpack:FindFirstChild("Axe")
                if axe then
                    local remoteEvent = axe:FindFirstChild("RemoteEvent")
                    if remoteEvent then
                        remoteEvent:FireServer(item)
                    end
                end
            end
        end
    end
end
