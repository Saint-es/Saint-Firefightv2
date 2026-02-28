RescueCushions = {}

RegisterNetEvent("fire:server:createCushion", function(coords)

    local id = #RescueCushions + 1

    RescueCushions[id] = {
        coords = coords,
        active = false
    }

    TriggerClientEvent("fire:client:spawnCushion", -1, id, coords)
end)

RegisterNetEvent("fire:server:setCushionActive", function(id)
    if RescueCushions[id] then
        RescueCushions[id].active = true
    end
end)
