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
