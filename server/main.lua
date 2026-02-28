FireDepartment = {
    budget = Config.Department.StartingBudget,
    upgrades = {}
}

ActiveFires = {}
FireIdCounter = 0
GlobalWind = vector3(0.0, 0.0, 0.0)

CreateThread(function()
    while true do
        Wait(60000)
        GlobalWind = vector3(
            math.random(-2,2),
            math.random(-2,2),
            0.0
        )
    end
end)

RegisterNetEvent("fire:server:getIncidents", function()
    local src = source

    local results = MySQL.query.await("SELECT * FROM fire_incidents ORDER BY created_at DESC LIMIT 10")

    TriggerClientEvent("fire:client:showIncidents", src, results)
end)

RegisterNetEvent("fire:server:getBudget", function()
    local src = source
    TriggerClientEvent("fire:client:showBudget", src, FireDepartment.budget)
end)
