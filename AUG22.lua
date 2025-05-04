-- ===== 自动适应屏幕的水印 =====
local function createAdaptiveWatermark()
    -- 如果已有水印，先删除旧的
    if game.CoreGui:FindFirstChild("AUG_Watermark") then
        game.CoreGui.AUG_Watermark:Destroy()
    end

    -- 获取屏幕分辨率（ViewportSize）
    local screenSize = workspace.CurrentCamera.ViewportSize

    -- 创建水印GUI
    local watermarkGui = Instance.new("ScreenGui")
    watermarkGui.Name = "AUG_Watermark"
    watermarkGui.Parent = game.CoreGui
    watermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling -- 确保显示在最上层
    watermarkGui.ResetOnSpawn = false

    local watermarkText = Instance.new("TextLabel")
    watermarkText.Name = "WatermarkText"
    watermarkText.Parent = watermarkGui
    watermarkText.Text = "测试版AUG" 
    watermarkText.TextColor3 = Color3.fromRGB(255, 255, 255)
    watermarkText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    watermarkText.TextStrokeTransparency = 0.3 
    watermarkText.Font = Enum.Font.GothamBold 
    watermarkText.TextSize = math.floor(screenSize.Y * 0.02)
    watermarkText.BackgroundTransparency = 1 
    watermarkText.AnchorPoint = Vector2.new(1, 0) 
    watermarkText.Position = UDim2.new(1, -10, 0, 10) 
    watermarkText.TextXAlignment = Enum.TextXAlignment.Right 

    watermarkText.Size = UDim2.new(0, watermarkText.TextBounds.X + 20, 0, watermarkText.TextBounds.Y + 10)

    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        screenSize = workspace.CurrentCamera.ViewportSize
        watermarkText.TextSize = math.floor(screenSize.Y * 0.02)
        watermarkText.Size = UDim2.new(0, watermarkText.TextBounds.X + 20, 0, watermarkText.TextBounds.Y + 10)
    end)
end

createAdaptiveWatermark()

local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "AUG脚本"; Text ="载入中"; Duration = 2; })wait("3")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "AUG脚本"; Text ="纯缝合不是特别好"; Duration = 2; })wait("2")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "我喜欢挂王牌"; Text ="🙏钱晨拜三拜"; Duration = 2; })wait("2")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "AUG脚本"; Text ="载入成功"; Duration = 3; })

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("现在时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheer/iuop/refs/heads/main/Protected_7843953596944453.lua"))();		
local win = ui:new("AUG脚本")
--
local UITab1 = win:Tab("信息",'16060333448')

local about = UITab1:section("作者信息",false)

about:Label("好几个月积攒起来的知识做的")
about:Label("每天不一定更新")
about:Label("无任何师傅")
about:Label("无任何感谢")

local UITab1 = win:Tab("作者的感谢",'16060333448')

local about = UITab1:section("作者的感谢",false)

about:Label("小依")
about:Label("是的没了")
about:Label("真的没了")

local about = UITab1:section("你的信息",false)

