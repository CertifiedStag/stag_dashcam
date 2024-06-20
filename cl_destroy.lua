local QBCore = exports['qb-core']:GetCoreObject()
local ox_target = exports.ox_target


local tableModel = Config.tableProp
local tableCoords = Config.tableLoc

print(tableModel)
print(tableCoords)

Citizen.CreateThread(function()
    RequestModel(tableModel)
    while not HasModelLoaded(tableModel) do
        Citizen.Wait(0)
    end

    local tableEntity = CreateObject(tableModel, tableCoords.x, tableCoords.y, tableCoords.z, false, false, false)
    SetEntityHeading(tableEntity, Config.heading)
    FreezeEntityPosition(tableEntity, true)

    if Config.target == "ox" then return
        ox_target:addLocalEntity(tableEntity, {
            {
                icon = "fa-solid fa-wrench",
                label = "Destroy Camera",
                onSelect = function()
                  print('loading progressbar')
                    QBCore.Functions.Progressbar("destroy_camera", "Destroying Camera", Config.destroyTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                     }, {
                        animDict = "amb@prop_human_parking_meter@male@base",
                        anim = "base",
                        flags = 49,
                     }, {}, {}, function()
                        TriggerServerEvent('stag_dashcams:server:destroyCam')
                     end, function()
                        TriggerEvent('QBCore:Notify', source, 'Cancelled...', 'error', 1000)
                     end)
                    
                end,
            }
        })
    
    elseif Config.target == "qb" then return
        exports['qb-target']:AddTargetEntity(tableEntity, {
            options = { 
              {
                num = 1,
                icon = 'fa-solid fa-wrench', 
                label = 'Destroy Camera', 
                targeticon = 'fas fa-example', 
                action = function(entity)
                  if IsPedAPlayer(entity) then return false end
                  QBCore.Functions.Progressbar("destroy_camera", "Destroying Camera", Config.creationTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                 }, {
                    animDict = "amb@prop_human_parking_meter@male@base",
                    anim = "base",
                    flags = 49,
                 }, {}, {}, function()
                    TriggerServerEvent('stag_dashcams:server:DestroyCam')
                 end, function()
                    TriggerEvent('QBCore:Notify', source, 'Cancelled...', 'error', 1000)
                 end)
                end,
              },
            },
            distance = 2.5,
          })
        end
    end)