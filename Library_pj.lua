local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
function Change(t,info, target, obj)
	if not obj or typeof(obj) ~= "Instance" then
		return
	end
	info = info or TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local gg = game:GetService("TweenService"):Create(obj, info, target)
	gg:Play()
	return {
		["Wait"] = function()
			gg.Completed:Wait()
		end
	}
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end
local scr = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
scr["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


local lol22 = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
local cc2 = Instance.new("ImageButton", lol22);
cc2["BorderSizePixel"] = 0;
cc2["BackgroundTransparency"] = 1;
cc2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cc2["Image"] = [[rbxassetid://80424892346620]];
cc2["Size"] = UDim2.new(0, 60, 0, 60);
cc2["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cc2["Position"] = UDim2.new(0.1784, 0, 0.51119, 0);
cc2.Draggable = true
cc2.MouseButton1Click:Connect(function()
	scr.Enabled = not scr.Enabled
end)

local lib = {}

function lib:Window()
	local G2L = {};
	-- StarterGui.ScreenGui

	-- StarterGui.ScreenGui.gg
	G2L["2"] = Instance.new("Frame", scr);
	G2L["2"]["BorderSizePixel"] = 0;
	G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["2"]["Size"] = UDim2.new(0, 1250, 0, 804);
	G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2"]["Name"] = [[gg]];
	G2L["2"]["BackgroundTransparency"] = 1;
	
	local gui = G2L["2"]
	local camera = workspace.CurrentCamera
	
	local guiSize = gui.Size

	local width = guiSize.X.Offset
	local height = guiSize.Y.Offset

	gui.Position = UDim2.new(
		0, camera.ViewportSize.X / 2 - width / 2,
		0, camera.ViewportSize.Y / 2 - height / 2
	)
	
	-- StarterGui.ScreenGui.gg.Main
	G2L["3"] = Instance.new("Frame", G2L["2"]);
	G2L["3"]["BorderSizePixel"] = 0;
	G2L["3"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
	G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["3"]["Size"] = UDim2.new(0, 286, 0, 373);
	G2L["3"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3"]["Name"] = [[Main]];


	-- StarterGui.ScreenGui.gg.Main.UICorner
	G2L["4"] = Instance.new("UICorner", G2L["3"]);
	G2L["4"]["CornerRadius"] = UDim.new(0, 3);


	-- StarterGui.ScreenGui.gg.Main.UIStroke
	G2L["5"] = Instance.new("UIStroke", G2L["3"]);
	G2L["5"]["Thickness"] = 3;
	G2L["5"]["Color"] = Color3.fromRGB(0, 103, 198);


	-- StarterGui.ScreenGui.gg.Main.avatar
	G2L["6"] = Instance.new("ImageLabel", G2L["3"]);
	G2L["6"]["BorderSizePixel"] = 0;
	G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
	G2L["6"]["Image"] = [[rbxassetid://113011633323467]];
	G2L["6"]["Size"] = UDim2.new(0, 43, 0, 43);
	G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["6"]["BackgroundTransparency"] = 1;
	G2L["6"]["Name"] = [[avatar]];
	G2L["6"]["Position"] = UDim2.new(0.02673, 0, 0.01418, 0);


	-- StarterGui.ScreenGui.gg.Main.deco
	G2L["7"] = Instance.new("Frame", G2L["3"]);
	G2L["7"]["BorderSizePixel"] = 0;
	G2L["7"]["BackgroundColor3"] = Color3.fromRGB(0, 103, 198);
	G2L["7"]["Size"] = UDim2.new(0, 286, 0, 2);
	G2L["7"]["Position"] = UDim2.new(0, 0, 0.15, 0);
	G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["7"]["Name"] = [[deco]];


	-- StarterGui.ScreenGui.gg.Main.Tab_ScrollingFrame
	G2L["8"] = Instance.new("ScrollingFrame", G2L["3"]);
	G2L["8"]["Active"] = true;
	G2L["8"]["BorderSizePixel"] = 0;
	G2L["8"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["8"]["BackgroundColor3"] = Color3.fromRGB(23, 23, 23);
	G2L["8"]["Name"] = [[Tab_ScrollingFrame]];
	G2L["8"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
	G2L["8"]["Size"] = UDim2.new(0, 219, 0, 38);
	G2L["8"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["8"]["Position"] = UDim2.new(0.20629, 0, 0.0249, 0);
	G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["8"]["ScrollBarThickness"] = 2;
	local tabfolder = G2L["8"]

	-- StarterGui.ScreenGui.gg.Main.Tab_ScrollingFrame.TabBtn
	G2L["b"] = Instance.new("UIListLayout", G2L["8"]);
	G2L["b"]["Wraps"] = true;
	G2L["b"]["Padding"] = UDim.new(0, 5);
	G2L["b"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
	G2L["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


	G2L["c"] = Instance.new("UIPadding", G2L["8"]);
	G2L["c"]["PaddingLeft"] = UDim.new(0, 5);


	G2L["d"] = Instance.new("UICorner", G2L["8"]);
	G2L["d"]["CornerRadius"] = UDim.new(0, 4);
	
	G2L["e"] = Instance.new("CanvasGroup", G2L["3"]);
	G2L["e"]["BorderSizePixel"] = 0;
	G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["e"]["Size"] = UDim2.new(0, 271, 0, 303);
	G2L["e"]["Position"] = UDim2.new(0.02448, 0, 0.17158, 0);
	G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["e"]["Name"] = [[Tabs]];
	G2L["e"]["BackgroundTransparency"] = 1;
	G2L["31"] = Instance.new("UICorner", G2L["e"]);
	G2L["31"]["CornerRadius"] = UDim.new(0, 3);
	MakeDraggable(G2L["3"],G2L["3"])
	local CACHE = false
	local LOL = {}
	local TabCache = {}
	function LOL:AddTab(tnhuw)
		tnhuw = tnhuw or {}
		local tlib = {}
		local Tab_BUTTON = Instance.new("TextButton", tabfolder);
		Tab_BUTTON["BorderSizePixel"] = 0;
		Tab_BUTTON["TextSize"] = 14;
		Tab_BUTTON["TextColor3"] = Color3.fromRGB(255, 255, 255);
		Tab_BUTTON["BackgroundColor3"] = Color3.fromRGB(0, 76, 141);
		Tab_BUTTON["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		Tab_BUTTON["Size"] = UDim2.new(0, 95, 0, 30);
		Tab_BUTTON["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab_BUTTON["Text"] = tnhuw.Title;
		Tab_BUTTON["Name"] = [[TabBtn]];
		Tab_BUTTON["Position"] = UDim2.new(0, 0, 0.10526, 0);
		G2L["a"] = Instance.new("UICorner", Tab_BUTTON);
		G2L["a"]["CornerRadius"] = UDim.new(0, 3);
		-- Tabs
		local tab_frame = Instance.new("ScrollingFrame", G2L["e"]);
		tab_frame["Active"] = true;
		tab_frame["BorderSizePixel"] = 0;
		tab_frame["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		tab_frame["BackgroundColor3"] = Color3.fromRGB(104, 104, 104);
		tab_frame["Name"] = [[Tab]];
		tab_frame["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		tab_frame["Size"] = UDim2.new(0, 271, 0, 303);
		tab_frame["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		tab_frame["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		tab_frame["ScrollBarThickness"] = 0;
		tab_frame["BackgroundTransparency"] = 1;
		tab_frame.Visible = false
		if not CACHE then
			tab_frame.Visible = not CACHE
			CACHE = not CACHE
		end
		G2L["12"] = Instance.new("UIListLayout", tab_frame);
		G2L["12"]["Padding"] = UDim.new(0, 5);
		G2L["12"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		G2L["13"] = Instance.new("UIPadding", tab_frame);
		G2L["13"]["PaddingTop"] = UDim.new(0, 2);
		G2L["13"]["PaddingLeft"] = UDim.new(0, 2);
		G2L["13"]["PaddingBottom"] = UDim.new(0, 5);
		Tab_BUTTON.MouseButton1Click:Connect(function()
			for i, v in pairs(G2L["e"]:GetChildren()) do
				if v:IsA("ScrollingFrame") and  v == tab_frame then
					v.Visible = true
				elseif v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
		end)
		function tlib:AddButton(opt)
			opt = typeof(opt) == "table" and opt or (function()
				return {}
			end)()
			
			local button_ = Instance.new("TextButton", tab_frame);
			button_["BorderSizePixel"] = 0;
			button_["TextSize"] = 15;
			button_["TextColor3"] = Color3.fromRGB(255, 255, 255);
			button_["BackgroundColor3"] = Color3.fromRGB(0, 103, 198);
			button_["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			button_["Size"] = UDim2.new(0, 267, 0, 31);
			button_["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			button_["Text"] = opt.Title
			button_["Name"] = [[Button]];
			button_.MouseButton1Click:Connect(function()
				opt.CallBack()
			end)
			G2L["11"] = Instance.new("UICorner", button_);
			G2L["11"]["CornerRadius"] = UDim.new(0, 3);
		end
		
		function tlib:AddToggle(opt)
			opt = typeof(opt) == "table" and opt or (function()
				return {
					["Title"] = "This is a Toggle",
					["CallBack"] = function(v)
						print("Toggle:", v)
					end,
					["Default"] = false
				}
			end)()
			
			local togglelib = {}
			local cache = false
			G2L["14"] = Instance.new("Frame", tab_frame);
			G2L["14"]["BorderSizePixel"] = 0;
			G2L["14"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
			G2L["14"]["Size"] = UDim2.new(0, 267, 0, 40);
			G2L["14"]["Position"] = UDim2.new(0, 0, 0.1196, 0);
			G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["14"]["Name"] = [[Toggle]];
			G2L["15"] = Instance.new("UICorner", G2L["14"]);
			G2L["15"]["CornerRadius"] = UDim.new(0, 3);
			G2L["16"] = Instance.new("TextButton", G2L["14"]);
			G2L["16"]["BorderSizePixel"] = 0;
			G2L["16"]["TextSize"] = 14;
			G2L["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			G2L["16"]["Size"] = UDim2.new(0, 30, 0, 30);
			G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["16"]["Text"] = [[]];
			G2L["16"]["Position"] = UDim2.new(0.86517, 0, 0.125, 0);

			G2L["17"] = Instance.new("UICorner", G2L["16"]);
			G2L["18"] = Instance.new("TextLabel", G2L["14"]);
			G2L["18"]["BorderSizePixel"] = 0;
			G2L["18"]["TextSize"] = 14;
			G2L["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			G2L["18"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["18"]["BackgroundTransparency"] = 1;
			G2L["18"]["Size"] = UDim2.new(0, 219, 0, 30);
			G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["18"]["Text"] = opt.Title
			G2L["18"]["Position"] = UDim2.new(0.04494, 0, 0.125, 0);
			
			local idknoname = {
				[false] = Color3.fromRGB(255, 255, 255),
				[true] = Color3.fromRGB(0, 102, 197)
			}
			function togglelib:Set(v)
				local color = idknoname[v]
				Change(0.2, nil, {
					["BackgroundColor3"] = color
				}, G2L["16"])
				opt.CallBack(v)
			end
			if opt.Default then
				togglelib:Set(typeof(opt.Default) == "boolean" and opt.Default or false)
			end
			G2L["16"].MouseButton1Click:Connect(function()
				cache = not cache
				togglelib:Set(cache)
			end)
			
			return togglelib
		end
		
		function tlib:AddParagraph(opt)
			opt = typeof(opt) == "table" and opt or (function()
				return {
					["Title"] = "This is a Paragraph"
				}
			end)()
			
			G2L["1e"] = Instance.new("Frame", tab_frame);
			G2L["1e"]["BorderSizePixel"] = 0;
			G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
			G2L["1e"]["Size"] = UDim2.new(0, 267, 0, 32);
			G2L["1e"]["Position"] = UDim2.new(0, 0, 0.4186, 0);
			G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["1e"]["Name"] = [[Paragraph]];
			G2L["1f"] = Instance.new("UICorner", G2L["1e"]);
			G2L["1f"]["CornerRadius"] = UDim.new(0, 3);
			G2L["20"] = Instance.new("TextLabel", G2L["1e"]);
			G2L["20"]["BorderSizePixel"] = 0;
			G2L["20"]["TextSize"] = 14;
			G2L["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["20"]["BackgroundTransparency"] = 1;
			G2L["20"]["Size"] = UDim2.new(0, 219, 0, 22);
			G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["20"]["Text"] = opt.Title
			G2L["20"]["Position"] = UDim2.new(0.04494, 0, 0.125, 0);
			return {
				["Set"] = function(gg)
					G2L["20"]["Text"] = gg
				end,
			}
		end
		
		function tlib:AddSection(opt)
			opt = typeof(opt) == "table" and opt or (function()
				return {
					["Title"] = "This is a Section"
				}
			end)()
			
			G2L["21"] = Instance.new("TextLabel", tab_frame);
			G2L["21"]["BorderSizePixel"] = 0;
			G2L["21"]["TextSize"] = 14;
			G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			G2L["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["21"]["BackgroundTransparency"] = 1;
			G2L["21"]["Size"] = UDim2.new(0, 267, 0, 24);
			G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["21"]["Text"] = opt.Title
			G2L["21"]["Name"] = [[Section]];
			G2L["21"]["Position"] = UDim2.new(-0.0223, 0, 0.53716, 0);
		end
		
		function tlib:AddDropdown(opt)
			opt = typeof(opt) == "table" and opt or (function()
				return {
					["Title"] = "This is a Dropdown",
					["Default"] = nil,
					["Option"] = {
						"Option 1","Option 2","Option 3",
					}
				}
			end)()
			
			local dropdownlib = {}


			-- StarterGui.ScreenGui.gg.Main.Tabs.Tab.DropdownOpen
			G2L["26"] = Instance.new("Frame", tab_frame);
			G2L["26"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
			G2L["26"]["BorderSizePixel"] = 0;
			G2L["26"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
			G2L["26"]["AutomaticSize"] = Enum.AutomaticSize.Y;
			G2L["26"]["Size"] = UDim2.new(0, 267, 0, 50);
			G2L["26"]["Position"] = UDim2.new(0, 0, 0.6723, 0);
			G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["26"]["Name"] = [[Dropdown]];


			-- StarterGui.ScreenGui.gg.Main.Tabs.Tab.DropdownOpen.UICorner
			G2L["27"] = Instance.new("UICorner", G2L["26"]);
			G2L["27"]["CornerRadius"] = UDim.new(0, 3);


			-- StarterGui.ScreenGui.gg.Main.Tabs.Tab.DropdownOpen.ImageButton
			local imgdd = Instance.new("ImageButton", G2L["26"]);
			imgdd["BorderSizePixel"] = 0;
			imgdd["ScaleType"] = Enum.ScaleType.Crop;
			imgdd["BackgroundTransparency"] = 1;
			imgdd["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			imgdd["Image"] = [[rbxassetid://81521192845375]];
			imgdd["Size"] = UDim2.new(0, 23, 0, 26);
			imgdd["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			imgdd["Position"] = UDim2.new(0.89139, 0, 0, 5);

			-- StarterGui.ScreenGui.gg.Main.Tabs.Tab.DropdownOpen.TextLabel
			G2L["29"] = Instance.new("TextLabel", G2L["26"]);
			G2L["29"]["BorderSizePixel"] = 0;
			G2L["29"]["TextSize"] = 14;
			G2L["29"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			G2L["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["29"]["BackgroundTransparency"] = 1;
			G2L["29"]["Size"] = UDim2.new(0, 213, 0, 22);
			G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["29"]["Text"] = opt.Title
			G2L["29"]["Position"] = UDim2.new(0.04494, 0, 0, 5);


			-- StarterGui.ScreenGui.gg.Main.Tabs.Tab.DropdownOpen.dd
			local frame_dd = Instance.new("Frame", G2L["26"]);
			frame_dd["BorderSizePixel"] = 0;
			frame_dd["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			frame_dd["AutomaticSize"] = Enum.AutomaticSize.Y;
			frame_dd["Size"] = UDim2.new(0, 267, 0, 50);
			frame_dd["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			frame_dd["Name"] = [[dd]];
			frame_dd["BackgroundTransparency"] = 1;


			-- StarterGui.ScreenGui.gg.Main.Tabs.Tab.DropdownOpen.dd.topbar
			G2L["2b"] = Instance.new("Frame", frame_dd);
			G2L["2b"]["BorderSizePixel"] = 0;
			G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["2b"]["Size"] = UDim2.new(0, 267, 0, 31);
			G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["2b"]["Name"] = [[topbar]];
			G2L["2b"]["BackgroundTransparency"] = 1;
			

			-- StarterGui.ScreenGui.gg.Main.Tabs.Tab.DropdownOpen.dd.UIListLayout
			G2L["2c"] = Instance.new("UIListLayout", frame_dd);
			G2L["2c"]["Padding"] = UDim.new(0, 5);
			G2L["2c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			local vaildtype = {["TextButton"]=true}
			function dropdownlib:AddOption(lol)
				for i, v in pairs(lol) do
					local frdrop = Instance.new("TextButton", frame_dd);
					frdrop["BorderSizePixel"] = 0;
					frdrop["TextSize"] = 14;
					frdrop["TextColor3"] = Color3.fromRGB(255, 255, 255);
					frdrop["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
					frdrop["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					frdrop["Size"] = UDim2.new(0, 267, 0, 27);
					frdrop["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					frdrop["Text"] = v;
					frdrop["Name"] = [[option]];
					frdrop["Position"] = UDim2.new(0, 0, 0.33645, 0);
					frdrop["Visible"] = false
					frdrop.MouseButton1Click:Connect(function()
						dropdownlib:Set(frdrop.Text)
					end)
				end
			end
			function dropdownlib:Set(op)
				local gg
				for i, v in pairs(frame_dd:GetChildren()) do
					if v:IsA("TextButton") and v.Text ~= op then
						v.Visible = false
					elseif v:IsA("TextButton") then
						v.Visible = true
						gg = v.Text
					end
				end
				Change(0.2, nil, {Rotation = 90}, imgdd)
				opt.CallBack(gg)
			end
			function dropdownlib:Reset()
				for i, v in pairs(frame_dd:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			function getas()
				local g_ = {}
				for i, v in pairs(frame_dd:GetChildren()) do
					if v:IsA("TextButton") and v.Name == "option"  then
						g_[#g_ + 1] = v
					end
				end
				return g_
			end

			imgdd.MouseButton1Click:Connect(function()
				
				if imgdd.Rotation == 90 then
					print("dasadsadsadsads")
					for i, v in pairs(frame_dd:GetChildren()) do
						if v:IsA("TextButton") then
							v.Visible = true
						end
					end
					Change(0.2, nil, {Rotation = 0}, imgdd)
				end
			end)
			
			dropdownlib:AddOption(opt.Option)
			opt.Default = opt.Default or opt.Option[1]
			dropdownlib:Set(opt.Default)
			return dropdownlib
		end
		return tlib
	end
	return LOL
end
return lib