about:Label("你的注入器:"..identifyexecutor())
about:Label("你的账号年龄:"..player.AccountAge.."天")
about:Label("你的注入器:"..identifyexecutor())
about:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
about:Label("你现在的服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
about:Label("你现在的服务器id:"..game.GameId)
about:Label("你的用户ID:"..game.Players.LocalPlayer.UserId)
about:Label("获取客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())
about:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    about:Button("关闭脚本",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)
    
about:Label("AUG脚本")
about:Label("作者QQ：为什么要告诉你")
about:Button("点击复作者QQ群",function()
setclipboard("149437754")
end)

local UITab3 = win:Tab("ai",'16060333448')

local about = UITab3:section("ai",true)

about:Label("ai是指ai做的脚本")
about:Label("并不是我做的")

about:Button("AUGlua语言编程",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yun5555555555/srnkl/refs/heads/main/AUGlua%E8%AF%AD%E9%9F%B3%E7%BC%96%E8%BE%91.lua"))()
end)

about:Button("AUGlua语言编程",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yun5555555555/AUGLM/refs/heads/main/Protected_9318184537034016.lua"))()
end)

local UITab3 = win:Tab("通用",'16060333448')

local about = UITab3:section("通用",true)

about:Slider("步行速度!", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 1000, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

about:Slider("跳跃高度!", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 50, 1000, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)

about:Slider('设置重力', 'Sliderflag', 196.2, 196.2, 1000,false, function(Value)
        game.Workspace.Gravity = Value
    end)

about:Button("血量设置",function()
game.Players.LocalPlayer.Character.Humanoid.Health = Value
end)

about:Button("反挂机v2",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)

about:Button("死亡笔记",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
end)

about:Button("汉化穿墙",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
end)

about:Button("无限跳",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

about:Button("转圈",function()
loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
end)

about:Button("操人脚本",function()
loadstring(game:HttpGet("https://pastebin.com/raw/bzmhRgKL"))();
end)

about:Button("操b脚本", function()
  local SimpleSexGUI = Instance.new("ScreenGui") local FGUI = Instance.new("Frame") local btnNaked = Instance.new("TextButton") local btnSex = Instance.new("TextButton") local tbxVictim = Instance.new("TextBox") local lblFUCKEMALL = Instance.new("TextLabel") local ImageLabel = Instance.new("ImageLabel") local lbltitle = Instance.new("TextLabel") local TextLabel = Instance.new("TextLabel") SimpleSexGUI.Name = "SimpleSexGUI" SimpleSexGUI.Parent = game.CoreGui FGUI.Name = "FGUI" FGUI.Parent = SimpleSexGUI FGUI.BackgroundColor3 = Color3.new(255,255,255) FGUI.BorderSizePixel = 1 FGUI.Position = UDim2.new(0,0, 0.667, 0) FGUI.Size = UDim2.new(0,317, 0,271) FGUI.Draggable = true lbltitle.Name = "Title" lbltitle.Parent = FGUI lbltitle.BackgroundColor3 = Color3.new(255,255,255) lbltitle.BorderSizePixel = 1 lbltitle.Position = UDim2.new (0, 0,-0.122, 0) lbltitle.Size = UDim2.new (0, 317,0, 33) lbltitle.Visible = true lbltitle.Active = true lbltitle.Draggable = false lbltitle.Selectable = true lbltitle.Font = Enum.Font.SourceSansBold lbltitle.Text = "一个简单的操蛋脚本!!" lbltitle.TextColor3 = Color3.new(0, 0, 0) lbltitle.TextSize = 20 btnSex.Name = "Sex" btnSex.Parent = FGUI btnSex.BackgroundColor3 = Color3.new(255,255,255) btnSex.BorderSizePixel = 1 btnSex.Position = UDim2.new (0.044, 0,0.229, 0) btnSex.Size = UDim2.new (0, 99,0, 31) btnSex.Visible = true btnSex.Active = true btnSex.Draggable = false btnSex.Selectable = true btnSex.Font = Enum.Font.SourceSansBold btnSex.Text = "让我们操蛋吧!!" btnSex.TextColor3 = Color3.new(0, 0, 0) btnSex.TextSize = 20 tbxVictim.Name = "VictimTEXT" tbxVictim.Parent = FGUI tbxVictim.BackgroundColor3 = Color3.new(255,255,255) tbxVictim.BorderSizePixel = 1 tbxVictim.Position = UDim2.new (0.533, 0,0.229, 0) tbxVictim.Size = UDim2.new (0, 133,0, 27) tbxVictim.Visible = true tbxVictim.Active = true tbxVictim.Draggable = false tbxVictim.Selectable = true tbxVictim.Font = Enum.Font.SourceSansBold tbxVictim.Text = "名字" tbxVictim.TextColor3 = Color3.new(0, 0, 0) tbxVictim.TextSize = 20 lblFUCKEMALL.Name = "FUCKEMALL" lblFUCKEMALL.Parent = FGUI lblFUCKEMALL.BackgroundColor3 = Color3.new(255,255,255) lblFUCKEMALL.BorderSizePixel = 1 lblFUCKEMALL.Position = UDim2.new (0.025, 0,0.856, 0) lblFUCKEMALL.Size = UDim2.new (0, 301,0, 27) lblFUCKEMALL.Visible = true lblFUCKEMALL.Font = Enum.Font.SourceSansBold lblFUCKEMALL.Text = "操蛋和操蛋" lblFUCKEMALL.TextColor3 = Color3.new(0, 0, 0) lblFUCKEMALL.TextSize = 20 ImageLabel.Name = "ImageLabel" ImageLabel.Parent = FGUI ImageLabel.Image = "http://www.roblox.com/asset/?id=42837..." ImageLabel.BorderSizePixel = 1 ImageLabel.Position = UDim2.new (0.274, 0,0.358, 0) ImageLabel.Size = UDim2.new (0, 106,0, 121) btnSex.MouseButton1Click:Connect(function() local player = tbxVictim.Text local stupid = Instance.new('Animation') stupid.AnimationId = 'rbxassetid://148840371' hummy = game:GetService("Players").LocalPlayer.Character.Humanoid pcall(function() hummy.Parent.Pants:Destroy() end) pcall(function() hummy.Parent.Shirt:Destroy() end) local notfunny = hummy:LoadAnimation(stupid) notfunny:Play() notfunny:AdjustSpeed(10) while hummy.Parent.Parent ~= nil do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[tbxVictim.Text].Character.HumanoidRootPart.CFrame end end)
end)

about:Button("Dex抓包",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoFenHG/Dex-Explorer/refs/heads/main/Dex-Explorer.lua"))()
end)

about:Button("spy",function()
getgenv().Spy="汉化Spy" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/refs/heads/main/spy%E6%B1%89%E5%8C%96%20(1).txt"))()
end)

about:Button("位置仪",function()
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")
local copy = Instance.new("TextButton")
local pos = Instance.new("TextBox")
local find = Instance.new("TextButton")
 
--Properties:
 
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.639646292, 0, 0.399008662, 0)
Frame.Size = UDim2.new(0, 387, 0, 206)
Frame.Active = true
 
title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.BorderSizePixel = 0
title.Size = UDim2.new(0, 387, 0, 50)
title.Font = Enum.Font.GothamBold
title.Text = "位置仪"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 30.000
title.TextWrapped = true
 
copy.Name = "copy"
copy.Parent = Frame
copy.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
copy.BorderSizePixel = 0
copy.Position = UDim2.new(0.527131796, 0, 0.635922313, 0)
copy.Size = UDim2.new(0, 148, 0, 50)
copy.Font = Enum.Font.GothamSemibold
copy.Text = "复制"
copy.TextColor3 = Color3.fromRGB(255, 255, 255)
copy.TextSize = 20.000
 
pos.Name = "pos"
pos.Parent = Frame
pos.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
pos.BorderSizePixel = 0
pos.Position = UDim2.new(0.0904392749, 0, 0.305825233, 0)
pos.Size = UDim2.new(0, 317, 0, 50)
pos.Font = Enum.Font.GothamSemibold
pos.Text = ""
pos.TextColor3 = Color3.fromRGB(255, 255, 255)
pos.TextSize = 14.000
pos.TextWrapped = true
 
find.Name = "find"
find.Parent = Frame
find.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
find.BorderSizePixel = 0
find.Position = UDim2.new(0.0904392898, 0, 0.635922313, 0)
find.Size = UDim2.new(0, 148, 0, 50)
find.Font = Enum.Font.GothamSemibold
find.Text = "查找当前位置"
find.TextColor3 = Color3.fromRGB(255, 255, 255)
find.TextSize = 20.000
 
-- Scripts:
 
local function UMTQ_fake_script() -- copy.LocalScript 
	local script = Instance.new('LocalScript', copy)
 
	script.Parent.MouseButton1Click:Connect(function()
		setclipboard(script.Parent.Parent.pos.Text)
	end)
end
coroutine.wrap(UMTQ_fake_script)()
local function KJAYG_fake_script() -- Frame.Dragify 
	local script = Instance.new('LocalScript', Frame)
 
	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
	    dragToggle = nil
	    local dragSpeed = 0
	    dragInput = nil
	    dragStart = nil
	    local dragPos = nil
	    function updateInput(input)
	        local Delta = input.Position - dragStart
	        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	    end
	    Frame.InputBegan:Connect(function(input)
	        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
	            dragToggle = true
	            dragStart = input.Position
	            startPos = Frame.Position
	            input.Changed:Connect(function()
	                if input.UserInputState == Enum.UserInputState.End then
	                    dragToggle = false
	                end
	            end)
	        end
	    end)
	    Frame.InputChanged:Connect(function(input)
	        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	            dragInput = input
	        end
	    end)
	    game:GetService("UserInputService").InputChanged:Connect(function(input)
	        if input == dragInput and dragToggle then
	            updateInput(input)
	        end
	    end)
	end
 
	dragify(script.Parent)
end
coroutine.wrap(KJAYG_fake_script)()
local function EKBNYI_fake_script() -- find.LocalScript 
	local script = Instance.new('LocalScript', find)
 
	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.pos.Text = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
	end)
end
coroutine.wrap(EKBNYI_fake_script)()
end)

about:Toggle("自动互动", "Auto Interact", false, function(state)
        if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25) -- Adjust the wait time as needed
            end
        else
            autoInteract = false
        end
    end)
    
about:Button("飞车『霖溺』",function()
    loadstring(game:HttpGet("https://shz.al/~KISJS"))()
end)

about:Button("变玩家",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
end)
about:Button("骂人无违规",function()
    loadstring(game:GetObjects("rbxassetid://1262435912")[1].Source)()
end)
about:Button("阿尔宙斯UI",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
end)

about:Button("自瞄（死亡消失）",function()
loadstring(game:HttpGet("https://pastefy.app/ZYMlyhhz/raw",false))()
end)

about:Button("宙斯自瞄",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
end)

about:Button("英文自瞄",function()
loadstring(game:HttpGet("https://rentry.co/n55gmtpi/raw", true))()
end)

about:Button("自瞄50",function()
loadstring(game:HttpGet("https://pastefy.app/b3uXjRF6/raw",false))()
end)

about:Button("自瞄100",function()
loadstring(game:HttpGet("https://pastefy.app/tQrd2r0L/raw",false))()
end)

about:Button("自瞄150",function()
loadstring(game:HttpGet("https://pastefy.app/UOQWFvGp/raw",false))()
end)

about:Button("自瞄200",function()
loadstring(game:HttpGet("https://pastefy.app/b5CuDuer/raw",false))()
end)

about:Button("自瞄250",function()
loadstring(game:HttpGet("https://pastefy.app/p2huH7eF/raw",false))()
end)

about:Button("自瞄300",function()
loadstring(game:HttpGet("https://pastefy.app/nIyVhrvV/raw",false))()
end)

about:Button("自瞄350",function()
loadstring(game:HttpGet("https://pastefy.app/pnjKHMvV/raw",false))()
end)

about:Button("自瞄400",function()
loadstring(game:HttpGet("https://pastefy.app/LQuP7sjj/raw",false))()
end)

about:Button("自瞄600",function()
loadstring(game:HttpGet("https://pastefy.app/WmcEe2HB/raw",false))()
end)

about:Button("自瞄全屏",function()
loadstring(game:HttpGet("https://pastefy.app/n5LhGGgf/raw",false))()
end)

about:Button("iw指令",function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

about:Toggle("无限跳","Toggle",false,function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

about:Button("飞檐走壁",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

about:Button("踏空行走",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)
about:Button("阿尔子追",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end)

about:Button("俄州子追",function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()
end)

about:Button("汉化阿尔宙斯自瞄",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end)

about:Button("普通范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end)

about:Button("中等范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end)

about:Button("全图范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()
end)

about:Button("终极范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/CAQ9x4A7"))()
end)

about:Button("隐身（E）",function()
loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
end)

about:Button("电脑键盘",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

about:Toggle("ESP 显示名字", "AMG", ENABLED, function(enabled)
    if enabled then ENABLED = true for _, player in ipairs(Players:GetPlayers()) do onPlayerAdded(player) end Players.PlayerAdded:Connect(onPlayerAdded) Players.PlayerRemoving:Connect(onPlayerRemoving) local localPlayer = Players.LocalPlayer if localPlayer and localPlayer.Character then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end RunService.Heartbeat:Connect(function() if ENABLED then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end end) else ENABLED = false for _, player in ipairs(Players:GetPlayers()) do onPlayerRemoving(player) end RunService:UnbindFromRenderStep("move") end
end)

about:Label("下面是撸管脚本")

about:Button("15r",function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end)

about:Button("6r",function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)

about:Button("飞行",function()
loadstring(game:HttpGet("https://pastebin.com/raw/pMyEyJN6"))()
end)
about:Button("在聊天框中进行图画",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/Draw-To-Chat-Obfuscated/refs/heads/main/Draw%20to%20Chat"))()
end)

about:Button("npc秒杀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/WSbuq/-/main/killNPC"))()
end)

about:Button("穿墙(可关闭)",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
end)

about:Button("在聊天框中进行图画",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/Draw-To-Chat-Obfuscated/refs/heads/main/Draw%20to%20Chat"))()
end)

about:Button("透视1",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'),true))()
end)

about:Button("透视2",function()
loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
end)

about:Button("透视3",function()  
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
       if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
           v.Character.Humanoid.NameDisplayDistance = 9e9
           v.Character.Humanoid.NameOcclusion = "NoOcclusion"
           v.Character.Humanoid.HealthDisplayDistance = 9e9
           v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
           v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
       end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end)
    
        local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.Name = "Highlight"
        end
    end)
    
    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)
    
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
                task.wait()
            end
    end
    end)
    end)

