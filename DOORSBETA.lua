local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("DOORS HACK [BETA]", "Ocean")


local PlrTab = Window:NewTab("ОСНОВНОЕ")
local PlrSection = PlrTab:NewSection("The Hotel :")

PlrSection:NewButton("ВОЗРОЖДЕНИЕ", "Воскрешает вас, но не бесплатно.", function()
    game.ReplicatedStorage.RemotesFolder.Revive:FireServer()
end)
PlrSection:NewButton("УМЕРЕТЬ", "Ваш персонаж умирает.", function()
    game.Players.LocalPlayer.Character.Head:Destroy()
end)
PlrSection:NewButton("ИГРАТЬ СНОВА", "Автоматически нажимает на кнопку Играть Снова.", function()
    game.ReplicatedStorage.RemotesFolder.PlayAgain:FireServer()
end)
PlrSection:NewButton("УБРАТЬ СКРИМЕРЫ", "У вас не будет Скримеров.", function()
    game.ReplicatedStorage.RemotesFolder.Jumpscare:Destroy()
    game.ReplicatedStorage.RemotesFolder.SpiderJumpscare:Destroy()
end)
PlrSection:NewButton("ВЕРНУТЬСЯ В ЛОББИ", "Возвращает вас в Лобби.", function()
    game.ReplicatedStorage.RemotesFolder.Lobby:FireServer()
end)
PlrSection:NewButton("ОТКРЫТЬ ПОРТАЛ В ROOMS", "Вы бесплатно открываете портал в ROOMS.", function()
    workspace.CurrentRooms["60"].RoomsDoor_Entrance.Door.EnterPrompt.Enabled = true
end)
PlrSection:NewButton("ОТКРЫТЬ ПОРТАЛ RIFT [ОБЫЧНЫЙ]", "Полностью рабочий RIFT.", function()
    workspace.CurrentRooms["0"].RiftSpawn.Rift.RiftPrompt.Enabled = true
end)
PlrSection:NewButton("ОТКРЫТЬ ПОРТАЛ RIFT [THE BACK DOOR]", "Полностью рабочий RIFT.", function()
    workspace.CurrentRooms["0"].RiftSpawn.Rift.StarCenter.StarRiftPrompt.Enabled = true
end)
PlrSection:NewButton("ВКЛЮЧИТЬ НОЧНОЕ ЗРЕНИЕ", "Вы сможете видеть в темноте.", function()
local Light = game:GetService("Lighting")
            function dofullbright()
            Light.Ambient = Color3.new(1, 1, 1)
            Light.ColorShift_Bottom = Color3.new(1, 1, 1)
            Light.ColorShift_Top = Color3.new(1, 1, 1)
            end
            dofullbright()
            Light.LightingChanged:Connect(dofullbright)
            end)

PlrSection:NewButton("МАКСИМАЛЬНАЯ СКОРОСТЬ", "Максимальная скорость без Лагов!", function()
local player = game.Players.LocalPlayer

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")

    local function setWalkSpeed()
        humanoid.WalkSpeed = 21
    end

    setWalkSpeed()

    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(setWalkSpeed)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end

end)


PlrSection:NewButton("ОБЫЧНАЯ СКОРОСТЬ", "Стандартная скрость.", function()
local player = game.Players.LocalPlayer

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")

    local function setWalkSpeed()
        humanoid.WalkSpeed = 15
    end

    setWalkSpeed()

    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(setWalkSpeed)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end

end)



PlrSection:NewButton("NOCLIP", "Стены теперь не проблема!", function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
end)

