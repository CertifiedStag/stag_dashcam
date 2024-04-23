local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('stag_dashcams:server:giveCam')
AddEventHandler('stag_dashcams:server:giveCam', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('dashcam', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dashcam'], 'add')
end)