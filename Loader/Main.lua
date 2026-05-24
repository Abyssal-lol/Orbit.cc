if getgenv().ngaaa then warn("already executed [abyss.lol]") return end
getgenv().ngaaa = true

function runGame()
game:GetService("CoreGui"):WaitForChild("AbyssAuth"):Destroy()
    local World1, World2, World3 = false, false, false

    if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
        World1 = true
    elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
        World2 = true
    elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
        World3 = true
    end

    function bloxfruitonly()
        task.spawn(function()
            local Players = game:GetService("Players")
            local LP = Players.LocalPlayer

            repeat task.wait() until game:IsLoaded()
            repeat task.wait() until LP and LP.Character

            local success, err = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Abyssal-lol/Orbit.cc/refs/heads/main/FastAttack/Script.lua"))()
            end)

            if not success then
                warn("auto-load:", err)
            end
        end)
    end

    local function advertiser()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Abyssal-lol/Orbit.cc/refs/heads/main/External/API/Advertiser.lua"))()
    end

    local function loadGame()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Abyssal-lol/Orbit.cc/refs/heads/main/External/API/Loading%20Screen/Main.lua"))()
    end

    local function loader()
        if World1 or World2 or World3 then
            loadGame()
            task.wait(5.5)
            advertiser()
            bloxfruitonly()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Abyssal-lol/Orbit.cc/refs/heads/main/Games/Blox%20Fruit.lua"))()
        else
            warn("Unsupported game")
        end
    end

    loader()
end

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local KeyFilePath = "Abyss_Auth.txt"
local RawKeyURL = "https://raw.githubusercontent.com/Abyssal-lol/Abyss-lol/refs/heads/main/Hi/Keysystem/kk"
local DiscordURL = "https://discord.gg/5qSWYaqnvd"

local function fetchKey()
    local success, result = pcall(function()
        return game:HttpGet(RawKeyURL)
    end)
    return success and result:gsub("%s+", "") or nil
end

local function validate()
    local remote = fetchKey()
    if isfile(KeyFilePath) then
        local saved = readfile(KeyFilePath):gsub("%s+", "")
        if saved == remote then
            return true, remote
        end
    end
    return false, remote
end

local isValid, correctKey = validate()

-- Create UI Instance first so it can be referenceable and destroyed if valid
local AbyssUI = Instance.new("ScreenGui")
AbyssUI.Name = "AbyssAuth"
AbyssUI.Parent = CoreGui
AbyssUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if isValid then 
    AbyssUI:Destroy()
    runGame()
    return 
end

local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Glow = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local InputFrame = Instance.new("Frame")
local Input = Instance.new("TextBox")
local VerifyBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

Main.Name = "AbyssUI"
Main.Parent = AbyssUI
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 350, 0, 240)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main

Glow.Name = "Glow"
Glow.Parent = Main
Glow.BackgroundTransparency = 1
Glow.Position = UDim2.new(0, -15, 0, -15)
Glow.Size = UDim2.new(1, 30, 1, 30)
Glow.Image = "rbxassetid://5028857084"
Glow.ImageColor3 = Color3.fromRGB(80, 0, 200)
Glow.ImageTransparency = 0.6 
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(24, 24, 276, 276)
Glow.ZIndex = 0

Title.Parent = Main
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0.08, 0)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "ABYSS SYSTEM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

InputFrame.Parent = Main
InputFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
InputFrame.Position = UDim2.new(0.1, 0, 0.32, 0)
InputFrame.Size = UDim2.new(0.8, 0, 0, 40)

Instance.new("UICorner", InputFrame).CornerRadius = UDim.new(0, 6)
local Stroke = Instance.new("UIStroke", InputFrame)
Stroke.Color = Color3.fromRGB(45, 45, 45)
Stroke.Thickness = 1

Input.Parent = InputFrame
Input.BackgroundTransparency = 1
Input.Size = UDim2.new(1, -20, 1, 0)
Input.Position = UDim2.new(0, 10, 0, 0)
Input.Font = Enum.Font.Gotham
Input.PlaceholderText = "Enter Access Key..."
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 14

VerifyBtn.Parent = Main
VerifyBtn.BackgroundColor3 = Color3.fromRGB(85, 0, 210)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 35)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.Text = "VERIFY"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 14
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 6)

GetKeyBtn.Parent = Main
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.72, 5)
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 35)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
GetKeyBtn.TextSize = 14
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)

Status.Parent = Main
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0, 0, 0.88, 0)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Font = Enum.Font.Gotham
Status.Text = "Awaiting verification..."
Status.TextColor3 = Color3.fromRGB(120, 120, 120)
Status.TextSize = 12

local function notify(msg, color)
    Status.Text = msg
    Status.TextColor3 = color
end

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(DiscordURL)
    notify("Discord link copied to clipboard!", Color3.fromRGB(100, 180, 255))
end)

VerifyBtn.MouseButton1Click:Connect(function()
    local inputKey = Input.Text:gsub("%s+", "")

    if inputKey == correctKey then
        writefile(KeyFilePath, inputKey)
        runGame()

        TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, 0.6, 0),
            BackgroundTransparency = 1
        }):Play()

        task.wait(0.4)
        AbyssUI:Destroy()
    else
        notify("Not valid key", Color3.fromRGB(255, 100, 100))

        local originalPos = InputFrame.Position
        for i = 1, 6 do
            InputFrame.Position = originalPos + UDim2.new(0, (i % 2 == 0 and 5 or -5), 0, 0)
            task.wait(0.05)
        end
        InputFrame.Position = originalPos
    end
end)

Main.BackgroundTransparency = 1
TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0
}):Play()
