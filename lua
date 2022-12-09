local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/jasonW9/gbg/main/luacode"))()

Aiming.TeamCheck(false)



local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")



local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = Workspace.CurrentCamera



local DaHoodSettings = {

    SilentAim = true,

    AimLock = false,

    Prediction = 0.1537,

    AimLockKeybind = Enum.KeyCode.E,

    Resolver = true,

    AUTO_PREDICTION = true,
    
    UnderGroundResolver = true,

}

getgenv().DaHoodSettings = DaHoodSettings



local GunSettings = {

    ["Double-Barrel SG"] = { --// dh

        ["FOV"] = 25

    },

    ["Double Barrel SG"] = { --// dhm

        ["FOV"] = 26.5

    },

    ["DoubleBarrel"] = { --// hood customs

    ["FOV"] = 20

    },

    ["Revolver"] = {

        ["FOV"] = 14.5

    },

    ["TacticalShotgun"] = {
        
         ["FOV"] = 12.9
        
    },

    ["SMG"] = {

        ["FOV"] = 6.5

    },

    ["Shotgun"] = {

        ["FOV"] = 25

    }

}




function Aiming.Check()

    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then

        return false

    end

    local Character = Aiming.Character(Aiming.Selected)

    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value

    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil

    if (KOd or Grabbed) then

        return false

    end

    return true

end



task.spawn(function()

    while task.wait() do

        if DaHoodSettings.Resolver and Aiming.Selected ~= nil and (Aiming.Selected.Character)  then

            local oldVel = game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity

            game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity = Vector3.new(oldVel.X, -0, oldVel.Z)

        end 

    end

end)



local Script = {Functions = {}}



Script.Functions.getToolName = function(name)

    local split = string.split(string.split(name, "[")[2], "]")[1]

    return split

end



Script.Functions.getEquippedWeaponName = function(player)

   if (player.Character) and player.Character:FindFirstChildWhichIsA("Tool") then

      local Tool =  player.Character:FindFirstChildWhichIsA("Tool")

      if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then 

         return Script.Functions.getToolName(Tool.Name)

      end

   end

   return nil

end



game:GetService("RunService").RenderStepped:Connect(function()

    if Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer) ~= nil then

        local WeaponSettings = GunSettings[Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer)]

        if WeaponSettings ~= nil then

            Aiming.FOV = WeaponSettings.FOV

        else

            Aiming.FOV = 5

        end

    end    

end)



local __index

__index = hookmetamethod(game, "__index", function(t, k)

    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then

        local SelectedPart = Aiming.SelectedPart

        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then

            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

            return (k == "Hit" and Hit or SelectedPart)

        end

    end



    return __index(t, k)

end)



RunService:BindToRenderStep("AimLock", 0, function()

    if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then

        local SelectedPart = Aiming.SelectedPart

        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)

    end
 end)
                            end)

game:GetService("RunService").RenderStepped:Connect(function()
    if Settings.rewrittenmain.UnderGroundResolver == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                local hrp = v.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)    
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)   
            end
        end
    end)
end)

if Settings.rewrittenmain.AUTO_PREDICTION == true then
    pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    split = string.split(pingvalue,'(')
    ping = tonumber(split[1])
    if ping < 360 then
        getgenv().DaHoodSettings.Prediction = 0.16537
    elseif ping < 270 then
        getgenv().DaHoodSettings.Prediction = 0.195566
    elseif ping < 260 then
        getgenv().DaHoodSettings.Prediction = 0.175566
    elseif ping < 250 then
        getgenv().DaHoodSettings.Prediction = 0.1651
    elseif ping < 240 then
        getgenv().DaHoodSettings.Prediction = 0.16780
    elseif ping < 230 then
        getgenv().DaHoodSettings.Prediction = 0.15692
    elseif ping < 220 then
        getgenv().DaHoodSettings.Prediction = 0.165566
    elseif ping < 210 then
        getgenv().DaHoodSettings.Prediction = 0.16780
    elseif ping < 200 then
        getgenv().DaHoodSettings.Prediction = 0.165566
    elseif ping < 190 then
        getgenv().DaHoodSettings.Prediction = 0.166547
    elseif ping < 180 then
        getgenv().DaHoodSettings.Prediction = 0.19284
    elseif ping < 170 then
        getgenv().DaHoodSettings.Prediction = 0.1923111 
    elseif ping < 160 then
        getgenv().DaHoodSettings.Prediction = 0.16
    elseif ping < 150 then
        getgenv().DaHoodSettings.Prediction = 0.15
    elseif ping < 140 then
        getgenv().DaHoodSettings.Prediction = 0.1223333
    elseif ping < 130 then
        getgenv().DaHoodSettings.Prediction = 0.156692
    elseif ping < 120 then
        getgenv().DaHoodSettings.Prediction = 0.1437
    elseif ping < 110 then
        getgenv().DaHoodSettings.Prediction = 0.1455
    elseif ping < 100 then
        getgenv().DaHoodSettings.Prediction = 0.14
    elseif ping < 90 then
        getgenv().DaHoodSettings.Prediction = 0.135
    elseif ping < 80 then
        getgenv().DaHoodSettings.Prediction = 0.130
    elseif ping < 70 then
        getgenv().DaHoodSettings.Prediction = 0.119
    elseif ping < 60 then
        getgenv().DaHoodSettings.Prediction = 0.015
    elseif ping < 50 then
        getgenv().DaHoodSettings.Prediction = 0.1142154
    elseif ping < 40 then
        getgenv().DaHoodSettings.Prediction = 0.1142154
    elseif ping < 30 then
        getgenv().DaHoodSettings.Prediction = 0.1142154
    elseif ping < 20 then
        getgenv().DaHoodSettings.Prediction = 0.1142154
    elseif ping < 10 then
        getgenv().DaHoodSettings.Prediction = 0.1142154
    end
end
