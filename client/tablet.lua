RegisterNetEvent("fire:client:showBudget", function(amount)

    lib.notify({
        title = "Department Budget",
        description = "$"..amount,
        type = "inform"
    })

end)

RegisterNetEvent("fire:client:showIncidents", function(incidents)

    local options = {}

    for _,v in pairs(incidents) do
        table.insert(options, {
            title = v.fire_type .. " - ID "..v.id,
            description = "Intensity: "..v.intensity
        })
    end

    lib.registerContext({
        id = 'incident_list',
        title = 'Recent Incidents',
        options = options
    })

    lib.showContext('incident_list')

end)