local UITab3 = win:Tab("画质",'16060333448')

local about = UITab3:section("画质",true)

about:Button("光影", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("光影滤镜", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("超高画质",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

about:Button("光影V4",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("RTX高仿",function()
loadstring(game:HttpGet('https://pastebin.com/raw/Bkf0BJb3'))()
end)

about:Button("光影深", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("光影浅", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

local UITab8 = win:Tab("『无限Robux』",'16060333448')

local about = UITab8:section("可以用！",false)

about:Button("20Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("50Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("100Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("200Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("500Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("1000Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

local UITab4 = win:Tab("『FE』",'7734068321')

local about = UITab4:section("『FE』",true)

about:Button("FE C00lgui", function()
loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
end)

about:Button("FE 1x1x1x1", function()
loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
end)

about:Button("FE大长腿", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets'))()
end)

about:Button("FE用头", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BK4Q0DfU"))()
end)

about:Button("复仇者", function()
    loadstring(game:HttpGet(('https://pastefy.ga/iGyVaTvs/raw'),true))()
end)

about:Button("鼠标", function()
    loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()
end)

about:Button("变怪物", function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/jfryBKds"))()
end)

about:Button("香蕉枪", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/BananaGunByNerd.lua"))()
end)

about:Button("超长🐔巴", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()
end)

about:Button("操人", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/AHAJAJAKAK/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A.LUA", true))()
end)

about:Button("FE动画中心", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)

about:Button("FE变玩家", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
end)

about:Button("FE猫娘R63", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end)

about:Button("FE", function()
    loadstring(game:HttpGet('https://pastefy.ga/a7RTi4un/raw'))()
end)

local UITab3 = win:Tab("脚本合集",'16060333448')

local about = UITab3:section("脚本合集",true)

about:Button("冷脚本",function()
getgenv().Leng="冷脚本QQ群815883059" loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/lenglenglenglenglenglenglenglenglenglenglengleng-cold-script-LBT-H/refs/heads/main/LENG-cold-script-LBT-H.txt"))()
end)


about:Button("星河脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%B2%B3%E6%B5%81%E6%97%A0%E5%AF%86%E9%92%A5.lua"))()
end)

about:Button("静心脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/gggggghjjnbb/main/jdjdd"))()
end)

about:Button("脚本中心",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
end)

about:Button("皮脚本",function()
getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end)

about:Button("鱼脚本",function()
getgenv().Fish = "鱼脚本"loadstring(game:HelpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,115,104,122,46,97,108,47,126,70,105,115,104,83,99,114,105,112,116,78,101,119})end)())))();
 end)

about:Button("神经脚本",function()
loadstring(game:HttpGet("https://github.com/shenjin55/qq-927274889/raw/refs/heads/main/roblox-shen-jin.lua"))()
end)

