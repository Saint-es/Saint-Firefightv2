CreateThread(function()
    while true do
        Wait(200)

        local ped = PlayerPedId()

        if IsPedShooting(ped) then
            local weapon = GetSelectedPedWeapon(ped)

            if weapon == `WEAPON_FIREEXTINGUISHER` then

                local coords = GetEntityCoords(ped)

                for fireId, fire in pairs(ClientFires) do
                    for index,node in pairs(fire.spreadNodes) do

                        if #(coords - node.coords) < 5.0 then
                            TriggerServerEvent("fire:server:suppressFire", fireId, index, "water")
                        end

                    end
                end

            end
        end
    end
end)
