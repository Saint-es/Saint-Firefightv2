RegisterNetEvent("fire:client:chemicalDamage", function()

    local ped = PlayerPedId()

    ApplyDamageToPed(ped, 10, false)

    lib.notify({
        title = "Chemical Exposure",
        description = "You are not wearing a Hazmat Suit!",
        type = "error"
    })

end)

RegisterNetEvent("fire:client:contaminated", function()

    lib.notify({
        title = "Contamination Spread",
        description = "You have been contaminated!",
        type = "warning"
    })

end)

CreateThread(function()
    while true do
        Wait(1000)

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        if #(coords - Config.Decontamination.Location) < Config.Decontamination.Radius then

            if Contaminated then
                TriggerServerEvent("fire:server:decontaminate")
            end

        end
    end
end)
