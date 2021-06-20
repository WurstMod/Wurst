local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
plr:WaitForChild("PlayerGui")
if not plr.Character then plr.CharacterAdded:Wait() end
wait(.1)

local UIS = game:GetService("UserInputService")
local Context = game:GetService("ContextActionService")
local tweens = game:GetService("TweenService")

local function log(msg)
	print("[WurstMod] " .. tostring(msg))
end
local function charCheck(char)
	return (not not char) and not not (char and char:FindFirstChild("Humanoid")) and (char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0)
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
local function findPlr(str, multiple)
	if multiple then
		if str:lower() == "me" then return {plr} end
		if str:lower() == "others" or str:lower() == "other" then
			local plrs = {}
			for _, a in pairs(game.Players:GetChildren()) do
				if a.UserId ~= plr.UserId then table.insert(plrs, a) end
			end
			return plrs
		end
		if str:lower() == "all" or str:lower() == "everyone" then return game.Players:GetChildren() end
		
		local abc = {}
		for _, p in pairs(game.Players:GetChildren()) do
			if p.Name:lower() == str:lower() or
				p.DisplayName:lower() == str:lower() or
				p.UserId == str then
				table.insert(abc, p)
			end
		end
		if #abc == 0 then return nil
		else return abc end
	else
		if str:lower() == "me" then return plr end

		for _, p in pairs(game.Players:GetChildren()) do
			for _, p in pairs(game.Players:GetChildren()) do
				if p.Name:lower() == str:lower() or
					p.DisplayName:lower() == str:lower() or
					p.UserId == str then
					return p
				end
			end
		end
	end
	
	return false
end

