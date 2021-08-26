local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
plr:WaitForChild("PlayerGui")
if not plr.Character then plr.CharacterAdded:Wait() end

globalUrl = "https://wurst-mod.tk/"
if game:GetService("RunService"):IsStudio() then 
	http_request = game.ReplicatedStorage.postWeb
else
	getgenv().http_request = http_request or request or (http and http.request) or syn.request 
end
wait(.1)

local UIS = game:GetService("UserInputService")
local Context = game:GetService("ContextActionService")
local tweens = game:GetService("TweenService")
local texts = game:GetService("TextService")
local httpr = game:GetService("HttpService")
local coreg = game:GetService("CoreGui")

local keycodes = {["Unknown"]=0,["Backspace"]=8,["Tab"]=9,["Clear"]=12,["Return"]=13,["Pause"]=19,["Escape"]=27,["Space"]=32,["QuotedDouble"]=34,["Hash"]=35,["Dollar"]=36,["Percent"]=37,["Ampersand"]=38,["Quote"]=39,["LeftParenthesis"]=40,["RightParenthesis"]=41,["Asterisk"]=42,["Plus"]=43,["Comma"]=44,["Minus"]=45,["Period"]=46,["Slash"]=47,["Zero"]=48,["One"]=49,["Two"]=50,["Three"]=51,["Four"]=52,["Five"]=53,["Six"]=54,["Seven"]=55,["Eight"]=56,["Nine"]=57,["Colon"]=58,["Semicolon"]=59,["LessThan"]=60,["Equals"]=61,["GreaterThan"]=62,["Question"]=63,["At"]=64,["LeftBracket"]=91,["BackSlash"]=92,["RightBracket"]=93,["Caret"]=94,["Underscore"]=95,["Backquote"]=96,["A"]=97,["B"]=98,["C"]=99,["D"]=100,["E"]=101,["F"]=102,["G"]=103,["H"]=104,["I"]=105,["J"]=106,["K"]=107,["L"]=108,["M"]=109,["N"]=110,["O"]=111,["P"]=112,["Q"]=113,["R"]=114,["S"]=115,["T"]=116,["U"]=117,["V"]=118,["W"]=119,["X"]=120,["Y"]=121,["Z"]=122,["LeftCurly"]=123,["Pipe"]=124,["RightCurly"]=125,["Tilde"]=126,["Delete"]=127,["KeypadZero"]=256,["KeypadOne"]=257,["KeypadTwo"]=258,["KeypadThree"]=259,["KeypadFour"]=260,["KeypadFive"]=261,["KeypadSix"]=262,["KeypadSeven"]=263,["KeypadEight"]=264,["KeypadNine"]=265,["KeypadPeriod"]=266,["KeypadDivide"]=267,["KeypadMultiply"]=268,["KeypadMinus"]=269,["KeypadPlus"]=270,["KeypadEnter"]=271,["KeypadEquals"]=272,["Up"]=273,["Down"]=274,["Right"]=275,["Left"]=276,["Insert"]=277,["Home"]=278,["End"]=279,["PageUp"]=280,["PageDown"]=281,["LeftShift"]=304,["RightShift"]=303,["LeftMeta"]=310,["RightMeta"]=309,["LeftAlt"]=308,["RightAlt"]=307,["LeftControl"]=306,["RightControl"]=305,["CapsLock"]=301,["NumLock"]=300,["ScrollLock"]=302,["LeftSuper"]=311,["RightSuper"]=312,["Mode"]=313,["Compose"]=314,["Help"]=315,["Print"]=316,["SysReq"]=317,["Break"]=318,["Menu"]=319,["Power"]=320,["Euro"]=321,["Undo"]=322,["F1"]=282,["F2"]=283,["F3"]=284,["F4"]=285,["F5"]=286,["F6"]=287,["F7"]=288,["F8"]=289,["F9"]=290,["F10"]=291,["F11"]=292,["F12"]=293,["F13"]=294,["F14"]=295,["F15"]=296,["World0"]=160,["World1"]=161,["World2"]=162,["World3"]=163,["World4"]=164,["World5"]=165,["World6"]=166,["World7"]=167,["World8"]=168,["World9"]=169,["World10"]=170,["World11"]=171,["World12"]=172,["World13"]=173,["World14"]=174,["World15"]=175,["World16"]=176,["World17"]=177,["World18"]=178,["World19"]=179,["World20"]=180,["World21"]=181,["World22"]=182,["World23"]=183,["World24"]=184,["World25"]=185,["World26"]=186,["World27"]=187,["World28"]=188,["World29"]=189,["World30"]=190,["World31"]=191,["World32"]=192,["World33"]=193,["World34"]=194,["World35"]=195,["World36"]=196,["World37"]=197,["World38"]=198,["World39"]=199,["World40"]=200,["World41"]=201,["World42"]=202,["World43"]=203,["World44"]=204,["World45"]=205,["World46"]=206,["World47"]=207,["World48"]=208,["World49"]=209,["World50"]=210,["World51"]=211,["World52"]=212,["World53"]=213,["World54"]=214,["World55"]=215,["World56"]=216,["World57"]=217,["World58"]=218,["World59"]=219,["World60"]=220,["World61"]=221,["World62"]=222,["World63"]=223,["World64"]=224,["World65"]=225,["World66"]=226,["World67"]=227,["World68"]=228,["World69"]=229,["World70"]=230,["World71"]=231,["World72"]=232,["World73"]=233,["World74"]=234,["World75"]=235,["World76"]=236,["World77"]=237,["World78"]=238,["World79"]=239,["World80"]=240,["World81"]=241,["World82"]=242,["World83"]=243,["World84"]=244,["World85"]=245,["World86"]=246,["World87"]=247,["World88"]=248,["World89"]=249,["World90"]=250,["World91"]=251,["World92"]=252,["World93"]=253,["World94"]=254,["World95"]=255,["ButtonX"]=1000,["ButtonY"]=1001,["ButtonA"]=1002,["ButtonB"]=1003,["ButtonR1"]=1004,["ButtonL1"]=1005,["ButtonR2"]=1006,["ButtonL2"]=1007,["ButtonR3"]=1008,["ButtonL3"]=1009,["ButtonStart"]=1010,["ButtonSelect"]=1011,["DPadLeft"]=1012,["DPadRight"]=1013,["DPadUp"]=1014,["DPadDown"]=1015,["Thumbstick1"]=1016,["Thumbstick2"]=1017}

local function log(msg, typ, sub)
	if typ ~= "log" and typ ~= "warn" and typ ~= "error" then sub = typ end
	
	if not sub then sub = ""
	else sub = "-" .. sub end
	local str = string.format("[WurstMod%s] %s", sub, msg)
	
	if typ == "warn" then warn(str)
	elseif typ == "error" then error(str)
	else print(str) end
end
local function getKeyName(keyc)
	
	local inverted = {}
	for x, d in pairs(keycodes) do
		inverted[d] = x
	end
	
	return inverted[tonumber(keyc)] or "[UNKNOWN]"
end
local function charCheck(char)
	return (not not char) and not not (char and char:FindFirstChildOfClass("Humanoid")) and (char and char:FindFirstChildOfClass("Humanoid") and char.Humanoid.Health > 0)
end
local function createOptions(obj, fc)
	local o = {
		keybind = {
			type = "key",
			title = "Keybind",
			value = 0
		}
	}

	if obj then
		for x, xd in pairs(obj) do
			o[x] = xd
		end
	end
	
	if fc then fc(o) end
	
	return o
end
local function copyT(tabl)
	local copy = {}
	for k, v in pairs(tabl) do
		if type(v) == "table" then
			v = copyT(v)
		end
		copy[k] = v
	end
	return copy
end

local stringify
stringify = function(v, spaces, usesemicolon, depth)
	if type(v) ~= 'table' then
		return tostring(v)
	elseif not next(v) then
		return '{}'
	end

	spaces = spaces or 4
	depth = depth or 1

	local space = (" "):rep(depth * spaces)
	local sep = usesemicolon and ";" or ","
	local concatenationBuilder = {"{"}

	for k, x in next, v do
		table.insert(concatenationBuilder, ("\n%s[%s] = %s%s"):format(space,type(k)=='number'and tostring(k)or('"%s"'):format(tostring(k)), stringify(x, spaces, usesemicolon, depth+1), sep))
	end

	local s = table.concat(concatenationBuilder)
	return ("%s\n%s}"):format(s:sub(1,-2), space:sub(1, -spaces-1))
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

local config = {}
config.version = "v1.6.0"
config.github = {}
config.github.name = "WurstMod/Wurst/"
config.github.branch = "dev"
config.gui = {}
config.gui.name = "_SecretWMD"
config.gui.ogname = config.gui.name

local function genrnm(lng)
	local str = ""
	for i = 1, lng do str = str .. tostring(math.random(1, 9)) end
	return str
end

-- very disguised pog
config.gui.name = genrnm(15) .. config.gui.name
config.gui.z = 1000
local veru = globalUrl .. config.github.branch .. "/lVersion"
if not game:GetService("RunService"):IsStudio() then config.latestVersion = game:HttpGet(veru)
else config.latestVersion = game.ReplicatedStorage.reqWeb:InvokeServer(veru) end
-- used only for development :)

config.latestVersion = config.latestVersion:gsub(string.format("\n"), "")

local events = {}
local stsEvents = {}
local ev, gui

local function hasChildWithEnding(par, str)
	local chld = par:GetChildren()
	for _, xd in pairs(chld) do
		if xd:IsA("ScreenGui") and string.match(xd.Name, str) then
			return xd
		end
	end
	return nil
end

local chld = hasChildWithEnding(plr.PlayerGui, config.gui.ogname)
if not game:GetService("RunService"):IsStudio() then chld = chld or hasChildWithEnding(coreg, config.gui.ogname) end

if chld then
	log("WurstMod already exists, removing")
	local disable = Instance.new("BoolValue")
	disable.Name = "disableWurst"
	disable.Parent = game.ReplicatedStorage
	repeat wait() until not hasChildWithEnding(plr.PlayerGui, config.gui.ogname)
	if not game:GetService("RunService"):IsStudio() then repeat wait() until not hasChildWithEnding(coreg, config.gui.ogname) end
	wait(0.1)
end

local function draggableUI(frame, collisions)
	local offX = 0
	local offY = 0
	local isHolding = false
	
	local function getPixels(f, TP)
		local par = f.Parent
		if par:IsA("ScreenGui") then par = workspace.CurrentCamera.ViewportSize
		else par = par.AbsoluteSize end
		
		local xd = (f.Position[TP].Scale * par[TP]) + f.Position[TP].Offset
		local sz = f.AbsoluteSize[TP] * f.AnchorPoint[TP]
		return xd - sz
	end
	
	frame.Position = UDim2.new(0, getPixels(frame, "X"), 0, getPixels(frame, "Y"))
	frame.AnchorPoint = Vector2.new()

	frame.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			if not frame.Visible then return end
			offX = mouse.X - frame.Position.X.Offset
			offY = mouse.Y - frame.Position.Y.Offset
			isHolding = true
			
			while wait() do
				if not isHolding then return end

				if not frame.Visible then isHolding = false return end
				local posX = mouse.X - offX
				local posY = mouse.Y - offY

				local psX = posX / workspace.CurrentCamera.ViewportSize.X
				local psY = posY / workspace.CurrentCamera.ViewportSize.Y
				local szX = frame.AbsoluteSize.X / workspace.CurrentCamera.ViewportSize.X
				local szY = frame.AbsoluteSize.Y / workspace.CurrentCamera.ViewportSize.Y

				if collisions then
					if psX <= 0 then psX = 0 end
					if psY <= 0 then psY = 0 end
					if (psX + szX) >= 1 then psX = 1 - szX end
					if (psY + szY) >= 1 then psY = 1 - szY end
				end

				psX *= workspace.CurrentCamera.ViewportSize.X
				psY *= workspace.CurrentCamera.ViewportSize.Y
				
				tweens:Create(frame, TweenInfo.new(.5, Enum.EasingStyle.Exponential), {
					Position = UDim2.new(0, psX, 0, psY)
				}):Play()
			end
		end
	end)
	frame.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			if not frame.Visible then return end
			isHolding = false
		end
	end)
