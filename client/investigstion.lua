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

RegisterCommand("firereport", function()

    local input = lib.inputDialog("Fire Investigation Report", {
        { type = "input", label = "Fire ID", required = true },
        { type = "select", label = "Cause", options = {
            { label = "Accidental", value = "Accidental" },
            { label = "Electrical Fault", value = "Electrical" },
            { label = "Arson", value = "Arson" }
        }},
        { type = "textarea", label = "Notes", required = true }
    })

    if not input then return end

    TriggerServerEvent("fire:server:createReport",
        input[1],
        input[2],
        input[3]
    )

end)
