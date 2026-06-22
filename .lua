local Quantum = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")

local Config = {
    Name = "Quantum",
    DefaultVersion = "5.1",
    DefaultTheme = "QuantumDark",
    CornerRadius = 10,
    ElementCorner = 6,
    SidebarWidth = 150,
    TopbarHeight = 40,
    MinWindowSize = Vector2.new(360, 240),
    HttpRetryAttempts = 3,
    HttpRetryDelay = 0.5,
    Themes = {
        QuantumDark = {
            Background = Color3.fromRGB(0, 0, 0),
            Sidebar = Color3.fromRGB(5, 5, 5),
            Accent = Color3.fromRGB(80, 220, 120),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(120, 120, 130),
            Element = Color3.fromRGB(12, 12, 12),
            ElementHover = Color3.fromRGB(20, 20, 20),
            ToggleOn = Color3.fromRGB(80, 220, 120),
            ToggleOff = Color3.fromRGB(40, 40, 45),
            Border = Color3.fromRGB(30, 30, 35),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(80, 220, 120)
        },
        Dark = {
            Background = Color3.fromRGB(18, 18, 22),
            Sidebar = Color3.fromRGB(24, 24, 30),
            Accent = Color3.fromRGB(124, 92, 242),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 32, 40),
            ElementHover = Color3.fromRGB(42, 42, 52),
            ToggleOn = Color3.fromRGB(124, 92, 242),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(90, 220, 140)
        },
        Light = {
            Background = Color3.fromRGB(245, 245, 250),
            Sidebar = Color3.fromRGB(235, 235, 240),
            Accent = Color3.fromRGB(100, 80, 220),
            Text = Color3.fromRGB(30, 30, 35),
            SubText = Color3.fromRGB(100, 100, 110),
            Element = Color3.fromRGB(220, 220, 230),
            ElementHover = Color3.fromRGB(210, 210, 220),
            ToggleOn = Color3.fromRGB(100, 80, 220),
            ToggleOff = Color3.fromRGB(180, 180, 190),
            Border = Color3.fromRGB(200, 200, 210),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(60, 200, 120)
        },
        Ocean = {
            Background = Color3.fromRGB(18, 22, 28),
            Sidebar = Color3.fromRGB(24, 28, 36),
            Accent = Color3.fromRGB(60, 180, 220),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 38, 48),
            ElementHover = Color3.fromRGB(42, 50, 62),
            ToggleOn = Color3.fromRGB(60, 180, 220),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(80, 220, 160)
        },
        Midnight = {
            Background = Color3.fromRGB(18, 18, 22),
            Sidebar = Color3.fromRGB(24, 24, 30),
            Accent = Color3.fromRGB(220, 60, 120),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 32, 40),
            ElementHover = Color3.fromRGB(42, 42, 52),
            ToggleOn = Color3.fromRGB(220, 60, 120),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(220, 60, 120)
        },
        Forest = {
            Background = Color3.fromRGB(18, 22, 18),
            Sidebar = Color3.fromRGB(24, 30, 24),
            Accent = Color3.fromRGB(80, 200, 120),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 40, 32),
            ElementHover = Color3.fromRGB(42, 52, 42),
            ToggleOn = Color3.fromRGB(80, 200, 120),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(100, 220, 100)
        }
    }
}

local LegacyIcons = {
    Custom = "rbxassetid://109647740279101",
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
    _FetchCache = {},
    _FetchFailed = {},
}

local function SafeHttpGet(url, timeout)
    timeout = timeout or 5
    if not url or type(url) ~= "string" then return nil end
    if IconModule._FetchFailed[url] then return nil end
    if IconModule._FetchCache[url] then return IconModule._FetchCache[url] end

    local success, content = false, nil
    local attempts = 0

    while attempts < Config.HttpRetryAttempts do
        attempts += 1
        success, content = pcall(function()
            if typeof(game.HttpGet) == "function" then
                return game:HttpGet(url, true)
            elseif typeof(HttpService.GetAsync) == "function" then
                return HttpService:GetAsync(url, true)
            else
                error("No HTTP method available")
            end
        end)

        if success and content and type(content) == "string" and #content > 0 then
            IconModule._FetchCache[url] = content
            return content
        end

        if attempts < Config.HttpRetryAttempts then
            task.wait(Config.HttpRetryDelay * attempts)
        end
    end

    IconModule._FetchFailed[url] = true
    warn("[Quantum] Failed to fetch icon pack after " .. tostring(Config.HttpRetryAttempts) .. " attempts: " .. url)
    return nil
end

local function SafeLoadstring(content)
    if type(content) ~= "string" or #content < 10 then return nil end
    if content:match("while true do") or content:match("for.-=.-1,1000000") then
        warn("[Quantum] Rejected potentially malicious icon pack")
        return nil
    end
    local ok, result = pcall(function()
        local fn = loadstring(content)
        if type(fn) == "function" then
            return fn()
        end
        return nil
    end)
    if ok and type(result) == "table" then
        return result
    end
    return nil
end

local function FetchIconPack(url)
    local content = SafeHttpGet(url)
    if not content then return nil end
    return SafeLoadstring(content)
end

local function parseIconString(iconString)
    if type(iconString) == "string" then
        local splitIndex = iconString:find(":")
        if splitIndex then
            return iconString:sub(1, splitIndex - 1), iconString:sub(splitIndex + 1)
        end
    end
    return nil, iconString
end

function IconModule.AddIcons(packName, iconsData)
    if type(packName) ~= "string" or type(iconsData) ~= "table" then
        warn("[Quantum] AddIcons: packName must be string, iconsData must be table")
        return
    end
    if not IconModule.Icons[packName] then
        IconModule.Icons[packName] = { Icons = {}, Spritesheets = {} }
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
                warn("[Quantum] AddIcons: Invalid spritesheet data format for icon '" .. iconName .. "'")
            end
        else
            warn("[Quantum] AddIcons: Unsupported data type for icon '" .. iconName .. "': " .. type(iconValue))
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

local function LoadIconPacksAsync()
    for packName, url in pairs(packUrls) do
        task.defer(function()
            local pack = FetchIconPack(url)
            if pack then
                IconModule.Icons[packName] = pack
            end
        end)
    end
end
LoadIconPacksAsync()

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
    if not instance or not instance.Parent then return nil end
    local ok, tween = pcall(function()
        return TweenService:Create(instance, TweenInfo.new(
            duration or 0.25,
            easingStyle or Enum.EasingStyle.Quart,
            easingDirection or Enum.EasingDirection.Out
        ), properties)
    end)
    if ok and tween then
        tween:Play()
        return tween
    end
    return nil
