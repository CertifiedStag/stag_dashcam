local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('stag_dashcams:server:giveCam')
AddEventHandler('stag_dashcams:server:giveCam', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('dashcam', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dashcam'], 'add')
end)

RegisterNetEvent('stag_dashcams:server:destroyCam')
AddEventHandler('stag_dashcams:server:destroyCam', function()
local hasItem = QBCore.Functions.HasItem('dashcam')
local hasItem2 = QBCore.Functions.HasItem(Config.destroyItem)
local Player = QBCore.Functions.GetPlayer(source)

    if not hasItem and hasItem2 then return end
    Player.Functions.RemoveItem('dashcam', 1)
    Player.Functions.AddItem('metalscrap', Config.MSamount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], 'add')
end,
QBCore.Functions.Notify('You do not have everything required!', 'error', 5000))