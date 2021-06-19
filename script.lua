local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
plr:WaitForChild("PlayerGui")
if not plr.Character then plr.CharacterAdded:Wait() end
wait(.1)

local UIS = game:GetService("UserInputService")
local Context = game:GetService("ContextActionService")
local tweens = game:GetService("TweenService")

local function log(msg)
	print("[WurstMod] " .. msg)
end
local function charCheck(char)
	return (not not char) and (char and char:FindFirstChild("Humanoid")) and (char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0)
end
local function createOptions(obj)
	local o = {
		keybind = {
			type = "key",
			title = "Keybind",
			value = -1
		}
	}
	
	if obj then
		for x, xd in pairs(obj) do
			o[x] = xd
		end
	end
	
	return o
end

local settings = {
	useWeb = true
}

local config = {}
config.version = "v1.0.0"
config.github = {}
config.github.name = "WurstMod/Wurst/"
config.github.branch = "main"
config.gui = {}
config.gui.name = "wurst"
config.gui.z = 1000
if settings.useWeb then config.latestVersion = game:HttpGet("https://raw.githubusercontent.com/" .. config.github.name .. config.github.branch .. "/version")
else config.latestVersion = config.version end

local freecamKeyboard = {
	W = 0,
	A = 0,
	S = 0,
	D = 0,
	E = 0,
	Q = 0
}
local freecamGUIs = {}
local freecamCores = {
	Backpack = true,
	Health = true
}
local freecamCamTyp
local freecamCamCF
local freecamCF

local function freecamKeyb(act, state, inp)
	freecamKeyboard[inp.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
	return Enum.ContextActionResult.Sink
end

local events = {}
local ev, gui

local modToggle = {}
local mods = {
	{
		name = "Freecam",
		id = "fcm",
		description = "Allows you to move your camera freely.",
		onEnable = function(mod)
			for _, g in pairs(plr.PlayerGui:GetChildren()) do
				if g.Name == gui.Name then continue
				else
					freecamGUIs[g] = g.Enabled
					g.Enabled = false
				end
			end
			for k, g in pairs(freecamCores) do
				freecamCores[k] = game.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[k])
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], false)
			end
			
			Context:BindActionAtPriority("FreecamKeyboard", freecamKeyb, false, Enum.ContextActionPriority.High.Value, 
				Enum.KeyCode.W, Enum.KeyCode.Up,
				Enum.KeyCode.A, Enum.KeyCode.Down,
				Enum.KeyCode.S,
				Enum.KeyCode.D,
				Enum.KeyCode.E,
				Enum.KeyCode.Q
			)
			
			freecamCF = workspace.CurrentCamera.CFrame
			freecamCamTyp = workspace.CurrentCamera.CameraType
			freecamCamCF = workspace.CurrentCamera.CFrame
		end,
		onDisable = function()
			for _, g in pairs(plr.PlayerGui:GetChildren()) do
				g.Enabled = g
			end
			for k, g in pairs(freecamCores) do
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], g)
			end

			Context:UnbindAction("FreecamKeyboard")
			
			local ts = tweens:Create(workspace.CurrentCamera, TweenInfo.new(0.25), {
				CFrame = freecamCamCF
			})
			ts:Play()
			ts.Completed:Wait()
			workspace.CurrentCamera.CameraType = freecamCamTyp
		end,
		tick = function(mod)
			workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

			local val = Vector3.new(
				freecamKeyboard.D - freecamKeyboard.A,
				freecamKeyboard.E - freecamKeyboard.Q,
				freecamKeyboard.S - freecamKeyboard.W
			)

			if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then val = val * Vector3.new(0.5, 0.5, 0.5) end
			if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then val = val * Vector3.new(2, 2, 2) end

			local cf = freecamCF:ToWorldSpace(CFrame.new(val))

			workspace.CurrentCamera.CFrame = cf
			freecamCF = cf
		end,
	},
	{
		name = "No-Clip",
		id = "nclp",
		description = "Makes your character no-clip.",
		onEnable = function() end,
		onDisable = function() end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end

			if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
				plr.Character.Head.CanCollide = false
				plr.Character.UpperTorso.CanCollide = false
				plr.Character.LowerTorso.CanCollide = false
				plr.Character.RightUpperArm.CanCollide = false
				plr.Character.RightLowerArm.CanCollide = false
				plr.Character.RightHand.CanCollide = false
				plr.Character.LeftUpperArm.CanCollide = false
				plr.Character.LeftLowerArm.CanCollide = false
				plr.Character.LeftHand.CanCollide = false
				plr.Character.LeftUpperLeg.CanCollide = false
				plr.Character.LeftLowerLeg.CanCollide = false
				plr.Character.LeftFoot.CanCollide = false
				plr.Character.RightUpperLeg.CanCollide = false
				plr.Character.RightLowerLeg.CanCollide = false
				plr.Character.RightFoot.CanCollide = false
			else
				plr.Character.Head.CanCollide = false
				plr.Character.Torso.CanCollide = false
				plr.Character["Right Arm"].CanCollide = false
				plr.Character["Left Arm"].CanCollide = false
				plr.Character["Right Leg"].CanCollide = false
				plr.Character["Left Leg"].CanCollide = false
			end

			plr.Character.HumanoidRootPart.CanCollide = false
		end,
	},
	{
		name = "Speedhack",
		id = "spdhck",
		description = "Allows you to change your character's speed",
		onEnable = function(mod)
			
		end,
		onDisable = function() end,
	}
}

