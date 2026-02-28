Framework = {}
Framework.Name = nil
Framework.Object = nil

CreateThread(function()

    if GetResourceState('qbx_core') == 'started' then
        Framework.Name = "qbox"
        Framework.Object = exports['qbx_core']:GetCoreObject()
        print("^2[FireDept]^7 QBOX detected.")

    elseif GetResourceState('qb-core') == 'started' then
        Framework.Name = "qbcore"
        Framework.Object = exports['qb-core']:GetCoreObject()
        print("^2[FireDept]^7 QBCore detected.")
    else
        print("^1[FireDept]^7 No framework detected.")
    end

end)

function Framework.GetPlayer(source)
    if not Framework.Object then return nil end
    return Framework.Object.Functions.GetPlayer(source)
end

function Framework.GetJob(source)
    local Player = Framework.GetPlayer(source)
    if not Player then return nil end
    return Player.PlayerData.job
end

function Framework.IsFirefighter(source)
    local job = Framework.GetJob(source)
    if not job then return false end
    return job.name == Config.Framework.FireJobName
end