local settings = {
	useWeb = false
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

local events = {}
local stsEvents = {}
local ev, gui

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
modules.ZIndex = config.gui.z + #gui:GetDescendants()

local modulesList = Instance.new("Frame", modules)
modulesList.Name = "list"
modulesList.AnchorPoint = Vector2.new(0, 1)
modulesList.BackgroundTransparency = 1
modulesList.Position = UDim2.new(0, 0, 1, 0)
modulesList.Size = UDim2.new(1, 0, 0.9, 0)
modulesList.Visible = false
modulesList.ZIndex = config.gui.z + #gui:GetDescendants()

local modulesListGrid = Instance.new("UIGridLayout", modulesList)
modulesListGrid.SortOrder = Enum.SortOrder.LayoutOrder
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
description.Name = "description"
description.AnchorPoint = Vector2.new(0, 1)
description.BackgroundTransparency = 0.5
description.BackgroundColor3 = Color3.new(1, 1, 1)
description.BorderSizePixel = 0
description.Position = UDim2.new(0, 0, 0, 0)
description.Size = UDim2.new(1, 0, 0.03, 0)
description.Font = Enum.Font.Nunito
description.TextColor3 = Color3.new()
description.TextScaled = true
description.RichText = true
description.TextXAlignment = Enum.TextXAlignment.Left
description.ZIndex = config.gui.z + #gui:GetDescendants()

local modlist = Instance.new("Frame", gui)
modlist.Name = "modlist"
modlist.BackgroundTransparency = 1
modlist.Position = UDim2.new(0, 0, 0.125, 0)
modlist.Size = UDim2.new(1, 0, 0.87, 0)
modlist.ZIndex = config.gui.z + #gui:GetDescendants()

local modlistLayout = Instance.new("UIListLayout", modlist)
modlistLayout.SortOrder = Enum.SortOrder.LayoutOrder
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

local modSettings = Instance.new("Frame")
modSettings.Name = "settings"
modSettings.BackgroundTransparency = 0.6
modSettings.BorderSizePixel = 0
modSettings.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
modSettings.Position = UDim2.new(0.5, 0, 0.5, 0)
modSettings.AnchorPoint = Vector2.new(0.5, 0.5)
modSettings.Size = UDim2.new(1, 0, 0.93, 0)
modSettings.ZIndex = config.gui.z + #gui:GetDescendants()

local modSettingsList = Instance.new("UIListLayout", modSettings)
modSettingsList.SortOrder = Enum.SortOrder.LayoutOrder
modSettingsList.Padding = UDim.new()

local modSettings_title = Instance.new("TextLabel")
modSettings_title.Name = "title"
modSettings_title.BackgroundTransparency = 1
modSettings_title.Size = UDim2.new(1, 0, 0.08, 0)
modSettings_title.Font = Enum.Font.Nunito
modSettings_title.Text = "Mod"
modSettings_title.TextColor3 = Color3.new(1, 1, 1)
modSettings_title.TextScaled = true
modSettings_title.ZIndex = modSettings.ZIndex + 1

local modSettings_number = Instance.new("Frame")
modSettings_number.Name = "number"
modSettings_number.BackgroundTransparency = 1
modSettings_number.Size = UDim2.new(1, 0, 0.05, 0)
modSettings_number.ZIndex = modSettings.ZIndex + 1

local modSettings_numberTitle = Instance.new("TextLabel", modSettings_number)
modSettings_numberTitle.Name = "title"
modSettings_numberTitle.BackgroundTransparency = 1
modSettings_numberTitle.Size = UDim2.new(1, 0, 1, 0)
modSettings_numberTitle.Font = Enum.Font.Nunito
modSettings_numberTitle.TextXAlignment = Enum.TextXAlignment.Left
modSettings_numberTitle.TextColor3 = Color3.new(1, 1, 1)
modSettings_numberTitle.TextScaled = true
modSettings_numberTitle.Text = "Title"
modSettings_numberTitle.ZIndex = modSettings.ZIndex + 1

local modSettings_numberValue = Instance.new("TextBox", modSettings_number)
modSettings_numberValue.Name = "value"
modSettings_numberValue.AnchorPoint = Vector2.new(1, 0)
modSettings_numberValue.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
modSettings_numberValue.BackgroundTransparency = 0.5
modSettings_numberValue.BorderSizePixel = 0
modSettings_numberValue.Size = UDim2.new(2, 0, 1, 0)
modSettings_numberValue.Position = UDim2.new(1, 0, 0, 0)
modSettings_numberValue.SizeConstraint = Enum.SizeConstraint.RelativeYY
modSettings_numberValue.Font = Enum.Font.Nunito
modSettings_numberValue.PlaceholderText = "Int"
modSettings_numberValue.PlaceholderColor3 = Color3.fromRGB(216, 216, 216)
modSettings_numberValue.TextColor3 = Color3.new(1, 1, 1)
modSettings_numberValue.TextScaled = true
modSettings_numberValue.ZIndex = modSettings.ZIndex + 1

local modSettings_text = Instance.new("Frame")
modSettings_text.Name = "text"
modSettings_text.BackgroundTransparency = 1
modSettings_text.Size = UDim2.new(1, 0, 0.05, 0)
modSettings_text.ZIndex = modSettings.ZIndex + 1

local modSettings_textTitle = Instance.new("TextLabel", modSettings_text)
modSettings_textTitle.Name = "title"
modSettings_textTitle.BackgroundTransparency = 1
modSettings_textTitle.Size = UDim2.new(1, 0, 1, 0)
modSettings_textTitle.Font = Enum.Font.Nunito
modSettings_textTitle.TextXAlignment = Enum.TextXAlignment.Left
modSettings_textTitle.TextColor3 = Color3.new(1, 1, 1)
modSettings_textTitle.TextScaled = true
modSettings_textTitle.Text = "Title"
modSettings_textTitle.ZIndex = modSettings.ZIndex + 1

local modSettings_textValue = Instance.new("TextBox", modSettings_text)
modSettings_textValue.Name = "value"
modSettings_textValue.AnchorPoint = Vector2.new(1, 0)
modSettings_textValue.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
modSettings_textValue.BackgroundTransparency = 0.5
modSettings_textValue.BorderSizePixel = 0
modSettings_textValue.Size = UDim2.new(4, 0, 1, 0)
modSettings_textValue.Position = UDim2.new(1, 0, 0, 0)
modSettings_textValue.SizeConstraint = Enum.SizeConstraint.RelativeYY
modSettings_textValue.Font = Enum.Font.Nunito
modSettings_textValue.PlaceholderText = "Text"
modSettings_textValue.PlaceholderColor3 = Color3.fromRGB(216, 216, 216)
modSettings_textValue.TextColor3 = Color3.new(1, 1, 1)
modSettings_textValue.TextScaled = true
modSettings_textValue.ZIndex = modSettings.ZIndex + 1

local isSettings = false
local function buildSettings(mod, obj)
	isSettings = true
	local setts = modSettings:Clone()
	local title = modSettings_title:Clone()
	title.Text = mod.name
	title.LayoutOrder = 0
	title.Parent = setts
	
	local i = 1
	for k, v in pairs(obj) do
		if v.type == "number" then
			local numb = modSettings_number:Clone()
			numb.LayoutOrder = i
			numb.Name = k
			numb.title.Text = v.title
			numb.value.Text = v.value
			numb.Parent = setts

			local function set(n)
				v.value = n
				obj[k] = v
				mod.settings = obj
			end

			local ev = numb.value:GetPropertyChangedSignal("Text"):Connect(function()
				local n = string.match(numb.value.Text, "%d+")
				if numb.value.Text == "" then set(v.min) return end
				if not n then numb.value.Text = tostring(v.min) return end

				local nb = tonumber(n)
				if nb > v.max then numb.value.Text = tostring(v.max) end
				if nb < v.min then numb.value.Text = tostring(v.min) end

				set(tonumber(numb.value.Text))
			end)
			table.insert(stsEvents, ev)
		elseif v.type == "string" then
			local text = modSettings_text:Clone()
			text.LayoutOrder = i
			text.Name = k
			text.title.Text = v.title
			text.value.Text = v.value
			text.Parent = setts

			local function set(n)
				v.value = n
				obj[k] = v
				mod.settings = obj
			end

			local ev = text.value:GetPropertyChangedSignal("Text"):Connect(function()
				set(text.value.Text)
			end)
			table.insert(stsEvents, ev)
		end
		i += 1
	end
	
	setts.Parent = modules
end

local function destroySettings()
	isSettings = false
	if modules:FindFirstChild("settings") then modules.settings:Destroy() end
	modulesList.Visible = true
	for _, e in pairs(stsEvents) do
		e:Disconnect()
	end
end

local modToggle = {}
local modEvs = {}
local modDid = {}
local modTogEv = {}
local mods = {
	{
		name = "Freecam",
		id = "fcm",
		description = "Allows you to move your camera freely.",
		settings = createOptions(),
		deathDisable = true,
		data = {
			freecamGUIs = {},
			freecamCores = {
				Backpack = true,
				Health = true
			},
			freecamCamTyp = nil,
			freecamCamCF = nil,
			freecamCF = nil,
			freecamKeyboard = {
				W = 0,
				A = 0,
				S = 0,
				D = 0,
				E = 0,
				Q = 0
			}
		},
		onEnable = function(mod)
			for _, g in pairs(plr.PlayerGui:GetChildren()) do
				if g.Name == gui.Name then continue
				else
					mod.data.freecamGUIs[g] = g.Enabled
					g.Enabled = false
				end
			end
			for k, g in pairs(mod.data.freecamCores) do
				mod.data.freecamCores[k] = game.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[k])
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], false)
			end
			
			local function freecamKeyb(act, state, inp)
				mod.data.freecamKeyboard[inp.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
				return Enum.ContextActionResult.Sink
			end

			Context:BindActionAtPriority("FreecamKeyboard", freecamKeyb, false, Enum.ContextActionPriority.High.Value, 
				Enum.KeyCode.W, Enum.KeyCode.Up,
				Enum.KeyCode.A, Enum.KeyCode.Down,
				Enum.KeyCode.S, Enum.KeyCode.Space,
				Enum.KeyCode.D, Enum.KeyCode.I,
				Enum.KeyCode.E, Enum.KeyCode.O,
				Enum.KeyCode.Q, Enum.KeyCode.U
			)

			freecamCF = workspace.CurrentCamera.CFrame
			freecamCamTyp = workspace.CurrentCamera.CameraType
			freecamCamCF = workspace.CurrentCamera.CFrame
		end,
		onDisable = function(mod)
			for _, g in pairs(plr.PlayerGui:GetChildren()) do
				g.Enabled = g
			end
			for k, g in pairs(mod.data.freecamCores) do
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], g)
			end

			Context:UnbindAction("FreecamKeyboard")
			mod.data.freecamKeyboard = {
				W = 0,
				A = 0,
				S = 0,
				D = 0,
				E = 0,
				Q = 0
			}

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
				mod.data.freecamKeyboard.D - mod.data.freecamKeyboard.A,
				mod.data.freecamKeyboard.E - mod.data.freecamKeyboard.Q,
				mod.data.freecamKeyboard.S - mod.data.freecamKeyboard.W
			)

			if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then val = val * Vector3.new(0.5, 0.5, 0.5) end
			if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then val = val * Vector3.new(2, 2, 2) end

			local cf = freecamCF:ToWorldSpace(CFrame.new(val))

			workspace.CurrentCamera.CFrame = cf
			freecamCF = cf
		end,
	},
	{
		name = "NoClip",
		id = "nclp",
		extraLines = 3,
		description = "Makes your character no-clip.<br/><b>Buggy on terrain!</b><br/><b>Turn off before sitting.</b>",
		settings = createOptions(),
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
		name = "SpeedHack",
		id = "spdhck",
		description = "Allows you to change your character's speed.",
		settings = createOptions({
			speed = {
				type = "number",
				title = "Speed",
				value = 16,
				min = 1,
				max = 500,
			}
		}),
		onEnable = function(mod)
			mod.walkspeed = 0
			if not charCheck(plr.Character) then return end

			mod.walkspeed = plr.Character.Humanoid.WalkSpeed
		end,
		onDisable = function(mod)
			if not charCheck(plr.Character) then return end
			
			plr.Character.Humanoid.WalkSpeed = mod.walkspeed
		end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end

			plr.Character.Humanoid.WalkSpeed = mod.settings.speed.value
		end,
	},
	{
		name = "JumpHack",
		id = "jmphck",
		description = "Allows you to change your character's jump power.",
		settings = createOptions({
			power = {
				type = "number",
				title = "Power",
				value = 50,
				min = 1,
				max = 400,
			}
		}),
		onEnable = function(mod)
			mod.jumppower = 0
			if not charCheck(plr.Character) then return end

			mod.jumppower = plr.Character.Humanoid.JumpPower
		end,
		onDisable = function(mod)
			if not charCheck(plr.Character) then return end
			
			plr.Character.Humanoid.JumpPower = mod.jumppower
		end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end

			plr.Character.Humanoid.UseJumpPower = true
			plr.Character.Humanoid.JumpPower = mod.settings.power.value
		end,
	},
	{
		name = "TpToPlayer",
		id = "plrtp",
		description = "Teleports you to a player.",
		settings = createOptions({
			disb = {
				type = "checkbox",
				title = "Automatic Disable",
				value = false
			},
			plr = {
				type = "string",
				title = "Player",
				value = "Roblox"
			}
		}),
		onEnable = function(mod)
			local plr = findPlr(mod.settings.plr.value, false)
			if not plr then
				modDid[mod.id] = false
				modTogEv[mod.id]:Fire()
				return
			end
		end,
		onDisable = function() end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end
			local splr = findPlr(mod.settings.plr.value, false)
			if not splr or not charCheck(splr.Character) then
				modDid[mod.id] = false
				modTogEv[mod.id]:Fire()
				return
			end

			plr.Character.PrimaryPart.CFrame = splr.Character.PrimaryPart.CFrame

			if mod.settings.disb.value then
				modDid[mod.id] = false
				modTogEv[mod.id]:Fire()
				return
			end
		end,
	},
	{
		name = "Flight",
		id = "fly",
		description = "Makes you fly.",
		deathDisable = true,
		settings = createOptions({
			speed = {
				type = "number",
				title = "Fly Speed",
				value = 60,
				min = 1,
				max = 200
			}
		}),
		data = {
			flyKeyboard = {
				W = 0,
				A = 0,
				S = 0,
				D = 0,
				E = 0,
				Q = 0
			}
		},
		onEnable = function(mod)
			if not charCheck(plr.Character) then return end

			mod.isPlatform = plr.Character.Humanoid.PlatformStand
			mod.autoRot = plr.Character.Humanoid.AutoRotate
			
			local function flyKeyb(act, state, inp)
				mod.data.flyKeyboard[inp.KeyCode.Name] = state == Enum.UserInputState.Begin and mod.settings.speed.value or 0
				return Enum.ContextActionResult.Sink
			end
			
			Context:BindActionAtPriority("FreecamKeyboard", flyKeyb, false, Enum.ContextActionPriority.High.Value, 
				Enum.KeyCode.W, Enum.KeyCode.Up,
				Enum.KeyCode.A, Enum.KeyCode.Down,
				Enum.KeyCode.S, Enum.KeyCode.Space,
				Enum.KeyCode.D,
				Enum.KeyCode.E,
				Enum.KeyCode.Q
			)
			
			mod.flyVel = Instance.new("BodyVelocity")
			mod.flyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			mod.flyVel.Velocity = Vector3.new()
			mod.flyVel.Parent = plr.Character.PrimaryPart
		end,
		onDisable = function(mod)
			mod.flyVel:Destroy()
			mod.flyVel = nil
			plr.Character.Humanoid.PlatformStand = mod.isPlatform
			plr.Character.Humanoid.AutoRotate = mod.autoRot
			
			Context:UnbindAction("FreecamKeyboard")
			mod.data.flyKeyboard = {
				W = 0,
				A = 0,
				S = 0,
				D = 0,
				E = 0,
				Q = 0
			}
		end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end
			
			plr.Character.Humanoid.PlatformStand = true
			plr.Character.Humanoid.AutoRotate = false
			
			local keyb = mod.data.flyKeyboard
			local vel = CFrame.new()
			local cf = workspace.CurrentCamera.CFrame
			
			vel = vel - cf.RightVector * keyb.A		-- A
			vel = vel + cf.RightVector * keyb.D		-- D
			vel = vel - cf.LookVector * keyb.S		-- S
			vel = vel + cf.LookVector * keyb.W		-- W
			vel = vel - cf.UpVector * keyb.Q		-- Q
			vel = vel + cf.UpVector * keyb.E		-- E
			
			for _, a in pairs(plr.Character:GetChildren()) do
				if a:IsA("BasePart") then
					a.AssemblyAngularVelocity = Vector3.new()
					a.AssemblyLinearVelocity = Vector3.new()
				end
			end
			mod.flyVel.Velocity = vel.p
			plr.Character.PrimaryPart.CFrame = CFrame.new(plr.Character.PrimaryPart.Position, cf:ToWorldSpace(CFrame.new(0, 0, -999999)).p)
		end,
	}
}