end

gui = Instance.new("ScreenGui")
gui.DisplayOrder = config.gui.z
gui.Name = config.gui.name
gui.Enabled = true
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
if game:GetService("RunService"):IsStudio() then gui.Parent = plr.PlayerGui
else gui.Parent = coreg end

--> THEME_START <--
local title = Instance.new("Frame", gui)
title.Name = "title"
title.BackgroundTransparency = 1
title.Size = UDim2.new(0.43, 0, 0.125, 0)
title.ZIndex = config.gui.z + #gui.Parent:GetDescendants()

local modal = Instance.new("TextButton", gui)
modal.Name = "modal"
modal.Visible = true
modal.Modal = false
modal.BackgroundTransparency = 1
modal.Size = UDim2.new(0, 0, 0, 0)
modal.Position = UDim2.new(-5, 0, -5, 0)

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
if config.github.branch == "dev" then titleIcon.Image = "rbxassetid://7065535337" end
titleIcon.ScaleType = Enum.ScaleType.Fit
titleIcon.ZIndex = config.gui.z + #gui:GetDescendants()

local modules = Instance.new("Frame", gui)
modules.Name = "modules"
modules.AnchorPoint = Vector2.new(0.5, 0.5)
modules.BackgroundTransparency = 1
modules.Position = UDim2.new(0.5, 0, 0.5, 0)
modules.Size = UDim2.new(0.45, 0, 0.96, 0)
modules.ZIndex = config.gui.z + #gui:GetDescendants()

local modulesList = Instance.new("ScrollingFrame", modules)
modulesList.Name = "list"
modulesList.AnchorPoint = Vector2.new(0, 1)
modulesList.BackgroundTransparency = 1
modulesList.Position = UDim2.new(0, 0, 1, 0)
modulesList.Size = UDim2.new(1, 0, 0.9, 0)

modulesList.ScrollBarThickness = 0
modulesList.ScrollBarImageTransparency = 1
modulesList.CanvasSize = UDim2.new()

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
modlistMod.TextStrokeColor3 = Color3.new(1, 1, 1)
modlistMod.TextStrokeTransparency = 0
modlistMod.TextXAlignment = Enum.TextXAlignment.Left
modlistMod.ZIndex = modlist.ZIndex + 1

local modSettings = Instance.new("ScrollingFrame")
modSettings.Name = "settings"
modSettings.BackgroundTransparency = 0.6
modSettings.BorderSizePixel = 0
modSettings.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
modSettings.Position = UDim2.new(0.5, 0, 0.5, 0)
modSettings.AnchorPoint = Vector2.new(0.5, 0.5)
modSettings.Size = UDim2.new(1, 0, 0.93, 0)
modSettings.CanvasSize = UDim2.new()
modSettings.ScrollBarThickness = 5
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

local modSettings_key = Instance.new("Frame")
modSettings_key.Name = "key"
modSettings_key.BackgroundTransparency = 1
modSettings_key.Size = UDim2.new(1, 0, 0.05, 0)
modSettings_key.ZIndex = modSettings.ZIndex + 1

local modSettings_keyTitle = Instance.new("TextLabel", modSettings_key)
modSettings_keyTitle.Name = "title"
modSettings_keyTitle.BackgroundTransparency = 1
modSettings_keyTitle.Size = UDim2.new(1, 0, 1, 0)
modSettings_keyTitle.Font = Enum.Font.Nunito
modSettings_keyTitle.TextXAlignment = Enum.TextXAlignment.Left
modSettings_keyTitle.TextColor3 = Color3.new(1, 1, 1)
modSettings_keyTitle.TextScaled = true
modSettings_keyTitle.Text = "Title"
modSettings_keyTitle.ZIndex = modSettings.ZIndex + 1

local modSettings_keyValue = Instance.new("TextButton", modSettings_key)
modSettings_keyValue.Name = "value"
modSettings_keyValue.AnchorPoint = Vector2.new(1, 0)
modSettings_keyValue.BackgroundColor3 = Color3.fromHSV(0, 0, 0.235294)
modSettings_keyValue.AutoButtonColor = false
modSettings_keyValue.BackgroundTransparency = 0.5
modSettings_keyValue.BorderSizePixel = 0
modSettings_keyValue.Size = UDim2.new(5, 0, 1, 0)
modSettings_keyValue.Position = UDim2.new(1, 0, 0, 0)
modSettings_keyValue.SizeConstraint = Enum.SizeConstraint.RelativeYY
modSettings_keyValue.Font = Enum.Font.Nunito
modSettings_keyValue.TextColor3 = Color3.new(1, 1, 1)
modSettings_keyValue.TextScaled = true
modSettings_keyValue.ZIndex = modSettings.ZIndex + 1

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

local modSettings_checkbox = Instance.new("Frame")
modSettings_checkbox.Name = "checkbox"
modSettings_checkbox.BackgroundTransparency = 1
modSettings_checkbox.Size = UDim2.new(1, 0, 0.05, 0)
modSettings_checkbox.ZIndex = modSettings.ZIndex + 1

local modSettings_checkboxTitle = Instance.new("TextLabel", modSettings_checkbox)
modSettings_checkboxTitle.Name = "title"
modSettings_checkboxTitle.BackgroundTransparency = 1
modSettings_checkboxTitle.Size = UDim2.new(1, 0, 1, 0)
modSettings_checkboxTitle.Font = Enum.Font.Nunito
modSettings_checkboxTitle.TextXAlignment = Enum.TextXAlignment.Left
modSettings_checkboxTitle.TextColor3 = Color3.new(1, 1, 1)
modSettings_checkboxTitle.TextScaled = true
modSettings_checkboxTitle.Text = "Title"
modSettings_checkboxTitle.ZIndex = modSettings.ZIndex + 1

local modSettings_checkboxValueOff = Instance.new("ImageLabel", modSettings_checkbox)
modSettings_checkboxValueOff.Name = "valueOff"
modSettings_checkboxValueOff.BackgroundTransparency = 1
modSettings_checkboxValueOff.AnchorPoint = Vector2.new(1, 0)
modSettings_checkboxValueOff.Size = UDim2.new(1, 0, 1, 0)
modSettings_checkboxValueOff.SizeConstraint = Enum.SizeConstraint.RelativeYY
modSettings_checkboxValueOff.Position = UDim2.new(1, 0, 0, 0)
modSettings_checkboxValueOff.Image = "rbxassetid://6978759624"
modSettings_checkboxValueOff.ZIndex = modSettings.ZIndex + 1

local modSettings_checkboxValueOn = Instance.new("ImageLabel", modSettings_checkbox)
modSettings_checkboxValueOn.Name = "valueOn"
modSettings_checkboxValueOn.BackgroundTransparency = 1
modSettings_checkboxValueOn.AnchorPoint = Vector2.new(1, 0)
modSettings_checkboxValueOn.Size = UDim2.new(1, 0, 1, 0)
modSettings_checkboxValueOn.SizeConstraint = Enum.SizeConstraint.RelativeYY
modSettings_checkboxValueOn.Position = UDim2.new(1, 0, 0, 0)
modSettings_checkboxValueOn.Image = "rbxassetid://6978759452"
modSettings_checkboxValueOn.Visible = false
modSettings_checkboxValueOn.ZIndex = modSettings.ZIndex + 1

local modSettings_checkboxValueHitbox = Instance.new("ImageButton", modSettings_checkbox)
modSettings_checkboxValueHitbox.Name = "hitbox"
modSettings_checkboxValueHitbox.BackgroundTransparency = 1
modSettings_checkboxValueHitbox.AnchorPoint = Vector2.new(1, 0)
modSettings_checkboxValueHitbox.Size = UDim2.new(1, 0, 1, 0)
modSettings_checkboxValueHitbox.SizeConstraint = Enum.SizeConstraint.RelativeYY
modSettings_checkboxValueHitbox.Position = UDim2.new(1, 0, 0, 0)
modSettings_checkboxValueHitbox.Image = ""
modSettings_checkboxValueHitbox.HoverImage = ""
modSettings_checkboxValueHitbox.ZIndex = modSettings.ZIndex + 2

local modSettings_choose = Instance.new("Frame")
modSettings_choose.Name = "choose"
modSettings_choose.BackgroundTransparency = 1
modSettings_choose.Size = UDim2.new(1, 0, 0.05, 0)
modSettings_choose.ZIndex = modSettings.ZIndex + 1

local modSettings_chooseTitle = Instance.new("TextLabel", modSettings_choose)
modSettings_chooseTitle.Name = "title"
modSettings_chooseTitle.BackgroundTransparency = 1
modSettings_chooseTitle.Size = UDim2.new(1, 0, 1, 0)
modSettings_chooseTitle.Font = Enum.Font.Nunito
modSettings_chooseTitle.TextXAlignment = Enum.TextXAlignment.Left
modSettings_chooseTitle.TextColor3 = Color3.new(1, 1, 1)
modSettings_chooseTitle.TextScaled = true
modSettings_chooseTitle.Text = "Title"
modSettings_chooseTitle.ZIndex = modSettings.ZIndex + 1

local modSettings_choose_option = Instance.new("Frame")
modSettings_choose_option.Name = "choose-option"
modSettings_choose_option.BackgroundTransparency = 0.4
modSettings_choose_option.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
modSettings_choose_option.Size = UDim2.new(1, 0, 0.05, 0)
modSettings_choose_option.ZIndex = modSettings.ZIndex + 1

local modSettings_choose_optionCorner = Instance.new("UICorner", modSettings_choose_option)
modSettings_choose_optionCorner.CornerRadius = UDim.new(1, 0)

local modSettings_choose_optionTitle = Instance.new("TextLabel", modSettings_choose_option)
modSettings_choose_optionTitle.Name = "title"
modSettings_choose_optionTitle.BackgroundTransparency = 1
modSettings_choose_optionTitle.Position = UDim2.new(.02, 0, 0, 0)
modSettings_choose_optionTitle.Size = UDim2.new(1, 0, 1, 0)
modSettings_choose_optionTitle.Font = Enum.Font.Nunito
modSettings_choose_optionTitle.TextXAlignment = Enum.TextXAlignment.Left
modSettings_choose_optionTitle.TextColor3 = Color3.new(1, 1, 1)
modSettings_choose_optionTitle.TextScaled = true
modSettings_choose_optionTitle.Text = "Title"
modSettings_choose_optionTitle.ZIndex = modSettings.ZIndex + 1

local modSettings_choose_optionHitbox = Instance.new("ImageButton", modSettings_choose_option)
modSettings_choose_optionHitbox.Name = "hitbox"
modSettings_choose_optionHitbox.BackgroundTransparency = 1
modSettings_choose_optionHitbox.Size = UDim2.new(1, 0, 1, 0)
modSettings_choose_optionHitbox.Image = ""
modSettings_choose_optionHitbox.HoverImage = ""
modSettings_choose_optionHitbox.ZIndex = modSettings.ZIndex + 2