about:Button("XA HUB",function()
loadstring(game:HttpGet("https://pastebin.com/raw/h8nC0fLb", true))()
end)

about:Button("落叶中星",function()
getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
end)

about:Button("鬼脚本",function()
ROBLOX = "GHOST_SCRIPT"GS_TEAM = "QQ群858895377"loadstring(game:HttpGet("https://raw.githubusercontent.com/Ghost-Gui-888/Ghost-Script/main/QQ858895377"))()
end)

about:Button("安脚本",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/atoyayaya/ui/main/11451411919')))()
end)

about:Button("小灵脚本",function()
XiaoLing = "小凌中心.Cocoe" loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Xiao-Ling-NEO.UI/main/%E2%82%AA%E5%B0%8F%E5%87%8C%E4%B8%AD%E5%BF%83(%E6%96%B0%E7%89%88ui).txt"))("小凌中心")("作者QQ:1211373508")
end)

about:Button("大死妈",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheer/-v4/refs/heads/main/Protected_5320244476072095.lua"))()
end)

local UITab1 = win:Tab("音乐",'7734068321')

local about = UITab1:section("音乐",true)

about:Button("防空警报", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("义勇军进行曲", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end)

about:Button("彩虹瀑布",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("火车音", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://3900067524"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("Gentry Road",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://5567523008"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("植物大战僵尸",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://158260415" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("早安越南",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://8295016126" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
      about:Button("愤怒芒西 Evade?",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://5029269312" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
      about:Button("梅西",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://7354576319" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
      about:Button("永春拳",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1845973140" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("带劲的音乐",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://18841891575" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
      about:Button("韩国国歌",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1837478300" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
      about:Button("哥哥你女朋友不会吃醋吧?",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://8715811379" 
     sound.Parent = game.Workspace 
     sound:Play()  
     end) 
     
      about:Button("蜘蛛侠出场声音",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://9108472930" 
     sound.Parent = game.Workspace 
     sound:Play()
     end) 
     
      about:Button("消防车",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://317455930" 
     sound.Parent = game.Workspace 
     sound:Play()
     end) 
     
      about:Button("万圣节1🎃",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1837467198" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("好听的",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1844125168" 
     sound.Parent = game.Workspace 
     sound:Play()
     end) 
     
 about:Button("国外音乐脚本",function()          
 loadstring(game:HttpGet(('https://pastebin.com/raw/g97RafnE'),true))()                   
end) 

   about:Button("国歌[Krx版]",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1845918434" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("妈妈生的",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6689498326" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("Music Ball-CTT",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://9045415830" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("电音",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6911766512" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("梗合集",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://8161248815" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("Its been so long",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6913550990" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("Baller",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://13530439660" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end)
   about:Button("男娘必听",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6797864253" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("螃蟹之舞",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://54100886218" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("布鲁克林惨案",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6783714255" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
   about:Button("航空模拟器音乐",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1838080629" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
local UITab18 = win:Tab("监狱人生",'7734068321')

local about = UITab18:section("监狱人生",true)

about:Toggle("自动杀所有人","text",false,function(state)
if state then
                print("Toggle On")
                isAutoKillRunning = true
                spawn(AutoKillLoop)
                spawn(AutoJump) -- Start the automatic jump function
            else
                print("Toggle Off")
                isAutoKillRunning = false
            end
end)

about:Toggle("删除门🚪","text",false,function(state)
if state then
        print("Toggle On")
        for i,v in pairs(workspace.Doors:GetChildren()) do
             v.Parent = game:service"ReplicatedStorage".nikodoors
    
        end
    else
        print("Toggle Off")
        for i,v in pairs(game:service"ReplicatedStorage".nikodoors:GetChildren()) do
            v.Parent = workspace.Doors
        end
    end
end)

about:Toggle("逮捕所有罪犯", function()
    wait(0.1)
	Player = game.Players.LocalPlayer
	Pcf = Player.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
		if v.Name ~= Player.Name then
			local i = 10
			repeat
				wait()
				i = i-1
				game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
				Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
			until i == 0
		end
	end
end)

about:Button("变成警察", function()
workspace.Remote.TeamEvent:FireServer("Bright blue");
end)

about:Button("变成囚犯", function()
workspace.Remote.TeamEvent:FireServer("Bright orange");
end)

local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
        local Character = ClosestChar()
        if Character then
            return Character.Torso, Character.Torso.Position
        end
    end

    return __namecall(self, ...)
end)
setreadonly(MT, true)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

about:Button("无敌模式",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
end)

about:Button("杀死所有人",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
end)
    
about:Button("无敌神器（拿上范围秒杀）",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
end)
    
about:Button("变钢铁侠",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
end)

about:Button("变死神",function()
        loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()
    end)
    
about:Button("变车模型",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
end)

about:Button("PRISONWARE V1.3",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
 end)
 
about:Button("红该 脚本",function()
        loadstring(game:HttpGetAsync("https://pastebin.com/raw/fYMnAEeJ"))()
end)

about:Button("Tiger脚本",function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/h17s3/TIGERADMIN/main/TIGERADMINSCRIPTFREE"), true))
end)

about:Button("Moon脚本（不知道有什么用）",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10"))()
end)

about:Button("监狱人生2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie'))()
end)

about:Button("监狱人生3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
end)

about:Button("监狱人生4",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/h17s3/TIGERADMIN/main/TIGERADMINSCRIPTFREE'),true))()
end)

local about = UITab14:section("『传送』",false)

about:Button("警卫室",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
end)

about:Button("监狱室内",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
end)

about:Button("监狱室外",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
end)

about:Button("犯罪复活点",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
end)

about:Button("传送院子", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(788.5759887695312, 97.99992370605469, 2455.056640625)
end)
about:Button("传送警车库", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.7301635742188, 98.20000457763672, 2503.56982421875)
end)
about:Button("传送死人下水道", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.4256591796875, 78.69828033447266, 2416.18359375)
end)
about:Button("传送食堂", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(921.0059204101562, 99.98993682861328, 2289.23095703125)
end)

local UITab3 = win:Tab("鱼1",'16060333448')

local about = UITab3:section("鱼1",true)

about:Button("1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
end)

about:Button("2",function()
 getgenv().Fish = "鱼脚本"loadstring(game:HelpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,115,104,122,46,97,108,47,126,70,105,115,104,83,99,114,105,112,116,78,101,119})end)())))();
end)

about:Button("3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
end)

about:Button("4",function()
loadstring(game:HttpGet("https://pastefy.app/xXwLngQD/raw"))()
end)

local UITab3 = win:Tab("俄",'16060333448')

local about = UITab3:section("俄",true)

about:Button("1",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\115\99\114\105\112\116\115\46\118\105\115\117\114\117\115\46\100\101\118\47\111\104\105\111\47\115\111\117\114\99\101"))()
end)

about:Button("2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IIIlll1ll1/Cracks/main/AdvancedLogic_Crack.lua"))()
end)

about:Button("3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mstir16/legocheats/main/archive/Ohio./script.lua"))()
end)

