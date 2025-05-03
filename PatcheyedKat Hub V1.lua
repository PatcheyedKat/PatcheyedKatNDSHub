-- PatcheyedKat Hub V1 for Natural Disaster Survival

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PatcheyedKatHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

local creationSound = Instance.new("Sound", screenGui)
creationSound.SoundId = "rbxassetid://2084290015"
creationSound.Volume = 1
creationSound:Play()

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 1  -- start invisible for fade
mainFrame.Parent = screenGui

local uicorner = Instance.new("UICorner", mainFrame)
uicorner.CornerRadius = UDim.new(0, 12)

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
titleBar.BackgroundTransparency = 1
titleBar.Parent = mainFrame
local titleCorner = Instance.new("UICorner", titleBar)
titleCorner.CornerRadius = UDim.new(0, 12)

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"

titleLabel.Size = UDim2.new(1, -30, 1, -8)
titleLabel.Position = UDim2.new(0, 10, 0, 4)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "PatcheyedKat Hub"
titleLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
titleLabel.TextSize = 18
titleLabel.TextTransparency = 1
titleLabel.Parent = titleBar


local minBtn = Instance.new("TextButton")
minBtn.Name = "Minimize"
minBtn.Size = UDim2.new(0, 25, 0, 25)
minBtn.Position = UDim2.new(1, -30, 0, 2)
minBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minBtn.BackgroundTransparency = 1
minBtn.Text = "–"
minBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
minBtn.TextSize = 18
local minCorner = Instance.new("UICorner", minBtn)
minCorner.CornerRadius = UDim.new(0, 8)
minBtn.Parent = titleBar


local btnContainer = Instance.new("Frame")
btnContainer.Name = "ButtonContainer"
btnContainer.Size = UDim2.new(1, 0, 1, -30)
btnContainer.Position = UDim2.new(0, 0, 0, 30)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = mainFrame


local layout = Instance.new("UIListLayout", btnContainer)
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top


local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
TweenService:Create(mainFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
TweenService:Create(titleBar, tweenInfo, {BackgroundTransparency = 0}):Play()
TweenService:Create(titleLabel, tweenInfo, {TextTransparency = 0}):Play()
TweenService:Create(minBtn, tweenInfo, {BackgroundTransparency = 0}):Play()


local function createScriptButton(name, url)
    local btn = Instance.new("TextButton")
    btn.Name = name:gsub("%s+", "")
    btn.Size = UDim2.new(0.9, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.fromRGB(0, 170, 255)
    btn.Text = name
    btn.TextSize = 16
    btn.AutoButtonColor = true
    btn.BackgroundTransparency = 1
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    btn.Parent = btnContainer
    -- fade in button text
    TweenService:Create(btn, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(btn, tweenInfo, {TextTransparency = 0}):Play()

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url, true))()
    end)
end



createScriptButton("TPToAll", "https://raw.githubusercontent.com/PatcheyedKat/NDS/refs/heads/main/TpToAll.Lua")
createScriptButton("Custom Ring V1", "https://raw.githubusercontent.com/PatcheyedKat/NDS/refs/heads/main/Custom%20Ring%20V1.lua")
-- Added Infinite Yield script
createScriptButton("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")


do
    local dragging, dragInput, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end


local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    btnContainer.Visible = not minimized
    if minimized then
        mainFrame.Size = UDim2.new(0, 300, 0, 30)
    else
        mainFrame.Size = UDim2.new(0, 300, 0, 200)
    end
end)
