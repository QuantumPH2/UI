local W424 = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")

local Config = {
    Name = "W424",
    DefaultVersion = "1.0",
    DefaultTheme = "Dark",
    CornerRadius = 10,
    ElementCorner = 6,
    SidebarWidth = 150,
    TopbarHeight = 40,
    MinWindowSize = Vector2.new(360, 240),
    Themes = {
        Dark = {
            Background = Color3.fromRGB(12, 12, 12),
            Sidebar = Color3.fromRGB(5, 5, 5),
            Accent = Color3.fromRGB(0, 140, 255),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(120, 120, 130),
            Element = Color3.fromRGB(12, 12, 12),
            ElementHover = Color3.fromRGB(20, 20, 20),
            ToggleOn = Color3.fromRGB(0, 140, 255),
            ToggleOff = Color3.fromRGB(40, 40, 45),
            Border = Color3.fromRGB(30, 30, 35),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(0, 140, 255)
        }
    }
}
Config.Themes.QuantumDark = Config.Themes.Dark
Config.Themes.W424Dark = Config.Themes.Dark

local LegacyIcons = {
    Custom = "rbxassetid://109818941157555",
    Home = "rbxassetid://7733960981",
    Settings = "rbxassetid://7734053495",
    User = "rbxassetid://7743875962",
    Eye = "rbxassetid://7733774602",
    EyeOff = "rbxassetid://7733774495",
    Shield = "rbxassetid://7734056608",
    ShieldCheck = "rbxassetid://7734056411",
    Search = "rbxassetid://7734052925",
    ChevronDown = "rbxassetid://7733717447",
    ChevronRight = "rbxassetid://7733717755",
    ChevronUp = "rbxassetid://7733919605",
    ChevronLeft = "rbxassetid://7733717651",
    X = "rbxassetid://7743878857",
    Minus = "rbxassetid://7734000129",
    Maximize = "rbxassetid://7733992982",
    Maximize2 = "rbxassetid://7733992901",
    Minimize = "rbxassetid://7733997941",
    Minimize2 = "rbxassetid://7733997870",
    Moon = "rbxassetid://7743870134",
    Sun = "rbxassetid://7734068495",
    Palette = "rbxassetid://7734021595",
    Sliders = "rbxassetid://7734058803",
    ToggleLeft = "rbxassetid://7734091286",
    ToggleRight = "rbxassetid://7743873539",
    Type = "rbxassetid://7743874740",
    MousePointer = "rbxassetid://7743870392",
    Layers = "rbxassetid://7743868936",
    Command = "rbxassetid://7733924046",
    Star = "rbxassetid://7734068321",
    Bell = "rbxassetid://7733911828",
    Folder = "rbxassetid://7733799185",
    Terminal = "rbxassetid://7743872929",
    Activity = "rbxassetid://7733655755",
    Target = "rbxassetid://7743872758",
    Anchor = "rbxassetid://7733911490",
    Compass = "rbxassetid://7733924216",
    Cpu = "rbxassetid://7733765045",
    Globe = "rbxassetid://7733954760",
    Hash = "rbxassetid://7733955906",
    Key = "rbxassetid://7733965118",
    Lock = "rbxassetid://7733992528",
    Unlock = "rbxassetid://7743875263",
    Move = "rbxassetid://7743870731",
    Power = "rbxassetid://7734042493",
    RefreshCw = "rbxassetid://7734051052",
    Trash = "rbxassetid://7743873871",
    Trash2 = "rbxassetid://7743873772",
    Wifi = "rbxassetid://7743878148",
    Wrench = "rbxassetid://7743878358",
    Check = "rbxassetid://7733715400",
    AlertCircle = "rbxassetid://7733911490",
    Info = "rbxassetid://7733960981",
    AlertTriangle = "rbxassetid://7733911490",
    ["bot"] = "rbxassetid://7733924046",
    ["fish"] = "rbxassetid://7733954760",
    ["droplets"] = "rbxassetid://7733924216",
    ["map-pin"] = "rbxassetid://7743872758",
    ["shopping-cart"] = "rbxassetid://7733799185",
    ["calendar"] = "rbxassetid://7733911828",
    ["settings"] = "rbxassetid://7734053495",
    ["repeat"] = "rbxassetid://7734051052",
    ["scroll"] = "rbxassetid://7743874740",
    ["check"] = "rbxassetid://7733715400",
    ["alert-triangle"] = "rbxassetid://7733911490",
    ["x"] = "rbxassetid://7743878857",
    ["refresh-cw"] = "rbxassetid://7734051052",
    ["user-x"] = "rbxassetid://7743875962",
    ["bar-chart-2"] = "rbxassetid://7734058803",
    ["smile"] = "rbxassetid://7743875962",
    ["sword"] = "rbxassetid://7743872758",
    ["gem"] = "rbxassetid://7734068321",
    ["sparkles"] = "rbxassetid://7734068321",
    ["egg"] = "rbxassetid://7733911828",
    ["heart"] = "rbxassetid://7734068321",
    ["cloud"] = "rbxassetid://7733954760",
    ["flame"] = "rbxassetid://7733911490",
    ["leaf"] = "rbxassetid://7733924216",
    ["candy"] = "rbxassetid://7733911828",
    ["rainbow"] = "rbxassetid://7734068321",
    ["code"] = "rbxassetid://7743872929",
    ["wand"] = "rbxassetid://7733965118",
    ["dna"] = "rbxassetid://7733765045",
    ["clover"] = "rbxassetid://7733924216",
    ["coins"] = "rbxassetid://7733954760",
    ["skull"] = "rbxassetid://7733911490",
    ["zap"] = "rbxassetid://7733765045",
    ["telescope"] = "rbxassetid://7733924216",
    ["cloud-lightning"] = "rbxassetid://7733911490",
    ["trending-up"] = "rbxassetid://7734058803",
    ["lock"] = "rbxassetid://7733992528",
    ["bug"] = "rbxassetid://7733924046",
    ["waves"] = "rbxassetid://7733954760",
    ["camera"] = "rbxassetid://7733774602",
    ["box"] = "rbxassetid://7733799185",
    ["layers"] = "rbxassetid://7743868936",
    ["clock"] = "rbxassetid://7733911828",
    ["rotate-ccw"] = "rbxassetid://7734051052",
    ["moon"] = "rbxassetid://7743870134",
    ["sun"] = "rbxassetid://7734068495",
    ["thumbs-up"] = "rbxassetid://7733715400",
    ["info"] = "rbxassetid://7733960981",
    ["user"] = "rbxassetid://7743875962",
    ["star"] = "rbxassetid://7734068321",
    ["target"] = "rbxassetid://7743872758",
    ["anchor"] = "rbxassetid://7733911490",
    ["shield"] = "rbxassetid://7734056608",
    ["cpu"] = "rbxassetid://7733765045",
    ["hash"] = "rbxassetid://7733955906",
    ["key"] = "rbxassetid://7733965118",
    ["move"] = "rbxassetid://7743870731",
    ["trash"] = "rbxassetid://7743873871",
    ["wifi"] = "rbxassetid://7743878148",
    ["wrench"] = "rbxassetid://7743878358",
    ["alert-circle"] = "rbxassetid://7733911490",
    ["shrub"] = "rbxassetid://7733924216",
    ["droplet"] = "rbxassetid://7733924216",
    ["plus"] = "rbxassetid://7734042493",
    ["eye"] = "rbxassetid://7733774602",
    ["eye-off"] = "rbxassetid://7733774495",
    ["shield-check"] = "rbxassetid://7734056411",
    ["toggle-left"] = "rbxassetid://7734091286",
    ["toggle-right"] = "rbxassetid://7743873539",
    ["mouse-pointer"] = "rbxassetid://7743870392",
    ["globe"] = "rbxassetid://7733954760",
    ["compass"] = "rbxassetid://7733924216",
    ["activity"] = "rbxassetid://7733655755",
    ["command"] = "rbxassetid://7733924046",
    ["terminal"] = "rbxassetid://7743872929",
    ["folder"] = "rbxassetid://7733799185",
    ["bell"] = "rbxassetid://7733911828",
    ["trash-2"] = "rbxassetid://7743873772",
    ["unlock"] = "rbxassetid://7743875263",
    ["minimize-2"] = "rbxassetid://7733997870",
    ["maximize-2"] = "rbxassetid://7733992901",
    ["chevron-left"] = "rbxassetid://7733717651",
    ["chevron-right"] = "rbxassetid://7733717755",
    ["chevron-up"] = "rbxassetid://7733919605",
    ["chevron-down"] = "rbxassetid://7733717447",
    ["search"] = "rbxassetid://7734052925",
    ["minus"] = "rbxassetid://7734000129",
    ["power"] = "rbxassetid://7734042493",
    ["atom"] = "rbxassetid://7733765045",
    ["refreshCw"] = "rbxassetid://7734051052",
    ["alertTriangle"] = "rbxassetid://7733911490",
    ["alertCircle"] = "rbxassetid://7733911490",
    ["barChart2"] = "rbxassetid://7734058803",
    ["userX"] = "rbxassetid://7743875962",
    ["mapPin"] = "rbxassetid://7743872758",
    ["shoppingCart"] = "rbxassetid://7733799185",
    ["rotateCcw"] = "rbxassetid://7734051052",
    ["cloudLightning"] = "rbxassetid://7733911490",
    ["trendingUp"] = "rbxassetid://7734058803",
}






local IconModule = {
    IconsType = "lucide",
    New = nil,
    IconThemeTag = nil,
    Icons = {},
}

local function FetchIconPack(url)
    local success, result = pcall(function()
        if typeof(game.HttpGet) == "function" then
            return game:HttpGet(url)
        elseif typeof(syn) == "table" and typeof(syn.request) == "function" then
            local response = syn.request({Url = url, Method = "GET"})
            return response and response.Body
        elseif typeof(http_request) == "function" then
            local response = http_request({Url = url, Method = "GET"})
            return response and response.Body
        else
            return HttpService:GetAsync(url)
        end
    end)
    if success and result and type(result) == "string" and result ~= "" then
        local ok, loaded = pcall(loadstring, result)
        if ok and type(loaded) == "function" then
            local ok2, pack = pcall(loaded)
            if ok2 and type(pack) == "table" then
                return pack
            end
        end
    end
    return nil
end

local function parseIconString(iconString)
    if type(iconString) == "string" then
        local splitIndex = iconString:find(":")
        if splitIndex then
            local iconType = iconString:sub(1, splitIndex - 1)
            local iconName = iconString:sub(splitIndex + 1)
            return iconType, iconName
        end
    end
    return nil, iconString
end

