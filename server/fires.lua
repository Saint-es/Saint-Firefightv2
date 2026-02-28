function CreateFireIncident(fireType, coords)

    FireIdCounter += 1
    local fireId = "FIRE-" .. FireIdCounter

    ActiveFires[fireId] = {
        id = fireId,
        type = fireType,
        coords = coords,
        intensity = 500,
        spreadNodes = {
            {
                coords = coords,
                intensity = 500
            }
        },
        resolved = false
    }

    LogFireIncident(fireType, json.encode(coords), 500)

    TriggerClientEvent("fire:client:syncFire", -1, fireId, ActiveFires[fireId])

end
