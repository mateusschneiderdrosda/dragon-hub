-- Blox Fruits Main Logic (Template)
local RedzLib = _G.RedzLib

-- Configurações Globais
_G.AutoFarm = false
_G.AutoStats = false
_G.SelectedStat = "Melee"

-- Funções de Jogo
local function AutoFarmFunction()
    spawn(function()
        while _G.AutoFarm do
            task.wait()
            -- Lógica de Auto Farm aqui
            -- print("Auto Farming...")
        end
    end)
end

local function AutoStatsFunction()
    spawn(function()
        while _G.AutoStats do
            task.wait()
            -- print("Adding stats to: " .. _G.SelectedStat)
        end
    end)
end

-- Criar Janela
local Window = RedzLib:CreateWindow("Redz Hub | Blox Fruits")

-- Aba Principal
local MainTab = RedzLib:CreateTab("Principal")
MainTab:CreateToggle("Auto Farm Level", function(state)
    _G.AutoFarm = state
    if state then
        AutoFarmFunction()
    end
end)

MainTab:CreateButton("Resgatar Códigos", function()
    print("Resgatando todos os códigos...")
end)

-- Aba de Stats
local StatsTab = RedzLib:CreateTab("Status")
StatsTab:CreateToggle("Auto Stats", function(state)
    _G.AutoStats = state
    if state then
        AutoStatsFunction()
    end
end)

StatsTab:CreateButton("Selecionar Melee", function()
    _G.SelectedStat = "Melee"
end)

StatsTab:CreateButton("Selecionar Defense", function()
    _G.SelectedStat = "Defense"
end)

-- Aba de Teleporte
local TeleportTab = RedzLib:CreateTab("Teleporte")
TeleportTab:CreateButton("Sea 1", function()
    print("Teleportando para Sea 1...")
end)
TeleportTab:CreateButton("Sea 2", function()
    print("Teleportando para Sea 2...")
end)
TeleportTab:CreateButton("Sea 3", function()
    print("Teleportando para Sea 3...")
end)

print("Script de Blox Fruits carregado com sucesso!")