local liveYTChat = Instance.new("Frame", gui)
liveYTChat.BackgroundTransparency = 0.15
liveYTChat.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
liveYTChat.Name = "ytchat"
liveYTChat.AnchorPoint = Vector2.new(0, 1)
liveYTChat.Size = UDim2.new(0.35, 0, 0.5, 0)
liveYTChat.Position = UDim2.new(0, 0, 1, 0)
liveYTChat.ClipsDescendants = true
liveYTChat.ZIndex = config.gui.z + #gui:GetDescendants()
liveYTChat.Visible = false

draggableUI(liveYTChat, true)

local liveYTChatUICorner = Instance.new("UICorner", liveYTChat)
liveYTChatUICorner.CornerRadius = UDim.new(0, 15)

local liveYTChat_list = Instance.new("UIListLayout", liveYTChat)
liveYTChat_list.Name = "list"
liveYTChat_list.FillDirection = Enum.FillDirection.Vertical
liveYTChat_list.HorizontalAlignment = Enum.HorizontalAlignment.Left
liveYTChat_list.SortOrder = Enum.SortOrder.LayoutOrder
liveYTChat_list.VerticalAlignment = Enum.VerticalAlignment.Bottom

local liveYTChat_msg = Instance.new("Frame")
liveYTChat_msg.BackgroundTransparency = 1
liveYTChat_msg.Size = UDim2.new(1, 0, 0.125, 0)
liveYTChat_msg.ZIndex = config.gui.z + #gui:GetDescendants()

local liveYTChat_msg_text = Instance.new("TextLabel", liveYTChat_msg)
liveYTChat_msg_text.Name = "text"
liveYTChat_msg_text.BackgroundTransparency = 1
liveYTChat_msg_text.Size = UDim2.new(0.85, 0, 1, 0)
liveYTChat_msg_text.Position = UDim2.new(0.15, 0, 0, 0)
liveYTChat_msg_text.Font = Enum.Font.Nunito
liveYTChat_msg_text.RichText = true
liveYTChat_msg_text.TextColor3 = Color3.new(1, 1, 1)
liveYTChat_msg_text.TextScaled = true
liveYTChat_msg_text.TextStrokeColor3 = Color3.new(1, 1, 1)
liveYTChat_msg_text.TextStrokeTransparency = 1
liveYTChat_msg_text.TextXAlignment = Enum.TextXAlignment.Left
liveYTChat_msg_text.TextYAlignment = Enum.TextYAlignment.Bottom
liveYTChat_msg_text.ZIndex = liveYTChat_msg.ZIndex + 1

local liveYTChat_msg_avatar = Instance.new("Frame", liveYTChat_msg)
liveYTChat_msg_avatar.Name = "avatar"
liveYTChat_msg_avatar.Size = UDim2.new(0.08, 0, 0.08, 0)
liveYTChat_msg_avatar.Position = UDim2.new(0.035, 0, 0, 0)
liveYTChat_msg_avatar.SizeConstraint = Enum.SizeConstraint.RelativeXX
liveYTChat_msg_avatar.BackgroundTransparency = 1
liveYTChat_msg_avatar.ZIndex = liveYTChat_msg_text.ZIndex + 1

local liveYTChat_msg_avatar_UIGridLayout = Instance.new("UIGridLayout", liveYTChat_msg_avatar)
liveYTChat_msg_avatar_UIGridLayout.CellPadding = UDim2.new()
liveYTChat_msg_avatar_UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
liveYTChat_msg_avatar_UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
liveYTChat_msg_avatar_UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder

local waypointBLB = Instance.new("BillboardGui")
waypointBLB.Name = "waypoint_name"
waypointBLB.AlwaysOnTop = true
waypointBLB.MaxDistance = math.huge
waypointBLB.Enabled = true
waypointBLB.ResetOnSpawn = false
waypointBLB.Size = UDim2.new(0, 100, 0, 100)
waypointBLB.StudsOffset = Vector3.new(0, 3, 0)

local waypointBLB_frame = Instance.new("TextLabel", waypointBLB)
waypointBLB_frame.Name = "distance"
waypointBLB_frame.AnchorPoint = Vector2.new(0.5, 1)
waypointBLB_frame.BorderSizePixel = 0
waypointBLB_frame.Position = UDim2.new(0.5, 0, 1, 0)
waypointBLB_frame.Size = UDim2.new(0.5, 0, 0.5, 0)
waypointBLB_frame.Font = Enum.Font.Nunito
waypointBLB_frame.TextColor3 = Color3.new(1, 1, 1)
waypointBLB_frame.TextScaled = true
waypointBLB_frame.Text = "0m"
waypointBLB_frame.ZIndex = 1

local waypointBLB_frameUICorner = Instance.new("UICorner", waypointBLB_frame)
waypointBLB_frameUICorner.CornerRadius = UDim.new(0.25, 0)

local waypointBLB_title = Instance.new("TextLabel", waypointBLB)
waypointBLB_title.Name = "title"
waypointBLB_title.BackgroundTransparency = 1
waypointBLB_title.Position = UDim2.new(0, 0, 0.25, 0)
waypointBLB_title.Size = UDim2.new(1, 0, 0.25, 0)
waypointBLB_title.Font = Enum.Font.Nunito
waypointBLB_title.TextColor3 = Color3.new(1, 1, 1)
waypointBLB_title.Text = "Title"
waypointBLB_title.TextScaled = true
waypointBLB_title.ZIndex = 2
--> THEME_END <--

local function drawImage(fram, data)
	local dt = data
	if type(dt) == "string" then
		local dtt = {
			Url = data,
			Method = "GET",
		}
		
		local dat
		if game:GetService("RunService"):IsStudio() then dat = game.ReplicatedStorage.postWeb:InvokeServer(dtt)
		else dat = http_request(dtt) end
		dt = httpr:JSONDecode(dat.Body)
	end
	
	fram:FindFirstChildOfClass("UIGridLayout").CellSize = UDim2.new(1 / dt.width, 0, 1 / dt.height, 0)
	
	for i, d in pairs(dt.data) do
		local fr = Instance.new("Frame")
		fr.BackgroundColor3 = Color3.fromRGB(d[1], d[2], d[3])
		fr.BorderSizePixel = 0
		fr.BackgroundTransparency = 1 - (d[4] / 255)
		local yY = i / dt.width
		local y = math.floor(yY)
		local x = i - (y * dt.width)
		fr.Name = x .. "x" .. y
		fr.LayoutOrder = i
		fr.ZIndex = fram.ZIndex + 1
		fr.Parent = fram

		--if yY == y then wait() end
	end
	
	return dt
end

local isSettings = false
local isChangingKeybinds = false
local mods = {}
local wmod = {
	name = "WurstMod",
	id = "wmod",
	settings = {
		save2cloud = {
			type = "checkbox",
			title = "Save to cloud",
			value = true
		}
	}
}

local function saveSettings()
	if not wmod.settings.save2cloud.value then return end
	local combined = {}
	for _, x in pairs(mods) do table.insert(combined, {
		id = x.id,
		settings = x.settings
	}) end
	local dat = {
		Url = globalUrl .. "api/setSettings?uid=" .. plr.UserId,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = httpr:JSONEncode({
			data = combined
		})
	}
	
	if game:GetService("RunService"):IsStudio() then http_request:InvokeServer(dat)
	else http_request(dat) end
end
local function getSettings()
	local r, u = nil, globalUrl .. "api/getSettings?uid=" .. plr.UserId
	if game:GetService("RunService"):IsStudio() then r = game.ReplicatedStorage.reqWeb:InvokeServer(u)
	else r = game:HttpGet(u) end
	return httpr:JSONDecode(r)
end

local function findByKey(o, k, v)
	local obj
	for _, a in pairs(o) do
		if a[k] and a[k] == v then obj = a end
	end
	return obj
end

local settingCache = {}
local function buildSettings(mod, obj)
	settingCache[mod.id] = copyT(obj)
	isSettings = true
	local setts = modSettings:Clone()
	local title = modSettings_title:Clone()
	title.Text = mod.name
	title.LayoutOrder = 0
	title.Parent = setts
	local ID = Instance.new("StringValue", setts)
	ID.Name = "ID"
	ID.Value = mod.id
	
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
		elseif v.type == "checkbox" then
			local check = modSettings_checkbox:Clone()
			check.LayoutOrder = i
			check.Name = k
			check.title.Text = v.title
			check.valueOff.Visible = not v.value
			check.valueOn.Visible = v.value
			check.Parent = setts

			local function set(n)
				v.value = n
				obj[k] = v
				mod.settings = obj
			end

			local ev = check.hitbox.Activated:Connect(function()
				v.value = not v.value
				check.valueOff.Visible = not v.value
				check.valueOn.Visible = v.value
				set(v.value)
			end)
			table.insert(stsEvents, ev)
		elseif v.type == "key" then
			local function getKeybinds()
				local keybinds = {}

				for _, md in pairs(mods) do
					if md == mod then continue end
					for _, sts in pairs(md.settings) do
						if sts.type == "key" and sts.value ~= 0 then table.insert(keybinds, sts.value) end
					end
				end

				return keybinds
			end
			local function getColor(kbs, vl)
				if table.find(kbs, vl) then return Color3.new(1, 0, 0)
				else return Color3.new(1, 1, 1) end
			end

			local key = modSettings_key:Clone()
			key.LayoutOrder = i
			key.Name = k
			key.title.Text = v.title
			key.value.Text = getKeyName(v.value)
			key.value.TextColor3 = getColor(getKeybinds(), v.value)
			key.Parent = setts

			local ev, evv
			local tooched = false
			ev = key.value.Activated:Connect(function()
				tooched = not tooched

				if tooched then
					isChangingKeybinds = true
					key.value.BackgroundColor3 = Color3.fromHSV(0.333333, 1, 0.470588)
					key.value.Text = "Waiting for Input..."
					key.value.TextColor3 = Color3.fromRGB(216, 216, 216)

					evv = UIS.InputBegan:Connect(function(kb, ch)
						if ch then return end
						if kb.UserInputType ~= Enum.UserInputType.Keyboard then return end
						
						local val = kb.KeyCode.Value
						if val == Enum.KeyCode.RightControl.Value then val = 0 end

						if evv then evv:Disconnect() end
						local kebs = getKeybinds()

						v.value = val
						key.value.TextColor3 = Color3.new(1, 1, 1)
						key.value.Text = getKeyName(v.value)
						key.value.TextColor3 = getColor(kebs, v.value)
						key.value.BackgroundColor3 = Color3.fromHSV(0, 0, 0.235294)
						tooched = not tooched
						wait(0.2)
						if not tooched then isChangingKeybinds = false end
					end)
					table.insert(stsEvents, evv)
				else
					isChangingKeybinds = false
					if evv then evv:Disconnect() end
					key.value.TextColor3 = Color3.new(1, 1, 1)
					key.value.Text = getKeyName(v.value)
					key.value.TextColor3 = getColor(getKeybinds(), v.value)
					key.value.BackgroundColor3 = Color3.fromHSV(0, 0, 0.235294)
				end
			end)
			table.insert(stsEvents, ev)
		elseif v.type == "choose" then
			local choose = modSettings_choose:Clone()
			choose.LayoutOrder = i
			choose.Name = k
			choose.title.Text = v.title
			choose.Parent = setts
			
			local lol = {}
			
			local function choose(kk)
				for i, xd in pairs(lol) do
					local lol = 0.2
					if i == kk then tweens:Create(xd, TweenInfo.new(lol), { BackgroundColor3 = Color3.fromRGB(195, 195, 195) }):Play()
					else tweens:Create(xd, TweenInfo.new(lol), { BackgroundColor3 = Color3.fromRGB(60, 60, 60) }):Play() end
				end
				v.value = kk
			end
			
			for ii, vv in pairs(v.options) do
				i += 1
				local opt = modSettings_choose_option:Clone()
				table.insert(lol, opt)
				opt.LayoutOrder = i
				opt.Name = k .. "-" .. ii
				opt.title.Text = vv
				if v.value == ii then opt.BackgroundColor3 = Color3.fromRGB(195, 195, 195)
				else opt.BackgroundColor3 = Color3.fromRGB(60, 60, 60) end
				opt.Parent = setts
				
				ev = opt.hitbox.Activated:Connect(function()
					choose(ii)
				end)
				table.insert(stsEvents, ev)
			end
		end
		i += 1
	end
	
	setts.Parent = modules
