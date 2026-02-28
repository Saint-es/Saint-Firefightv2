function LoadUpgrades()
    local results = MySQL.query.await("SELECT * FROM fire_station_upgrades")

    for _,row in pairs(results) do
        FireDepartment.upgrades[row.upgrade_name] = row.level
    end
end

function PurchaseUpgrade(name)

    local config = Config.Upgrades[name]
    if not config then return false end

    local currentLevel = FireDepartment.upgrades[name] or 0

    if currentLevel >= config.maxLevel then
        return false
    end

    if not RemoveDepartmentFunds(config.cost) then
        return false
    end

    FireDepartment.upgrades[name] = currentLevel + 1

    MySQL.insert([[
        INSERT INTO fire_station_upgrades (upgrade_name, level)
        VALUES (?, ?)
        ON DUPLICATE KEY UPDATE level = ?
    ]], {
        name,
        FireDepartment.upgrades[name],
        FireDepartment.upgrades[name]
    })

    return true
end

CreateThread(function()
    Wait(2000)
    LoadUpgrades()
end)