function IconModule.AddIcons(packName, iconsData)
    if type(packName) ~= "string" or type(iconsData) ~= "table" then
        warn("AddIcons: packName must be string, iconsData must be table")
        return
    end
    if not IconModule.Icons[packName] then
        IconModule.Icons[packName] = {
            Icons = {},
            Spritesheets = {},
        }
    end
    for iconName, iconValue in pairs(iconsData) do
        if type(iconValue) == "number" or (type(iconValue) == "string" and iconValue:match("^rbxassetid://")) then
            local imageId = iconValue
            if type(iconValue) == "number" then
                imageId = "rbxassetid://" .. tostring(iconValue)
            end
            IconModule.Icons[packName].Icons[iconName] = {
                Image = imageId,
                ImageRectSize = Vector2.new(0, 0),
                ImageRectPosition = Vector2.new(0, 0),
                Parts = nil,
            }
            IconModule.Icons[packName].Spritesheets[imageId] = imageId
        elseif type(iconValue) == "table" then
            if iconValue.Image and iconValue.ImageRectSize and iconValue.ImageRectPosition then
                local imageId = iconValue.Image
                if type(imageId) == "number" then
                    imageId = "rbxassetid://" .. tostring(imageId)
                end
                IconModule.Icons[packName].Icons[iconName] = {
                    Image = imageId,
                    ImageRectSize = iconValue.ImageRectSize,
                    ImageRectPosition = iconValue.ImageRectPosition,
                    Parts = iconValue.Parts,
                }
                if not IconModule.Icons[packName].Spritesheets[imageId] then
                    IconModule.Icons[packName].Spritesheets[imageId] = imageId
                end
            else
                warn("AddIcons: Invalid spritesheet data format for icon '" .. iconName .. "'")
            end
        else
            warn("AddIcons: Unsupported data type for icon '" .. iconName .. "': " .. type(iconValue))
        end
    end
end

function IconModule.SetIconsType(iconType)
    IconModule.IconsType = iconType
end

function IconModule.Icon(Icon, Type, DefaultFormat)
    DefaultFormat = DefaultFormat ~= false
    local iconType, iconName = parseIconString(Icon)
    local targetType = iconType or Type or IconModule.IconsType
    local targetName = iconName
    local iconSet = IconModule.Icons[targetType]

    if iconSet and iconSet.Icons and iconSet.Icons[targetName] then
        return {
            iconSet.Spritesheets[tostring(iconSet.Icons[targetName].Image)],
            iconSet.Icons[targetName],
        }
    elseif iconSet and iconSet[targetName] and type(iconSet[targetName]) == "string" and string.find(iconSet[targetName], "rbxassetid://") then
        if DefaultFormat then
            return {
                iconSet[targetName],
                { ImageRectSize = Vector2.new(0, 0), ImageRectPosition = Vector2.new(0, 0) },
            }
        else
            return iconSet[targetName]
        end
    end
    return nil
end

function IconModule.GetIcon(Icon, Type)
    return IconModule.Icon(Icon, Type, false)
end

function IconModule.Icon2(Icon, Type, DefaultFormat)
    return IconModule.Icon(Icon, Type, true)
end


local packUrls = {
    lucide = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/lucide/dist/Icons.lua",
    solar = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/solar/dist/Icons.lua",
    craft = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/craft/dist/Icons.lua",
    geist = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/geist/dist/Icons.lua",
    sfsymbols = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/sfsymbols/dist/Icons.lua",
    gravity = "https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/gravity/dist/Icons.lua",
}

for packName, url in pairs(packUrls) do
    local pack = FetchIconPack(url)
    if pack and type(pack) == "table" then
        IconModule.Icons[packName] = pack
    end
end



local function Create(className, properties)
    local instance = Instance.new(className)
    for prop, value in pairs(properties or {}) do
        if prop == "Image" and type(value) == "table" then
            instance.Image = value.Image
            if value.ImageRectSize then
                instance.ImageRectSize = value.ImageRectSize
            end
            if value.ImageRectOffset then
                instance.ImageRectOffset = value.ImageRectOffset
            end
        else
            instance[prop] = value
        end
    end
    return instance
end

local function Tween(instance, properties, duration, easingStyle, easingDirection)
    if not instance or not instance.Parent then return end
    local tween = TweenService:Create(instance, TweenInfo.new(
        duration or 0.25,
        easingStyle or Enum.EasingStyle.Quart,
        easingDirection or Enum.EasingDirection.Out
    ), properties)
    tween:Play()
    return tween
end

local function Round(number, precision)
    precision = precision or 2
    return math.round(number * 10^precision) / 10^precision
end

local function GetIcon(name, iconType)
    if not name then return {Image = LegacyIcons.Info} end

    
    local iconData = IconModule.Icon2(name, iconType)
    if iconData then
        if type(iconData) == "string" then
            return {Image = iconData}
        else
            return {
                Image = iconData[1],
                ImageRectSize = iconData[2].ImageRectSize,
                ImageRectOffset = iconData[2].ImageRectPosition
            }
        end
    end

    
    if LegacyIcons[name] then 
        return {Image = LegacyIcons[name]} 
    end

    
    if type(name) == "string" and (name:sub(1, 13) == "rbxassetid://" or name:sub(1, 4) == "http") then
        return {Image = name}
    end

    return {Image = LegacyIcons.Info}
end

local function NormalizeOption(opt)
    if type(opt) == "table" then
        return opt.Title or opt.title or tostring(opt), opt.Icon or opt.icon
    end
    return tostring(opt), nil
end

local CurrentTheme = Config.Themes[Config.DefaultTheme]
local ThemeListeners = {}
local OpenDropdowns = {}
local DropdownConnections = {}
local CurrentDropdownState = {
    IsOpen = false,
    IsMulti = false,
    Selected = nil,
    Options = {},
    Callback = nil,
    Arrow = nil,
    Button = nil,
    Rebuild = nil,
    OptionButtons = {},
}

local DropdownPanel = nil
local DropdownOverlay = nil
local DropdownPanelTitle = nil
local DropdownPanelSearch = nil
local DropdownPanelScroll = nil


local function ListenTheme(callback)
    table.insert(ThemeListeners, callback)
    callback(CurrentTheme)
end

local function CloseAllDropdowns()
    if CurrentDropdownState and CurrentDropdownState.IsOpen then
        CurrentDropdownState.IsOpen = false
        if DropdownPanel then
            DropdownPanel.Visible = false
        end
        if DropdownOverlay then
            DropdownOverlay.Visible = false
            DropdownOverlay.BackgroundTransparency = 1
        end
        if CurrentDropdownState.Arrow then
            CurrentDropdownState.Arrow.Rotation = 0
        end
        if CurrentDropdownState.OptionButtons then
            for _, btn in ipairs(CurrentDropdownState.OptionButtons) do
                if btn then btn:Destroy() end
            end
        end
        CurrentDropdownState.OptionButtons = {}
        CurrentDropdownState.Selected = nil
        CurrentDropdownState.Options = {}
        CurrentDropdownState.Callback = nil
        CurrentDropdownState.Arrow = nil
        CurrentDropdownState.Button = nil
        CurrentDropdownState.Rebuild = nil
    end

    for _, data in ipairs(OpenDropdowns) do
        if data and data.Menu and data.Menu.Parent then
            data.Menu.Visible = false
            data.Menu.Size = UDim2.new(0, data.Menu.Size.X.Offset, 0, 0)
            if data.Arrow then
                data.Arrow.Rotation = 0
            end
            data.IsOpen = false
            if data.HeartbeatConn then
                pcall(function() data.HeartbeatConn:Disconnect() end)
                data.HeartbeatConn = nil
            end
        end
    end
end


local function RegisterDropdown(menu, arrow, btnRef)
    local data = {Menu = menu, Arrow = arrow, Button = btnRef, IsOpen = false, HeartbeatConn = nil}
    table.insert(OpenDropdowns, data)
    return data
end


local ConfigManager = {}
ConfigManager.__index = ConfigManager

function ConfigManager.new(windowName)
    local self = setmetatable({}, ConfigManager)
    self.WindowName = windowName or "W424"
    self.Data = {}
    self.Path = self.WindowName .. "_W424Config.json"
    self.AutoSave = false
    self.AutoSaveInterval = 3
    self.Thread = nil
    self.Elements = {}
    return self
end

function ConfigManager:Load()
    if typeof(readfile) == "function" then
        local ok, content = pcall(readfile, self.Path)
        if ok and content and content ~= "" then
            local ok2, data = pcall(function()
                return HttpService:JSONDecode(content)
            end)
            if ok2 and type(data) == "table" then
                self.Data = data
                return true
            end
        end
    end
    return false
end

function ConfigManager:Save()
    if typeof(writefile) == "function" then
        local ok, content = pcall(function()
            return HttpService:JSONEncode(self.Data)
        end)
        if ok then
            pcall(writefile, self.Path, content)
        end
    end
end

function ConfigManager:StartAutoSave()
    if self.AutoSave then return end
    self.AutoSave = true
    self.Thread = task.spawn(function()
        while self.AutoSave do
            task.wait(self.AutoSaveInterval)
            self:Save()
        end
    end)
end

function ConfigManager:EnableAutoSave(interval)
    self.AutoSaveInterval = interval or 3
    self:StartAutoSave()
end

function ConfigManager:DisableAutoSave()
    self:StopAutoSave()
end

function ConfigManager:IsAutoSaving()
    return self.AutoSave
end

function ConfigManager:SaveNow()
    self:Save()
end

function ConfigManager:SetAutoSaveInterval(interval)
    self.AutoSaveInterval = interval or 3
    if self.AutoSave then
        self:StopAutoSave()
        self:StartAutoSave()
    end
end

function ConfigManager:StopAutoSave()
    self.AutoSave = false
    if self.Thread then
        pcall(function() task.cancel(self.Thread) end)
        self.Thread = nil
    end
end

function ConfigManager:Set(key, value)
    self.Data[key] = value
end

function ConfigManager:Get(key, defaultValue)
    if self.Data[key] ~= nil then
        return self.Data[key]
    end
    return defaultValue
end

function ConfigManager:BindElement(key, elementType, getValueFunc, setValueFunc)
    self.Elements[key] = {
        Type = elementType,
        Get = getValueFunc,
        Set = setValueFunc
    }
    local saved = self:Get(key)
    if saved ~= nil and setValueFunc then
        pcall(function() setValueFunc(saved) end)
    end
end

function ConfigManager:SaveNamedConfig(name)
    if typeof(writefile) ~= "function" then return false end
    local path = self.WindowName .. "_" .. name .. "_W424.json"
    local ok, content = pcall(function()
        return HttpService:JSONEncode(self.Data)
    end)
    if ok and content then
        return pcall(writefile, path, content)
    end
    return false
end

