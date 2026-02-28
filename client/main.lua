ClientFires = {}

RegisterNetEvent("fire:client:syncFire", function(fireId, fireData)
    ClientFires[fireId] = fireData

    for _,node in pairs(fireData.spreadNodes) do
        StartScriptFire(node.coords.x, node.coords.y, node.coords.z, 25, false)
    end
end)

RegisterNetEvent("fire:client:addFireNode", function(fireId, coords)
    if not ClientFires[fireId] then return end
    StartScriptFire(coords.x, coords.y, coords.z, 25, false)
end)

RegisterNetEvent("fire:client:fireResolved", function(fireId)
    ClientFires[fireId] = nil
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
