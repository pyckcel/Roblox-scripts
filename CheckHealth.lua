local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function sendHealthNotification()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Health Status";
        Text = "Current Health: " .. math.floor(humanoid.Health);
        Icon = "rbxassetid://0";
        Duration = math.huge;
        Button1 = "OK";
    })
end

humanoid.HealthChanged:Connect(function(newHealth)
    sendHealthNotification()
end)

sendHealthNotification()