log("Loaded GUI")

ev = game:GetService("RunService").Heartbeat:Connect(function()
	local isHover = false
	for _, mod in pairs(modulesList:GetChildren()) do
		if modulesList.Visible and mod:IsA("Frame") and (mouse.X >= mod.AbsolutePosition.X and mouse.X < mod.AbsolutePosition.X + mod.AbsoluteSize.X) and (mouse.Y >= mod.AbsolutePosition.Y and mouse.y < mod.AbsolutePosition.Y + mod.AbsoluteSize.Y) then
			isHover = true
			local modObj
			for _, m in pairs(mods) do
				if m.id == mod.name then modObj = m end
			end
			
			if modObj then
				description.Text = modObj.description
				local het = 0.03
				local lines = modObj.extraLines or 1
				description.Size = UDim2.new(1, 0, het * lines, 0)
			end 
		end
	end
	
	if isHover then
		description.Visible = true
		description.Position = UDim2.new(0, mouse.X, 0, mouse.Y + 36)
	else
		description.Visible = false
	end
end)
table.insert(events, ev)
ev = UIS.InputBegan:Connect(function(k)
	if k.KeyCode == Enum.KeyCode.RightControl then
		if isSettings then
			destroySettings()
		else
			modulesList.Visible = not modulesList.Visible	
		end
	end
end)
table.insert(events, ev)