end

local function destroySettings()
	isSettings = false
	if modules:FindFirstChild("settings") then
		spawn(function()
			local ID = modules.settings.ID.Value
			spawn(function()
				local mod = findByKey(mods, "id", ID)
				local str1 = stringify(settingCache[mod.id])
				local str2 = stringify(mod.settings)
				
				if mod and str1 ~= str2 then
					saveSettings()	
				end
			end)
			modules.settings:Destroy()
			modulesList.Visible = true
		end)
	end
	for _, e in pairs(stsEvents) do
		e:Disconnect()
	end
end

local mm2Data = {
	sherrif = nil,
	murderer = nil,
	
	identified = false,
	round = false
}
local mm2Evs = {
	notifications = Instance.new("BindableEvent")
}

if game.PlaceId == 142823291 then
	local tmr = game.ReplicatedStorage.GetTimer:InvokeServer()
	
	local tev
	local ttevs = {}
	local tevs = {}

	local function dod()
		for _, xd in pairs(tevs) do
			for _, xx in pairs(xd) do
				xx:Disconnect()
			end
		end
		for _, xd in pairs(ttevs) do
			xd:Disconnect()
		end
		
		local function check(splr)
			tevs[splr.UserId] = {}
			local function thing(x)
				if x.Name == "Gun" and mm2Data.sherrif ~= splr then
					mm2Data.sherrif = splr
					mm2Evs.notifications:Fire("RoleNotifications", splr.Name .. " is now the Sherrif!", game.Players:GetUserThumbnailAsync(splr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100), 120)
				elseif x.Name == "Knife" and mm2Data.murderer ~= splr then
					mm2Data.murderer = splr
					mm2Evs.notifications:Fire("RoleNotifications", splr.Name .. " is now the Murderer!", game.Players:GetUserThumbnailAsync(splr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100), 120)
				end
			end

			for _, x in pairs(splr:WaitForChild("Backpack"):GetChildren()) do
				thing(x)
			end
			tev = splr:WaitForChild("Backpack").ChildAdded:Connect(function(x)
				thing(x)
			end)
			table.insert(tevs[splr.UserId], tev)
			local function cch(chr)
				if not chr then return end
				tev = chr.ChildAdded:Connect(function(x)
					thing(x)
				end)
				table.insert(tevs[splr.UserId], tev)
				table.insert(events, tev)

				for _, x in pairs(chr:GetChildren()) do
					thing(x)
				end
			end
			cch(splr.Character)
			tev = splr.CharacterAdded:Connect(cch)
			table.insert(tevs[splr.UserId], tev)
			table.insert(events, tev)
		end

		for _, splr in pairs(game.Players:GetChildren()) do
			check(splr)
		end

		tev = game.Players.PlayerAdded:Connect(check)
		table.insert(ttevs, tev)
		tev = game.Players.PlayerRemoving:Connect(function(splr)
			wait()
			for _, e in pairs(tevs[splr.UserId]) do
				e:Disconnect()
			end
			tevs[splr.UserId] = nil
		end)
		table.insert(ttevs, tev)
	end
	
	if tmr < 0 then
		mm2Evs.notifications:Fire("RoleNotifications", "There's currently no ongoing round")
		mm2Data.round = false
		mm2Data.sherrif = nil
		mm2Data.murderer = nil
		mm2Data.identified = true
	else
		mm2Evs.notifications:Fire("RoleNotifications", "The round is currently ongoing")
		mm2Data.round = true
		mm2Data.identified = true
	end
	
	game.ReplicatedStorage.Remotes.Gameplay.RoundEndFade.OnClientEvent:Connect(function()
		mm2Evs.notifications:Fire("RoleNotifications", "The round has ended")
		mm2Data.round = false
		mm2Data.sherrif = nil
		mm2Data.murderer = nil
		mm2Data.identified = true
	end)
	game.ReplicatedStorage.RoundStart.OnClientEvent:Connect(function()
		mm2Evs.notifications:Fire("RoleNotifications", "The round has started")
		dod()
		mm2Data.round = true
		mm2Data.identified = true
	end)
	
	dod()
end

