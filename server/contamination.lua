ContaminatedPlayers = {}

function IsPlayerNearChemicalFire(source)

    local ped = GetPlayerPed(source)
    if not ped then return false end

    local coords = GetEntityCoords(ped)

    for _,fire in pairs(ActiveFires) do
        if fire.type == "Chemical" and not fire.resolved then
            if #(coords - fire.coords) < 15.0 then
                return true
            end
        end
    end

    return false
end

CreateThread(function()
    while true do
        Wait(3000)

        for _,src in pairs(GetPlayers()) do

            if IsPlayerNearChemicalFire(src) then

                if not Inventory.HasItem(src, Config.Items.HazmatSuit) then

                    ContaminatedPlayers[src] = true
                    TriggerClientEvent("fire:client:chemicalDamage", src)

                end

            end

        end

    end
end)

CreateThread(function()
    while true do
        Wait(5000)

        for src,_ in pairs(ContaminatedPlayers) do

            local ped = GetPlayerPed(src)
            if not ped then goto continue end

            local coords = GetEntityCoords(ped)

            for _,target in pairs(GetPlayers()) do
                if target ~= src then

                    local tPed = GetPlayerPed(target)
                    local tCoords = GetEntityCoords(tPed)

                    if #(coords - tCoords) < 3.0 then
                        ContaminatedPlayers[target] = true
                        TriggerClientEvent("fire:client:contaminated", target)
                    end

                end
            end

            ::continue::
        end

    end
end)

RegisterNetEvent("fire:server:decontaminate", function()
    local src = source

    if ContaminatedPlayers[src] then
        ContaminatedPlayers[src] = nil
        TriggerClientEvent("fire:client:decontaminated", src)
    end
end)
