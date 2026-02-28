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

RegisterNetEvent("fire:server:generateArsonCase", function(fireId, suspect)

    local evidenceScore = math.random(20,100)

    MySQL.insert([[
        INSERT INTO fire_arson_cases (fire_id, suspect_identifier, evidence_score)
        VALUES (?, ?, ?)
    ]], {
        fireId,
        suspect,
        evidenceScore
    })

end)


RegisterNetEvent("fire:server:generateArsonCase", function(fireId, suspect)

    local evidenceScore = math.random(20,100)

    MySQL.insert([[
        INSERT INTO fire_arson_cases (fire_id, suspect_identifier, evidence_score)
        VALUES (?, ?, ?)
    ]], {
        fireId,
        suspect,
        evidenceScore
    })

end)