local modTick = {}
local modToggle = {}
local modEvs = {}
local modDid = {}
local modTogEv = {}
mods = {
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
			},
			lastPos = Vector3.new(),
			delta = Vector2.new(),
			camX = 0,
			camY = 0
		},
		onEnable = function(mod)
			for _, g in pairs(plr.PlayerGui:GetChildren()) do
				if g.Name == gui.Name or not g:IsA("ScreenGui") then continue
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
			local function freecamMouseWheel(act, state, inp)
				tweens:Create(workspace.CurrentCamera, TweenInfo.new(0.13, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					FieldOfView = workspace.CurrentCamera.FieldOfView - (inp.Position.Z * 3) 
				}):Play()
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
			Context:BindActionAtPriority("FreecamMouseWheel", freecamMouseWheel, false, Enum.ContextActionPriority.High.Value, Enum.UserInputType.MouseWheel)

			mod.data.freecamCF = workspace.CurrentCamera.CFrame
			mod.data.freecamOffset = workspace.CurrentCamera.CFrame.p - plr.Character.PrimaryPart.CFrame.p
			mod.data.freecamOrt = Vector3.new(workspace.CurrentCamera.CFrame:ToEulerAnglesXYZ())
			mod.data.freecamZoom = workspace.CurrentCamera.FieldOfView
			mod.data.freecamCamTyp = workspace.CurrentCamera.CameraType
			mod.data.freecamCamCF = workspace.CurrentCamera.CFrame

			mod.data.camX = math.deg(mod.data.freecamOrt.Y)
			mod.data.camY = math.deg(mod.data.freecamOrt.X)
		end,
		onDisable = function(mod)
			for g, v in pairs(mod.data.freecamGUIs) do
				g.Enabled = v
			end
			for k, g in pairs(mod.data.freecamCores) do
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], g)
			end

			Context:UnbindAction("FreecamKeyboard")
			Context:UnbindAction("FreecamMouseWheel")
			mod.data.freecamKeyboard = {
				W = 0,
				A = 0,
				S = 0,
				D = 0,
				E = 0,
				Q = 0
			}
			mod.data.camY = 0
			mod.data.camX = 0
			local rto = mod.data.freecamOrt

			local ts = tweens:Create(workspace.CurrentCamera, TweenInfo.new(0.25), {
				CFrame = CFrame.new(plr.Character.PrimaryPart.CFrame.p + mod.data.freecamOffset) * CFrame.Angles(rto.X, rto.Y, rto.Z)
			})
			local ts2 = tweens:Create(workspace.CurrentCamera, TweenInfo.new(0.25), {
				FieldOfView = mod.data.freecamZoom
			})
			ts:Play()
			ts2:Play()
			ts.Completed:Wait()
			workspace.CurrentCamera.CameraType = mod.data.freecamCamTyp
		end,
		tick = function(mod)
			workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
			UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
			
			local thing = (workspace.CurrentCamera.FieldOfView / 70) / 1.75
			local val = Vector3.new(
				mod.data.freecamKeyboard.D - mod.data.freecamKeyboard.A,
				mod.data.freecamKeyboard.E - mod.data.freecamKeyboard.Q,
				mod.data.freecamKeyboard.S - mod.data.freecamKeyboard.W
			) * Vector3.new(1.1 + thing, 1.1 + thing, 1.1 + thing)

			if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then val = val * Vector3.new(0.5, 0.5, 0.5) end
			if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then val = val * Vector3.new(2, 2, 2) end
			
			local sens = 0.2 + thing
			
			local delta = UIS:GetMouseDelta()
			local dx = delta.X * sens
			local dy = delta.Y * sens
			
			mod.data.camX = mod.data.camX - dx * 0.4
			mod.data.camY = math.clamp(mod.data.camY - dy * 0.4, -90, 90)
			
			local cf
			cf = mod.data.freecamCF:ToWorldSpace(CFrame.new(val))
			cf = CFrame.new(cf.p) * CFrame.Angles(0, math.rad(mod.data.camX), 0) * CFrame.Angles(math.rad(mod.data.camY), 0, 0)

			workspace.CurrentCamera.CFrame = cf
			mod.data.freecamCF = cf
		end,
	},
	{
		name = "NoClip",
		id = "nclp",
		extraLines = 3,
		description = "Makes your character no-clip.\n<b>Buggy on terrain!</b>\n<b>Turn off before sitting.</b>",
		settings = createOptions(),
		onEnable = function() end,
		onDisable = function() end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end
			
			for _, p in pairs(plr.Character:GetChildren()) do
				if p:IsA("BasePart") then p.CanCollide = false; p.CanTouch = false end
			end
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
			local splr = findPlr(mod.settings.plr.value, false)
			if not splr then
				mod:disable()
				return
			end
		end,
		onDisable = function() end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end
			local splr = findPlr(mod.settings.plr.value, false)
			if not splr or not charCheck(splr.Character) then
				mod:disable()
				return
			end

			plr.Character.PrimaryPart.CFrame = splr.Character.PrimaryPart.CFrame

			if mod.settings.disb.value then
				mod:disable()
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
				max = 50000
			},
			altDir = {
				type = "checkbox",
				title = "ALT Directions",
				value = false
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
			
			Context:BindActionAtPriority("FlyKeyboard", flyKeyb, false, Enum.ContextActionPriority.High.Value, 
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
			
			Context:UnbindAction("FlyKeyboard")
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
			plr.Character.Humanoid.AutoRotate = true
			
			local keyb = mod.data.flyKeyboard
			local vel = CFrame.new()
			local cf = workspace.CurrentCamera.CFrame
			local ogcf = cf
			
			if mod.settings.altDir.value then
				local abc = plr.Character.PrimaryPart:Clone()
				abc.CFrame = cf -- I'm smart
				abc.Orientation = Vector3.new(0, abc.Orientation.Y, 0)
				cf = abc.CFrame
				abc:Destroy()
				abc = nil
			end
			vel = vel - cf.RightVector * keyb.A			-- A
			vel = vel + cf.RightVector * keyb.D			-- D
			vel = vel - cf.LookVector * keyb.S			-- S
			vel = vel + cf.LookVector * keyb.W			-- W
			
			vel = vel - Vector3.new(0, 1, 0) * keyb.Q	-- Q
			vel = vel + Vector3.new(0, 1, 0) * keyb.E	-- Q
			
			cf = ogcf
			
			for _, a in pairs(plr.Character:GetChildren()) do
				if a:IsA("BasePart") then
					a.AssemblyAngularVelocity = Vector3.new()
					a.AssemblyLinearVelocity = Vector3.new()
				end
			end
			tweens:Create(mod.flyVel, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
				Velocity = vel.p
			}):Play()
			plr.Character.PrimaryPart.CFrame = CFrame.new(plr.Character.PrimaryPart.Position, cf:ToWorldSpace(CFrame.new(0, 0, -999999)).p)
		end,
	},
	{
		name = "Sit",
		id = "sit",
		description = "Makes you sit.",
		settings = createOptions(),
		onEnable = function(mod)
			if not charCheck(plr.Character) then return end
			
			mod.isSit = plr.Character.Humanoid.Sit 
		end,
		onDisable = function(mod)
			plr.Character.Humanoid.Sit = mod.isSit 	
		end,
		tick = function()
			if not charCheck(plr.Character) then return end
			
			plr.Character.Humanoid.Sit = true
		end,
	},
	{
		name = "Spectate",
		id = "spct",
		description = "Makes you spectate another player.",
		deathDisable = true,
		settings = createOptions({
			plr = {
				type = "string",
				title = "Player",
				value = "Roblox"
			}
		}),
		onEnable = function(mod)
			mod.defType = workspace.CurrentCamera.CameraType
			mod.defSubj = workspace.CurrentCamera.CameraSubject
			
			local splr = findPlr(mod.settings.plr.value, false)
			if not splr then
				mod:disable()
				return
			end
		end,
		onDisable = function(mod)
			workspace.CurrentCamera.CameraType = mod.defType 
			workspace.CurrentCamera.CameraSubject = mod.defSubj 
		end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end
			local splr = findPlr(mod.settings.plr.value)
			if not splr or not charCheck(splr.Character) then return end
			
			workspace.CurrentCamera.CameraSubject = splr.Character.Humanoid
		end,
	},
	{
		name = "Fling",
		id = "flng",
		description = "Makes your character spin, flinging everyone.",
		deathDisable = true,
		autoEnable = {"nclp"},
		settings = createOptions({
			tools = {
				type = "checkbox",
				title = "Custom fling for tools",
				value = true
			}
		}),
		onEnable = function(mod)
			if not charCheck(plr.Character) then return end
			
			local tool = plr.Backpack:FindFirstChildOfClass("Tool")
			if mod.settings.tools.value and tool then
				plr.Character.Humanoid:UnequipTools()
				plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
				tool.Parent = plr.Character
				
				local gpos = tool.GripPos
				
				local pwr = 25000
				
				local p, pY = pwr, pwr / 2
				
				tool.GripPos = Vector3.new(p, pY, p)
				wait(0.35)
				tool.GripPos = gpos
				plr.Character.Humanoid:UnequipTools()
				mod:disable()
			else
				local power = 1000000
				mod.flingVel = Instance.new("BodyAngularVelocity")
				mod.flingVel.AngularVelocity = Vector3.new(0, power, 0)
				mod.flingVel.MaxTorque = Vector3.new(0, power, 0)
				mod.flingVel.Parent = plr.Character.PrimaryPart
			end
		end,
		onDisable = function(mod)
			if mod.flingVel then
				mod.flingVel:Destroy()
				mod.flingVel = nil
			end
		end,
	},
	{
		name = "KillAura",
		gameBonus = { 142823291 },
		id = "klaura",
		description = "Makes your character look at anyone near the radius.",
		settings = createOptions({
			walls = {
				type = "checkbox",
				title = "Check Walls (indev)",
				value = false
			},
			looking = {
				type = "checkbox",
				title = "Check Looking",
				value = false
			},
			camr = {
				type = "checkbox",
				title = "Restore Camera Rotation when Target is Lost",
				value = true
			},
			radius = {
				type = "number",
				title = "Radius (in studs)",
				value = 10,
				min = 5,
				max = 50000
			},
			sort = {
				type = "choose",
				title = "Sort",
				value = 1,
				options = {
					"Nearest",
					"Player"
				}
			},
			player = {
				type = "string",
				title = "Player",
				value = "Roblox"
			}
		}, function(md)
			if game.PlaceId == 142823291 then
				table.insert(md.sort.options, "MM2 Murderer")
				table.insert(md.sort.options, "MM2 Sherrif")
			end
		end),
		onEnable = function() end,
		tick = function(mod)
			if not charCheck(plr.Character) then return end
			
			if mod.settings.sort.value == 2 and not findPlr(mod.settings.player.value, false) then return mod:disable() end
			
			local targets = {}
			for _, pl in pairs(game.Players:GetChildren()) do
				if mod.settings.sort.value == 2 and mod.settings.player.value == pl.Name and pl.Character and pl.Character.PrimaryPart then table.insert(targets, pl.Name) break end
			
				if pl.UserId == plr.UserId then continue end
				if pl.Character and pl.Character.PrimaryPart then
					local prm = pl.Character.PrimaryPart
					local magnc = (prm.Position - plr.Character.PrimaryPart.Position).Magnitude
					
					if magnc > mod.settings.radius.value then continue end
					
					local cpos, isCm = workspace.CurrentCamera:WorldToScreenPoint(prm.Position)
					if not isCm and mod.settings.looking.value then continue end
					
					if mod.settings.walls.value then
						local rDir = workspace.CurrentCamera.CFrame.p - plr.Character.PrimaryPart.Position
						local raycastParams = RaycastParams.new()
						raycastParams.FilterDescendantsInstances = plr.Character:GetChildren()
						raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
						local ray = workspace:Raycast(workspace.CurrentCamera.CFrame.p, rDir, raycastParams)
						
						if ray then
							local prt = ray.Instance
							if prt then
								if not table.find(pl.Character:GetDescendants(), prt) then continue end
							else continue end
						else continue end
					end					
					
					table.insert(targets, pl)
				end
			end
			
			local target
			if #targets == 1 then target = targets[1]
			elseif #targets > 1 then
				if mod.settings.sort.value < 3 then
					table.sort(targets, function(a, b)
						local function getMgn(pl)
							local prm = pl.Character.PrimaryPart
							local magnc = (prm.Position - plr.Character.PrimaryPart.Position).Magnitude
							return magnc
						end
						
						local aMgn = getMgn(a)
						local bMgn = getMgn(b)
						
						return bMgn > aMgn
					end)
					target = targets[1]
				else
					for _, x in pairs(targets) do
						if x.UserId == mm2Data.murderer.UserId and (mod.settings.sort.value == 3) then target = x end
						if x.UserId == mm2Data.sherrif.UserId and (mod.settings.sort.value == 4) then target = x end
					end
				end
			end
			
			if target then
				if not mod.lastRot then
					local x, y, z = workspace.CurrentCamera.CFrame:ToEulerAnglesXYZ()
					mod.lastRot = {x, y, z}
				end
				
				local prmpr = target.Character.PrimaryPart
				local ps = plr.Character.PrimaryPart
				local magnit = (ps.Position - prmpr.Position).Magnitude
				
				local pos = target.Character.Head.Position + prmpr.Velocity * (magnit / 1000)
				local cf = CFrame.new(workspace.CurrentCamera.CFrame.p, pos)
				
				workspace.CurrentCamera.CFrame = cf
			elseif mod.settings.camr and mod.lastRot then
				local cf = CFrame.new(workspace.CurrentCamera.CFrame.p) * CFrame.Angles(mod.lastRot[1], mod.lastRot[2], mod.lastRot[3]) 

				workspace.CurrentCamera.CFrame = cf
				mod.lastRot = nil
			end
			
		end,
		onDisable = function() end,
	},
	{
		name = "ClickToTP",
		id = "cttp",
		description = "Teleports you to your mouse's position.",
		settings = createOptions({
			tpkey = {
				type = "key",
				title = "Teleport key",
				value = 268
			}
		}),
		onEnable = function(mod)
			local part = Instance.new("Part")
			part.Shape = Enum.PartType.Ball
			part.Material = Enum.Material.ForceField
			part.Name = "tpdisc"
			part.Size = Vector3.new(1.5, 1.5, 1.5)
			part.CanCollide = false
			part.Anchored = true
			part.Parent = workspace
			
			mod.filter = mouse.TargetFilter
			mouse.TargetFilter = part
			
			local mesh = Instance.new("SpecialMesh", part)
			mesh.Scale = part.Size
			mesh.MeshType = Enum.MeshType.Sphere
			mod.disc = part
		end,
		tick = function(mod)
			if mod.disc then
				mod.disc.Position = mouse.Hit.p
			end
		end,
		onDisable = function(mod)
			if mod.clickListen then mod.clickListen:Disconnect() end
			if mod.clickListen2 then mod.clickListen2:Disconnect() end
			mod.disc:Destroy()
			mod.disc = nil
			mouse.TargetFilter = mod.filter
		end,
		keyPressed = function(mod, k)
			if tonumber(mod.settings.tpkey.value) == tonumber(k.KeyCode.Value) then
				plr.Character.PrimaryPart.CFrame = CFrame.new(mod.disc.Position + Vector3.new(0, plr.Character.PrimaryPart.Size.Y, 0))
			end
		end
	},
	{
		name = "PlayerESP",
		gameBonus = { 142823291 },
		id = "pesp",
		description = "See all players through walls, basically like XRay.",
		settings = createOptions({
			color = {
				type = "choose",
				title = "Color",
				value = 1,
				options = {
					"Team color (or White)",
					"White",
					"Gray",
					"Blue",
					"Cyan",
					"Red",
					"Green",
					"Yellow",
					"Black",
					"Rainbow (may lag)"
				}
			},
			team = {
				type = "checkbox",
				title = "Ignore own team",
				value = true
			}
		}, function(md)
			if game.PlaceId == 142823291 then
				table.insert(md.color.options, "MM2 Role")
			end
		end),
		onEnable = function(mod)
			mod.colors = {
				nil,
				Color3.fromRGB(255, 255, 255),
				Color3.fromRGB(127, 127, 127),
				Color3.fromRGB(0, 0, 255),
				Color3.fromRGB(0, 255, 255),
				Color3.fromRGB(255, 0, 0),
				Color3.fromRGB(0, 255, 0),
				Color3.fromRGB(255, 255, 0),
				Color3.fromRGB(0, 0, 0),
				nil,
				nil
			}
			mod.rainbowHue = 0
			mod.parts = {}
			
			local gg = Instance.new("ViewportFrame", gui)
			gg.Name = "esp"
			gg.Size = UDim2.new(1, 0, 1, 0)
			gg.BorderSizePixel = 0
			gg.BorderColor3 = Color3.new()
			gg.BackgroundColor3 = Color3.new()
			gg.BackgroundTransparency = 1
			gg.ZIndex = -1
			
			mod.camAtts = {}
			
			mod.gui = gg
		end,
		tick = function(mod)
			local gg = mod.gui
			
			gg.CurrentCamera = workspace.CurrentCamera
			
			if mod.rainbowHue >= 1 then mod.rainbowHue = 0 end
			
			local plrs = {}
			for _, p in pairs(game.Players:GetChildren()) do
				if p.UserId == plr.UserId then continue end
				if mod.settings.team.value and p.Team == plr.Team and plr.Team and p.Team then continue end
				
				if p.Character then table.insert(plrs, p) end
			end
			
			for _, xdd in pairs(gg:GetChildren()) do
				if not xdd:IsA("Model") then continue end
				local yas = false
				for _, xd in pairs(plrs) do
					if tostring(xd.UserId) == xdd.Name then yas = true end
				end
				if not yas then
					local revs = {}
					for k, v in pairs(mod.parts) do
						revs[v] = k
					end
					for _, xddd in pairs(xdd:GetChildren()) do
						if xddd:IsA("BasePart") then
							local th = revs[xddd]
							mod.parts[th] = nil
							xddd:Destroy()
						end
					end
					xdd:Destroy()
				end
			end
			
			for _, pl in pairs(plrs) do
				if not gg:FindFirstChild(pl.UserId) then
					local lmao = Instance.new("Model", gg)
					lmao.Name = pl.UserId
				end
				
				local lel = gg:FindFirstChild(pl.UserId)
				local espColor = Color3.new(1, 1, 1)
				if mod.settings.color.value == 1 and pl.TeamColor then
					espColor = pl.TeamColor.Color
				elseif mod.settings.color.value == 10 then
					espColor = Color3.fromHSV(mod.rainbowHue, 1, 1)
				elseif mod.settings.color.value == 11 then
					if mm2Data.sherrif and (mm2Data.sherrif.UserId == pl.UserId) then espColor = Color3.new(0, 0, 1)
					elseif mm2Data.murderer and (mm2Data.murderer.UserId == pl.UserId) then espColor = Color3.new(1, 0, 0)
					else espColor = Color3.new(0, 1, 0) end
				else
					espColor = mod.colors[mod.settings.color.value]
				end
				
				for _, xd in pairs(pl.Character:GetChildren()) do
					if xd:IsA("BasePart") then
						if mod.parts[xd] then
							local prt = mod.parts[xd]
							prt.CFrame = xd.CFrame
							prt.Size = xd.Size
							prt.Color = espColor
						else
							local arch = xd.Archivable
							xd.Archivable = true
							local prt = xd:Clone()
							prt:ClearAllChildren()
							xd.Archivable = arch
							
							if pl.Character.PrimaryPart == xd then lel.PrimaryPart = prt end
							prt.Material = Enum.Material.SmoothPlastic
							prt.Parent = lel
							prt.Anchored = true
							if xd.Transparency > 0.5 then prt.Transparency = 0
							else prt.Transparency = 0 end
							mod.parts[xd] = prt
						end
					end
				end
			end
			
			mod.rainbowHue += 0.5 / 255
		end,
		onDisable = function(mod)
			mod.gui:Destroy()
			mod.parts = {}
		end,
	},
	{
		name = "PlaySound",
		id = "plsnd",
		description = "Plays a sound (only for you).",
		settings = createOptions({
			sound = {
				type = "string",
				title = "Sound ID",
				value = "152745539"
			},
			loop = {
				type = "checkbox",
				title = "Looped",
				value = false
			}
		}),
		onEnable = function(mod)
			local id = mod.settings.sound.value
			local snd = Instance.new("Sound")
			mod.snd = snd
			snd.SoundId = "rbxassetid://" .. mod.settings.sound.value
			snd.Parent = workspace
			repeat wait() until snd.IsLoaded
			snd:Play()
		end,
		tick = function(mod)
			mod.snd.Looped = mod.settings.loop.value
		end,
		onDisable = function(mod)
			mod.snd:Destroy()
			mod.snd = nil
		end,
	},
	--{
	--	name = "Animation",
	--	id = "animtn",
	--	description = "Plays an animation.",
	--	settings = createOptions({
	--		animation = {
	--			type = "choose",
	--			title = "Animation",
	--			value = 1,
	--			options = {
	--				"Dance1 [R6-R15]",
	--				"Dance2 [R6-R15]",
	--				"Dance3 [R6-R15]"
	--			}
	--		}
	--	}),
	--	onEnable = function(mod)
	--		local r15anims = {
	--			"7060091835",
	--			"7060097097",
	--			"7060099231"
	--		}
	--		local r6anims = {
	--			"7060281579",
	--			"7060301237",
	--			"7060304399"
	--		}
			
	--		local function disable()
	--			modDid[mod.id] = false
	--			modTogEv[mod.id]:Fire()
	--		end

	--		if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 and not r15anims[mod.settings.animation.value] then disable() return end
	--		if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and not r6anims[mod.settings.animation.value] then disable() return end
			
	--		local animd = ""
	--		if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then animd = r6anims[mod.settings.animation.value] end
	--		if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then animd = r15anims[mod.settings.animation.value] end
			
	--		local animxd = Instance.new("Animation", workspace)
	--		animxd.AnimationId = "http://www.roblox.com/asset/?id=" .. animd
	--		local anmt = plr.Character.Humanoid:LoadAnimation(animxd)
	--		anmt:Play()
	--		mod.anim = anmt
	--	end,
	--	tick = function() end,
	--	onDisable = function(mod)
	--		mod.anim:Stop()
	--	end
	--}
	{
		name = "FullBright",
		id = "flbrht",
		description = "Makes your game fullbright (duh).",
		settings = createOptions(),
		onEnable = function(mod)
			mod.ambient = game.Lighting.Ambient
			mod.brightness = game.Lighting.Brightness
			mod.outdoorambient = game.Lighting.OutdoorAmbient
			mod.exposurecompensation = game.Lighting.ExposureCompensation
		end,
		tick = function(mod)
			game.Lighting.Ambient = Color3.new(1, 1, 1)
			game.Lighting.Brightness = 3
			game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
			game.Lighting.ExposureCompensation = 0
		end,
		onDisable = function(mod)
			game.Lighting.Ambient = mod.ambient
			game.Lighting.Brightness = mod.brightness 
			game.Lighting.OutdoorAmbient = mod.outdoorambient
			game.Lighting.ExposureCompensation = mod.exposurecompensation
			
		end,
	},
	{
		name = "InfiniteJump",
		id = "infjmp",
		description = "Allows you to jump infinitely.",
		settings = createOptions(),
		onEnable = function(mod)
			
		end,
		onDisable = function(mod)
			
		end,
		keyPressed = function(mod, k)
			if not charCheck(plr.Character) then return end
			if k.KeyCode == Enum.KeyCode.Space then
				local st = plr.Character.Humanoid:GetState()
				if st == Enum.HumanoidStateType.Jumping or st == Enum.HumanoidStateType.Freefall then
					plr.Character.Humanoid.UseJumpPower = true
					local vl = plr.Character.PrimaryPart.Velocity
					plr.Character.PrimaryPart.Velocity = Vector3.new(vl.X, plr.Character.Humanoid.JumpPower, vl.Z) 
				end
			end
		end,
	},
	{
		name = "GodMode",
		id = "godmd",
		description = "Makes you invincible (most of the time)",
		settings = createOptions(),
		deathDisable = true,
		onEnable = function(mod)
			local hmn = plr.Character.Humanoid
			local l = hmn:Clone()
			l.Name = "1"
			if workspace.CurrentCamera.CameraSubject == hmn then workspace.CurrentCamera.CameraSubject = l end
			hmn.Name = "1"
			l.Parent = plr.Character
			l.Name = "Humanoid"
			wait(0.1)
			hmn:Destroy()
		end,
		onDisable = function(mod)
			plr.Character:FindFirstChildOfClass("Humanoid").Health = 0
		end,
	},
	{
		name = "BringPlayer",
		id = "brgplr",
		description = "Brings a player to you (most of the time)",
		settings = createOptions({
			plr = {
				type = "string",
				title = "Player",
				value = "Roblox"
			}
		}),
		onEnable = function(mod)
			local splr = findPlr(mod.settings.plr.value, false)
			if not splr or not splr.Character or not splr.Character.PrimaryPart then
				mod:disable()
				return
			end
			
			local cap = plr.Character.PrimaryPart.CFrame
			local hmn = plr.Character.Humanoid
			hmn.Name = "1"
			local l = hmn:Clone()
			l.Parent = plr.Character
			l.Name = "Humanoid"
			wait(0.1)
			hmn:Destroy()
			hmn = l
			
			local sub = workspace.CurrentCamera.CameraSubject
			workspace.CurrentCamera.CameraSubject = splr.Character
			plr.Character.Animate.Disabled = true
			wait(0.1)
			plr.Character.Animate.Disabled = false
			plr.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			for _, v in pairs(plr.Backpack:GetChildren()) do
				plr.Character.Humanoid:EquipTool(v)
			end

			local function tpp()
				if splr.Character and plr.Character then
					splr.Character.PrimaryPart.CFrame = plr.Character.PrimaryPart.CFrame
				end
			end
			local function tgout()
				if splr.Character and plr.Character then
					plr.Character.Humanoid:MoveTo(splr.Character.Head.Position)
				end
			end
			
			tpp()
			wait(.1)
			tpp()
			wait(.3)
			tgout()
			wait(.2)
			plr.Character.PrimaryPart.CFrame = cap
			workspace.CurrentCamera.CameraSubject = hmn
		end,
	},
	{
		name = "AntiAFK",
		id = "aafk",
		description = "Forces your player not to get kicked once AFK",
		settings = createOptions(),
		onEnable = function(mod)
			local vu = game:GetService("VirtualUser")
			mod.ev = plr.Idled:Connect(function()
				vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				wait(1)
				vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			end)
		end,
		onDisable = function(mod)
			mod.ev:Disconnect()
		end,
	},
	{
		name = "HideGUI",
		id = "hdgi",
		description = "Hides the gui. Literally what did you expect. (requires a keybind)",
		settings = createOptions(),
		onEnable = function(mod)
			local ky = mod.settings.keybind.value
			if ky == 0 then
				mod:disable()
				return
			end
			
			gui.Enabled = false
		end,
		onDisable = function(mod)
			gui.Enabled = true
		end,
	},
	{
		name = "Invisible",
		id = "invsb",
		deathDisable = true,
		description = "Makes you invisible (most of the time)",
		settings = createOptions(),
		onEnable = function(mod)
			mod.chr = plr.Character
			local platform = Instance.new("Part", workspace)
			platform.Name = "platform"
			platform.Anchored = true
			platform.Size = Vector3.new(15, 1, 15)
			mod.platform = platform
			
			local rch = plr.Character.Archivable
			plr.Character.Archivable = true
			local nchar = plr.Character:Clone()
			plr.Character.Archivable = rch
			
			nchar.Humanoid:ClearAllChildren()
			
			for _, d in pairs(nchar:GetDescendants()) do
				if d:IsA("BasePart") then d.Transparency += 0.5 end
			end
			
			nchar.Name = "N_" .. plr.Name
			nchar.Parent = workspace
			
			mod.ev = nchar:WaitForChild("Humanoid").Died:Connect(function()
				mod.ev:Disconnect()
				mod:disable()
			end)
			
			mod.nchr = nchar
			
			workspace.CurrentCamera.CameraSubject = nchar.Humanoid
			plr.Character = nchar
			
			spawn(function()
				wait(.025)
				nchar.Animate.Disabled = true
				wait()
				nchar.Animate.Disabled = false
			end)
		end,
		tick = function(mod)
			if mod.chr then
				mod.chr.PrimaryPart.Velocity = Vector3.new()
				local cfrm = Vector3.new(mod.nchr.PrimaryPart.Position.X, workspace.FallenPartsDestroyHeight + 5, mod.nchr.PrimaryPart.Position.Z)
				mod.platform.CFrame = CFrame.new(cfrm)
				mod.chr.PrimaryPart.CFrame = CFrame.new(cfrm + Vector3.new(math.random(-5, 5), 4, math.random(-5, 5)))
			end
			
			if mod.nchr and mod.nchr.PrimaryPart then
				mod.cfr = mod.nchr.PrimaryPart.CFrame
			end
		end,
		onDisable = function(mod)
			if mod.ev then mod.ev:Disconnect() end
			if mod.platform then mod.platform:Destroy(); mod.platform = nil end
			
			local cf = mod.nchr.PrimaryPart
			if cf then cf = cf.CFrame
			else cf = mod.cfr end
			
			mod.chr.PrimaryPart.CFrame = cf
			
			workspace.CurrentCamera.CameraSubject = mod.chr.Humanoid
			plr.Character = mod.chr
			mod.nchr:Destroy()
		end,
	},
	{
		name = "Debug",
		id = "debug",
		description = "Adds some debug parameters to the corner of your screen",
		settings = createOptions({
			fps = {
				type = "checkbox",
				title = "Show FPS",
				value = true
			},
			coordinates = {
				type = "checkbox",
				title = "Coordinates",
				value = true
			},
			direction = {
				type = "checkbox",
				title = "Direction",
				value = true
			}
		}),
		onEnable = function(mod)
			mod.fps = 0
			local dbg = Instance.new("TextLabel")
			dbg.Name = "debug"
			dbg.AnchorPoint = Vector2.new(1, 0)
			dbg.Position = UDim2.new(1, 0, 0, 0)
			dbg.Size = UDim2.new(0.4, 0, 0.3, 0)
			dbg.BackgroundTransparency = 1
			dbg.TextXAlignment = Enum.TextXAlignment.Right
			dbg.TextYAlignment = Enum.TextYAlignment.Top
			dbg.TextStrokeColor3 = Color3.new(1, 1, 1)
			dbg.TextStrokeTransparency = 0
			dbg.Parent = gui
			mod.debug = dbg
		end,
		tick = function(mod)
			local dbg = mod.debug
			dbg.TextSize = dbg.AbsoluteSize.Y * 0.1042
			
			if mod.settings.fps.value then
				spawn(function()
					mod.fps += 1
					wait(1)
					if not mod.settings.fps.value then return end
					mod.fps -= 1
				end)
			else
				mod.fps = 0
			end
			
			local pos = {}
			if charCheck(plr.Character) then
				local ps = plr.Character.PrimaryPart.Position
				pos = {
					X = math.floor(ps.X),
					Y = math.floor(ps.Y),
					Z = math.floor(ps.Z)
				}
			else pos = {
				X = "-",
				Y = "-",
				Z = "-"
			}
			end
			
			local y, x, z = workspace.CurrentCamera.CFrame:ToEulerAnglesYXZ()
			y, x, z = math.deg(y), math.deg(x), math.deg(z)
			y, x, z = math.floor(y), math.floor(x), math.floor(z)
			
			local classes = {}
			if mod.settings.fps.value then table.insert(classes, string.format("FPS: %s", math.floor(math.round(mod.fps / 10) * 10))) end
			if mod.settings.direction.value then table.insert(classes, string.format("Direction: %s, %s, %s", x, y, z)) end
			if mod.settings.coordinates.value then table.insert(classes, string.format("Position: %s, %s, %s", pos.X, pos.Y, pos.Z)) end
			
			dbg.Text = table.concat(classes, "\n")
		end,
		onDisable = function(mod)
			mod.debug:Destroy()
			mod.debug = nil
		end,
	},
	--{
	--	name = "CameraNoClip",
	--	id = "camnoclip",
	--	description = "Allows you to clip your camera through... stuff",
	--	settings = createOptions(),
	--	data = {
	--		camX = 0,
	--		camY = 0,
	--		zoom = 5
	--	},
	--	onEnable = function(mod)
	--		local offs = plr.Character.Head.CFrame:ToObjectSpace(workspace.CurrentCamera.CFrame)
	--		local sub = workspace.CurrentCamera.CameraSubject
	--		local typ = workspace.CurrentCamera.CameraType
	--		mod.offset = offs
	--		mod.typ = typ
	--		mod.sub = sub
	--		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

	--		mod.data.zoom = 5
	--		mod.data.camX = 0
	--		mod.data.camY = 0
	--	end,
	--	tick = function(mod)
	--		local yoffs = plr.Character.Head.Position.Y - plr.Character.PrimaryPart.Position.Y
	--		local cf = CFrame.new(plr.Character.PrimaryPart.CFrame:ToWorldSpace( CFrame.new( Vector3.new(mod.data.zoom, yoffs, 0) ) ).p , plr.Character.PrimaryPart.CFrame:ToWorldSpace(CFrame.new(Vector3.new(0, yoffs, 0))).p)
	--		workspace.CurrentCamera.CFrame = CFrame.new(cf.p)
	--	end,
	--	onDisable = function(mod)
	--		workspace.CurrentCamera.CameraType = mod.typ
	--		workspace.CurrentCamera.CameraSubject = mod.SUB
	--	end,
	--},
	{
		name = "YoutubeLiveChat",
		id = "ytlivechat",
		description = "Shows a live chat of a YouTube video",
		settings = createOptions({
			id = {
				type = "string",
				title = "ID of a Youtube Video",
				value = ""
			},
			layout = {
				type = "choose",
				title = "Layout",
				value = 2,
				options = {
					"Top",
					"Bottom"
				}
			}
		}),
		jsonCache = {},
		avCache = {},
		onEnable = function(mod)
			if not mod.settings.id.value or mod.settings.id.value == "" then return mod:disable() end
			liveYTChat.Visible = true
			
			local ogChat = mod.settings.id.value
			mod.setInterval(function()
				if not modToggle[mod.id] then return end
				
				if mod.settings.id.value ~= ogChat then return mod:disable() end

				local datt
				local dat = {
					Url = globalUrl .. "api/ytchat?id=" .. mod.settings.id.value,
					Method = "GET"
				}
				if game:GetService("RunService"):IsStudio() then datt = http_request:InvokeServer(dat)
				else datt = http_request(dat) end

				if datt.Status == 404 or datt.StatusCode == 404 or not datt.Success then return mod:disable()
				else
					local llua = httpr:JSONDecode(datt.Body)
					local ids = {}
					for _, d in pairs(mod.jsonCache) do table.insert(ids, d.id) end

					spawn(function()
						if #ids == 0 then return end
						for j, m in pairs(llua) do
							if not table.find(ids, m.id) then
								if not m.pinned then
									local msg = liveYTChat_msg:Clone()
									msg.Name = m.id
									msg.text.Text = string.format("<font color='rgb(179,179,179)'><b>%s</b></font> %s", m.author.name, m.text)
									local cach = mod.avCache[m.author.channel]
									local saiz = 16
									if cach then
										drawImage(msg.avatar, cach)
									else
										mod.avCache[m.author.channel] = drawImage(
											msg.avatar,
											string.format(
												"%sapi/imagedat?url=%s&width=%s&height=%s",
												globalUrl,
												m.avatar.url,
												tostring(saiz),
												tostring(saiz)
											)
										) -- you can use this if u want!
									end
									msg.LayoutOrder = tick()
									msg.Parent = liveYTChat
									print(string.format("%s: %s", m.author.name, m.text))
								end
							end
						end
					end)
					mod.jsonCache = llua
				end
			end, 0.5)
		end,
		tick = function(mod)
			liveYTChat_list.VerticalAlignment = Enum.VerticalAlignment[mod.settings.layout.options[mod.settings.layout.value]]
			
			local i = 1
			for _, m in pairs(liveYTChat:GetChildren()) do
				if m:IsA("Frame") then
					if (m.LayoutOrder > 0 and mod.settings.layout.value == 1) or (m.LayoutOrder < 0 and mod.settings.layout.value == 2) then
						m.LayoutOrder = -m.LayoutOrder
					end
						
					local siz = 0.032102728731942 -- 20
					local sz = texts:GetTextSize(m.text.Text, siz * workspace.CurrentCamera.ViewportSize.Y, m.text.Font, Vector2.new(m.text.AbsoluteSize.X, math.huge))
					m.Size = UDim2.new(m.Size.X, UDim.new(sz.Y / m.Parent.AbsoluteSize.Y, 0))
					i += 1
				end
			end
		end,
		onDisable = function(mod)
			mod.jsonCache = {}
			mod.avCache = {}
			liveYTChat.Visible = false
			for _, xd in pairs(liveYTChat:GetChildren()) do
				if xd:IsA("Frame") then xd:Destroy() end
			end
		end,
	},
	{
		name = "Waypoints",
		id = "wponts",
		description = "Allows you to save a location, and teleport to it",
		settings = createOptions({
			create = {
				type = "key",
				title = "Create Waypoint",
				value = 0
			},
			points = {
				type = "choose",
				title = "Waypoints",
				value = 0,
				save = false,
				options = {}
			},
			name = {
				type = "string",
				title = "The name of the new Waypont",
				value = "My Waypoint"
			},
			tp = {
				type = "key",
				title = "Teleport to Waypoint",
				value = 0
			}
		}, function(md)
			if game.PlaceId == 142823291 then
				table.insert(md.points.options, "MM2 Murderer")
				table.insert(md.points.options, "MM2 Sherrif")
			end
		end),
		saves = {},
		onEnable = function(mod)
			mod.parts = {}
			
			for _, save in pairs(mod.settings.points.options) do
				local pos = mod.saves[save]
				if pos then
					mod:create(save, pos)
				end
			end
		end,
		onDisable = function(mod)
			if mod.ev then mod.ev:Disconnect() end
		end,
		create = function(mod, save, pos)
			local p = Instance.new("Part")
			p.Transparency = 1
			p.Anchored = true
			p.CanCollide = false
			p.CanTouch = false
			p.Name = save
			p.Position = pos
			p.Size = Vector3.new(0.5, 0.5, 0.5)
			p.Parent = workspace

			local wpn = waypointBLB:Clone()
			wpn.Name = save
			wpn.title.Text = save
			wpn.distance.BackgroundColor3 = Color3.fromHSV(math.random(0, 255) / 255, 1, 1)
			wpn.Parent = p
			table.insert(mod.parts, p)
		end,
		keyPressed = function(mod, k)
			if tonumber(mod.settings.create.value) == tonumber(k.KeyCode.Value) then
				local nm = mod.settings.name.value
				if not table.find(mod.settings.points.options, nm) then
					mod.saves[nm] = plr.Character.PrimaryPart.Position
					table.insert(mod.settings.points.options, nm)
					mod:create(nm, mod.saves[nm])
				end
			elseif tonumber(mod.settings.tp.value) == tonumber(k.KeyCode.Value) then
				local nm = mod.settings.points.options[mod.settings.points.value]
				if nm then
					plr.Character.PrimaryPart.CFrame = CFrame.new(mod.saves[nm])
				end
			end
		end,
		tick = function(mod)
			for _, p in pairs(mod.parts) do
				local dist = (p.Position - plr.Character.PrimaryPart.Position).Magnitude
				local meters = math.floor(dist * 0.82)

				p[p.Name].distance.Text = string.format("%sm", meters)
			end
		end,
	},
	{
		name = "RoleNotifications",
		id = "mm2_rlnotif",
		description = "[MM2] Sends Notifications everyone round, with who has which role",
		gameSpecific = { 142823291 },
		settings = createOptions(),
		onEnable = function(mod)
			mod.ev = mm2Evs.notifications.Event:Connect(function(ttl, txt, img, time)
				pcall(game.StarterGui.SetCore, game.StarterGui, "SendNotification", {
					Title = ttl,
					Text = txt,
					Icon = img,
					Duration = 5 or time
				})
			end)
			table.insert(events, mod.ev)
			
			if mm2Data.round then mm2Evs.notifications:Fire("RoleNotifications", "The round is currently ongoing")
			else mm2Evs.notifications:Fire("RoleNotifications", "Waiting for the round to start") end

			if mm2Data.sherrif then mm2Evs.notifications:Fire("RoleNotifications", mm2Data.sherrif.Name .. " is now the Sherrif!", game.Players:GetUserThumbnailAsync(mm2Data.sherrif.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100), 120) end
			if mm2Data.murderer then mm2Evs.notifications:Fire("RoleNotifications", mm2Data.murderer.Name .. " is now the Murderer!", game.Players:GetUserThumbnailAsync(mm2Data.murderer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100), 120) end
		end,
		onDisable = function(mod)
			mod.ev:Disconnect()
		end,
	},
	{
		name = "TpToGun",
		id = "mm2_ttg",
		description = "[MM2] Teleports you to the gun",
		gameSpecific = { 142823291 },
		settings = createOptions({
			gun = {
				type = "string",
				title = "[DEBUG]_droppedgun_name",
				value = "GunDrop"
			}
		}),
		onEnable = function(mod)
			local gun = workspace:FindFirstChild(mod.settings.gun.value)
			
			if not gun then
				mod:disable()
				return
			end
			
			if gun:IsA("Model") then gun = gun.PrimaryPart end
			
			local cap = plr.Character.PrimaryPart.CFrame
			local offs = plr.Character.PrimaryPart.Position - plr.Character.Head.Position
			local vl = plr.Character.PrimaryPart.Velocity
			
			local ps = gun.Position + offs
			local enb = true
			
			spawn(function()
				while enb and wait() do
					plr.Character.PrimaryPart.Anchored = true
					plr.Character.PrimaryPart.CFrame = CFrame.new(ps)
					plr.Character.PrimaryPart.Velocity = Vector3.new()
				end
			end)
			
			wait(.15)
			enb = false
			wait()
			plr.Character.PrimaryPart.Velocity = vl
			plr.Character.PrimaryPart.CFrame = cap

			mod:disable()
			return
		end,
	},

	--> COMMUNITY_MODULES <--
	--> COMMUNITY_MODULES_END <--
}

