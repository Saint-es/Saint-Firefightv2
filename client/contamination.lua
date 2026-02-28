RegisterNetEvent("fire:client:chemicalDamage", function()

    local ped = PlayerPedId()

    ApplyDamageToPed(ped, 10, false)

    lib.notify({
        title = "Chemical Exposure",
        description = "You are not wearing a Hazmat Suit!",
        type = "error"
    })

end)
