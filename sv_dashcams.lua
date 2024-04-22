local QBCore = exports['qb-core']:GetCoreObject()
local src = source
local Config = lib.require('sv_config')

RegisterNetEvent('stag_dashcams:removeCam')
AddEventHandler('stag_dashcams:removeCam', function()
TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RewardItem], 'add')
end)

QBCore.Commands.Add('takecam', function()
TriggerClientEvent('stag_takecam', src)
end)