log("Loaded GUI")
local speclColor = Color3.new(1, .8, 0)
local communityColor = Color3.new(0.6, 0, 1)
local defColor = description.TextColor3

ev = game:GetService("RunService").Heartbeat:Connect(function()
	local isHover = false
	local het = 0.035
	for _, mod in pairs(modulesList:GetChildren()) do
		if modulesList.Visible and mod:IsA("Frame") and (mouse.X >= mod.AbsolutePosition.X and mouse.X < mod.AbsolutePosition.X + mod.AbsoluteSize.X) and (mouse.Y >= mod.AbsolutePosition.Y and mouse.y < mod.AbsolutePosition.Y + mod.AbsoluteSize.Y) then
			isHover = true
			local modObj
			for _, m in pairs(mods) do
				if m.id == mod.name then modObj = m end
			end
			
			if modObj then
				description.Text = modObj.description
				
				if modObj.gameSpecific and table.find(modObj.gameSpecific, game.PlaceId) then description.TextColor3 = speclColor
				elseif modObj.isCommunity then description.TextColor3 = communityColor
				else description.TextColor3 = defColor end
				
				local onLine = texts:GetTextSize("", 14, description.Font, Vector2.new(math.huge, math.huge)).Y
				local lines = texts:GetTextSize(description.Text, 14, description.Font, Vector2.new(math.huge, math.huge))
				description.Size = UDim2.new((lines.X / workspace.CurrentCamera.ViewportSize.X) * 2, 0, het * (lines.Y / onLine), 0)
			end 
		end
	end
	
	if (mouse.X >= titleText.AbsolutePosition.X and mouse.X < titleText.AbsolutePosition.X + titleText.AbsoluteSize.X) and (mouse.Y >= titleText.AbsolutePosition.Y and mouse.y < titleText.AbsolutePosition.Y + titleText.AbsoluteSize.Y) then
		local txt = ""
		if config.version == config.latestVersion then
			txt = string.format("You are on the latest version (%s)!", config.latestVersion)
		else
			txt = string.format("Outdated!\nYou are on version %s while the\nlatest version is %s!", config.version, config.latestVersion)
		end
		
		description.Text = txt
		local onLine = texts:GetTextSize("", 14, description.Font, Vector2.new(math.huge, math.huge)).Y
		local lines = texts:GetTextSize(description.Text, 14, description.Font, Vector2.new(math.huge, math.huge))
		description.Size = UDim2.new((lines.X / workspace.CurrentCamera.ViewportSize.X) * 2, 0, het * (lines.Y / onLine), 0)
		
		isHover = true
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
	if isChangingKeybinds then return end
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
	modal.Modal = isSettings or modulesList.Visible
	
	for _, mod in pairs(mods) do
		if modToggle[mod.id] and modDid[mod.id] then
			if mod.tick then
				local scs, xd = pcall(mod.tick, mod)
				if not scs then log("tick: " .. xd, "warn", mod.name) end
			end
		end
	end
end)
table.insert(events, ev)