end

local function Round(number, precision)
    precision = precision or 2
    return math.round(number * 10^precision) / 10^precision
end

local function GetIcon(name, iconType)
    if not name then return { Image = LegacyIcons.Info } end

    local iconData = IconModule.Icon2(name, iconType)
    if iconData then
        if type(iconData) == "string" then
            return { Image = iconData }
        else
            return {
                Image = iconData[1],
                ImageRectSize = iconData[2].ImageRectSize,
                ImageRectOffset = iconData[2].ImageRectPosition
            }
        end
    end

    if LegacyIcons[name] then
        return { Image = LegacyIcons[name] }
    end

    if type(name) == "string" and (name:sub(1, 13) == "rbxassetid://" or name:sub(1, 4) == "http") then
        return { Image = name }
    end

    return { Image = LegacyIcons.Info }
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

local function ApplyTheme(themeName)
    if not Config.Themes[themeName] then return end
    CurrentTheme = Config.Themes[themeName]
    for _, callback in ipairs(ThemeListeners) do
        if callback then
            pcall(callback, CurrentTheme)
        end
    end
end

local function ListenTheme(callback)
    table.insert(ThemeListeners, callback)
    pcall(callback, CurrentTheme)
    return #ThemeListeners
end

local function UnlistenTheme(index)
    if ThemeListeners[index] then
        ThemeListeners[index] = nil
    end
end

local function CloseAllDropdowns()
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
    local data = { Menu = menu, Arrow = arrow, Button = btnRef, IsOpen = false, HeartbeatConn = nil }
    table.insert(OpenDropdowns, data)
    return data
end

local ConnectionManager = {}
ConnectionManager.__index = ConnectionManager

function ConnectionManager.new()
    local self = setmetatable({}, ConnectionManager)
    self._connections = {}
    return self
end

function ConnectionManager:Add(conn)
    if typeof(conn) == "RBXScriptConnection" then
        table.insert(self._connections, conn)
    end
    return conn
end

function ConnectionManager:Connect(signal, callback)
    local conn = signal:Connect(callback)
    self:Add(conn)
    return conn
end

function ConnectionManager:DisconnectAll()
    for _, conn in ipairs(self._connections) do
        if conn and conn.Connected then
            pcall(function() conn:Disconnect() end)
        end
    end
    self._connections = {}
end

local ConfigManager = {}
ConfigManager.__index = ConfigManager

function ConfigManager.new(windowName)
    local self = setmetatable({}, ConfigManager)
    self.WindowName = windowName or "Quantum"
    self.Data = {}
    self.Path = self.WindowName .. "_QuantumConfig.json"
    self.AutoSave = false
    self.AutoSaveInterval = 3
    self.Thread = nil
    self.Elements = {}
    return self
end

function ConfigManager:Load()
    if typeof(readfile) ~= "function" then return false end
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
    return false
end

function ConfigManager:Save()
    if typeof(writefile) ~= "function" then return end
    local ok, content = pcall(function()
        return HttpService:JSONEncode(self.Data)
    end)
    if ok and content then
        pcall(writefile, self.Path, content)
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
    self.AutoSave = false
    if self.Thread then
        pcall(function() task.cancel(self.Thread) end)
        self.Thread = nil
    end
end

function ConfigManager:IsAutoSaving()
    return self.AutoSave
end

function ConfigManager:SaveNow()
    self:Save()
end

function ConfigManager:LoadConfig()
    return self:Load()
end

function ConfigManager:SetAutoSaveInterval(interval)
    self.AutoSaveInterval = interval or 3
    if self.AutoSave then
        self:DisableAutoSave()
        self:StartAutoSave()
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

local NotifyScreen = nil
local NotifyLayout = nil
local ActiveNotifications = {}

local function InitNotify()
    if NotifyScreen then return end
    local ok, screen = pcall(function()
        return Create("ScreenGui", {
            Name = "QuantumNotify",
            Parent = game.CoreGui,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            ResetOnSpawn = false,
        })
    end)
    if not ok or not screen then return end
    NotifyScreen = screen
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

