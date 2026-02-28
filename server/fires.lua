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

CreateThread(function()
    while true do
        Wait(5000)

        for fireId, fire in pairs(ActiveFires) do
            if not fire.resolved then

                local fireConfig = Config.FireTypes[fire.type]
                if not fireConfig then goto continue end

                for _,node in pairs(fire.spreadNodes) do
                    node.intensity = node.intensity - math.random(5,15)

                    if node.intensity > 0 then

                        local spreadChance = fireConfig.spreadRate * 0.1

                        if fireConfig.windAmplified then
                            spreadChance += (math.abs(GlobalWind.x) + math.abs(GlobalWind.y)) * 0.05
                        end

                        if math.random() < spreadChance then
                            local newCoords = vector3(
                                node.coords.x + math.random(-3,3),
                                node.coords.y + math.random(-3,3),
                                node.coords.z
                            )

                            table.insert(fire.spreadNodes, {
                                coords = newCoords,
                                intensity = 300
                            })

                            TriggerClientEvent("fire:client:addFireNode", -1, fireId, newCoords)
                        end

                    end
                end

                if #fire.spreadNodes == 0 then
                    fire.resolved = true
                    TriggerClientEvent("fire:client:fireResolved", -1, fireId)
                end

            end
            ::continue::
        end

    end
end)

RegisterNetEvent("fire:server:suppressFire", function(fireId, nodeIndex, method)

    local src = source
    local fire = ActiveFires[fireId]
    if not fire then return end

    local fireConfig = Config.FireTypes[fire.type]
    if not fireConfig then return end

    if fireConfig.requiredMethod ~= method then

        if fireConfig.waterMakesWorse and method == "water" then
            fire.spreadNodes[nodeIndex].intensity += 200
        end

        return
    end

    fire.spreadNodes[nodeIndex].intensity -= 200

    if fire.spreadNodes[nodeIndex].intensity <= 0 then
        table.remove(fire.spreadNodes, nodeIndex)
    end

end)