-- wmod settings
local gsettings = getSettings() or {}
wmod.settings = gsettings.wmod or wmod.settings
local wmodS = tempModule:Clone()
wmodS.ZIndex = modulesList.ZIndex
wmodS.Name = "wmodS"
wmodS.title.Text = "Settings"
wmodS.Parent = gui
wmodS.Position = UDim2.new(1, -5, 1, -5)
wmodS.AnchorPoint = Vector2.new(1, 1)
spawn(function()
	wmodS.btn.Visible = false
end)
wmodS.btn.Activated:Connect(function()
	buildSettings(wmod, wmod.settings)
	modulesList.Visible = false
end)

-- resize modules' list
local mainY = modulesListGrid.CellSize.Y.Scale
ev = game:GetService("RunService").Stepped:Connect(function()
	modulesListGrid.CellSize = UDim2.new(0.5, -2, 0, (modulesList.AbsoluteSize.Y * mainY) - 2)
	if modules:FindFirstChild("settings") then
		wmodS.Visible = false
	else
		wmodS.btn.Visible = false
		wmodS.Visible = modulesList.Visible
		wmodS.btn.Visible = true
	end
	local s =  modulesListGrid.CellSize
	wmodS.Size = UDim2.new(0.15, -2, 0, s.Y.Offset)
	modulesList.CanvasSize = UDim2.new(0, 0, 0, modulesListGrid.AbsoluteContentSize.Y)
end)
table.insert(events, ev)

