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

function OpenUpgradeMenu()

    local options = {}

    for name,data in pairs(Config.Upgrades) do
        table.insert(options, {
            title = name,
            description = "Cost: $"..data.cost,
            onSelect = function()
                TriggerServerEvent("fire:server:buyUpgrade", name)
            end
        })
    end

    lib.registerContext({
        id = 'upgrade_menu',
        title = 'Station Upgrades',
        options = options
    })

    lib.showContext('upgrade_menu')

end
