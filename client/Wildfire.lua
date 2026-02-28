CreateThread(function()
    while true do
        Wait(1000)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 then
            local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

            if string.lower(model) == Config.Wildfire.BulldozerModel then
                local coords = GetEntityCoords(vehicle)
                TriggerServerEvent("fire:server:createFirebreak", coords)
            end
        end
    end
end)
