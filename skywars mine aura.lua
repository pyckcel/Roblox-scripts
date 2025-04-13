-- Mine Aura v2 (GUI Toggle Version with Match Reset Fix)
-- made by hash_lol + mod by Code Copilot

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local detectionRange = 25
local running = false

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MineAuraGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(1, -130, 0.5, -20)
toggleButton.AnchorPoint = Vector2.new(0, 0)
toggleButton.Text = "Ativar"
toggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 20
toggleButton.Parent = screenGui

-- Toggle Function
local function toggleAura()
    running = not running
    toggleButton.Text = running and "Desativar" or "Ativar"

    if running then
        task.spawn(function()
            while running do
                task.wait(0.1)

                -- Atualiza character e HumanoidRootPart se reiniciar
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                    player.CharacterAdded:Wait()
                    character = player.Character
                    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                else
                    humanoidRootPart = player.Character.HumanoidRootPart
                end

                for _, item in pairs(workspace:GetDescendants()) do
                    if item:IsA("Part") and item.Name == "Block" then
                        local distance = (humanoidRootPart.Position - item.Position).Magnitude
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
        end)
    end
end

toggleButton.MouseButton1Click:Connect(toggleAura)