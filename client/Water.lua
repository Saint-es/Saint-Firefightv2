RegisterCommand("togglepump", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then return end

    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    TriggerServerEvent("fire:server:togglePump", netId)
end)