-- for modules
UIS.InputBegan:Connect(function(input, c)
	if c then return end
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if isChangingKeybinds then return end

	for _, mod in pairs(mods) do
		if modToggle[mod.id] then
			if mod.keyPressed then
				local scs, xd = pcall(mod.keyPressed, mod, input)
				if not scs then log("keyPressed: " .. xd, "warn", mod.name); mod:disable() end	
			end
		end
	end
end)
UIS.InputChanged:Connect(function(input, c)
	if c then return end
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if isChangingKeybinds then return end

	for _, mod in pairs(mods) do
		if modToggle[mod.id] then
			if mod.keyChanged then
				local scs, xd = pcall(mod.keyChanged, mod, input)
				if not scs then log("keyChanged: " .. xd, "warn", mod.name); mod:disable() end	
			end
		end
	end
end)
UIS.InputEnded:Connect(function(input, c)
	if c then return end
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if isChangingKeybinds then return end

	for _, mod in pairs(mods) do
		if modToggle[mod.id] then
			if mod.keyReleased then
				local scs, xd = pcall(mod.keyReleased, mod, input)
				if not scs then log("keyReleased: " .. xd, "warn", mod.name); mod:disable() end	
			end
		end
	end
end)


for imod, mod in pairs(mods) do
	if mod.gameSpecific and not table.find(mod.gameSpecific, game.PlaceId) then continue end
	mod.settings = mod.settings or createOptions()
	modToggle[mod.id] = false
	modEvs[mod.id] = {}
	mod.intervals = {}
	modTogEv[mod.id] = Instance.new("BindableEvent")
	local modul = tempModule:Clone()
	modul.Name = mod.id
	modul.title.Text = mod.name
	
	if (mod.gameSpecific and table.find(mod.gameSpecific, game.PlaceId)) or (mod.gameBonus and table.find(mod.gameBonus, game.PlaceId)) then modul.title.TextColor3 = speclColor
	elseif mod.isCommunity then modul.title.TextColor3 = communityColor	 end
	
	modul.LayoutOrder = imod
	modul.Parent = modulesList
	
	local sts = findByKey(gsettings, "id", mod.id)
	if sts then
		for x, d in pairs(sts.settings) do
			if mod.settings[x] and d.value ~= nil and d.save ~= false then mod.settings[x].value = d.value end
		end
	end
	
	local offBtn = modul.BackgroundColor3
	
	local togg
	togg = function(isDeath)
		if not isDeath and not charCheck(plr.Character) then return end
		modToggle[mod.id] = not modToggle[mod.id]
		modDid[mod.id] = false
		if modToggle[mod.id] then
			tweens:Create(modul, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.new(0, 1, 0)
			}):Play()
			local now = tick()

			spawn(function()
				if mod.autoEnable then for _, m in pairs(mods) do
					if not modToggle[m.id] and table.find(mod.autoEnable, m.id) then modTogEv[m.id]:Fire() end
					end end
				
				modTick[mod.id] = now
				
				mod.setInterval = function(func, tim, ...)
					if not func then log("setInterval: Argument 1 missing or nil", "warn", mod.name) return end
					if type(func) ~= "function" then log(string.format("setInterval: Unable to cast %s to function", type(func)), "warn", mod.name) return end
					if not tim then log("setInterval: Argument 2 missing or nil", "warn", mod.name) return end
					tim = tonumber(tim) or tim
					if type(tim) ~= "number" then log(string.format("setInterval: Unable to cast %s to number", type(tim)), "warn", mod.name) return end
					local args = table.pack(...)
					local noW = tick()
					table.insert(mod.intervals, noW)
					spawn(function()
						while wait(tim) do
							if not table.find(mod.intervals, noW) then break end
							if not modToggle[mod.id] or modTick[mod.id] ~= now then if table.find(mod.intervals, noW) then table.remove(mod.intervals, table.find(mod.intervals, noW)) end break end
							spawn(function()
								func(unpack(args))
							end)
						end
					end)
				end
				mod.clearInterval = function(numb)
					if not numb then log("clearInterval: Argument 1 missing or nil", "warn", mod.name) return end
					numb = tonumber(numb) or numb
					if type(numb) ~= "number" then log(string.format("setInterval: Unable to cast %s to number", type(numb)), "warn", mod.name) return end

					if table.find(mod.intervals, numb) then
						table.remove(mod.intervals, table.find(mod.intervals, numb))
					else log("clearInterval: Invalid interval number") end
				end
				
				local scs, xd = pcall(mod.onEnable, mod)
				if not scs then log("onEnable: " .. xd, "warn", mod.name); mod:disable() end
				
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
				TextTransparency = 0,
				TextStrokeTransparency = 0
			}):Play()
		else
			for _, ed in pairs(modEvs[mod.id]) do ed:Disconnect() end
			tweens:Create(modul, TweenInfo.new(0.2), {
				BackgroundColor3 = offBtn
			}):Play()

			spawn(function()
				local scs, xd = pcall(mod.onDisable, mod)
				if not scs then log("onDisable: " .. xd, "warn", mod.name) end
				modDid[mod.id] = true
			end)
			
			for _, mdl in pairs(modlist:GetChildren()) do
				if mdl.Name == mod.id then
					spawn(function()

						local tws = tweens:Create(mdl, TweenInfo.new(0.2), {
							TextTransparency = 1,
							TextStrokeTransparency = 1
						})
						tws:Play()
						tws.Completed:Wait()
						mdl:Destroy()
					end)
				end
			end
		end
	end
	
	ev = UIS.InputBegan:Connect(function(kb, ch)
		if ch then return end
		
		if isChangingKeybinds then return end
		if kb.KeyCode == Enum.KeyCode.Unknown then return end
		if tonumber(kb.KeyCode.Value) == tonumber(mod.settings.keybind.value) and kb.UserInputType == Enum.UserInputType.Keyboard then
			togg()
		end
	end)
	table.insert(events, ev)

	mod.disable = function()
		if modToggle[mod.id] then
			-- just to make sure
			modDid[mod.id] = false
			modTogEv[mod.id]:Fire()
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
log("Disabled", "warn", "Old")

gui:Destroy()
game.ReplicatedStorage.disableWurst:Destroy()
for _, e in pairs(events) do
	e:Disconnect()
end
script.Disabled = true