local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('stag_dashcams:takeCam')
AddEventHandler('stag_dashcams:takeCam', function()
    local hasItem = QBCore.Functions.HasItem(Config.RemoveItem)
            if not hasItem then return
                QBCore.Functions.Notify('You Do Not Have The Required Item', 'error', 1000)
            end

    QBCore.Functions.Progressbar('take_cam', 'Taking Dashcam', Config.RemoveTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        },
        {animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 1,}, 
        {}, {}, function()
            QBCore.Functions.Notify('Successfully Removed Dashcam', 'success', 1000)
            Wait(100)
            print('here')
            TriggerServerEvent('stag_dashcams:server:giveCam')
            print('now here')
        end, function()
            QBCore.Functions.Notify('Cancelled...', 'error', 1000)
    end)
end
)

RegisterCommand('takecam', function()
    if not IsPedSittingInAnyVehicle(PlayerPedId()) then return
        QBCore.Functions.Notify('Not in a vehicle', 'error', 5000)
    else
    TriggerEvent('stag_dashcams:takeCam')
    end
end, false)
    