about:Button("4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))()
end)

about:Button("5",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/main/Games/Ohio"))()
end)

local UITab3 = win:Tab("忍者",'16060333448')

local about = UITab3:section("忍者",true)

about:Button("禁漫中心",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/jm%E5%BF%8D%E8%80%85.lua"))()
end)

about:Button("传送",function()
loadstring(game:HttpGet("https://pastebin.com/raw/UzaUDSPK"))()
end)

about:Button("忍者传奇1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/zerpqe/script/main/NinjaLegends.lua"))()
end)

about:Button("忍者传奇2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatBlueDevil/Bleus/main/Ninja%20Legends/Source.lua"))()
end)

about:Button("忍者传奇3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Zyb150933/zyb/main/123'))()
end)

about:Button("忍者传奇4",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Zyb150933/zyb/main/123'))()
end)

local UITab27 = win:Tab("极速传奇",'7734068321')

local about = UITab27:section("极速传奇",true)

about:Button("1",function()
loadstring(game:HttpGet("https://raw.githubusercontentcomTtmScripter/GoodScript/main/LegendOfSpeed(Chinese)"))()
end)

about:Button("2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/Legend-of-Speed-Auto-/main/GetPet"))()
end)

local UITab3 = win:Tab("死铁轨",'16060333448')

local about = UITab3:section("死铁轨",true)

about:Button("飞行",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Vehicle%20Fly%20Gui'))()
end)

about:Button("1",function()
loadstring(game:HttpGet("https://github.com/XiaoyeQWQ/state/raw/refs/heads/main/Dead-RailV2.lua"))()
end)

about:Button("2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/autobond"))()
end)

about:Button("3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
end)

about:Button("4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

local UITab3 = win:Tab("战争机器",'16060333448')

local about = UITab3:section("战争机器",true)

about:Label("未更新")

local UITab3 = win:Tab("活到七天",'16060333448')

local about = UITab3:section("活到七天",true)

about:Label("未更新")

local UITab3 = win:Tab("通用",'16060333448')

local about = UITab3:section("通用",true)

about:Toggle("刷新时通知", "TZ", false, function(TZ)
     _G.IE = (TZ and true or false) LatestRoom.Changed:Connect(function() if _G.IE == true then local n = ChaseStart.Value - LatestRoom.Value if 0 < n and n < 4 then Notification:Notify("请注意", "事件可能刷新于" .. tostring(n) .. " 房间","rbxassetid://17360377302",3) end end end) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.IE == true then Notify("请注意", "Rush 已刷新","rbxassetid://17360377302",3) elseif inst.Name == "AmbushMoving" and _G.IE == true then Notify("请注意", "Ambush 已刷新","rbxassetid://17360377302",3) end end)
end)
about:Toggle("自动躲避Rush/Ambush", "ADB", false, function(ADB)
    _G.Avoid = (ADB and true or false) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.Avoid == true then Notify("请注意!", "正在躲避 Rush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) elseif inst.Name == "AmbushMoving" and _G.Avoid == true then Notify("注意!", "正在躲避 Ambush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) end end)
end)
about:Toggle("无 Screech", "NCH", false, function(NCH)
    _G.NS = (NCH and true or false) workspace.CurrentCamera.ChildAdded:Connect(function(child) if child.Name == "Screech" and _G.NS == true then child:Destroy() end end)
end)
about:Button("最强汉化",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)
about:Button("最新",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
end)
about:Button("DX",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/replicator-lol/main/dor.lua"))()
end)
about:Button("RP变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)
about:Button("剪刀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
end)
about:Button("十字架",function()
loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
end)
about:Button("神圣炸弹",function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)
about:Button("吸铁石",function()
loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)
about:Button("刷怪变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
end)
about:Button("变身",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)

about:Button("DOORS目前认为最好用的",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

about:Button("自动过rooms",function()
 loadstring(game:HttpGet('\x68\x74\x74\x70\x73\x3A\x2F\x2F\x68\x2E\x6C\x6B\x6D\x63\x2E\x61\x73\x69\x61\x2F\x73\x63\x72\x69\x70\x74\x2F\x64\x6F\x6F\x72\x73\x72\x6F\x6F\x6D\x2E\x6C\x75\x61'))()
end) end)

local UITab5 = win:Tab("『Door2』",'4483345998')

local about = UITab5:section("『Door2』",true)

about:Button("DX",function()
loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/DF2RW.lua"))()
end)
about:Button("汉化",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoFenHG/DOORS/main/Hydra.txt"))()
end)
about:Button("不知名",function()
loadstring(game:HttpGet("https://github.com/DocYogurt/DOORS/raw/main/Loader.lua"))()
end)
about:Button("脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/ZS%20III", true))()
end)

local UITab3 = win:Tab("伐木",'16060333448')

local about = UITab3:section("伐木",true)

about:Button("1",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ItsEcstasy/Nightfall/main/Versions/2.10.4'))()
end)

about:Button("2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/LuaWare.lua", true))()
end)

about:Button("3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/ScriptsDache/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua", true))()
end)

about:Button("4",function()
loadstring(game:HttpGet("https://pastebin.com/raw/p9mEnV28"))()
end)

local UITab21 = win:Tab("『极速传奇』",'16060333448')

        local SGV_Tab = UITab21:section("选择传送点",false)

        SGV_Tab:Button("城市",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2002.0133056640625, 1.2624330520629883, 985.2265625)
        end)

        SGV_Tab:Button("雪城",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9675.25, 59.63568115234375, 3783.50146484375)
        end)

        SGV_Tab:Button("火山",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11052.4189453125, 217.59571838378906, 4898.76416015625)
        end)

        SGV_Tab:Button("公路",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13095.255859375, 217.59567260742188, 5905.240234375)
        end)
        
local about = UITab21:section("『修改』",false)

about:Textbox("修改经验值", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.exp.Value=arg
end)

about:Textbox("修改等级", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.level
.Value=arg
end)

about:Textbox("修改比赛数", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.leaderstats.Races.Value=arg
end)

about:Textbox("修改圈数", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.leaderstats.Hoops.Value=arg
end)

about:Textbox("修改重生", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value=arg
end)

about:Textbox("修改步数", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.leaderstats.Steps.Value=arg
end)

about:Textbox("修改尾迹容量", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.maxPetCapacity.Value=arg
end)

about:Textbox("修改宠物位数量", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.maxPetCapacity.Value=arg
end)

about:Textbox("修改宝石数量", "arg", "输入",function(arg)
game:GetService("Players").LocalPlayer.Gems.Value=arg
end)

local about = UITab21:section("『自动』",false)