if plr.PlayerGui:FindFirstChild(config.gui.name) then
	log("WurstMod already exists, removing")
	local disable = Instance.new("BoolValue")
	disable.Name = "disableWurst"
	disable.Parent = game.ReplicatedStorage
	repeat wait() until not plr.PlayerGui:FindFirstChild(config.gui.name)
	wait(0.1)
end

gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.DisplayOrder = config.gui.z
gui.Name = config.gui.name
gui.Enabled = true
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local title = Instance.new("Frame", gui)
title.Name = "title"
title.BackgroundTransparency = 1
title.Size = UDim2.new(0.43, 0, 0.125, 0)
title.ZIndex = config.gui.z + #gui:GetDescendants()

local titleText = Instance.new("TextLabel", title)
titleText.Name = "text"
titleText.BackgroundTransparency = 0.5
titleText.BorderSizePixel = 0
titleText.Size = UDim2.new(1, 0, 0.5, 0)
titleText.Position = UDim2.new(0, 0, 0.5, 0)
titleText.AnchorPoint = Vector2.new(0, 0.5)
titleText.TextXAlignment = Enum.TextXAlignment.Right
titleText.TextScaled = true
titleText.Font = Enum.Font.Nunito
titleText.ZIndex = config.gui.z + #gui:GetDescendants()
titleText.Text = config.version .. " - " .. config.github.branch:upper()

if config.version ~= config.latestVersion then titleText.TextColor3 = Color3.new(1, 0.5, 0)
else titleText.TextColor3 = Color3.new(0.8, 1, 0.8) end

local titleIcon = Instance.new("ImageLabel", title)
titleIcon.Name = "icon"
titleIcon.BackgroundTransparency = 1
titleIcon.AnchorPoint = Vector2.new(0, 0.5)
titleIcon.Position = UDim2.new(0, 0, 0.5, 0)
titleIcon.Size = UDim2.new(0.42, 0, 1, 0)
titleIcon.Image = "rbxassetid://6973883824"
titleIcon.ScaleType = Enum.ScaleType.Fit
titleIcon.ZIndex = config.gui.z + #gui:GetDescendants()

local modules = Instance.new("Frame", gui)
modules.Name = "modules"
modules.AnchorPoint = Vector2.new(0.5, 0.5)
modules.BackgroundTransparency = 1
modules.Position = UDim2.new(0.5, 0, 0.5, 0)
modules.Size = UDim2.new(0.45, 0, 0.96, 0)
modules.Visible = false
modules.ZIndex = config.gui.z + #gui:GetDescendants()

local modulesList = Instance.new("Frame", modules)
modulesList.Name = "list"
modulesList.AnchorPoint = Vector2.new(0, 1)
modulesList.BackgroundTransparency = 1
modulesList.Position = UDim2.new(0, 0, 1, 0)
modulesList.Size = UDim2.new(1, 0, 0.9, 0)
modulesList.ZIndex = config.gui.z + #gui:GetDescendants()

local modulesListGrid = Instance.new("UIGridLayout", modulesList)
modulesListGrid.CellPadding = UDim2.new(0, 2, 0, 2)
modulesListGrid.CellSize = UDim2.new(0.5, -2, 0.1, -2)

local tempModule = Instance.new("Frame")
tempModule.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
tempModule.BackgroundTransparency = 0.6
tempModule.BorderSizePixel = 0
tempModule.ZIndex = modulesList.ZIndex + 1

local tempModuleTitle = Instance.new("TextLabel", tempModule)
tempModuleTitle.Name = "title"
tempModuleTitle.BackgroundTransparency = 1
tempModuleTitle.AnchorPoint = Vector2.new(0.5, 0.5)
tempModuleTitle.BackgroundTransparency = 1
tempModuleTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
tempModuleTitle.Size = UDim2.new(0.85, 0, 0.8, 0)
tempModuleTitle.Font = Enum.Font.Nunito
tempModuleTitle.TextColor3 = Color3.new(1, 1, 1)
tempModuleTitle.TextScaled = true
tempModuleTitle.ZIndex = tempModule.ZIndex + 1

