TruckData = {}

function IsAuthorizedWaterVehicle(vehicle)
    local model = GetEntityModel(vehicle)
    local modelName = string.lower(GetDisplayNameFromVehicleModel(model))

    return Config.WaterSystem.AuthorizedVehicles[modelName]
end

RegisterNetEvent("fire:server:registerTruck", function(netId)
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if not vehicle then return end

    local config = IsAuthorizedWaterVehicle(vehicle)
    if not config then return end

    TruckData[netId] = {
        water = config.maxWater,
        maxWater = config.maxWater,
        pumpActive = false
    }
end)

RegisterNetEvent("fire:server:togglePump", function(netId)
    if not TruckData[netId] then return end
    TruckData[netId].pumpActive = not TruckData[netId].pumpActive
end)

RegisterNetEvent("fire:server:useWater", function(netId, amount)
    if not TruckData[netId] then return end

    TruckData[netId].water -= amount
    if TruckData[netId].water < 0 then
        TruckData[netId].water = 0
    end
end)
