RegisterCommand("firetablet", function()

    lib.registerContext({
        id = 'fire_tablet_main',
        title = 'Fire Department Tablet',
        options = {
            {
                title = "Department Budget",
                onSelect = function()
                    TriggerServerEvent("fire:server:getBudget")
                end
            },
            {
                title = "Purchase Upgrades",
                onSelect = function()
                    OpenUpgradeMenu()
                end
            },
            {
                title = "Active Fire Incidents",
                onSelect = function()
                    TriggerServerEvent("fire:server:getIncidents")
                end
            },
            {
                title = "Start Court Case",
                onSelect = function()
                    StartCourtCaseMenu()
                end
            }
        }
    })

    lib.showContext('fire_tablet_main')

end)