about:Toggle("自动设置最大速度", "SD", false, function(SD)
    if SD then while true do game:GetService("ReplicatedStorage").rEvents.changeSpeedJumpRemote:InvokeServer("changeSpeed,math.huge")
 wait() end end
end)

about:Toggle("自动设置最大跳跃", "TY", false, function(TY)
    if TY then while true do game:GetService("ReplicatedStorage").rEvents.changeSpeedJumpRemote:InvokeServer("changeJump,math.huge")
 wait() end end
end)

local UITab43 = win:Tab("『刀刃球』",'16060333448')

local about = UITab43:section("自动",false)

about:Button("自动攻击",function()
local Debug = false -- Set this to true if you want my debug output.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9) -- A second argument in waitforchild what could it mean?
local Balls = workspace:WaitForChild("Balls", 9e9)

-- Functions

local function print(...) -- Debug print.
    if Debug then
        warn(...)
    end
end

local function VerifyBall(Ball) -- Returns nil if the ball isn't a valid projectile; true if it's the right ball.
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

local function IsTarget() -- Returns true if we are the current target.
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end

local function Parry() -- Parries.
    Remotes:WaitForChild("ParryButtonPress"):Fire()
end

-- The actual code

Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end
    
    local OldPosition = Ball.Position
    local OldTick = tick()
    
    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then -- No need to do the math if we're not being attacked.
            local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude -- Fix for .Velocity not working. Yes I got the lowest possible grade in accuplacer math.
                    
            if (Distance / Velocity) <= 10 then -- Sorry for the magic number. This just works. No, you don't get a slider for this because it's 2am.
                Parry()
            end
        end
        
        if (tick() - OldTick >= 1/60) then -- Don't want it to update too quickly because my velocity implementation is aids. Yes, I tried Ball.Velocity. No, it didn't work.
            OldTick = tick()
            OldPosition = Ball.Position
        end
    end)
end)
end)

about:Button("自动绕线",function()
getgenv().god = true
while getgenv().god and task.wait() do
    for _,ball in next, workspace.Balls:GetChildren() do
        if ball then
            if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, ball.Position)
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Highlight") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame * CFrame.new(0, 0, (ball.Velocity).Magnitude * -0.5)
                    game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
                end
            end
        end
    end
end
end)

about:Button("自动邮件",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))();
end)

about:Button("自动检测垃圾邮件",function()
getgenv().AutoDetectSpam = true

--///////////////////////////////////////////////////////////////////--

local Alive = workspace:WaitForChild("Alive", 9e9)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local ParryAttempt = Remotes:WaitForChild("ParryAttempt", 9e9)
local Balls = workspace:WaitForChild("Balls", 9e9)

--///////////////////////////////////////////////////////////////////--

local function get_ProxyPlayer()
  local Distance = math.huge
  local plrRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
  local PlayerReturn = nil
  
  for _,plr1 in pairs(Alive:GetChildren()) do
    if plr1:FindFirstChild("Humanoid") and plr1.Humanoid.Health > 50 then
      if plr1.Name ~= Player.Name and plrRP and plr1:FindFirstChild("HumanoidRootPart") then
        local magnitude = (plr1.HumanoidRootPart.Position - plrRP.Position).Magnitude
        if magnitude <= Distance then
          Distance = magnitude
          PlayerReturn = plr1
        end
      end
    end
  end
  return PlayerReturn
end

local function SuperClick()
  task.spawn(function()
    if IsAlive() and #Alive:GetChildren() > 1 then
      local args1 = 0.5
      local args2 = CFrame.new()
      local args3 = {["enzo"] = Vector3.new()}
      local args4 = {500, 500}
      
      if args1 and args2 and args3 and args4 then
        ParryAttempt:FireServer(args1, args2, args3, args4)
      end
    end
  end)
end

task.spawn(function()
  while task.wait() do
    if getgenv().SpamClickA and getgenv().AutoDetectSpam then
      SuperClick()
    end
  end
end)

local ParryCounter = 0
local DetectSpamDistance = 0

local function GetBall(ball)
  local Target = ""
  
  ball:GetPropertyChangedSignal("Position"):Connect(function()
    local PlayerPP = Player and Player.Character and Player.Character.PrimaryPart
    local NearestPlayer = get_ProxyPlayer()
    
    if ball and PlayerPP and NearestPlayer and NearestPlayer.PrimaryPart then
      local PlayerDistance = (PlayerPP.Position - NearestPlayer.PrimaryPart.Position).Magnitude
      local BallDistance = (PlayerPP.Position - ball.Position).Magnitude
      
      DetectSpamDistance = 25 + math.clamp(ParryCounter / 3, 0, 25)
      
      if ParryCounter > 2 and PlayerDistance < DetectSpamDistance and BallDistance < 55 then
        getgenv().SpamClickA = true
      else
        getgenv().SpamClickA = false
      end
    end
  end)
  ball:GetAttributeChangedSignal("target"):Connect(function()
    Target = ball:GetAttribute("target")
    local NearestPlayer = get_ProxyPlayer()
    
    if NearestPlayer then
      if Target == NearestPlayer.Name or Target == Player.Name then
        ParryCounter = ParryCounter + 1
      else
        ParryCounter = 0
      end
    end
  end)
end

for _,ball in pairs(Balls:GetChildren()) do
  if ball and not ball:GetAttribute("realBall") then
    return
  end
  
  GetBall(ball)
end

Balls.ChildAdded:Connect(function(ball)
  if not getgenv().AutoDetectSpam then
    return
  elseif ball and not ball:GetAttribute("realBall") then
    return
  end
  
  getgenv().SpamClickA = false
  ParryCounter = 0
  GetBall(ball)
end)
end)

local UITab19 = win:Tab("『鱼2』",'7734068321')

local about = UITab19:section("『鱼2』",false)

about:Button("乌托邦",function()
loadstring(game:HttpGet("https://pastefy.app/xXwLngQD/raw"))()
end)

 local SGV_Tab = UITab19:section("速度模式",false)
 
 SGV_Tab:Toggle("速度 (开/关)","开关",false,function(v)
            if v == true then
                sudu = game:GetService("RunService").Heartbeat:Connect(function()
                    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                        if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                            game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 10)
                        end
                    end
                end)
            elseif not v and sudu then
                sudu:Disconnect()
                sudu = nil
            end
        end)

        SGV_Tab:Slider('速度设置', '拉条',  1, 1, 1000,false, function(v)
            Speed = v
        end)
        local SGV_Tab = UITab19:section("水上模式",false)

        SGV_Tab:Toggle("水上行走","开关",false,function(v)
            for i,v in pairs(workspace.zones.fishing:GetChildren()) do
                if v.Name == "Ocean" then
                    v.CanCollide = Value
                end
            end
        end)
        
local SGV_Tab = UITab19:section("氧气设置",false)
 
SGV_Tab:Toggle("无限氧气","开关",false,function(Value)
            LocalPlayer.Character.client.oxygen.Disabled = Value
        end)

