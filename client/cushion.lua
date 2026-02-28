RegisterCommand("deploycushion", function()

    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 then return end

    local model = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

    if not Config.RescueCushion.AuthorizedVehicles[model] then
        return
    end

    local coords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 5.0, 0.0)

    TriggerServerEvent("fire:server:createCushion", coords)

end)

RegisterNetEvent("fire:client:spawnCushion", function(id, coords)

    local obj = CreateObject(`prop_air_bigradar`, coords.x, coords.y, coords.z, true, true, true)
    FreezeEntityPosition(obj, true)

    Wait(Config.RescueCushion.InflateTime)

    TriggerServerEvent("fire:server:setCushionActive", id)

end)

CreateThread(function()
    while true do
        Wait(100)

        local ped = PlayerPedId()
        if IsPedFalling(ped) then

            local coords = GetEntityCoords(ped)

            for _,data in pairs(RescueCushions or {}) do
                if data.active then
                    if #(coords - data.coords) < Config.RescueCushion.Radius then
                        SetEntityHealth(ped, GetEntityHealth(ped))
                        ClearPedTasksImmediately(ped)
                    end
                end
            end

        end
    end
end)