-- runs modules' tick funcs etc.
ev = game:GetService("RunService").Stepped:Connect(function()
	for _, mod in pairs(mods) do
		if modToggle[mod.id] and modDid[mod.id] then
			if mod.tick then mod:tick(mod) end
		end
	end
end)
table.insert(events, ev)

for imod, mod in pairs(mods) do
	modToggle[mod.id] = false
	modEvs[mod.id] = {}
	modTogEv[mod.id] = Instance.new("BindableEvent")
	local modul = tempModule:Clone()
	modul.Name = mod.id
	modul.title.Text = mod.name
	modul.LayoutOrder = imod
	modul.Parent = modulesList
	
	local togg
	togg = function(isDeath)
		if isDeath and not charCheck(plr.Character) then return end
		modToggle[mod.id] = not modToggle[mod.id]
		modDid[mod.id] = false
		if modToggle[mod.id] then
			tweens:Create(modul, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0, 1, 0)
			}):Play()

			spawn(function()
				mod:onEnable(mod)
				modDid[mod.id] = true
			end)
			
			if mod.deathDisable then table.insert(modEvs[mod.id], plr.Character.Humanoid.Died:Connect(function()
				togg(true)
				end)) end
			
			for _, mdl in pairs(modlist:GetChildren()) do
				if mdl.Name == mod.id then
					mdl:Destroy()
				end
			end

			local mdl = modlistMod:Clone()
			mdl.Name = mod.id
			mdl.Text = mod.name
			mdl.TextTransparency = 1
			mdl.LayoutOrder = imod
			mdl.Parent = modlist
			tweens:Create(mdl, TweenInfo.new(0.2), {
				TextTransparency = 0
			}):Play()
		else
			for _, ed in pairs(modEvs[mod.id]) do ed:Disconnect() end
			tweens:Create(modul, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
			}):Play()

			spawn(function()
				mod:onDisable(mod)
				modDid[mod.id] = true
			end)
			
			for _, mdl in pairs(modlist:GetChildren()) do
				if mdl.Name == mod.id then
					spawn(function()

						local tws = tweens:Create(mdl, TweenInfo.new(0.2), {
							TextTransparency = 1
						})
						tws:Play()
						tws.Completed:Wait()
						mdl:Destroy()
					end)
				end
			end
		end
	end
	
	modul.btn.Activated:Connect(togg)
	modTogEv[mod.id].Event:Connect(togg)
	
	modul.btn.MouseButton2Click:Connect(function()
		buildSettings(mod, mod.settings)
		modulesList.Visible = false
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