local SGV_Tab = UITab19:section("跳跃模式",false)

SGV_Tab:Button("无限跳跃",function()
            game:GetService("UserInputService").JumpRequest:connect(function()
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
              end)
        end)

local SGV_Tab = UITab19:section("雷达与坐标",false)

SGV_Tab:Toggle("雷达","开关",false,function(Value)
            for _, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
                if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
                    v.Enabled = Value
                end
            end
        end)

SGV_Tab:Toggle("坐标","开关",false,function(Value)
            if Value then
                local XyzClone = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()
                XyzClone.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
                local Pos = GetPosition()
                local StringInput = string.format("%s,%s,%s", ExportValue(Pos[1]), ExportValue(Pos[2]), ExportValue(Pos[3]))
                XyzClone.Text = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font>: "..StringInput
    
                BypassGpsLoop = game:GetService("RunService").Heartbeat:Connect(function() -- Line 26
                    local Pos = GetPosition()
                    StringInput = string.format("%s,%s,%s", ExportValue(Pos[1]), ExportValue(Pos[2]), ExportValue(Pos[3]))
                    XyzClone.Text = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font>: "..StringInput
                end)
            else
                if PlayerGui.hud.safezone.backpack:FindFirstChild("xyz") then
                    PlayerGui.hud.safezone.backpack:FindFirstChild("xyz"):Destroy()
                end
                if BypassGpsLoop then
                    BypassGpsLoop:Disconnect()
                    BypassGpsLoop = nil
                end
            end
        end)
 
local about = UITab19:section("『钓鱼与定身和出售』",false)

about:Button("在出生点自动钓鱼",function()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(321.46282958984375, 133.61595153808594, 268.07733154296875)

local args = {
    [1] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flimsy Rod")
}

game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.events.equip:FireServer(unpack(args))

game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flimsy Rod").events.reset:FireServer()

local args = {
    [1] = 82.00000000000003,
    [2] = 1
}

game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flimsy Rod").events.cast:FireServer(unpack(args))       
end)

about:Button("在任何地点自动钓鱼",function()
local args = {
    [1] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flimsy Rod")
}

game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.events.equip:FireServer(unpack(args))

game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flimsy Rod").events.reset:FireServer()

local args = {
    [1] = 82.00000000000003,
    [2] = 1
}

about:Toggle("定身","开关",false,function(Value)
            local oldpos = HumanoidRootPart.CFrame
            FreezeChar = Value
            task.wait()
            while WaitForSomeone(RenderStepped) do
                if FreezeChar and HumanoidRootPart ~= nil then
                    task.wait()
                    HumanoidRootPart.CFrame = oldpos
                else
                    break
                end
            end
        end)

about:Toggle("出售","开关",false,function(state)
            autoSellEnabled = state 
        if autoSellEnabled then
            
            task.spawn(function()
                while autoSellEnabled do
                    local success, err = pcall(function()
                        ReplicatedStorage:WaitForChild("events"):WaitForChild("selleverything"):InvokeServer()
                    end)
                    if not success then
                        warn(" " .. err)
                    end
                    wait(1)
                end
            end)
        end
        end)

game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flimsy Rod").events.cast:FireServer(unpack(args))       
end)    

local SGV_Tab = UITab19:section("NPC",false)

SGV_Tab:Label("必要条件1:跟梅林对话一次")
        SGV_Tab:Label("必要条件2:在阳光岛内使用")
        
        SGV_Tab:Button("传送梅林",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-930.4, 225.7, -993.9) 
        end)

        SGV_Tab:Button("购买魔法遗迹",function()
            local merlin = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power")
            merlin:InvokeServer()
        end)

        SGV_Tab:Button("购买幸运",function()
            local merlin = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck")
            merlin:InvokeServer()
        end)
 
local SGV_Tab = UITab19:section("鉴定与出售",false)

SGV_Tab:Label("必要条件:需要和检定员聊天一次")
        SGV_Tab:Button("传送鉴定员",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(449.2, 150.5, 208.9) 
        end)
        
                SGV_Tab:Button("鉴定",function()           Workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
        end)
        
        SGV_Tab:Button("出售所有鱼",function()          ReplicatedStorage:WaitForChild("events"):WaitForChild("selleverything"):InvokeServer()
        end)

        SGV_Tab:Button("出售手中鱼",function()
            workspace.world.npcs:FindFirstChild("Marc Merchant").merchant.sell:InvokeServer()
        end) 
              
local SGV_Tab = UITab19:section("传送功能", true)
  