function Quantum:Notify(data)
    data = data or {}
    local title = data.Title or "Notification"
    local content = data.Content or ""
    local duration = data.Duration or 3
    local icon = data.Icon or "Info"
    local iconId = GetIcon(icon)

    InitNotify()
    if not NotifyLayout then return end

    local notifFrame = Create("Frame", {
        Parent = NotifyLayout,
        Size = UDim2.new(0, 260, 0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        LayoutOrder = #ActiveNotifications,
        ZIndex = 201,
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = notifFrame })

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

    task.defer(function()
        if not notifFrame or not notifFrame.Parent then return end
        local contentHeight = math.max(38, 18 + ContentLbl.AbsoluteSize.Y + 6)
        notifFrame.Size = UDim2.new(0, 240, 0, contentHeight)
    end)

    task.delay(duration, function()
        if notifFrame and notifFrame.Parent then
            notifFrame.Size = UDim2.new(0, 0, 0, notifFrame.Size.Y.Offset)
        end
        task.wait(0.1)
        if notifFrame and notifFrame.Parent then
            notifFrame:Destroy()
        end
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
local FloatingConnectionsMgr = nil
local MainWindowScreen = nil
local MainFrame = nil
local IsMinimized = false
local IsClosed = false

local function CreateFloatingIcon(customIcon)
    if FloatingConnectionsMgr then
        FloatingConnectionsMgr:DisconnectAll()
    end
    if FloatingIconScreen then
        pcall(function() FloatingIconScreen:Destroy() end)
    end

    local iconToUse = customIcon and GetIcon(customIcon) or GetIcon("Custom")

    local ok, screen = pcall(function()
        return Create("ScreenGui", {
            Name = "QuantumFloatingIcon",
            Parent = game.CoreGui,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            ResetOnSpawn = false,
            Enabled = true
        })
    end)
    if not ok or not screen then return nil end
    FloatingIconScreen = screen
    FloatingConnectionsMgr = ConnectionManager.new()

    local Backdrop = Create("Frame", {
        Name = "Backdrop",
        Parent = FloatingIconScreen,
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 14, 0.5, -20),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Active = true,
        ClipsDescendants = true,
        ZIndex = 1000
    })

    Create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = Backdrop })
    Create("UIStroke", { Color = Color3.fromRGB(10, 10, 10), Thickness = 1, Transparency = 0.3, Parent = Backdrop })

    local isCustomImage = customIcon ~= nil
    local Icon = Create("ImageLabel", {
        Name = "Icon",
        Parent = Backdrop,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 28, 0, 28),
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

    FloatingConnectionsMgr:Connect(Backdrop.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            mouseDownOnIcon = true
            isDragging = true
            hasMoved = false
            dragStart = input.Position
            startPos = Backdrop.Position
        end
    end)

    FloatingConnectionsMgr:Connect(UserInputService.InputChanged, function(input)
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

    FloatingConnectionsMgr:Connect(UserInputService.InputEnded, function(input)
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

    ListenTheme(function(theme)
        if Backdrop and Backdrop.Parent then
            Backdrop.BackgroundColor3 = theme.Sidebar
            if Backdrop:FindFirstChild("UIStroke") then
                Backdrop.UIStroke.Color = theme.Border
            end
            if not isCustomImage and Icon and Icon.Parent then
                Icon.ImageColor3 = theme.Text
            end
        end
    end)

    FloatingIconBtn = Backdrop
    return FloatingIconScreen
end

function Quantum:CreateWindow(data)
    data = data or {}
    local windowName = data.Name or "Quantum"
    local windowIcon = data.Icon or "atom"
    local floatingIcon = data.FloatingIcon or nil
    local customVersion = data.Version or Config.DefaultVersion
    local toggleKey = data.ToggleKey

    if MainWindowScreen then
        pcall(function() MainWindowScreen:Destroy() end)
    end

    CreateFloatingIcon(floatingIcon)

    local WindowConnections = ConnectionManager.new()

    local ok, screen = pcall(function()
        return Create("ScreenGui", {
            Name = "QuantumUI",
            Parent = game.CoreGui,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            ResetOnSpawn = false,
            Enabled = true
        })
    end)
    if not ok or not screen then
        warn("[Quantum] Failed to create ScreenGui")
        return nil
    end
    MainWindowScreen = screen

    MainFrame = Create("Frame", {
        Name = "Main",
        Parent = MainWindowScreen,
        Size = UDim2.new(0, 460, 0, 280),
        Position = UDim2.new(0.5, -230, 0.5, -140),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Active = true,
        ZIndex = 10
    })

    Create("UICorner", { CornerRadius = UDim.new(0, Config.CornerRadius), Parent = MainFrame })

    local Shadow = Create("ImageLabel", {
        Name = "Shadow",
        Parent = MainFrame,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 50, 1, 50),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10806158995",
        ImageColor3 = CurrentTheme.Shadow,
        ImageTransparency = 0.5,
        ZIndex = 0
    })

    local Topbar = Create("Frame", {
        Name = "Topbar",
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        Active = true,
        ZIndex = 20
    })
    Create("UICorner", { CornerRadius = UDim.new(0, Config.CornerRadius), Parent = Topbar })

    local TopbarFix = Create("Frame", {
        Name = "Fix",
        Parent = Topbar,
        Size = UDim2.new(1, 0, 0.5, 0),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 20
    })

    local TitleIcon = Create("ImageLabel", {
        Name = "TitleIcon",
        Parent = Topbar,
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 10, 0, 9),
        BackgroundTransparency = 1,
        Image = GetIcon("atom"),
        ImageColor3 = CurrentTheme.Accent,
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 21
    })

    local Title = Create("TextLabel", {
        Name = "Title",
        Parent = Topbar,
        Size = UDim2.new(0, 170, 0, 20),
        Position = UDim2.new(0, 34, 0, 6),
        BackgroundTransparency = 1,
        Text = windowName,
        TextColor3 = Color3.fromRGB(80, 220, 120),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextStrokeTransparency = 0.6,
        TextStrokeColor3 = Color3.fromRGB(40, 180, 80),
        ZIndex = 21
    })

    local TitleGlowTween = TweenService:Create(Title, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        TextStrokeTransparency = 0.25
    })
    TitleGlowTween:Play()

    local Version = Create("TextLabel", {
        Name = "Version",
        Parent = Topbar,
        Size = UDim2.new(0, 160, 0, 12),
        Position = UDim2.new(0, 32, 0, 24),
        BackgroundTransparency = 1,
        Text = "v" .. customVersion,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 21
    })

    local ProfileSection = Create("Frame", {
        Name = "ProfileSection",
        Parent = Topbar,
        Size = UDim2.new(0, 120, 0, 32),
        Position = UDim2.new(1, -190, 0.5, -12),
        BackgroundTransparency = 1,
        ZIndex = 21
    })

    local ProfileFrame = Create("Frame", {
        Name = "ProfileFrame",
        Parent = ProfileSection,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = CurrentTheme.Element,
        BorderSizePixel = 0,
        ZIndex = 22
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = ProfileFrame })
    Create("UIStroke", { Color = CurrentTheme.Border, Thickness = 1, Parent = ProfileFrame })

    local ProfileImg = Create("ImageLabel", {
        Parent = ProfileFrame,
        Size = UDim2.new(1, -4, 1, -4),
        Position = UDim2.new(0, 2, 0, 2),
        BackgroundTransparency = 1,
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=48&h=48",
        ZIndex = 23
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = ProfileImg })

    local ProfileName = Create("TextLabel", {
        Name = "ProfileName",
        Parent = ProfileSection,
        Size = UDim2.new(0, 80, 0, 14),
        Position = UDim2.new(0, 30, 0, 0),
        BackgroundTransparency = 1,
        Text = LocalPlayer.DisplayName or LocalPlayer.Name,
        TextColor3 = CurrentTheme.Text,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 22
    })

    local ProfileUser = Create("TextLabel", {
        Name = "ProfileUser",
        Parent = ProfileSection,
        Size = UDim2.new(0, 80, 0, 12),
        Position = UDim2.new(0, 30, 0, 14),
        BackgroundTransparency = 1,
        Text = "@" .. LocalPlayer.Name,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 22
    })

    local ConfirmOverlay = Create("Frame", {
        Name = "ConfirmOverlay",
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = CurrentTheme.Overlay,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 100
    })
    Create("UICorner", { CornerRadius = UDim.new(0, Config.CornerRadius), Parent = ConfirmOverlay })

    local ConfirmBox = Create("Frame", {
        Name = "ConfirmBox",
        Parent = ConfirmOverlay,
        Size = UDim2.new(0, 240, 0, 120),
        Position = UDim2.new(0.5, -110, 0.5, -50),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ZIndex = 101
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ConfirmBox })

    Create("TextLabel", {
        Parent = ConfirmBox,
        Size = UDim2.new(1, 0, 0, 36),
        Position = UDim2.new(0, 0, 0, 8),
        BackgroundTransparency = 1,
        Text = "Close Quantum?",
        TextColor3 = CurrentTheme.Text,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })

    Create("TextLabel", {
        Parent = ConfirmBox,
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 0, 26),
        BackgroundTransparency = 1,
        Text = "You can reopen using the floating icon.",
        TextColor3 = CurrentTheme.SubText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextWrapped = true,
        ZIndex = 102
    })

    local ConfirmYes = Create("TextButton", {
        Parent = ConfirmBox,
        Size = UDim2.new(0, 84, 0, 28),
        Position = UDim2.new(0.5, 4, 1, -32),
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        Text = "Close",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ConfirmYes })

    local ConfirmNo = Create("TextButton", {
        Parent = ConfirmBox,
        Size = UDim2.new(0, 84, 0, 28),
        Position = UDim2.new(0.5, -80, 1, -32),
        BackgroundColor3 = CurrentTheme.Element,
        Text = "Cancel",
        TextColor3 = CurrentTheme.Text,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ConfirmNo })

    local Controls = Create("Frame", {
        Name = "Controls",
        Parent = Topbar,
        Size = UDim2.new(0, 90, 0, Config.TopbarHeight),
        Position = UDim2.new(1, -99, 0, 0),
        BackgroundTransparency = 1,
        ZIndex = 21
    })

    local function MakeControl(name, icon, pos, callback)
        local btn = Create("ImageButton", {
            Name = name,
            Parent = Controls,
            Size = UDim2.new(0, 24, 0, 24),
            Position = pos,
            BackgroundColor3 = CurrentTheme.Element,
            AutoButtonColor = false,
            Image = GetIcon(icon),
            ImageColor3 = CurrentTheme.SubText,
            ZIndex = 22
        })
        Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = btn })
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = CurrentTheme.ElementHover
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = CurrentTheme.Element
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    MakeControl("Minimize", "Minus", UDim2.new(0, 0, 0.5, -11), function()
        CloseAllDropdowns()
        IsMinimized = true
        MainFrame.Visible = false
    end)

    local IsMaximized = false
    MakeControl("Resize", "Maximize2", UDim2.new(0, 25, 0.5, -11), function()
        IsMaximized = not IsMaximized
        if IsMaximized then
            MainFrame.Size = UDim2.new(0, 440, 0, 280)
        else
            MainFrame.Size = UDim2.new(0, 360, 0, 220)
        end
    end)

    MakeControl("Close", "X", UDim2.new(0, 50, 0.5, -11), function()
        CloseAllDropdowns()
        ConfirmOverlay.Visible = true
    end)

    ConfirmYes.MouseButton1Click:Connect(function()
        CloseAllDropdowns()
        IsClosed = true
        MainWindowScreen.Enabled = false
        ConfirmOverlay.Visible = false
    end)

    ConfirmNo.MouseButton1Click:Connect(function()
        ConfirmOverlay.Visible = false
    end)

    local Sidebar = Create("Frame", {
        Name = "Sidebar",
        Parent = MainFrame,
        Size = UDim2.new(0, Config.SidebarWidth, 1, -Config.TopbarHeight),
        Position = UDim2.new(0, 0, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 15
    })
    Create("UICorner", { CornerRadius = UDim.new(0, Config.CornerRadius), Parent = Sidebar })

    Create("Frame", {
        Name = "Fix",
        Parent = Sidebar,
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 0, -10),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 15
    })

    local SearchFrame = Create("Frame", {
        Parent = Sidebar,
        Size = UDim2.new(1, -10, 0, 32),
        Position = UDim2.new(0, 5, 0, 6),
        BackgroundColor3 = CurrentTheme.Element,
        BorderSizePixel = 0,
        ZIndex = 16
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = SearchFrame })

    local SearchIcon = Create("ImageLabel", {
        Parent = SearchFrame,
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(0, 6, 0.5, -7),
        BackgroundTransparency = 1,
        Image = GetIcon("Search"),
        ImageColor3 = CurrentTheme.SubText,
        ZIndex = 17
    })

    local SearchBox = Create("TextBox", {
        Parent = SearchFrame,
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.new(0, 22, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = "Search tabs...",
        TextColor3 = CurrentTheme.Text,
        PlaceholderColor3 = CurrentTheme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        ClearTextOnFocus = false,
        ZIndex = 17
    })

    local TabList = Create("ScrollingFrame", {
        Name = "TabList",
        Parent = Sidebar,
        Size = UDim2.new(1, -10, 1, -44),
        Position = UDim2.new(0, 5, 0, 44),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = CurrentTheme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 16
    })

    Create("UIListLayout", {
        Parent = TabList,
        Padding = UDim.new(0, 3),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    local Content = Create("Frame", {
        Name = "Content",
        Parent = MainFrame,
        Size = UDim2.new(1, -Config.SidebarWidth + 4, 1, -Config.TopbarHeight),
        Position = UDim2.new(0, Config.SidebarWidth - 4, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 14
    })
    Create("UICorner", { CornerRadius = UDim.new(0, Config.CornerRadius), Parent = Content })

    Create("Frame", {
        Name = "Fix",
        Parent = Content,
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(0, -10, 0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ZIndex = 14
    })

    local ResizeHandle = Create("ImageButton", {
        Name = "ResizeHandle",
        Parent = MainFrame,
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(1, -20, 1, -20),
        BackgroundTransparency = 1,
        Image = GetIcon("ChevronLeft"),
        ImageColor3 = CurrentTheme.SubText,
        ImageTransparency = 0.4,
        Rotation = -45,
        ZIndex = 30,
        Active = true
    })

    local resizing = false
    local resizeStart = nil
    local startSize = nil

    WindowConnections:Connect(ResizeHandle.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            resizeStart = input.Position
            startSize = MainFrame.Size
        end
    end)

    WindowConnections:Connect(UserInputService.InputChanged, function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - resizeStart
            local newWidth = math.max(Config.MinWindowSize.X, startSize.X.Offset + delta.X)
            local newHeight = math.max(Config.MinWindowSize.Y, startSize.Y.Offset + delta.Y)
            MainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
        end
    end)

    WindowConnections:Connect(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = false
        end
    end)

    local dragging = false
    local dragStart = nil
    local startPos = nil

    WindowConnections:Connect(Topbar.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            local changedConn
            changedConn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.Cancel then
                    dragging = false
                    if changedConn then changedConn:Disconnect() end
                end
            end)
            if changedConn then
                WindowConnections:Add(changedConn)
            end
        end
    end)

    WindowConnections:Connect(UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    WindowConnections:Connect(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    if toggleKey then
        WindowConnections:Connect(UserInputService.InputBegan, function(input, gpe)
            if not gpe and input.KeyCode == toggleKey then
                if MainFrame then
                    if MainFrame.Visible then
                        CloseAllDropdowns()
                    end
                    MainFrame.Visible = not MainFrame.Visible
                    IsMinimized = not MainFrame.Visible
                end
            end
        end)
    end

    local themeIndex = ListenTheme(function(theme)
        if not MainFrame or not MainFrame.Parent then return end
        MainFrame.BackgroundColor3 = theme.Background
        Shadow.ImageColor3 = theme.Shadow
        Topbar.BackgroundColor3 = theme.Sidebar
        TopbarFix.BackgroundColor3 = theme.Sidebar
        Sidebar.BackgroundColor3 = theme.Sidebar
        Content.BackgroundColor3 = theme.Background
        Title.TextStrokeColor3 = Color3.fromRGB(40, 180, 80)
        TitleIcon.ImageColor3 = theme.Accent
        TabList.ScrollBarImageColor3 = theme.Accent
        ConfirmOverlay.BackgroundColor3 = theme.Overlay
        ConfirmBox.BackgroundColor3 = theme.Background
        ConfirmNo.BackgroundColor3 = theme.Element
        ConfirmNo.TextColor3 = theme.Text
        ResizeHandle.ImageColor3 = theme.SubText
        ProfileFrame.BackgroundColor3 = theme.Element
        if ProfileFrame:FindFirstChild("UIStroke") then
            ProfileFrame.UIStroke.Color = theme.Border
        end
        ProfileName.TextColor3 = theme.Text
        ProfileUser.TextColor3 = theme.SubText
        SearchFrame.BackgroundColor3 = theme.Element
        SearchIcon.ImageColor3 = theme.SubText
        SearchBox.TextColor3 = theme.Text
        SearchBox.PlaceholderColor3 = theme.SubText
    end)

    local WindowAPI = {}
    WindowAPI.Notify = function(_, d) Quantum:Notify(d) end
    WindowAPI.SetTheme = function(_, name) ApplyTheme(name) end
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

    WindowAPI.Destroy = function(_)
        WindowConnections:DisconnectAll()
        UnlistenTheme(themeIndex)
        if MainWindowScreen then
            pcall(function() MainWindowScreen:Destroy() end)
            MainWindowScreen = nil
        end
        if FloatingConnectionsMgr then
            FloatingConnectionsMgr:DisconnectAll()
        end
        if FloatingIconScreen then
            pcall(function() FloatingIconScreen:Destroy() end)
            FloatingIconScreen = nil
        end
        MainFrame = nil
        FloatingIconBtn = nil
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
            BackgroundColor3 = CurrentTheme.Element,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = #Tabs + 1,
            ZIndex = 17
        })
        Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = TabBtn })

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
        Create("UICorner", { CornerRadius = UDim.new(0, 2), Parent = TabIndicator })

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
            TabBtn.BackgroundColor3 = CurrentTheme.ElementHover
            TabBtnIcon.ImageColor3 = CurrentTheme.Accent
            TabBtnText.TextColor3 = CurrentTheme.Text
        end

        TabBtn.MouseButton1Click:Connect(Activate)
        TabBtn.MouseEnter:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            TabBtn.BackgroundColor3 = CurrentTheme.ElementHover
        end)
        TabBtn.MouseLeave:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            TabBtn.BackgroundColor3 = CurrentTheme.Element
        end)

        table.insert(Tabs, { Activate = Activate, Name = tabName, Button = TabBtn })
        table.insert(TabButtons, { Btn = TabBtn, Name = tabName:lower() })
        if #Tabs == 1 then Activate() end

        ListenTheme(function(theme)
            if not TabBtn or not TabBtn.Parent then return end
            if ActiveTab and ActiveTab.Button == TabBtn then
                TabBtn.BackgroundColor3 = theme.ElementHover
                TabBtnIcon.ImageColor3 = theme.Accent
                TabBtnText.TextColor3 = theme.Text
            else
                TabBtn.BackgroundColor3 = theme.Element
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
                BackgroundColor3 = CurrentTheme.Element,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                LayoutOrder = #TabContent:GetChildren(),
                ZIndex = 16
            })
            Create("UICorner", { CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionFrame })

            local SectionHeader = Create("TextButton", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 0, 44),
                BackgroundColor3 = CurrentTheme.Element,
                Text = "",
                AutoButtonColor = false,
                ZIndex = 17
            })
            Create("UICorner", { CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionHeader })

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

            local targetHeight = 36
            local sectionDropdowns = {}

            local function UpdateSize()
                if not SectionItems or not SectionItems.Parent then return end
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
                if TabContent and TabContent.Parent then
                    TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContent.UIListLayout.AbsoluteContentSize.Y + 16)
                end
            end

            SectionHeader.MouseButton1Click:Connect(function()
                isCollapsed = not isCollapsed
                UpdateSize()
            end)

            if not collapsed then
                Arrow.Rotation = 180
                task.defer(UpdateSize)
            end

            ListenTheme(function(theme)
                if not SectionFrame or not SectionFrame.Parent then return end
                SectionFrame.BackgroundColor3 = theme.Element
                SectionHeader.BackgroundColor3 = theme.Element
                Arrow.ImageColor3 = theme.SubText
            end)

            SectionItems.ChildAdded:Connect(function()
                task.defer(function()
                    if not isCollapsed then UpdateSize() end
                end)
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = ToggleFrame })

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
                    Size = UDim2.new(0, 36, 0, 20),
                    Position = UDim2.new(1, -52, 0.5, -12),
                    BackgroundColor3 = CurrentTheme.ToggleOff,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ToggleBtn })

                local ToggleCircle = Create("Frame", {
                    Parent = ToggleBtn,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 2, 0.5, -5),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ToggleCircle })

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
                    ToggleCircle.Position = UDim2.new(0, 22, 0.5, -5)
                end

                ToggleClick.MouseButton1Click:Connect(function()
                    state = not state
                    if state then
                        ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                        ToggleCircle.Position = UDim2.new(0, 22, 0.5, -5)
                    else
                        ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOff
                        ToggleCircle.Position = UDim2.new(0, 2, 0.5, -5)
                    end
                    pcall(callback, state)
                end)

                ListenTheme(function(theme)
                    if not ToggleFrame or not ToggleFrame.Parent then return end
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
                            ToggleCircle.Position = UDim2.new(0, 22, 0.5, -5)
                        else
                            ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOff
                            ToggleCircle.Position = UDim2.new(0, 2, 0.5, -5)
                        end
                        pcall(callback, state)
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = SliderFrame })

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
                    BackgroundColor3 = CurrentTheme.Element,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Track })

                local Fill = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                    BackgroundColor3 = CurrentTheme.Accent,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Fill })

                local Knob = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new((default - min) / (max - min), -6, 0.5, -6),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 21
                })
                Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Knob })

                local draggingSlider = false

                local function UpdateSlider(input)
                    if not Track or not Track.Parent then return end
                    local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
                    local value = math.clamp(Round(min + (pos * (max - min)), math.log10(1/increment)), min, max)
                    value = math.floor(value / increment + 0.5) * increment
                    Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                    Knob.Position = UDim2.new((value - min) / (max - min), -6, 0.5, -6)
                    ValueLabel.Text = tostring(value)
                    pcall(callback, value)
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

                WindowConnections:Connect(UserInputService.InputChanged, function(input)
                    if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        UpdateSlider(input)
                    end
                end)

                WindowConnections:Connect(UserInputService.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingSlider = false
                    end
                end)

                ListenTheme(function(theme)
                    if not SliderFrame or not SliderFrame.Parent then return end
                    SliderFrame.BackgroundColor3 = theme.Background
                    Track.BackgroundColor3 = theme.Element
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
                        pcall(callback, val)
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
                    BackgroundColor3 = CurrentTheme.Accent,
                    Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = Btn })

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
                    Btn.BackgroundColor3 = Color3.fromRGB(
                        math.clamp(CurrentTheme.Accent.R * 255 + 20, 0, 255),
                        math.clamp(CurrentTheme.Accent.G * 255 + 20, 0, 255),
                        math.clamp(CurrentTheme.Accent.B * 255 + 20, 0, 255)
                    )
                end)
                Btn.MouseLeave:Connect(function()
                    Btn.BackgroundColor3 = CurrentTheme.Accent
                end)
                Btn.MouseButton1Click:Connect(function()
                    pcall(callback)
                end)

                ListenTheme(function(theme)
                    if not Btn or not Btn.Parent then return end
                    Btn.BackgroundColor3 = theme.Accent
                end)

                return { Click = callback }
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = DropdownFrame })

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
                    Size = UDim2.new(0, 76, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
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
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = DropdownBtn })

                local Arrow = Create("ImageLabel", {
                    Parent = DropdownBtn,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(1, -18, 0.5, -7),
                    BackgroundTransparency = 1,
                    Image = GetIcon("ChevronDown"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 20
                })

                local defaultText, _ = NormalizeOption(default)
                if defaultText ~= "" then
                    DropdownBtn.Text = defaultText
                    DropdownBtn.TextColor3 = CurrentTheme.Text
                else
                    DropdownBtn.Text = "Select option"
                    DropdownBtn.TextColor3 = CurrentTheme.SubText
                end

                local MenuFrame = Create("Frame", {
                    Parent = MainWindowScreen,
                    Size = UDim2.new(0, 150, 0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 500
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = MenuFrame })
                Create("UIStroke", { Color = CurrentTheme.Border, Thickness = 1, Parent = MenuFrame })

                local ddData = RegisterDropdown(MenuFrame, Arrow, DropdownBtn)
                table.insert(sectionDropdowns, ddData)

                local SearchBox = Create("TextBox", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 28),
                    Position = UDim2.new(0, 4, 0, 4),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    PlaceholderText = "Search...",
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    ZIndex = 31
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = SearchBox })

                Create("ImageLabel", {
                    Parent = SearchBox,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(1, -18, 0.5, -7),
                    BackgroundTransparency = 1,
                    Image = GetIcon("Search"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 32
                })

                local OptionsScroll = Create("ScrollingFrame", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 0),
                    Position = UDim2.new(0, 4, 0, 28),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = CurrentTheme.Accent,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ZIndex = 31
                })

                Create("UIListLayout", {
                    Parent = OptionsScroll,
                    Padding = UDim.new(0, 2)
                })

                local selected = default
                local optionButtons = {}

                local function BuildOptions(filterText)
                    for _, btn in ipairs(optionButtons) do
                        if btn then btn:Destroy() end
                    end
                    optionButtons = {}

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then
                            local optBtn = Create("TextButton", {
                                Parent = OptionsScroll,
                                Size = UDim2.new(1, 0, 0, 30),
                                BackgroundColor3 = CurrentTheme.Element,
                                Text = "",
                                TextColor3 = CurrentTheme.Text,
                                TextSize = 12,
                                Font = Enum.Font.Gotham,
                                ZIndex = 32
                            })
                            Create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = optBtn })

                            if optIcon then
                                Create("ImageLabel", {
                                    Parent = optBtn,
                                    Size = UDim2.new(0, 14, 0, 14),
                                    Position = UDim2.new(0, 5, 0.5, -5),
                                    BackgroundTransparency = 1,
                                    Image = GetIcon(optIcon),
                                    ImageColor3 = CurrentTheme.SubText,
                                    ZIndex = 33,
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
                                    ZIndex = 33,
                                })
                            else
                                optBtn.Text = optText
                            end

                            optBtn.MouseButton1Click:Connect(function()
                                selected = opt
                                local selText, _ = NormalizeOption(selected)
                                DropdownBtn.Text = selText
                                DropdownBtn.TextColor3 = CurrentTheme.Text
                                pcall(callback, selected)
                                ddData.IsOpen = false
                                MenuFrame.Visible = false
                                MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                                Arrow.Rotation = 0
                                if ddData.HeartbeatConn then
                                    pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                    ddData.HeartbeatConn = nil
                                end
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

                    local listHeight = math.min(count * 28 + 4, 160)
                    OptionsScroll.Size = UDim2.new(1, -10, 0, listHeight)
                    OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, count * 28 + 4)
                end

                BuildOptions("")

                SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    BuildOptions(SearchBox.Text)
                end)

                local function UpdateMenuPosition()
                    if not DropdownBtn or not DropdownBtn.Parent then return end
                    local btnPos = DropdownBtn.AbsolutePosition
                    local btnSize = DropdownBtn.AbsoluteSize
                    MenuFrame.Position = UDim2.new(0, btnPos.X, 0, btnPos.Y + btnSize.Y + 3)
                    MenuFrame.Size = UDim2.new(0, btnSize.X, 0, MenuFrame.Size.Y.Offset)
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    else
                        CloseAllDropdowns()
                        ddData.IsOpen = true
                        UpdateMenuPosition()
                        MenuFrame.Visible = true
                        local menuHeight = math.min(#options * 28 + 36, 220)
                        MenuFrame.Size = UDim2.new(0, DropdownBtn.AbsoluteSize.X, 0, menuHeight)
                        Arrow.Rotation = 180
                        SearchBox.Text = ""
                        BuildOptions("")

                        ddData.HeartbeatConn = RunService.Heartbeat:Connect(function()
                            if ddData.IsOpen and DropdownBtn and DropdownBtn.Parent then
                                UpdateMenuPosition()
                            else
                                if ddData.HeartbeatConn then
                                    pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                    ddData.HeartbeatConn = nil
                                end
                            end
                        end)
                    end
                end)

                TabContent:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    end
                end)

                local clickConn = UserInputService.InputBegan:Connect(function(input, gpe)
                    if not gpe and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                        if ddData.IsOpen then
                            local mousePos = UserInputService:GetMouseLocation()
                            local menuPos = MenuFrame.AbsolutePosition
                            local menuSize = MenuFrame.AbsoluteSize
                            if mousePos.X < menuPos.X or mousePos.X > menuPos.X + menuSize.X or
                                mousePos.Y < menuPos.Y or mousePos.Y > menuPos.Y + menuSize.Y then
                                local btnPos = DropdownBtn.AbsolutePosition
                                local btnSize = DropdownBtn.AbsoluteSize
                                if mousePos.X < btnPos.X or mousePos.X > btnPos.X + btnSize.X or
                                    mousePos.Y < btnPos.Y or mousePos.Y > btnPos.Y + btnSize.Y then
                                    ddData.IsOpen = false
                                    MenuFrame.Visible = false
                                    MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                                    Arrow.Rotation = 0
                                    if ddData.HeartbeatConn then
                                        pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                        ddData.HeartbeatConn = nil
                                    end
                                end
                            end
                        end
                    end
                end)
                table.insert(DropdownConnections, clickConn)

                ListenTheme(function(theme)
                    if not DropdownFrame or not DropdownFrame.Parent then return end
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = theme.Element
                    local selText, _ = NormalizeOption(selected)
                    DropdownBtn.TextColor3 = selText ~= "" and selText ~= "Select option" and theme.Text or theme.SubText
                    Arrow.ImageColor3 = theme.SubText
                    MenuFrame.BackgroundColor3 = theme.Background
                    SearchBox.BackgroundColor3 = theme.Element
                    SearchBox.TextColor3 = theme.Text
                    SearchBox.PlaceholderColor3 = theme.SubText
                    OptionsScroll.ScrollBarImageColor3 = theme.Accent
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
                        local selText, _ = NormalizeOption(selected)
                        DropdownBtn.Text = selText
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    end
                    BuildOptions("")
                end
                function DropdownAPI:Set(value)
                    selected = value
                    local selText, _ = NormalizeOption(selected)
                    DropdownBtn.Text = selText
                    DropdownBtn.TextColor3 = CurrentTheme.Text
                    pcall(callback, selected)
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = DropdownFrame })

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
                    Size = UDim2.new(0, 76, 0, 14),
                    Position = UDim2.new(0, 22, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
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
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = DropdownBtn })

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

                local MenuFrame = Create("Frame", {
                    Parent = MainWindowScreen,
                    Size = UDim2.new(0, 150, 0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 500
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = MenuFrame })
                Create("UIStroke", { Color = CurrentTheme.Border, Thickness = 1, Parent = MenuFrame })

                local ddData = RegisterDropdown(MenuFrame, Arrow, DropdownBtn)
                table.insert(sectionDropdowns, ddData)

                local SearchBox = Create("TextBox", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 28),
                    Position = UDim2.new(0, 4, 0, 4),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    PlaceholderText = "Search...",
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    ZIndex = 31
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = SearchBox })

                Create("ImageLabel", {
                    Parent = SearchBox,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(1, -18, 0.5, -7),
                    BackgroundTransparency = 1,
                    Image = GetIcon("Search"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 32
                })

                local OptionsScroll = Create("ScrollingFrame", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 0),
                    Position = UDim2.new(0, 4, 0, 28),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = CurrentTheme.Accent,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ZIndex = 31
                })

                Create("UIListLayout", {
                    Parent = OptionsScroll,
                    Padding = UDim.new(0, 2)
                })

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

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then
                            local row = Create("Frame", {
                                Parent = OptionsScroll,
                                Size = UDim2.new(1, 0, 0, 26),
                                BackgroundColor3 = CurrentTheme.Element,
                                ZIndex = 32,
                            })
                            Create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = row })

                            local checkBox = Create("Frame", {
                                Parent = row,
                                Size = UDim2.new(0, 14, 0, 14),
                                Position = UDim2.new(0, 6, 0.5, -7),
                                BackgroundColor3 = CurrentTheme.Background,
                                BorderSizePixel = 0,
                                ZIndex = 33,
                            })
                            Create("UICorner", { CornerRadius = UDim.new(0, 2), Parent = checkBox })

                            local checkMark = Create("ImageLabel", {
                                Parent = checkBox,
                                Size = UDim2.new(0, 14, 0, 14),
                                Position = UDim2.new(0.5, -6, 0.5, -6),
                                BackgroundTransparency = 1,
                                Image = GetIcon("Check"),
                                ImageColor3 = CurrentTheme.Accent,
                                ZIndex = 34,
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
                                    ZIndex = 33,
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
                                ZIndex = 33,
                            })

                            local clickBtn = Create("TextButton", {
                                Parent = row,
                                Size = UDim2.new(1, 0, 1, 0),
                                BackgroundTransparency = 1,
                                Text = "",
                                ZIndex = 35,
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
                                pcall(callback, selected)
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

                    local listHeight = math.min(count * 28 + 4, 160)
                    OptionsScroll.Size = UDim2.new(1, -10, 0, listHeight)
                    OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, count * 28 + 4)
                end

                BuildOptions()

                SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    BuildOptions(SearchBox.Text)
                end)

                local function UpdateMenuPosition()
                    if not DropdownBtn or not DropdownBtn.Parent then return end
                    local btnPos = DropdownBtn.AbsolutePosition
                    local btnSize = DropdownBtn.AbsoluteSize
                    MenuFrame.Position = UDim2.new(0, btnPos.X, 0, btnPos.Y + btnSize.Y + 3)
                    MenuFrame.Size = UDim2.new(0, btnSize.X, 0, MenuFrame.Size.Y.Offset)
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    else
                        CloseAllDropdowns()
                        ddData.IsOpen = true
                        UpdateMenuPosition()
                        MenuFrame.Visible = true
                        local menuHeight = math.min(#options * 28 + 36, 220)
                        MenuFrame.Size = UDim2.new(0, DropdownBtn.AbsoluteSize.X, 0, menuHeight)
                        Arrow.Rotation = 180
                        SearchBox.Text = ""
                        BuildOptions()

                        ddData.HeartbeatConn = RunService.Heartbeat:Connect(function()
                            if ddData.IsOpen and DropdownBtn and DropdownBtn.Parent then
                                UpdateMenuPosition()
                            else
                                if ddData.HeartbeatConn then
                                    pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                    ddData.HeartbeatConn = nil
                                end
                            end
                        end)
                    end
                end)

                TabContent:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    end
                end)

                local clickConn = UserInputService.InputBegan:Connect(function(input, gpe)
                    if not gpe and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                        if ddData.IsOpen then
                            local mousePos = UserInputService:GetMouseLocation()
                            local menuPos = MenuFrame.AbsolutePosition
                            local menuSize = MenuFrame.AbsoluteSize
                            if mousePos.X < menuPos.X or mousePos.X > menuPos.X + menuSize.X or
                                mousePos.Y < menuPos.Y or mousePos.Y > menuPos.Y + menuSize.Y then
                                local btnPos = DropdownBtn.AbsolutePosition
                                local btnSize = DropdownBtn.AbsoluteSize
                                if mousePos.X < btnPos.X or mousePos.X > btnPos.X + btnSize.X or
                                    mousePos.Y < btnPos.Y or mousePos.Y > btnPos.Y + btnSize.Y then
                                    ddData.IsOpen = false
                                    MenuFrame.Visible = false
                                    MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                                    Arrow.Rotation = 0
                                    if ddData.HeartbeatConn then
                                        pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                        ddData.HeartbeatConn = nil
                                    end
                                end
                            end
                        end
                    end
                end)
                table.insert(DropdownConnections, clickConn)

                ListenTheme(function(theme)
                    if not DropdownFrame or not DropdownFrame.Parent then return end
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = theme.Element
                    UpdateButtonText()
                    Arrow.ImageColor3 = theme.SubText
                    MenuFrame.BackgroundColor3 = theme.Background
                    SearchBox.BackgroundColor3 = theme.Element
                    SearchBox.TextColor3 = theme.Text
                    SearchBox.PlaceholderColor3 = theme.SubText
                    OptionsScroll.ScrollBarImageColor3 = theme.Accent
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
                    BuildOptions()
                end
                function MultiDropdownAPI:Set(values)
                    selected = {}
                    if type(values) == "table" then
                        for _, v in ipairs(values) do table.insert(selected, v) end
                    end
                    UpdateButtonText()
                    pcall(callback, selected)
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = InputFrame })

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
                    BackgroundColor3 = CurrentTheme.Element,
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
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = InputBox })

                InputBox.FocusLost:Connect(function(enterPressed)
                    pcall(callback, InputBox.Text, enterPressed)
                end)

                ListenTheme(function(theme)
                    if not InputFrame or not InputFrame.Parent then return end
                    InputFrame.BackgroundColor3 = theme.Background
                    InputBox.BackgroundColor3 = theme.Element
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = BindFrame })

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
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = BindBtn })

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
                            if conn then conn:Disconnect() end
                            pcall(callback, input.KeyCode)
                        end
                    end)
                end)

                WindowConnections:Connect(UserInputService.InputBegan, function(input)
                    if input.KeyCode == default and not listening then
                        pcall(callback, default)
                    end
                end)

                ListenTheme(function(theme)
                    if not BindFrame or not BindFrame.Parent then return end
                    BindFrame.BackgroundColor3 = theme.Background
                    BindBtn.BackgroundColor3 = theme.Element
                    BindBtn.TextColor3 = theme.Text
                end)

                return { Set = function(key) default = key; BindBtn.Text = key.Name end, Get = function() return default end }
            end

            function SectionAPI:CreateLabel(labelData)
                labelData = labelData or {}
                local labelText = labelData.Text or "Label"
                local labelIcon = labelData.Icon or "Type"

                local LabelFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 26),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = LabelFrame })

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
                    if not LabelFrame or not LabelFrame.Parent then return end
                    LabelFrame.BackgroundColor3 = theme.Background
                    Label.TextColor3 = theme.Text
                end)

                return { Set = function(text) Label.Text = text end, Get = function() return Label.Text end }
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = ParaFrame })

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
                    if not ParaFrame or not ParaFrame.Parent then return end
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = PickerFrame })

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
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ColorPreview })
                Create("UIStroke", { Color = CurrentTheme.Border, Thickness = 1, Parent = ColorPreview })

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
                Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = ColorMenu })
                Create("UIStroke", { Color = CurrentTheme.Border, Thickness = 1, Parent = ColorMenu })

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
                Create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = RInput })

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
                Create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = GInput })

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
                Create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = BInput })

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
                Create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = ApplyBtn })

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
                    pcall(callback, newColor)
                    colorOpen = false
                    ColorMenu.Visible = false
                    ColorMenu.Size = UDim2.new(0, 105, 0, 0)
                end)

                ListenTheme(function(theme)
                    if not PickerFrame or not PickerFrame.Parent then return end
                    PickerFrame.BackgroundColor3 = theme.Background
                    ColorMenu.BackgroundColor3 = theme.Background
                    RInput.BackgroundColor3 = theme.Element
                    GInput.BackgroundColor3 = theme.Element
                    BInput.BackgroundColor3 = theme.Element
                    ApplyBtn.BackgroundColor3 = theme.Accent
                end)

                return { Set = function(c) ColorPreview.BackgroundColor3 = c; pcall(callback, c) end, Get = function() return ColorPreview.BackgroundColor3 end }
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
                    if not Divider or not Divider.Parent then return end
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
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = StatusFrame })

                local Dot = Create("Frame", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 7, 0.5, -4),
                    BackgroundColor3 = statusColor,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Dot })

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
                    if not StatusFrame or not StatusFrame.Parent then return end
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

            return SectionAPI
        end

        function TabAPI:Section(data)
            local sec = self:CreateSection(data)
            self._CurrentSection = sec
            return sec
        end

        function TabAPI:Paragraph(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateParagraph(data)
        end

        function TabAPI:Button(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateButton(data)
        end

        function TabAPI:Toggle(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateToggle(data)
        end

        function TabAPI:Slider(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateSlider(data)
        end

        function TabAPI:Dropdown(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateDropdown(data)
        end

        function TabAPI:MultiDropdown(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateMultiDropdown(data)
        end

        function TabAPI:Input(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateInput(data)
        end

        function TabAPI:Keybind(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateKeybind(data)
        end

        function TabAPI:Label(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateLabel(data)
        end

        function TabAPI:ColorPicker(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateColorPicker(data)
        end

        function TabAPI:Divider()
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateDivider()
        end

        function TabAPI:Status(data)
            if not self._CurrentSection then self:Section({ Name = "Default", Opened = true }) end
            return self._CurrentSection:CreateStatus(data)
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

return Quantum