function ConfigManager:LoadNamedConfig(name)
    if typeof(readfile) ~= "function" then return false end
    local path = self.WindowName .. "_" .. name .. "_W424.json"
    local ok, content = pcall(readfile, path)
    if ok and content and content ~= "" then
        local ok2, data = pcall(function()
            return HttpService:JSONDecode(content)
        end)
        if ok2 and type(data) == "table" then
            self.Data = data
            for key, elem in pairs(self.Elements) do
                if elem.Set and self.Data[key] ~= nil then
                    pcall(function() elem.Set(self.Data[key]) end)
                end
            end
            return true
        end
    end
    return false
end

function ConfigManager:DeleteNamedConfig(name)
    if typeof(delfile) == "function" then
        local path = self.WindowName .. "_" .. name .. "_W424.json"
        return pcall(delfile, path)
    end
    return false
end

function ConfigManager:GetAllConfigNames()
    local names = {}
    if typeof(listfiles) == "function" then
        local ok, files = pcall(listfiles)
        if ok and files then
            for _, file in ipairs(files) do
                local prefix = self.WindowName .. "_"
                local suffix = "_W424.json"
                if file:sub(1, #prefix) == prefix and file:sub(-#suffix) == suffix then
                    local name = file:sub(#prefix + 1, -#suffix - 1)
                    table.insert(names, name)
                end
            end
        end
    end
    return names
end

function ConfigManager:BuildConfigSection(tab)
    local section = tab:CreateSection({Name = "Configuration", Icon = "Settings", Collapsed = false})
    
    section:CreateToggle({
        Name = "Auto Save Config",
        Default = self.AutoSave,
        Callback = function(state)
            if state then
                self:EnableAutoSave(2)
                W424:Notify({Title = "Auto Save", Content = "Auto save enabled (2s)", Duration = 3, Icon = "Check"})
            else
                self:DisableAutoSave()
                W424:Notify({Title = "Auto Save", Content = "Auto save disabled", Duration = 3, Icon = "X"})
            end
        end
    })

    local configListDropdown = section:CreateDropdown({
        Name = "Config List",
        Options = self:GetAllConfigNames(),
        Default = "Select Config",
        Callback = function(val)
            self.SelectedConfig = val
        end
    })
    
    local configInput = section:CreateInput({
        Name = "Config Name",
        PlaceholderText = "Enter config name...",
        Callback = function(val)
            self.InputConfigName = val
        end
    })

    section:CreateButtonRow({
        {
            Name = "Save",
            Callback = function()
                local nameToSave = (self.InputConfigName and self.InputConfigName ~= "") and self.InputConfigName or self.SelectedConfig
                if nameToSave and nameToSave ~= "Select Config" then
                    self:SaveNamedConfig(nameToSave)
                    W424:Notify({Title = "Config Saved", Content = "Saved config: " .. nameToSave, Duration = 3, Icon = "Check"})
                    configListDropdown:Refresh(self:GetAllConfigNames(), nameToSave)
                else
                    W424:Notify({Title = "Error", Content = "Please enter or select a config name", Duration = 3, Icon = "AlertTriangle"})
                end
            end
        },
        {
            Name = "Load",
            Callback = function()
                if self.SelectedConfig and self.SelectedConfig ~= "Select Config" then
                    local success = self:LoadNamedConfig(self.SelectedConfig)
                    if success then
                        W424:Notify({Title = "Config Loaded", Content = "Loaded config: " .. self.SelectedConfig, Duration = 3, Icon = "Check"})
                    else
                        W424:Notify({Title = "Error", Content = "Failed to load config", Duration = 3, Icon = "AlertTriangle"})
                    end
                end
            end
        },
        {
            Name = "Remove",
            Callback = function()
                if self.SelectedConfig and self.SelectedConfig ~= "Select Config" then
                    self:DeleteNamedConfig(self.SelectedConfig)
                    W424:Notify({Title = "Config Removed", Content = "Removed config: " .. self.SelectedConfig, Duration = 3, Icon = "Trash"})
                    self.SelectedConfig = nil
                    configListDropdown:Refresh(self:GetAllConfigNames(), "Select Config")
                end
            end
        },
        {
            Name = "Clear All",
            Callback = function()
                local allConfigs = self:GetAllConfigNames()
                for _, name in ipairs(allConfigs) do
                    self:DeleteNamedConfig(name)
                end
                W424:Notify({Title = "Configs Cleared", Content = "All configs removed", Duration = 3, Icon = "Trash"})
                self.SelectedConfig = nil
                configListDropdown:Refresh({}, "Select Config")
            end
        }
    })
end

local NotifyScreen = nil
local NotifyLayout = nil
local ActiveNotifications = {}

local function InitNotify()
    if NotifyScreen then return end
    NotifyScreen = Create("ScreenGui", {
        Name = "W424Notify",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
    })
    NotifyLayout = Create("Frame", {
        Parent = NotifyScreen,
        Size = UDim2.new(0, 280, 1, -20),
        Position = UDim2.new(1, -290, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 200,
    })
    Create("UIListLayout", {
        Parent = NotifyLayout,
        Padding = UDim.new(0, 6),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
end

function W424:Notify(data)
    data = data or {}
    local title = data.Title or "Notification"
    local content = data.Content or ""
    local duration = data.Duration or 3
    local icon = data.Icon or "Info"
    local iconId = GetIcon(icon)

    InitNotify()

    local notifFrame = Create("Frame", {
        Parent = NotifyLayout,
        Size = UDim2.new(0, 260, 0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        LayoutOrder = #ActiveNotifications,
        ZIndex = 201,
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = notifFrame})
    local IconImg = Create("ImageLabel", {
        Parent = notifFrame,
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 6, 0, 6),
        BackgroundTransparency = 1,
        Image = iconId,
        ImageColor3 = CurrentTheme.Accent,
        ZIndex = 202,
    })

    local TitleLbl = Create("TextLabel", {
        Parent = notifFrame,
        Size = UDim2.new(1, -30, 0, 18),
        Position = UDim2.new(0, 28, 0, 6),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = CurrentTheme.Text,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 202,
    })

    local ContentLbl = Create("TextLabel", {
        Parent = notifFrame,
        Size = UDim2.new(1, -30, 0, 0),
        Position = UDim2.new(0, 28, 0, 22),
        BackgroundTransparency = 1,
        Text = content,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        AutomaticSize = Enum.AutomaticSize.Y,
        ZIndex = 202,
    })

    table.insert(ActiveNotifications, notifFrame)

    task.wait()
    local contentHeight = math.max(38, 18 + ContentLbl.AbsoluteSize.Y + 6)
    notifFrame.Size = UDim2.new(0, 240, 0, contentHeight)

    task.delay(duration, function()
        notifFrame.Size = UDim2.new(0, 0, 0, contentHeight)
        task.wait(0.1)
        notifFrame:Destroy()
        for i, n in ipairs(ActiveNotifications) do
            if n == notifFrame then
                table.remove(ActiveNotifications, i)
                break
            end
        end
    end)
end

local FloatingIconScreen = nil
local FloatingIconBtn = nil
local FloatingConnections = {}
local MainWindowScreen = nil
local MainFrame = nil
local IsMinimized = false
local IsClosed = false

local function CreateFloatingIcon(customIcon)
    for _, conn in ipairs(FloatingConnections) do
        if conn then conn:Disconnect() end
    end
    FloatingConnections = {}

    if FloatingIconScreen then
        FloatingIconScreen:Destroy()
    end

    local iconToUse = customIcon and GetIcon(customIcon) or GetIcon("Custom")

    FloatingIconScreen = Create("ScreenGui", {
        Name = "W424FloatingIcon",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
        Enabled = true
    })

    
    local Backdrop = Create("Frame", {
        Name = "Backdrop",
        Parent = FloatingIconScreen,
        Size = UDim2.new(0, 64, 0, 64),
        Position = UDim2.new(0, 14, 0.5, -32),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = true,
        ClipsDescendants = true,
        ZIndex = 1000
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = Backdrop
    })

    local isCustomImage = customIcon ~= nil
    local Icon = Create("ImageLabel", {
        Name = "Icon",
        Parent = Backdrop,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 58, 0, 58),
        BackgroundTransparency = 1,
        Image = iconToUse,
        ImageColor3 = isCustomImage and Color3.fromRGB(255, 255, 255) or CurrentTheme.Text,
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 1001
    })

    local mouseDownOnIcon = false
    local isDragging = false
    local dragStart = nil
    local startPos = nil
    local hasMoved = false
    local dragThreshold = 5

    local conn1 = Backdrop.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            mouseDownOnIcon = true
            isDragging = true
            hasMoved = false
            dragStart = input.Position
            startPos = Backdrop.Position
        end
    end)

    local conn2 = UserInputService.InputChanged:Connect(function(input)
        if isDragging and mouseDownOnIcon and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > dragThreshold or math.abs(delta.Y) > dragThreshold then
                hasMoved = true
            end
            if Backdrop and Backdrop.Parent then
                Backdrop.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end
    end)

    local conn3 = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if mouseDownOnIcon and not hasMoved then
                CloseAllDropdowns()
                if IsClosed then
                    IsClosed = false
                    if MainWindowScreen then
                        MainWindowScreen.Enabled = true
                    end
                    if MainFrame then
                        MainFrame.Visible = true
                        MainFrame.Size = UDim2.new(0, 440, 0, 280)
                        MainFrame.Position = UDim2.new(0.5, -200, 0.5, -130)
                    end
                elseif IsMinimized then
                    IsMinimized = false
                    if MainFrame then
                        MainFrame.Visible = true
                    end
                else
                    CloseAllDropdowns()
                    IsMinimized = true
                    if MainFrame then
                        MainFrame.Visible = false
                    end
                end
            end
            mouseDownOnIcon = false
            isDragging = false
        end
    end)

    table.insert(FloatingConnections, conn1)
    table.insert(FloatingConnections, conn2)
    table.insert(FloatingConnections, conn3)

    ListenTheme(function(theme)
        MainFrame.BackgroundColor3 = theme.Background
        Shadow.ImageColor3 = theme.Shadow
        Topbar.BackgroundColor3 = theme.Sidebar
        TopbarFix.BackgroundColor3 = theme.Sidebar
        TopAccentBar.BackgroundColor3 = theme.Accent
        Sidebar.BackgroundColor3 = theme.Sidebar
        Content.BackgroundColor3 = theme.Background
        TitleIcon.ImageColor3 = theme.Accent
        Divider.TextColor3 = theme.SubText
        SubTitle.TextColor3 = theme.Text
        DiscordIcon.ImageColor3 = theme.SubText
        DiscordDivider.TextColor3 = theme.SubText
        DiscordText.TextColor3 = theme.SubText
        TabList.ScrollBarImageColor3 = theme.Accent
        ConfirmOverlay.BackgroundColor3 = theme.Overlay
        ConfirmBox.BackgroundColor3 = theme.Background
        ConfirmNo.BackgroundColor3 = theme.Element
        ConfirmNo.TextColor3 = theme.Text
        ResizeHandle.ImageColor3 = theme.SubText
        SearchFrame.BackgroundColor3 = theme.Element
        SearchIcon.ImageColor3 = theme.SubText
        SearchBox.TextColor3 = theme.Text
        SearchBox.PlaceholderColor3 = theme.SubText
        DropdownPanel.BackgroundColor3 = theme.Background
        DropdownPanelTitle.TextColor3 = theme.Text
        DropdownPanelSearch.BackgroundColor3 = theme.Element
        DropdownPanelSearch.TextColor3 = theme.Text
        DropdownPanelSearch.PlaceholderColor3 = theme.SubText
        DropdownPanelScroll.ScrollBarImageColor3 = theme.Accent
    end)

    local WindowAPI = {}
    WindowAPI.Notify = function(_, d) W424:Notify(d) end
    WindowAPI.SetTitle = function(_, text)
        windowName = text
        Title.Text = text
    end
    WindowAPI.SetSubtitle = function(_, text)
        windowSubtitle = text
        SubTitle.Text = text
    end
    WindowAPI.SetVersion = function(_, ver)
        customVersion = ver
        Version.Text = "v" .. ver
    end
    WindowAPI.SetIcon = function(_, icon)
        windowIcon = icon
        TitleIcon.Image = GetIcon(icon)
    end
    WindowAPI.SetDiscord = function(_, link)
        discordLink = link
        DiscordText.Text = link
    end
    WindowAPI.Config = ConfigManager.new(windowName)
    WindowAPI.Config:Load()
    WindowAPI.Config:StartAutoSave()

    
    WindowAPI.EnableAutoSave = function(_, interval)
        WindowAPI.Config:EnableAutoSave(interval)
    end
    WindowAPI.DisableAutoSave = function(_)
        WindowAPI.Config:DisableAutoSave()
    end
    WindowAPI.SaveConfig = function(_)
        WindowAPI.Config:SaveNow()
    end
    WindowAPI.LoadConfig = function(_)
        WindowAPI.Config:Load()
    end
    WindowAPI.SetConfigValue = function(_, key, value)
        WindowAPI.Config:Set(key, value)
    end
    WindowAPI.GetConfigValue = function(_, key, defaultValue)
        return WindowAPI.Config:Get(key, defaultValue)
    end
    WindowAPI.BindConfigElement = function(_, key, elementType, getValueFunc, setValueFunc)
        WindowAPI.Config:BindElement(key, elementType, getValueFunc, setValueFunc)
    end
    WindowAPI.SaveNamedConfig = function(_, name)
        return WindowAPI.Config:SaveNamedConfig(name)
    end
    WindowAPI.LoadNamedConfig = function(_, name)
        return WindowAPI.Config:LoadNamedConfig(name)
    end
    WindowAPI.DeleteNamedConfig = function(_, name)
        return WindowAPI.Config:DeleteNamedConfig(name)
    end
    WindowAPI.GetConfigNames = function(_)
        return WindowAPI.Config:GetAllConfigNames()
    end

    local Tabs = {}
    local ActiveTab = nil
    local TabButtons = {}

    function WindowAPI:CreateTab(tabData)
        tabData = tabData or {}
        local tabName = tabData.Name or "Tab"
        local tabIcon = tabData.Icon or "Settings"

        local TabBtn = Create("TextButton", {
            Parent = TabList,
            Size = UDim2.new(1, -6, 0, 36),
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = #Tabs + 1,
            ZIndex = 17
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = TabBtn})

        local TabBtnIcon = Create("ImageLabel", {
            Parent = TabBtn,
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(0, 8, 0.5, -7),
            BackgroundTransparency = 1,
            Image = GetIcon(tabIcon),
            ImageColor3 = CurrentTheme.SubText,
            ZIndex = 18
        })

        local TabBtnText = Create("TextLabel", {
            Parent = TabBtn,
            Size = UDim2.new(0, 110, 0, 28),
            Position = UDim2.new(0, 24, 0, 2),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = CurrentTheme.SubText,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 18
        })

        local TabIndicator = Create("Frame", {
            Parent = TabBtn,
            Size = UDim2.new(0, 2, 0.5, 0),
            Position = UDim2.new(0, 0, 0.25, 0),
            BackgroundColor3 = CurrentTheme.Accent,
            BorderSizePixel = 0,
            Visible = false,
            ZIndex = 18
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 2), Parent = TabIndicator})

        local TabContent = Create("ScrollingFrame", {
            Parent = Content,
            Size = UDim2.new(1, -14, 1, -14),
            Position = UDim2.new(0, 6, 0, 6),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = CurrentTheme.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            ZIndex = 15
        })

        Create("UIListLayout", {
            Parent = TabContent,
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder
        })

        local function Activate()
            CloseAllDropdowns()
            if ActiveTab then
                ActiveTab.Content.Visible = false
                ActiveTab.Indicator.Visible = false
                ActiveTab.Button.BackgroundColor3 = CurrentTheme.Element
                ActiveTab.Icon.ImageColor3 = CurrentTheme.SubText
                ActiveTab.Label.TextColor3 = CurrentTheme.SubText
            end

            ActiveTab = {
                Button = TabBtn,
                Content = TabContent,
                Icon = TabBtnIcon,
                Label = TabBtnText,
                Indicator = TabIndicator
            }

            TabContent.Visible = true
            TabIndicator.Visible = true
            TabBtnIcon.ImageColor3 = CurrentTheme.Accent
            TabBtnText.TextColor3 = CurrentTheme.Text
        end

        TabBtn.MouseButton1Click:Connect(Activate)
        TabBtn.MouseEnter:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
        end)
        TabBtn.MouseLeave:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
        end)

        table.insert(Tabs, {Activate = Activate, Name = tabName, Button = TabBtn})
        table.insert(TabButtons, {Btn = TabBtn, Name = tabName:lower()})
        if #Tabs == 1 then Activate() end

        ListenTheme(function(theme)
            if ActiveTab and ActiveTab.Button == TabBtn then
                TabBtnIcon.ImageColor3 = theme.Accent
                TabBtnText.TextColor3 = theme.Text
            else
                TabBtnIcon.ImageColor3 = theme.SubText
                TabBtnText.TextColor3 = theme.SubText
            end
            TabIndicator.BackgroundColor3 = theme.Accent
            TabContent.ScrollBarImageColor3 = theme.Accent
        end)

        local TabAPI = {}
        TabAPI._CurrentSection = nil
        TabAPI._Sections = {}
        TabAPI._TabContent = TabContent

        function TabAPI:CreateSection(sectionData)
            sectionData = sectionData or {}
            local sectionName = sectionData.Name or "Section"
            local sectionIcon = sectionData.Icon or "Folder"
            local collapsed = sectionData.Collapsed or false
            local opened = sectionData.Opened
            if opened == nil then opened = not collapsed end
            if opened == false then collapsed = true end
            local isCollapsed = collapsed

            local SectionFrame = Create("Frame", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 44),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                LayoutOrder = #TabContent:GetChildren(),
                ZIndex = 16
            })
            Create("UICorner", {CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionFrame})

            local SectionHeader = Create("TextButton", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 0, 44),
                BackgroundTransparency = 1,
                Text = "",
                AutoButtonColor = false,
                ZIndex = 17
            })
            Create("UICorner", {CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionHeader})

            Create("ImageLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 10, 0.5, -8),
                BackgroundTransparency = 1,
                Image = GetIcon(sectionIcon),
                ImageColor3 = CurrentTheme.Accent,
                ZIndex = 18
            })

            Create("TextLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(1, -60, 0, 20),
                Position = UDim2.new(0, 32, 0.5, -10),
                BackgroundTransparency = 1,
                Text = sectionName,
                TextColor3 = CurrentTheme.Text,
                TextSize = 11,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 18
            })

            local Arrow = Create("ImageLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(0, 14, 0, 14),
                Position = UDim2.new(1, -30, 0.5, -6),
                BackgroundTransparency = 1,
                Image = GetIcon("ChevronDown"),
                ImageColor3 = CurrentTheme.SubText,
                ZIndex = 18
            })

            local SectionItems = Create("Frame", {
                Parent = SectionFrame,
                Size = UDim2.new(1, -12, 0, 0),
                Position = UDim2.new(0, 8, 0, 42),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Visible = not isCollapsed,
                ClipsDescendants = false,
                ZIndex = 17
            })

            Create("UIListLayout", {
                Parent = SectionItems,
                Padding = UDim.new(0, 3),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            local isCollapsed = collapsed
            local targetHeight = 36
            local sectionDropdowns = {}

            local function UpdateSize()
                local itemsHeight = SectionItems.UIListLayout.AbsoluteContentSize.Y
                targetHeight = 40 + itemsHeight + 6
                if isCollapsed then
                    SectionFrame.Size = UDim2.new(1, 0, 0, 44)
                    SectionItems.Visible = false
                    SectionItems.Size = UDim2.new(1, -12, 0, 0)
                    Arrow.Rotation = 0
                    for _, dd in ipairs(sectionDropdowns) do
                        if dd and dd.Menu and dd.Menu.Parent then
                            dd.Menu.Visible = false
                            dd.Menu.Size = UDim2.new(0, dd.Menu.Size.X.Offset, 0, 0)
                            if dd.Arrow then dd.Arrow.Rotation = 0 end
                            dd.IsOpen = false
                            if dd.HeartbeatConn then
                                pcall(function() dd.HeartbeatConn:Disconnect() end)
                                dd.HeartbeatConn = nil
                            end
                        end
                    end
                else
                    SectionFrame.Size = UDim2.new(1, 0, 0, targetHeight)
                    SectionItems.Visible = true
                    SectionItems.Size = UDim2.new(1, -12, 0, itemsHeight + 6)
                    Arrow.Rotation = 180
                end
                TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContent.UIListLayout.AbsoluteContentSize.Y + 16)
            end

            SectionItems.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                if not isCollapsed then
                    UpdateSize()
                end
            end)

            SectionHeader.MouseButton1Click:Connect(function()
                isCollapsed = not isCollapsed
                UpdateSize()
            end)

            if not collapsed then
                Arrow.Rotation = 180
                task.wait(0.05)
                UpdateSize()
            end

            ListenTheme(function(theme)
                Arrow.ImageColor3 = theme.SubText
            end)

            SectionItems.ChildAdded:Connect(function()
                task.wait(0.1)
                if not isCollapsed then
                    UpdateSize()
                end
            end)

            local SectionAPI = {}
            SectionAPI._SectionItems = SectionItems
            SectionAPI._SectionDropdowns = sectionDropdowns
            SectionAPI._UpdateSize = UpdateSize

            function SectionAPI:CreateToggle(toggleData)
                toggleData = toggleData or {}
                local toggleName = toggleData.Name or "Toggle"
                local toggleIcon = toggleData.Icon or "ToggleLeft"
                local default = toggleData.Default or false
                local callback = toggleData.Callback or function() end
                local desc = toggleData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 30

                local ToggleFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ToggleFrame})

                Create("ImageLabel", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 7),
                    BackgroundTransparency = 1,
                    Image = GetIcon(toggleIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 150, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 4),
                    BackgroundTransparency = 1,
                    Text = toggleName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = ToggleFrame,
                        Size = UDim2.new(1, -60, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local ToggleBtn = Create("Frame", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 40, 0, 22),
                    Position = UDim2.new(1, -56, 0.5, -11),
                    BackgroundColor3 = CurrentTheme.ToggleOff,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ToggleBtn})

                local ToggleCircle = Create("Frame", {
                    Parent = ToggleBtn,
                    Size = UDim2.new(0, 16, 0, 16),
                    Position = UDim2.new(0, 3, 0.5, -8),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ToggleCircle})

                local ToggleClick = Create("TextButton", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    ZIndex = 25
                })

                local state = default
                if default then
                    ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                    ToggleCircle.Position = UDim2.new(0, 21, 0.5, -8)
                end

                ToggleClick.MouseButton1Click:Connect(function()
                    state = not state
                    if state then
                        ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                        ToggleCircle.Position = UDim2.new(0, 21, 0.5, -8)
                    else
                        ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOff
                        ToggleCircle.Position = UDim2.new(0, 3, 0.5, -10)
                    end
                    callback(state)
                end)

                ListenTheme(function(theme)
                    ToggleFrame.BackgroundColor3 = theme.Background
                    ToggleCircle.BackgroundColor3 = theme.Text
                    if state then
                        ToggleBtn.BackgroundColor3 = theme.ToggleOn
                    else
                        ToggleBtn.BackgroundColor3 = theme.ToggleOff
                    end
                end)

                local API = {
                    Set = function(val)
                        state = val
                        if state then
                            ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                            ToggleCircle.Position = UDim2.new(0, 21, 0.5, -8)
                        else
                            ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOff
                            ToggleCircle.Position = UDim2.new(0, 3, 0.5, -10)
                        end
                        callback(state)
                    end,
                    Get = function() return state end
                }
                return API
            end

            function SectionAPI:CreateSlider(sliderData)
                sliderData = sliderData or {}
                local sliderName = sliderData.Name or "Slider"
                local sliderIcon = sliderData.Icon or "Sliders"
                local min = sliderData.Min or 0
                local max = sliderData.Max or 100
                local default = sliderData.Default or min
                local increment = sliderData.Increment or 1
                local callback = sliderData.Callback or function() end
                local desc = sliderData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 50 or 40

                local SliderFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = SliderFrame})

                Create("ImageLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(sliderIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 110, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = sliderName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = SliderFrame,
                        Size = UDim2.new(1, -14, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local ValueLabel = Create("TextLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 38, 0, 14),
                    Position = UDim2.new(1, -42, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = tostring(default),
                    TextColor3 = CurrentTheme.Accent,
                    TextSize = 11,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 19
                })

                local Track = Create("Frame", {
                    Parent = SliderFrame,
                    Size = UDim2.new(1, -14, 0, 4),
                    Position = UDim2.new(0, 7, 0, hasDesc and 36 or 26),
                    BackgroundColor3 = Color3.fromRGB(35, 35, 40),
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Track})

                local Fill = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                    BackgroundColor3 = CurrentTheme.Accent,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Fill})

                local Knob = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new((default - min) / (max - min), -6, 0.5, -6),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 21
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Knob})

                local draggingSlider = false

                local function UpdateSlider(input)
                    local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
                    local value = math.clamp(Round(min + (pos * (max - min)), math.log10(1/increment)), min, max)
                    value = math.floor(value / increment + 0.5) * increment
                    Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                    Knob.Position = UDim2.new((value - min) / (max - min), -6, 0.5, -6)
                    ValueLabel.Text = tostring(value)
                    callback(value)
                end

                Knob.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingSlider = true
                    end
                end)

                Track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingSlider = true
                        UpdateSlider(input)
                    end
                end)

                UserInputService.InputChanged:Connect(function(input)
                    if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        UpdateSlider(input)
                    end
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingSlider = false
                    end
                end)

                ListenTheme(function(theme)
                    SliderFrame.BackgroundColor3 = theme.Background
                    Track.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
                    Fill.BackgroundColor3 = theme.Accent
                    Knob.BackgroundColor3 = theme.Text
                    ValueLabel.TextColor3 = theme.Accent
                end)

                local API = {
                    Set = function(val)
                        val = math.clamp(val, min, max)
                        val = math.floor(val / increment + 0.5) * increment
                        Fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
                        Knob.Position = UDim2.new((val - min) / (max - min), -6, 0.5, -6)
                        ValueLabel.Text = tostring(val)
                        callback(val)
                    end,
                    Get = function() return tonumber(ValueLabel.Text) or default end
                }
                return API
            end

            function SectionAPI:CreateButton(buttonData)
                buttonData = buttonData or {}
                local buttonName = buttonData.Name or "Button"
                local buttonIcon = buttonData.Icon or "Command"
                local callback = buttonData.Callback or function() end
                local desc = buttonData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local Btn = Create("TextButton", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = Color3.fromRGB(30, 110, 220),
                    Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = Btn})

                Create("ImageLabel", {
                    Parent = Btn,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(buttonIcon),
                    ImageColor3 = CurrentTheme.Text,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = Btn,
                    Size = UDim2.new(0, 150, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = buttonName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = Btn,
                        Size = UDim2.new(1, -26, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.Text,
                        TextTransparency = 0.3,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                Btn.MouseEnter:Connect(function()
                    Btn.BackgroundColor3 = Color3.fromRGB(50, 140, 255)
                end)
                Btn.MouseLeave:Connect(function()
                    Btn.BackgroundColor3 = Color3.fromRGB(30, 110, 220)
                end)
                Btn.MouseButton1Down:Connect(function()
                    Btn.BackgroundColor3 = Color3.fromRGB(90, 180, 255)
                end)
                Btn.MouseButton1Up:Connect(function()
                    Btn.BackgroundColor3 = Color3.fromRGB(50, 140, 255)
                end)
                Btn.MouseButton1Click:Connect(function()
                    callback()
                end)

                ListenTheme(function(theme)
                    Btn.BackgroundColor3 = Color3.fromRGB(30, 110, 220)
                end)

                return {Click = callback}
            end

            function SectionAPI:CreateButtonRow(buttonsData)
                local RowFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 28),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })

                Create("UIListLayout", {
                    Parent = RowFrame,
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                })

                local buttonWidth = 1 / #buttonsData
                
                for _, data in ipairs(buttonsData) do
                    local btn = Create("TextButton", {
                        Parent = RowFrame,
                        Size = UDim2.new(buttonWidth, -((#buttonsData - 1) * 4 / #buttonsData), 1, 0),
                        BackgroundColor3 = CurrentTheme.Element,
                        Text = data.Name or "Button",
                        TextColor3 = CurrentTheme.Text,
                        TextSize = 11,
                        Font = Enum.Font.GothamBold,
                        AutoButtonColor = false,
                        ZIndex = 19
                    })
                    Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = btn})
                    Create("UIStroke", {
                        Color = CurrentTheme.Border,
                        Thickness = 1,
                        Transparency = 0.5,
                        Parent = btn
                    })

                    btn.MouseEnter:Connect(function()
                        btn.BackgroundColor3 = CurrentTheme.Accent
                        btn.TextColor3 = Color3.fromRGB(0, 0, 0)
                    end)
                    btn.MouseLeave:Connect(function()
                        btn.BackgroundColor3 = CurrentTheme.Element
                        btn.TextColor3 = CurrentTheme.Text
                    end)
                    btn.MouseButton1Click:Connect(function()
                        if data.Callback then data.Callback() end
                    end)
                end
                
                ListenTheme(function(theme)
                    for _, child in ipairs(RowFrame:GetChildren()) do
                        if child:IsA("TextButton") then
                            child.BackgroundColor3 = theme.Element
                            child.TextColor3 = theme.Text
                            local stroke = child:FindFirstChildOfClass("UIStroke")
                            if stroke then stroke.Color = theme.Border end
                        end
                    end
                end)
            end

            function SectionAPI:CreateDropdown(dropdownData)
                dropdownData = dropdownData or {}
                local dropdownName = dropdownData.Name or "Dropdown"
                local dropdownIcon = dropdownData.Icon or "ChevronDown"
                local options = dropdownData.Options or dropdownData.Values or {}
                local default = dropdownData.Default or ""
                local callback = dropdownData.Callback or function() end
                local desc = dropdownData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local DropdownFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Element,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = DropdownFrame})

                Create("ImageLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(dropdownIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0.4, 0, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = DropdownFrame,
                        Size = UDim2.new(1, -120, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local DropdownBtn = Create("TextButton", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 150, 0, 26),
                    Position = UDim2.new(1, -158, 0, hasDesc and 8 or 2),
                    BackgroundColor3 = Color3.fromRGB(55, 55, 60),
                    Text = "",
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = DropdownBtn})
                Create("UIStroke", {
                    Color = Color3.fromRGB(80, 80, 85),
                    Thickness = 1,
                    Transparency = 0.5,
                    Parent = DropdownBtn
                })
                Create("UIStroke", {
                    Color = Color3.fromRGB(0, 140, 255),
                    Thickness = 1,
                    Transparency = 0.7,
                    Parent = DropdownBtn
                })

                local Arrow = Create("ImageLabel", {
                    Parent = DropdownBtn,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(1, -18, 0.5, -7),
                    BackgroundTransparency = 1,
                    Image = GetIcon("ChevronDown"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 20
                })

                local selected = default
                local function UpdateButtonText()
                    local selText, _ = NormalizeOption(selected)
                    if selText ~= "" then
                        DropdownBtn.Text = selText
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    else
                        DropdownBtn.Text = "Select option"
                        DropdownBtn.TextColor3 = CurrentTheme.SubText
                    end
                end
                UpdateButtonText()

                local optionButtons = {}

                local function BuildOptions(filterText)
                    for _, btn in ipairs(optionButtons) do
                        if btn then btn:Destroy() end
                    end
                    optionButtons = {}

                    for _, child in ipairs(DropdownPanelScroll:GetChildren()) do
                        if child:IsA("GuiObject") and child.Name ~= "UIListLayout" then
                            child:Destroy()
                        end
                    end

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then
                            local optBtn = Create("TextButton", {
                                Parent = DropdownPanelScroll,
                                Size = UDim2.new(1, 0, 0, 30),
                                BackgroundColor3 = CurrentTheme.Element,
                                Text = "",
                                TextColor3 = CurrentTheme.Text,
                                TextSize = 12,
                                Font = Enum.Font.Gotham,
                                ZIndex = 101
                            })
                            Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = optBtn})

                            if optIcon then
                                Create("ImageLabel", {
                                    Parent = optBtn,
                                    Size = UDim2.new(0, 14, 0, 14),
                                    Position = UDim2.new(0, 5, 0.5, -5),
                                    BackgroundTransparency = 1,
                                    Image = GetIcon(optIcon),
                                    ImageColor3 = CurrentTheme.SubText,
                                    ZIndex = 102,
                                })
                                local txt = Create("TextLabel", {
                                    Parent = optBtn,
                                    Size = UDim2.new(1, -20, 1, 0),
                                    Position = UDim2.new(0, 20, 0, 0),
                                    BackgroundTransparency = 1,
                                    Text = optText,
                                    TextColor3 = CurrentTheme.Text,
                                    TextSize = 12,
                                    Font = Enum.Font.Gotham,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    ZIndex = 102,
                                })
                            else
                                optBtn.Text = optText
                            end

                            optBtn.MouseButton1Click:Connect(function()
                                selected = opt
                                UpdateButtonText()
                                callback(selected)
                                CloseAllDropdowns()
                            end)

                            optBtn.MouseEnter:Connect(function()
                                optBtn.BackgroundColor3 = CurrentTheme.Accent
                            end)
                            optBtn.MouseLeave:Connect(function()
                                optBtn.BackgroundColor3 = CurrentTheme.Element
                            end)

                            table.insert(optionButtons, optBtn)
                            count = count + 1
                        end
                    end
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    if CurrentDropdownState.IsOpen and CurrentDropdownState.Button == DropdownBtn then
                        CloseAllDropdowns()
                    else
                        CloseAllDropdowns()
                        CurrentDropdownState.IsOpen = true
                        CurrentDropdownState.IsMulti = false
                        CurrentDropdownState.Options = options
                        CurrentDropdownState.Selected = selected
                        CurrentDropdownState.Callback = callback
                        CurrentDropdownState.Arrow = Arrow
                        CurrentDropdownState.Button = DropdownBtn
                        CurrentDropdownState.Rebuild = BuildOptions
                        CurrentDropdownState.OptionButtons = optionButtons

                        DropdownPanelTitle.Text = dropdownName
                        DropdownPanelSearch.Text = ""

                        DropdownPanel.Position = UDim2.new(1, 20, 0, Config.TopbarHeight)
                        DropdownPanel.Visible = true
                        DropdownOverlay.Visible = true
                        Tween(DropdownOverlay, {BackgroundTransparency = 0.88}, 0.2)
                        Tween(DropdownPanel, {Position = UDim2.new(1, -180, 0, Config.TopbarHeight)}, 0.3)
                        Arrow.Rotation = 180

                        BuildOptions("")
                    end
                end)

                TabContent:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                    if CurrentDropdownState.IsOpen and CurrentDropdownState.Button == DropdownBtn then
                        CloseAllDropdowns()
                    end
                end)

                ListenTheme(function(theme)
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
                    UpdateButtonText()
                    Arrow.ImageColor3 = theme.SubText
                    DropdownPanel.BackgroundColor3 = theme.Background
                    DropdownPanelSearch.BackgroundColor3 = theme.Element
                    DropdownPanelSearch.TextColor3 = theme.Text
                    DropdownPanelSearch.PlaceholderColor3 = theme.SubText
                    DropdownPanelScroll.ScrollBarImageColor3 = theme.Accent
                    for _, btn in ipairs(optionButtons) do
                        if btn and btn.Parent then
                            btn.BackgroundColor3 = theme.Element
                            if btn:IsA("TextButton") and btn.Text ~= "" then
                                btn.TextColor3 = theme.Text
                            end
                        end
                    end
                end)

                local DropdownAPI = {}
                function DropdownAPI:Refresh(newOptions, newDefault)
                    options = newOptions or {}
                    if newDefault ~= nil then
                        selected = newDefault
                        UpdateButtonText()
                    end
                    if CurrentDropdownState.IsOpen and CurrentDropdownState.Button == DropdownBtn then
                        BuildOptions(DropdownPanelSearch.Text)
                    end
                end
                function DropdownAPI:Set(value)
                    selected = value
                    UpdateButtonText()
                    callback(selected)
                end
                function DropdownAPI:Get()
                    return selected
                end
                return DropdownAPI
            end

            function SectionAPI:CreateMultiDropdown(dropdownData)
                dropdownData = dropdownData or {}
                local dropdownName = dropdownData.Name or "MultiDropdown"
                local dropdownIcon = dropdownData.Icon or "ChevronDown"
                local options = dropdownData.Options or dropdownData.Values or {}
                local default = dropdownData.Default or {}
                local callback = dropdownData.Callback or function() end
                local desc = dropdownData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local DropdownFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Element,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = DropdownFrame})

                Create("ImageLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(dropdownIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0.4, 0, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = DropdownFrame,
                        Size = UDim2.new(1, -120, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local DropdownBtn = Create("TextButton", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 150, 0, 26),
                    Position = UDim2.new(1, -158, 0, hasDesc and 8 or 2),
                    BackgroundColor3 = Color3.fromRGB(55, 55, 60),
                    Text = "",
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = DropdownBtn})
                Create("UIStroke", {
                    Color = Color3.fromRGB(80, 80, 85),
                    Thickness = 1,
                    Transparency = 0.5,
                    Parent = DropdownBtn
                })
                Create("UIStroke", {
                    Color = Color3.fromRGB(0, 140, 255),
                    Thickness = 1,
                    Transparency = 0.7,
                    Parent = DropdownBtn
                })

                local Arrow = Create("ImageLabel", {
                    Parent = DropdownBtn,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(1, -18, 0.5, -7),
                    BackgroundTransparency = 1,
                    Image = GetIcon("ChevronDown"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 20
                })

                local selected = {}
                if type(default) == "table" then
                    for _, v in ipairs(default) do
                        table.insert(selected, v)
                    end
                end

                local function UpdateButtonText()
                    if #selected == 0 then
                        DropdownBtn.Text = "Select options"
                        DropdownBtn.TextColor3 = CurrentTheme.SubText
                    elseif #selected == 1 then
                        local t, _ = NormalizeOption(selected[1])
                        DropdownBtn.Text = t
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    else
                        DropdownBtn.Text = #selected .. " selected"
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    end
                end
                UpdateButtonText()

                local optionItems = {}

                local function IsSelected(opt)
                    for _, s in ipairs(selected) do
                        local sText, _ = NormalizeOption(s)
                        local oText, _ = NormalizeOption(opt)
                        if sText == oText then return true end
                    end
                    return false
                end

                local function BuildOptions(filterText)
                    for _, item in ipairs(optionItems) do
                        if item then item:Destroy() end
                    end
                    optionItems = {}

                    for _, child in ipairs(DropdownPanelScroll:GetChildren()) do
                        if child:IsA("GuiObject") and child.Name ~= "UIListLayout" then
                            child:Destroy()
                        end
                    end

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then

                        local row = Create("Frame", {
                            Parent = DropdownPanelScroll,
                            Size = UDim2.new(1, 0, 0, 26),
                            BackgroundColor3 = CurrentTheme.Element,
                            ZIndex = 101,
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = row})

                        local checkBox = Create("Frame", {
                            Parent = row,
                            Size = UDim2.new(0, 14, 0, 14),
                            Position = UDim2.new(0, 6, 0.5, -7),
                            BackgroundColor3 = CurrentTheme.Background,
                            BorderSizePixel = 0,
                            ZIndex = 102,
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 2), Parent = checkBox})

                        local checkMark = Create("ImageLabel", {
                            Parent = checkBox,
                            Size = UDim2.new(0, 14, 0, 14),
                            Position = UDim2.new(0.5, -6, 0.5, -6),
                            BackgroundTransparency = 1,
                            Image = GetIcon("Check"),
                            ImageColor3 = CurrentTheme.Accent,
                            ZIndex = 103,
                            Visible = IsSelected(opt),
                        })

                        local textX = 26
                        if optIcon then
                            Create("ImageLabel", {
                                Parent = row,
                                Size = UDim2.new(0, 14, 0, 14),
                                Position = UDim2.new(0, 22, 0.5, -6),
                                BackgroundTransparency = 1,
                                Image = GetIcon(optIcon),
                                ImageColor3 = CurrentTheme.SubText,
                                ZIndex = 102,
                            })
                            textX = 44
                        end

                        local txt = Create("TextLabel", {
                            Parent = row,
                            Size = UDim2.new(1, -textX - 4, 1, 0),
                            Position = UDim2.new(0, textX, 0, 0),
                            BackgroundTransparency = 1,
                            Text = optText,
                            TextColor3 = CurrentTheme.Text,
                            TextSize = 11,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 102,
                        })

                        local clickBtn = Create("TextButton", {
                            Parent = row,
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Text = "",
                            ZIndex = 104,
                        })

                        clickBtn.MouseButton1Click:Connect(function()
                            local selIdx = nil
                            for i, s in ipairs(selected) do
                                local sText, _ = NormalizeOption(s)
                                if sText == optText then selIdx = i; break end
                            end
                            if selIdx then
                                table.remove(selected, selIdx)
                                checkMark.Visible = false
                            else
                                table.insert(selected, opt)
                                checkMark.Visible = true
                            end
                            UpdateButtonText()
                            callback(selected)
                        end)

                        row.MouseEnter:Connect(function()
                            row.BackgroundColor3 = CurrentTheme.ElementHover
                        end)
                        row.MouseLeave:Connect(function()
                            row.BackgroundColor3 = CurrentTheme.Element
                        end)

                        table.insert(optionItems, row)
                        count = count + 1
                        end
                    end
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    if CurrentDropdownState.IsOpen and CurrentDropdownState.Button == DropdownBtn then
                        CloseAllDropdowns()
                    else
                        CloseAllDropdowns()
                        CurrentDropdownState.IsOpen = true
                        CurrentDropdownState.IsMulti = true
                        CurrentDropdownState.Options = options
                        CurrentDropdownState.Selected = selected
                        CurrentDropdownState.Callback = callback
                        CurrentDropdownState.Arrow = Arrow
                        CurrentDropdownState.Button = DropdownBtn
                        CurrentDropdownState.Rebuild = BuildOptions
                        CurrentDropdownState.OptionButtons = optionItems

                        DropdownPanelTitle.Text = dropdownName
                        DropdownPanelSearch.Text = ""

                        DropdownPanel.Position = UDim2.new(1, 20, 0, Config.TopbarHeight)
                        DropdownPanel.Visible = true
                        DropdownOverlay.Visible = true
                        Tween(DropdownOverlay, {BackgroundTransparency = 0.88}, 0.2)
                        Tween(DropdownPanel, {Position = UDim2.new(1, -180, 0, Config.TopbarHeight)}, 0.3)
                        Arrow.Rotation = 180

                        BuildOptions()
                    end
                end)

                TabContent:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                    if CurrentDropdownState.IsOpen and CurrentDropdownState.Button == DropdownBtn then
                        CloseAllDropdowns()
                    end
                end)

                ListenTheme(function(theme)
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
                    UpdateButtonText()
                    Arrow.ImageColor3 = theme.SubText
                    DropdownPanel.BackgroundColor3 = theme.Background
                    DropdownPanelSearch.BackgroundColor3 = theme.Element
                    DropdownPanelSearch.TextColor3 = theme.Text
                    DropdownPanelSearch.PlaceholderColor3 = theme.SubText
                    DropdownPanelScroll.ScrollBarImageColor3 = theme.Accent
                    for _, row in ipairs(optionItems) do
                        if row and row.Parent then
                            row.BackgroundColor3 = theme.Element
                        end
                    end
                end)

                local MultiDropdownAPI = {}
                function MultiDropdownAPI:Refresh(newOptions, newDefault)
                    options = newOptions or {}
                    if type(newDefault) == "table" then
                        selected = {}
                        for _, v in ipairs(newDefault) do table.insert(selected, v) end
                        UpdateButtonText()
                    end
                    if CurrentDropdownState.IsOpen and CurrentDropdownState.Button == DropdownBtn then
                        BuildOptions(DropdownPanelSearch.Text)
                    end
                end
                function MultiDropdownAPI:Set(values)
                    selected = {}
                    if type(values) == "table" then
                        for _, v in ipairs(values) do table.insert(selected, v) end
                    end
                    UpdateButtonText()
                    callback(selected)
                end
                function MultiDropdownAPI:Get()
                    return selected
                end
                return MultiDropdownAPI
            end

            function SectionAPI:CreateInput(inputData)
                inputData = inputData or {}
                local inputName = inputData.Name or "Input"
                local inputIcon = inputData.Icon or "Type"
                local placeholder = inputData.Placeholder or "Enter..."
                local default = inputData.Default or ""
                local callback = inputData.Callback or function() end
                local desc = inputData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local InputFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = InputFrame})

                Create("ImageLabel", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(inputIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 76, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = inputName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = InputFrame,
                        Size = UDim2.new(1, -120, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local InputBox = Create("TextBox", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 92, 0, 24),
                    Position = UDim2.new(1, -99, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = Color3.fromRGB(55, 55, 60),
                    Text = default,
                    PlaceholderText = placeholder,
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = InputBox})
                Create("UIStroke", {
                    Color = Color3.fromRGB(80, 80, 85),
                    Thickness = 1,
                    Transparency = 0.5,
                    Parent = InputBox
                })

                InputBox.FocusLost:Connect(function(enterPressed)
                    callback(InputBox.Text, enterPressed)
                end)

                ListenTheme(function(theme)
                    InputFrame.BackgroundColor3 = theme.Background
                    InputBox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
                    InputBox.TextColor3 = theme.Text
                    InputBox.PlaceholderColor3 = theme.SubText
                end)

                local API = {
                    Set = function(text) InputBox.Text = text end,
                    Get = function() return InputBox.Text end
                }
                return API
            end

            function SectionAPI:CreateKeybind(bindData)
                bindData = bindData or {}
                local bindName = bindData.Name or "Keybind"
                local bindIcon = bindData.Icon or "Key"
                local default = bindData.Default or Enum.KeyCode.LeftShift
                local callback = bindData.Callback or function() end
                local desc = bindData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local BindFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = BindFrame})

                Create("ImageLabel", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(bindIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 110, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = bindName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = BindFrame,
                        Size = UDim2.new(1, -70, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local BindBtn = Create("TextButton", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 46, 0, 24),
                    Position = UDim2.new(1, -52, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = default.Name,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.GothamBold,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = BindBtn})

                local listening = false
                BindBtn.MouseButton1Click:Connect(function()
                    listening = true
                    BindBtn.Text = "..."
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            default = input.KeyCode
                            BindBtn.Text = input.KeyCode.Name
                            listening = false
                            conn:Disconnect()
                            callback(input.KeyCode)
                        end
                    end)
                end)

                UserInputService.InputBegan:Connect(function(input)
                    if input.KeyCode == default and not listening then
                        callback(default)
                    end
                end)

                ListenTheme(function(theme)
                    BindFrame.BackgroundColor3 = theme.Background
                    BindBtn.BackgroundColor3 = theme.Element
                    BindBtn.TextColor3 = theme.Text
                end)

                return {Set = function(key) default = key; BindBtn.Text = key.Name end, Get = function() return default end}
            end

            function SectionAPI:CreateLabel(labelData)
                labelData = labelData or {}
                local labelText = labelData.Text or "Label"
                local labelIcon = labelData.Icon or "Type"

                local LabelFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 26),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = LabelFrame})

                Create("ImageLabel", {
                    Parent = LabelFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = GetIcon(labelIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                local Label = Create("TextLabel", {
                    Parent = LabelFrame,
                    Size = UDim2.new(0, 200, 0, 18),
                    Position = UDim2.new(0, 22, 0, 0),
                    BackgroundTransparency = 1,
                    Text = labelText,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    RichText = true,
                    ZIndex = 19
                })

                ListenTheme(function(theme)
                    LabelFrame.BackgroundColor3 = theme.Background
                    Label.TextColor3 = theme.Text
                end)

                return {Set = function(text) Label.Text = text end, Get = function() return Label.Text end}
            end

            function SectionAPI:CreateParagraph(paraData)
                paraData = paraData or {}
                local title = paraData.Title or "Paragraph"
                local content = paraData.Content or paraData.Desc or "Description text goes here..."
                local icon = paraData.Icon or "Type"

                local ParaFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ParaFrame})
                Create("UIStroke", {
                    Color = Color3.fromRGB(0, 140, 255),
                    Thickness = 1,
                    Transparency = 0.85,
                    Parent = ParaFrame
                })

                Create("ImageLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, 8),
                    BackgroundTransparency = 1,
                    Image = GetIcon(icon),
                    ImageColor3 = CurrentTheme.Accent,
                    ZIndex = 19
                })

                local TitleLabel = Create("TextLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(1, -26, 0, 14),
                    Position = UDim2.new(0, 22, 0, 4),
                    BackgroundTransparency = 1,
                    Text = title,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    ClipsDescendants = true,
                    ZIndex = 19
                })

                local ContentLabel = Create("TextLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(1, -14, 0, 0),
                    Position = UDim2.new(0, 7, 0, 24),
                    BackgroundTransparency = 1,
                    Text = content,
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    RichText = true,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    ZIndex = 19
                })

                local function RefreshSize()
                    task.wait()
                    if not ParaFrame or not ParaFrame.Parent then return end
                    local width = math.max(ParaFrame.AbsoluteSize.X - 18, 50)
                    if width > 0 then
                        local bounds = TextService:GetTextSize(ContentLabel.Text, ContentLabel.TextSize, ContentLabel.Font, Vector2.new(width, math.huge))
                        local newHeight = 28 + bounds.Y + 10
                        ParaFrame.Size = UDim2.new(1, 0, 0, newHeight)
                    end
                    if self._UpdateSize then
                        self._UpdateSize()
                    end
                end

                task.defer(RefreshSize)
                ContentLabel:GetPropertyChangedSignal("Text"):Connect(RefreshSize)
                ParaFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    if ParaFrame.AbsoluteSize.X > 0 then
                        RefreshSize()
                    end
                end)

                
                task.spawn(function()
                    for i = 1, 5 do
                        task.wait(0.1)
                        if not ParaFrame or not ParaFrame.Parent then break end
                        RefreshSize()
                    end
                end)

                ListenTheme(function(theme)
                    ParaFrame.BackgroundColor3 = theme.Background
                    TitleLabel.TextColor3 = theme.Text
                    ContentLabel.TextColor3 = theme.SubText
                end)

                local API = {
                    SetTitle = function(t) TitleLabel.Text = t end,
                    SetContent = function(c) ContentLabel.Text = c end,
                    SetDesc = function(c) ContentLabel.Text = c end,
                    GetContent = function() return ContentLabel.Text end,
                }
                return API
            end

            function SectionAPI:CreateColorPicker(pickerData)
                pickerData = pickerData or {}
                local pickerName = pickerData.Name or "Color"
                local pickerIcon = pickerData.Icon or "Palette"
                local default = pickerData.Default or Color3.fromRGB(255, 255, 255)
                local callback = pickerData.Callback or function() end
                local desc = pickerData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local PickerFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = PickerFrame})

                Create("ImageLabel", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(pickerIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 110, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = pickerName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = PickerFrame,
                        Size = UDim2.new(1, -70, 0, 10),
                        Position = UDim2.new(0, 22, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local ColorPreview = Create("TextButton", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 34, 0, 24),
                    Position = UDim2.new(1, -41, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = default,
                    Text = "",
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = ColorPreview})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ColorPreview})

                local ColorMenu = Create("Frame", {
                    Parent = ColorPreview,
                    Size = UDim2.new(0, 105, 0, 0),
                    Position = UDim2.new(0, -50, 0, 18),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 30
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ColorMenu})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ColorMenu})

                local RInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 34, 0, 30),
                    Position = UDim2.new(0, 5, 0, 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.R * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = RInput})

                local GInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 34, 0, 30),
                    Position = UDim2.new(0, 42, 0, 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.G * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = GInput})

                local BInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 34, 0, 30),
                    Position = UDim2.new(0, 79, 0, 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.B * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = BInput})

                local ApplyBtn = Create("TextButton", {
                    Parent = ColorMenu,
                    Size = UDim2.new(1, -10, 0, 30),
                    Position = UDim2.new(0, 5, 0, 30),
                    BackgroundColor3 = CurrentTheme.Accent,
                    Text = "Apply",
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.GothamBold,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = ApplyBtn})

                local colorOpen = false
                ColorPreview.MouseButton1Click:Connect(function()
                    colorOpen = not colorOpen
                    if colorOpen then
                        ColorMenu.Visible = true
                        ColorMenu.Size = UDim2.new(0, 95, 0, 42)
                    else
                        ColorMenu.Visible = false
                        ColorMenu.Size = UDim2.new(0, 105, 0, 0)
                    end
                end)

                ApplyBtn.MouseButton1Click:Connect(function()
                    local r = math.clamp(tonumber(RInput.Text) or 255, 0, 255)
                    local g = math.clamp(tonumber(GInput.Text) or 255, 0, 255)
                    local b = math.clamp(tonumber(BInput.Text) or 255, 0, 255)
                    local newColor = Color3.fromRGB(r, g, b)
                    ColorPreview.BackgroundColor3 = newColor
                    callback(newColor)
                    colorOpen = false
                    ColorMenu.Visible = false
                    ColorMenu.Size = UDim2.new(0, 105, 0, 0)
                end)

                ListenTheme(function(theme)
                    PickerFrame.BackgroundColor3 = theme.Background
                    ColorMenu.BackgroundColor3 = theme.Background
                    RInput.BackgroundColor3 = theme.Element
                    GInput.BackgroundColor3 = theme.Element
                    BInput.BackgroundColor3 = theme.Element
                    ApplyBtn.BackgroundColor3 = theme.Accent
                end)

                return {Set = function(c) ColorPreview.BackgroundColor3 = c; callback(c) end, Get = function() return ColorPreview.BackgroundColor3 end}
            end

            function SectionAPI:CreateDivider()
                local Divider = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, -8, 0, 1),
                    Position = UDim2.new(0, 4, 0, 0),
                    BackgroundColor3 = CurrentTheme.Border,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })

                ListenTheme(function(theme)
                    Divider.BackgroundColor3 = theme.Border
                end)

                return self
            end

            function SectionAPI:CreateStatus(statusData)
                statusData = statusData or {}
                local statusText = statusData.Text or "Status"
                local statusIcon = statusData.Icon or "Check"
                local statusColor = statusData.Color or CurrentTheme.Success

                local StatusFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 26),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = StatusFrame})

                local Dot = Create("Frame", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0.5, -4),
                    BackgroundColor3 = statusColor,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Dot})

                local IconImg = Create("ImageLabel", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 18, 0.5, -5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(statusIcon),
                    ImageColor3 = statusColor,
                    ZIndex = 19
                })

                local StatusLabel = Create("TextLabel", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 200, 0, 18),
                    Position = UDim2.new(0, 30, 0, 0),
                    BackgroundTransparency = 1,
                    Text = statusText,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                ListenTheme(function(theme)
                    StatusFrame.BackgroundColor3 = theme.Background
                    StatusLabel.TextColor3 = theme.Text
                end)

                local StatusAPI = {}
                function StatusAPI:Set(data)
                    if type(data) == "string" then
                        StatusLabel.Text = data
                    elseif type(data) == "table" then
                        if data.Text then StatusLabel.Text = data.Text end
                        if data.Color then
                            Dot.BackgroundColor3 = data.Color
                            IconImg.ImageColor3 = data.Color
                        end
                        if data.Icon then IconImg.Image = GetIcon(data.Icon) end
                    end
                end
                function StatusAPI:SetText(t) StatusLabel.Text = t end
                function StatusAPI:SetColor(c) Dot.BackgroundColor3 = c; IconImg.ImageColor3 = c end
                function StatusAPI:SetIcon(i) IconImg.Image = GetIcon(i) end
                function StatusAPI:Get() return StatusLabel.Text end
                return StatusAPI
            end

            function SectionAPI:CreateQuestList(questData)
                questData = questData or {}
                local questTitle = questData.Title or "Quests"
                local questIcon = questData.Icon or "Target"
                local quests = questData.Quests or {}
                local callback = questData.Callback or function() end

                local QuestFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 44),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = QuestFrame})

                Create("ImageLabel", {
                    Parent = QuestFrame,
                    Size = UDim2.new(0, 16, 0, 16),
                    Position = UDim2.new(0, 7, 0, 8),
                    BackgroundTransparency = 1,
                    Image = GetIcon(questIcon),
                    ImageColor3 = CurrentTheme.Accent,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = QuestFrame,
                    Size = UDim2.new(1, -30, 0, 18),
                    Position = UDim2.new(0, 24, 0, 4),
                    BackgroundTransparency = 1,
                    Text = questTitle,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                local QuestList = Create("Frame", {
                    Parent = QuestFrame,
                    Size = UDim2.new(1, -12, 0, 0),
                    Position = UDim2.new(0, 6, 0, 28),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 17
                })
                Create("UIListLayout", {
                    Parent = QuestList,
                    Padding = UDim.new(0, 4),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                local questItems = {}
                local questHeight = 0

                local function BuildQuests()
                    for _, item in ipairs(questItems) do
                        if item and item.Frame then item.Frame:Destroy() end
                    end
                    questItems = {}
                    questHeight = 0

                    for _, quest in ipairs(quests) do
                        local qName = quest.Name or "Quest"
                        local qIcon = quest.Icon or "Check"
                        local qCompleted = quest.Completed or false

                        local qFrame = Create("Frame", {
                            Parent = QuestList,
                            Size = UDim2.new(1, 0, 0, 28),
                            BackgroundColor3 = CurrentTheme.Element,
                            BorderSizePixel = 0,
                            LayoutOrder = #questItems,
                            ZIndex = 20
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = qFrame})

                        local checkBox = Create("Frame", {
                            Parent = qFrame,
                            Size = UDim2.new(0, 18, 0, 18),
                            Position = UDim2.new(0, 6, 0.5, -9),
                            BackgroundColor3 = CurrentTheme.Background,
                            BorderSizePixel = 0,
                            ZIndex = 21
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = checkBox})

                        local checkMark = Create("ImageLabel", {
                            Parent = checkBox,
                            Size = UDim2.new(0, 14, 0, 14),
                            Position = UDim2.new(0.5, -7, 0.5, -7),
                            BackgroundTransparency = 1,
                            Image = GetIcon("Check"),
                            ImageColor3 = CurrentTheme.Success,
                            ZIndex = 22,
                            Visible = qCompleted
                        })

                        Create("ImageLabel", {
                            Parent = qFrame,
                            Size = UDim2.new(0, 16, 0, 16),
                            Position = UDim2.new(0, 28, 0.5, -8),
                            BackgroundTransparency = 1,
                            Image = GetIcon(qIcon),
                            ImageColor3 = qCompleted and CurrentTheme.Success or CurrentTheme.SubText,
                            ZIndex = 21
                        })

                        local qLabel = Create("TextLabel", {
                            Parent = qFrame,
                            Size = UDim2.new(1, -52, 0, 18),
                            Position = UDim2.new(0, 48, 0, 0),
                            BackgroundTransparency = 1,
                            Text = qName,
                            TextColor3 = qCompleted and CurrentTheme.Success or CurrentTheme.Text,
                            TextSize = 11,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 21
                        })

                        local qBtn = Create("TextButton", {
                            Parent = qFrame,
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Text = "",
                            ZIndex = 25
                        })

                        qBtn.MouseButton1Click:Connect(function()
                            qCompleted = not qCompleted
                            checkMark.Visible = qCompleted
                            qLabel.TextColor3 = qCompleted and CurrentTheme.Success or CurrentTheme.Text
                            qFrame:FindFirstChildOfClass("ImageLabel").ImageColor3 = qCompleted and CurrentTheme.Success or CurrentTheme.SubText
                            callback(qName, qCompleted)
                        end)

                        table.insert(questItems, {
                            Frame = qFrame,
                            Name = qName,
                            SetCompleted = function(state)
                                qCompleted = state
                                checkMark.Visible = qCompleted
                                qLabel.TextColor3 = qCompleted and CurrentTheme.Success or CurrentTheme.Text
                            end,
                            IsCompleted = function() return qCompleted end
                        })
                        questHeight = questHeight + 32
                    end

                    QuestFrame.Size = UDim2.new(1, 0, 0, 36 + questHeight)
                    QuestList.Size = UDim2.new(1, 0, 0, questHeight)
                    if self._UpdateSize then self._UpdateSize() end
                end

                BuildQuests()

                ListenTheme(function(theme)
                    QuestFrame.BackgroundColor3 = theme.Background
                    for _, item in ipairs(questItems) do
                        if item.Frame then
                            item.Frame.BackgroundColor3 = theme.Element
                        end
                    end
                end)

                local QuestAPI = {}
                function QuestAPI:SetQuests(newQuests)
                    quests = newQuests or {}
                    BuildQuests()
                end
                function QuestAPI:Complete(name)
                    for _, item in ipairs(questItems) do
                        if item.Name == name then
                            item.SetCompleted(true)
                            break
                        end
                    end
                end
                function QuestAPI:Uncomplete(name)
                    for _, item in ipairs(questItems) do
                        if item.Name == name then
                            item.SetCompleted(false)
                            break
                        end
                    end
                end
                function QuestAPI:IsComplete(name)
                    for _, item in ipairs(questItems) do
                        if item.Name == name then
                            return item.IsCompleted()
                        end
                    end
                    return false
                end
                function QuestAPI:GetCompleted()
                    local completed = {}
                    for _, item in ipairs(questItems) do
                        if item.IsCompleted() then
                            table.insert(completed, item.Name)
                        end
                    end
                    return completed
                end
                function QuestAPI:Reset()
                    for _, item in ipairs(questItems) do
                        item.SetCompleted(false)
                    end
                end
                return QuestAPI
            end

            return SectionAPI
        end

        
        function TabAPI:Section(data)
            local sec = self:CreateSection(data)
            self._CurrentSection = sec
            return sec
        end

        function TabAPI:Paragraph(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateParagraph(data)
        end

        function TabAPI:Button(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateButton(data)
        end

        function TabAPI:ButtonRow(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateButtonRow(data)
        end

        function TabAPI:Toggle(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateToggle(data)
        end

        function TabAPI:Slider(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateSlider(data)
        end

        function TabAPI:Dropdown(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateDropdown(data)
        end

        function TabAPI:MultiDropdown(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateMultiDropdown(data)
        end

        function TabAPI:Input(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateInput(data)
        end

        function TabAPI:Keybind(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateKeybind(data)
        end

        function TabAPI:Label(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateLabel(data)
        end

        function TabAPI:ColorPicker(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateColorPicker(data)
        end

        function TabAPI:Divider()
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateDivider()
        end

        function TabAPI:Status(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateStatus(data)
        end

        function TabAPI:QuestList(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateQuestList(data)
        end

        return TabAPI
    end

    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local text = SearchBox.Text:lower()
        for _, tab in ipairs(TabButtons) do
            if text == "" or tab.Name:find(text, 1, true) then
                tab.Btn.Visible = true
            else
                tab.Btn.Visible = false
            end
        end
    end)

    return WindowAPI
end

return W424
