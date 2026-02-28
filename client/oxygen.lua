PlayerAir = 300
UsingSCBA = false

CreateThread(function()
    while true do
        Wait(1000)

        if UsingSCBA then
            PlayerAir -= 1

            if PlayerAir <= 0 then
                UsingSCBA = false
                TriggerEvent("fire:client:airEmpty")
            end
        end
    end
end)

if fire.type == "Shop" then
    if not Inventory.HasItem(src, Config.Items.SCBA) then
        TriggerClientEvent("fire:client:smokeDamage", src)
    end
end

RegisterNetEvent("fire:client:airEmpty", function()

    lib.notify({
        title = "SCBA Empty",
        description = "Your air tank is empty!",
        type = "error"
    })

end)

RegisterNetEvent("fire:client:smokeDamage", function()

    ApplyDamageToPed(PlayerPedId(), 5, false)

    lib.notify({
        title = "Smoke Inhalation",
        description = "You need an SCBA tank!",
        type = "error"
    })

end)
