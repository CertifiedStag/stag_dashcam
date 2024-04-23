local QBCore = exports['qb-core']:GetCoreObject()

local HasItem = QBCore.Functions.HasItem(Config.RemoveItem)
local playerPed = PlayerPedId()
local vehicle = GetVehiclePedIsIn(playerPed, false)

RegisterNetEvent('stag_dashcams:check') 
AddEventHandler('stag_dashcams:check', function()
    if not HasItem then return 
        QBCore.Functions.Notify('You Do Not Have The Required Item', 'error', 1000)
    end
    if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
    TriggerEvent('stag_dashcams:takeCam')
    else return
    QBCore.Functions.Notify('Not in Drivers Seat', 'error', 1000)
    end
end
)

RegisterNetEvent('stag_dashcams:takeCam')
AddEventHandler('stag_dashcams:takeCam', function()
    QBCore.Functions.Progressbar('take_cam', 'Taking Dashcam', 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        },
        {animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 1,}, 
        {}, {}, function()
            TriggerServerEvent('stag_dashcams:takeCam')
            QBCore.Functions.Notify('Successfully Removed Dashcam', 'success', 1000)
        end, function()
            QBCore.Functions.Notify('Cancelled...', 'error', 1000)
    end)
end
)