SGV_Tab:Button("阳光石岛",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-913.630615234375, 137.29348754882812, -1129.8995361328125) 
        end)
        
        SGV_Tab:Button("罗斯利特湾",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1501.675537109375, 133, 416.2070007324219)
        end)

        
        SGV_Tab:Button("Mo木",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(382.6944580078125, 134.34976196289062, 245.103424072265625)
        end)

        
        SGV_Tab:Button("灯塔",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36.46199035644531, -246.55001831054688, 205.77120971679688)
        end)

        
        SGV_Tab:Button("魅惑祭坛",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1310.048095703125, -805.292236328125, -162.34507751464844)
        end)

        
        SGV_Tab:Button("主权雕像",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(22.098665237426758, 159.01470947265625, -1039.8543701171875)
        end)

        
        SGV_Tab:Button("蘑菇沼泽",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2442.805908203125, 130.904052734375, -686.1648559570312)
        end)

        
        SGV_Tab:Button("雪岛",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2601.7, 135.7, 2413.7)
        end)

        
        SGV_Tab:Button("特拉平岛",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(152.3716278076172, 154.91015625, 2000.9171142578125)
        end)

        
        SGV_Tab:Button("???",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1476.7, -225.7, -2349.7)
        end)

        
        SGV_Tab:Button("桦树岛",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1757.7, 142.7, -2518.7)
        end)

        
        SGV_Tab:Button("被遗弃的海岸",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2487.7, 133.7, 1553.7)
        end)

        
        SGV_Tab:Button("收割者尖刺",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1352.7, 400.7, 1579.7)
        end)

        
        SGV_Tab:Button("荒凉深渊",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-997.7, -244.7, -2718.7)
        end)

        
        SGV_Tab:Button("盐水池",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1793.7, -142.7, -3411.7)
        end)

        
        SGV_Tab:Button("火山",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1891.7, 167.7, 329.7)
        end)

        
        SGV_Tab:Button("钥匙门",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1.7, -703.7, 1229.7)
        end)

        
        SGV_Tab:Button("75万鱼竿",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1703.7, -902.7, 1433.7)
        end)

        
        SGV_Tab:Button("深度",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(976.7, -697.7, 1274.7)
        end)

        
        SGV_Tab:Button("头晕",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-118.7, -513.7, 1086.7)
        end)

        
        SGV_Tab:Button("拱门",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(999.7, 131.7, -1237.7)
        end)


    local SGV_Tab = UITab19:section("图腾模式",false)

        SGV_Tab:Button("风暴图腾",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(36.2, 132.7, 1940.7)
        end)

        SGV_Tab:Button("时间图腾",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1146.7, 134.7, -1073.7)
        end)

        SGV_Tab:Button("起风图腾",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2846.7, 178.7, 2702.7)
        end)

        SGV_Tab:Button("起雾图腾",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2793.7, 139.7, -629.7)
        end)

        SGV_Tab:Button("极光图腾",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1812.4, -136.9, -3282.1)
        end)

        SGV_Tab:Button("日蚀图腾",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5964.4, 269.9, 848.1)
        end)

        local SGV_Tab = UITab19:section("碎片模式",false)
        
        SGV_Tab:Button("橙色碎片(需要开日蚀图腾)",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6068.4, 443.9, 685.1)
        end)

        SGV_Tab:Button("青色石头",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5969.4, 274.9, 845.1)
        end)

        SGV_Tab:Button("蓝色碎片(看水下)",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5799, 135.90478515625, 402.775634765625)
        end)



        local SGV_Tab = UITab19:section("制作模式",false)
        
        SGV_Tab:Button("先点我 下去后在传送制作鱼竿台",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5956, 154.90478515625, 482.775634765625)
        end)

        SGV_Tab:Button("制作鱼竿台",function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3160, -745.90478515625, 1685.775634765625)
        end)
        
        
        local SGV_Tab = UITab19:section("亮度模式",false)
        
        SGV_Tab:Button("亮度Ⅰ",function()
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        end)

        SGV_Tab:Button("亮度Ⅱ",function()
            game.Lighting.Ambient = Color3.new(2, 2, 2)
        end)

        SGV_Tab:Button("亮度Ⅲ",function()
            game.Lighting.Ambient = Color3.new(3, 3, 3)
        end)

        local SGV_Tab = UITab19:section("隐藏模式",false)
        
        SGV_Tab:Button("隐藏头衔",function()
            local LocalPlayerName = LocalPlayer.Name
            game:GetService("ReplicatedStorage").playerstats:FindFirstChild(LocalPlayerName).Settings.nametag.Value = false
        end)

        local SGV_Tab = UITab19:section("天气模式",false)
        
        SGV_Tab:Toggle("驱雾","开关",false,function(Value)
    		if Value then
                if game:GetService("Lighting"):FindFirstChild("Sky") then
                    game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom
                end
            else
                if game:GetService("Lighting").bloom:FindFirstChild("Sky") then
                    game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")
                end
            end
        end)

        SGV_Tab:Toggle("白天","开关",false,function(Value)
    		if Value then
                DayOnlyLoop = RunService.Heartbeat:Connect(function()
                    game:GetService("Lighting").TimeOfDay = "12:00:00"
                end)
            else
                if DayOnlyLoop then
                    DayOnlyLoop:Disconnect()
                    DayOnlyLoop = nil
                end
            end
        end)
        
local UITab3 = win:Tab("大力士",'16060333448')

local about = UITab3:section("大力士",true)

about:Button("传送到开始区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.86943817138672, 11.751949310302734, -198.07127380371094)
    end)
    
about:Button("传送到健身区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93.60747528076172, 11.751947402954102, -10.266206741333008)
    end)
    
about:Button("传送到食物区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.86384582519531, 11.751947402954102, 228.9690399169922)
    end)
    
about:Button("传送到街机区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.99887084960938, 11.751949310302734, 502.90997314453125)
    end)
    
about:Button("传送到农场区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.6707763671875, 11.751947402954102, 788.5997314453125)
    end)
    
about:Button("传送到城堡区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.87281036376953, 11.84177017211914, 1139.7509765625)
    end)
    
about:Button("传送到蒸汽朋克区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92.63227081298828, 11.841767311096191, 1692.7890625)
    end)
    
about:Button("传送到迪斯科区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.69613647460938, 16.015085220336914, 2505.213134765625)
    end)
    
about:Button("传送到太空区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.42948150634766, 11.841769218444824, 3425.941650390625)
    end)
    
about:Button("传送到糖果区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.55805969238281, 11.841663360595703, 4340.69921875)
    end)
    
about:Button("送到实验室区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.00920867919922, 11.841663360595703, 5226.60205078125)
    end)
    
about:Button("传送到热带区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80.26090240478516, 12.0902681350708, 6016.16552734375)
    end)
    
about:Button("传送到恐龙区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38.4753303527832, 25.801530838012695, 6937.779296875)
    end)
    
about:Button("传送到复古区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.81867218017578, 12.89099407196045, 7901.74755859375)
    end)
    
about:Button("传送到冬季区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.47243881225586, 11.841662406921387, 8983.810546875)
    end)
    
about:Button("传送到深海区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105.36250305175781, 26.44820213317871, 9970.0849609375)
    end)
    
about:Button("传送到狂野西部区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.69414520263672, 15.108586311340332, 10938.654296875)
    end)
    
about:Button("传送到豪华公寓区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.75145721435547, 11.313281059265137, 12130.349609375)
    end)
    
about:Button("传送到宝剑战斗区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111.25597381591797, 11.408829689025879, 12945.57421875)
    end)
    
about:Button("传送到童话区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.14932250976562, 11.313281059265137, 14034.50390625)
    end)
    
about:Button("传送到桃花区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108.2142333984375, 11.813281059265137, 15131.861328125)
    end)
    
about:Button("传送到厨房区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.78338623046875, 21.76291847229004, 16204.9755859375)
    end)
    
about:Button("传送到下水道区域", function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(47.36086654663086, 12.25178050994873, 17656.04296875)
    end)
    
about:Button("超级大力士模拟器1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0strongman", true))()
end)

about:Button("超级大力士模拟器2",function()
loadstring(game:HttpGet("https://pastefy.app/aO18ZEB9/raw"))()
end)

about:Button("超级大力士模拟器3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/hngamingroblox/scripts/main/strongman%20simulator'))()
end)

about:Button("超级大力士模拟器4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0strongman", true))()
end)

local UITab3 = win:Tab("战争",'16060333448')

local about = UITab3:section("战争",true)

about:Button("战争大亨1",function()
loadstring(game:HttpGet'https://raw.githubusercontent.com/Macintosh1983/ChillHubMain/main/ChillHubOilWarfareTycoon.lua')()
end)

about:Button("战争大亨2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/War-Tycoon/main/Script"))() 
end)

about:Button("战争大亨3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/WarTycoon", true))() 
end)

about:Button("战争大亨4",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/nici002018/GNHub/master/GNHub.lua", true))()
end)

about:Button("战争大亨5",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/WarTycoon", true))()
end)

about:Button("战争大亨6",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraScript/Script/main/WarTycoon'))()
end)

about:Button("战争大亨7",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/megamoeus/UI-Engine-V2/main/OWTPublic"))()
end)