PlrSection:NewButton("FLY", "Полёт возможен! Нажмите на G Что-бы летать.", function()
    local plr = game.Players.LocalPlayer
	local mouse = plr:GetMouse()

	localplayer = plr

	if workspace:FindFirstChild("Core") then
		workspace.Core:Destroy()
	end

	local Core = Instance.new("Part")
	Core.Name = "Core"
	Core.Size = Vector3.new(0.05, 0.05, 0.05)

	spawn(function()
		Core.Parent = workspace
		local Weld = Instance.new("Weld", Core)
		Weld.Part0 = Core
		Weld.Part1 = localplayer.Character.LowerTorso
		Weld.C0 = CFrame.new(0, 0, 0)
	end)

	workspace:WaitForChild("Core")

	local torso = workspace.Core
	flying = true
	local speed=10
	local keys={a=false,d=false,w=false,s=false}
	local e1
	local e2
	local function start()
		local pos = Instance.new("BodyPosition",torso)
		local gyro = Instance.new("BodyGyro",torso)
		pos.Name="EPIXPOS"
		pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		pos.position = torso.Position
		gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		gyro.cframe = torso.CFrame
		repeat
			wait()
			localplayer.Character.Humanoid.PlatformStand=true
			local new=gyro.cframe - gyro.cframe.p + pos.position
			if not keys.w and not keys.s and not keys.a and not keys.d then
				speed=5
			end
			if keys.w then
				new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				speed=speed+0
			end
			if keys.s then
				new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				speed=speed+0
			end
			if keys.d then
				new = new * CFrame.new(speed,0,0)
				speed=speed+0
			end
			if keys.a then
				new = new * CFrame.new(-speed,0,0)
				speed=speed+0
			end
			if speed>10 then
				speed=5
			end
			pos.position=new.p
			if keys.w then
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
			elseif keys.s then
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
			else
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame
			end
		until flying == false
		if gyro then gyro:Destroy() end
		if pos then pos:Destroy() end
		flying=false
		localplayer.Character.Humanoid.PlatformStand=false
		speed=10
	end
	e1=mouse.KeyDown:connect(function(key)
		if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
		if key=="w" then
			keys.w=true
		elseif key=="s" then
			keys.s=true
		elseif key=="a" then
			keys.a=true
		elseif key=="d" then
			keys.d=true
		elseif key=="g" then
			if flying==true then
				flying=false
			else
				flying=true
				start()
			end
		end
	end)
	e2=mouse.KeyUp:connect(function(key)
		if key=="w" then
			keys.w=false
		elseif key=="s" then
			keys.s=false
		elseif key=="a" then
			keys.a=false
		elseif key=="d" then
			keys.d=false
		end
	end)
	start()
end)

PlrSection:NewButton("ФАРМ СМЕРТЕЙ", "Используйте после 0 двери.", function()
    while true do
    game.Players.LocalPlayer.Character.Head:Destroy()
    wait(3)
    game.ReplicatedStorage.RemotesFolder.Revive:FireServer()
    wait(1)
end
end)

local PlrSection = PlrTab:NewSection("Super Hard Mode : ")

PlrSection:NewButton("ВОЗРОЖДЕНИЕ", "Воскрешает вас бесконечно.", function()
    game.ReplicatedStorage.EntityInfo.Revive:FireServer()
end)
PlrSection:NewButton("УМЕРЕТЬ", "Ваш персонаж умирает.", function()
    game.Players.LocalPlayer.Character.Head:Destroy()
end)
PlrSection:NewButton("ИГРАТЬ СНОВА", "Автоматически нажимает на кнопку Играть Снова.", function()
    game.ReplicatedStorage.EntityInfo.PlayAgain:FireServer()
end)
PlrSection:NewButton("УБРАТЬ СКРИМЕРЫ", "У вас не будет Скримеров.", function()
    game.ReplicatedStorage.EntityInfo.Jumpscare:Destroy()
    game.ReplicatedStorage.EntityInfo.SpiderJumpscare:Destroy()
end)
PlrSection:NewButton("ВЕРНУТЬСЯ В ЛОББИ", "Возвращает вас в Лобби.", function()
    game.ReplicatedStorage.EntityInfo.Lobby:FireServer()
end)
PlrSection:NewButton("ОТКРЫТЬ ПОРТАЛ В ROOMS", "Вы бесплатно открываете портал в ROOMS.", function()
    workspace.CurrentRooms["60"].RoomsDoor_Entrance.Door.EnterPrompt.Enabled = true
end)

local PlrSection = PlrTab:NewSection("The DRAKOBLOXXERS :")

PlrSection:NewButton("БЕЗ УРОНА", "При Активации на кнопку, вы не умрёте от Блоков.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main",true))()
end)

local PlrTab = Window:NewTab("ОБХОДЫ")
local PlrSection = PlrTab:NewSection("Скоро будет...")



local PlrTab = Window:NewTab("ДРУГОЕ")
local PlrSection = PlrTab:NewSection("Информация про разработчика :")

PlrSection:NewButton("Дискорд Сервер", "https://discord.gg/YpEaxNqEuT", function()
    
end)

PlrSection:NewButton("Главный Разработчик / Дискорд - .MiXuR", "Если у вас есть идеи, пишите.", function()
    
end)