local tempModuleBtn = Instance.new("ImageButton", tempModule)
tempModuleBtn.Name = "btn"
tempModuleBtn.BackgroundTransparency = 1
tempModuleBtn.Image = ""
tempModuleBtn.HoverImage = ""
tempModuleBtn.Size = UDim2.new(1, 0, 1, 0)
tempModuleBtn.ZIndex = tempModuleTitle.ZIndex + 1

local description = Instance.new("TextLabel", gui)
description.AnchorPoint = Vector2.new(0, 1)
description.BackgroundTransparency = 0.5
description.BackgroundColor3 = Color3.new(1, 1, 1)
description.BorderSizePixel = 0
description.Position = UDim2.new(0, 0, 1, 0)
description.Size = UDim2.new(1, 0, 0.03, 0)
description.Font = Enum.Font.Nunito
description.TextColor3 = Color3.new()
description.TextScaled = true
description.TextXAlignment = Enum.TextXAlignment.Left
description.ZIndex = config.gui.z + #gui:GetDescendants()

local modlist = Instance.new("Frame", gui)
modlist.Name = "modlist"
modlist.BackgroundTransparency = 1
modlist.Position = UDim2.new(0, 0, 0.125, 0)
modlist.Size = UDim2.new(1, 0, 0.87, 0)
modlist.ZIndex = config.gui.z + #gui:GetDescendants()

local modlistLayout = Instance.new("UIListLayout", modlist)
modlistLayout.Padding = UDim.new(0, -5)

local modlistMod = Instance.new("TextLabel")
modlistMod.Name = "mod"
modlistMod.BackgroundTransparency = 1
modlistMod.Size = UDim2.new(1, 0, 0.05, 0)
modlistMod.Font = Enum.Font.Nunito
modlistMod.TextScaled = true
modlistMod.TextColor3 = Color3.new()
modlistMod.TextXAlignment = Enum.TextXAlignment.Left
modlistMod.ZIndex = modlist.ZIndex + 1

log("Loaded GUI")

ev = game:GetService("RunService").Heartbeat:Connect(function()
	local isHover = false
	for _, mod in pairs(modulesList:GetChildren()) do
		if modules.Visible and mod:IsA("Frame") and (mouse.X >= mod.AbsolutePosition.X and mouse.X < mod.AbsolutePosition.X + mod.AbsoluteSize.X) and (mouse.Y >= mod.AbsolutePosition.Y and mouse.y < mod.AbsolutePosition.Y + mod.AbsoluteSize.Y) then
			isHover = true
			local modObj
			for _, m in pairs(mods) do
				if m.id == mod.name then modObj = m end
			end
			
			if modObj then description.Text = modObj.description end 
		end
	end
	
	if isHover then
		description.Visible = true
	else
		description.Visible = false
	end
end)
table.insert(events, ev)
ev = UIS.InputBegan:Connect(function(k)
	if k.KeyCode == Enum.KeyCode.RightControl then
		modules.Visible = not modules.Visible
	end
end)
table.insert(events, ev)

-- runs modules' tick funcs
ev = game:GetService("RunService").Stepped:Connect(function()
	for _, mod in pairs(mods) do
		if modToggle[mod.id] then
			mod:tick(mod)
		end
	end
end)
table.insert(events, ev)

for imod, mod in pairs(mods) do
	modToggle[mod.id] = false
	local modul = tempModule:Clone()
	modul.Name = mod.id
	modul.title.Text = mod.name
	modul.LayoutOrder = imod
	modul.Parent = modulesList
	
	modul.btn.Activated:Connect(function()
		if not charCheck(plr.Character) then return end
		modToggle[mod.id] = not modToggle[mod.id]
		if modToggle[mod.id] then
			tweens:Create(modul, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0, 1, 0)
			}):Play()
			
			mod:onEnable(mod)
			
			local mdl = modlistMod:Clone()
			mdl.Name = mod.id
			mdl.Text = mod.name
			mdl.TextTransparency = 1
			mdl.Parent = modlist
			tweens:Create(mdl, TweenInfo.new(0.2), {
				TextTransparency = 0
			}):Play()
		else
			tweens:Create(modul, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
			}):Play()
			
			spawn(function()
				mod:onDisable(mod)
			end)
			
			local mdl = modlist:FindFirstChild(mod.id)
			if mdl then
				local tws = tweens:Create(mdl, TweenInfo.new(0.2), {
					TextTransparency = 1
				})
				tws:Play()
				tws.Completed:Wait()
				mdl:Destroy()
			end
		end
	end)
	log("Loaded " .. mod.name)
end
log("Loaded all modules")

repeat wait() until game.ReplicatedStorage:FindFirstChild("disableWurst")
log("Disabled")

gui:Destroy()
game.ReplicatedStorage.disableWurst:Destroy()
for _, e in pairs(events) do
	e:Disconnect()
end
