_G.RedzLib = {}

local RedzLib = _G.RedzLib
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

function RedzLib:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RedzHubStyle_GUI"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 550, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame

    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 8)
    TopBarCorner.Parent = TopBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = title
    TitleLabel.Size = UDim2.new(1, -20, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 14
    TitleLabel.Parent = TopBar

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 150, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame

    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.Size = UDim2.new(1, 0, 1, -10)
    TabContainer.Position = UDim2.new(0, 0, 0, 5)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ScrollBarThickness = 2
    TabContainer.Parent = Sidebar

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Parent = TabContainer
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Size = UDim2.new(1, -160, 1, -50)
    ContentArea.Position = UDim2.new(0, 155, 0, 45)
    ContentArea.BackgroundTransparency = 1
    ContentArea.Parent = MainFrame

    local Tabs = {}
    local FirstTab = true

    function RedzLib:CreateTab(name)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, -10, 0, 30)
        TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextSize = 12
        TabButton.Parent = TabContainer

        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 4)
        TabCorner.Parent = TabButton

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.ScrollBarThickness = 2
        Page.Parent = ContentArea

        local PageListLayout = Instance.new("UIListLayout")
        PageListLayout.Parent = Page
        PageListLayout.Padding = UDim.new(0, 5)

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(ContentArea:GetChildren()) do
                if v:IsA("ScrollingFrame") then v.Visible = false end
            end
            for _, v in pairs(TabContainer:GetChildren()) do
                if v:IsA("TextButton") then v.TextColor3 = Color3.fromRGB(200, 200, 200) end
            end
            Page.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        end)

        if FirstTab then
            Page.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(255, 0, 0)
            FirstTab = false
        end

        local Elements = {}

        function Elements:CreateButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -10, 0, 35)
            Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.Font = Enum.Font.Gotham
            Button.TextSize = 12
            Button.Parent = Page

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 4)
            BtnCorner.Parent = Button

            Button.MouseButton1Click:Connect(callback)
        end

        function Elements:CreateToggle(text, callback)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, -10, 0, 35)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            ToggleFrame.Parent = Page

            local TglCorner = Instance.new("UICorner")
            TglCorner.CornerRadius = UDim.new(0, 4)
            TglCorner.Parent = ToggleFrame

            local TglLabel = Instance.new("TextLabel")
            TglLabel.Text = text
            TglLabel.Size = UDim2.new(1, -50, 1, 0)
            TglLabel.Position = UDim2.new(0, 10, 0, 0)
            TglLabel.BackgroundTransparency = 1
            TglLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TglLabel.TextXAlignment = Enum.TextXAlignment.Left
            TglLabel.Font = Enum.Font.Gotham
            TglLabel.TextSize = 12
            TglLabel.Parent = ToggleFrame

            local TglBtn = Instance.new("TextButton")
            TglBtn.Size = UDim2.new(0, 30, 0, 15)
            TglBtn.Position = UDim2.new(1, -40, 0.5, -7)
            TglBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            TglBtn.Text = ""
            TglBtn.Parent = ToggleFrame

            local TglBtnCorner = Instance.new("UICorner")
            TglBtnCorner.CornerRadius = UDim.new(1, 0)
            TglBtnCorner.Parent = TglBtn

            local TglIndicator = Instance.new("Frame")
            TglIndicator.Size = UDim2.new(0, 13, 0, 13)
            TglIndicator.Position = UDim2.new(0, 1, 0.5, -6)
            TglIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TglIndicator.Parent = TglBtn

            local IndCorner = Instance.new("UICorner")
            IndCorner.CornerRadius = UDim.new(1, 0)
            IndCorner.Parent = TglIndicator

            local Toggled = false
            TglBtn.MouseButton1Click:Connect(function()
                Toggled = not Toggled
                if Toggled then
                    TweenService:Create(TglIndicator, TweenInfo.new(0.2), {Position = UDim2.new(1, -14, 0.5, -6), BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
                else
                    TweenService:Create(TglIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 1, 0.5, -6), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                end
                callback(Toggled)
            end)
        end

        return Elements
    end

    local dragging, dragStart, startPos
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return RedzLib
end

return RedzLib
