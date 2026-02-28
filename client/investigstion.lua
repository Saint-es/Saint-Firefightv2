RegisterNetEvent("fire:server:createReport", function(fireId, cause, notes)

    local src = source
    if not Framework.IsFirefighter(src) then return end

    local Player = Framework.GetPlayer(src)
    if not Player then return end

    MySQL.insert([[
        INSERT INTO fire_reports (fire_id, investigator, cause, notes)
        VALUES (?, ?, ?, ?)
    ]], {
        fireId,
        Player.PlayerData.citizenid,
        cause,
        notes
    })

    TriggerClientEvent("ox_lib:notify", src, {
        title = "Investigation",
        description = "Report submitted successfully.",
        type = "success"
    })

end)
