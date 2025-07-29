-- Raw Roblox executor loading screen script

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create ScreenGui in PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Black fullscreen background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0
bg.ZIndex = 0
bg.Parent = screenGui

-- Game Title Text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0.25, 0)
title.BackgroundTransparency = 1
title.Text = " Rayfield Dark Spawner Script"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = screenGui

-- Loading bar container
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0.5, 0, 0.06, 0)
loadingFrame.Position = UDim2.new(0.25, 0, 0.5, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui

-- Progress bar fill
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = loadingFrame

-- Loading percentage text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 1.3, 0)
loadingText.Position = UDim2.new(0, 0, 1.1, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading... 0%"
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.Font = Enum.Font.Gotham
loadingText.TextScaled = true
loadingText.Parent = loadingFrame

-- Status message
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 1.2, 0)
statusText.Position = UDim2.new(0, 0, 2.2, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "Initializing..."
statusText.TextColor3 = Color3.new(1, 1, 1)
statusText.Font = Enum.Font.Gotham
statusText.TextScaled = true
statusText.Parent = loadingFrame

-- Status messages list
local statusMessages = {
	"> Verifying pet spawner script...",
	"> Bypassing dupe detection firewall...",
	"> Injecting anti-exploit layer...",
	"> Compiling egg drop chances...",
	"> Obfuscating trade channels...",
	"> Securing trade system...",
	"> Calibrating pet capsule emitters...",
	"> Finalizing data checksum...",
	"> Security handshake complete."
}

-- Simulate loading function
local function simulateLoading()
	local steps = 100
	local duration = 200 -- seconds (4+ minutes)
	local delayPerStep = duration / steps
	local messageIndex = 1

	for i = 1, steps do
		local percent = i / steps

		-- Tween progress bar
		local tween = TweenService:Create(progressBar, TweenInfo.new(0.05), {
			Size = UDim2.new(percent, 0, 1, 0)
		})
		tween:Play()

		-- Update percent text
		loadingText.Text = "Loading... " .. math.floor(percent * 100) .. "%"

		-- Update status message every few steps
		if i % math.floor(steps / #statusMessages) == 0 and messageIndex <= #statusMessages then
			statusText.Text = statusMessages[messageIndex]
			messageIndex = messageIndex + 1
		end

		wait(delayPerStep)
	end

	-- Final message
	statusText.Text = "Finalizing launch sequence..."
	loadingText.Text = "Welcome!"
	wait(0.5)

	-- Fade out all UI
	local fadeTween = TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1})
	local frameTween = TweenService:Create(loadingFrame, TweenInfo.new(1), {Position = UDim2.new(0.25, 0, 1.2, 0)})
	local titleFade = TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1})
	local statusFade = TweenService:Create(statusText, TweenInfo.new(1), {TextTransparency = 1})
	local loadingFade = TweenService:Create(loadingText, TweenInfo.new(1), {TextTransparency = 1})

	fadeTween:Play()
	frameTween:Play()
	titleFade:Play()
	statusFade:Play()
	loadingFade:Play()

	wait(1.2)
	screenGui:Destroy()
end

simulateLoading()
