Inventory = {}
Inventory.Type = nil

CreateThread(function()

    if GetResourceState('ox_inventory') == 'started' then
        Inventory.Type = "ox"
        print("^2[FireDept]^7 ox_inventory detected.")

    elseif GetResourceState('qb-inventory') == 'started' then
        Inventory.Type = "qb"

    elseif GetResourceState('qbx_inventory') == 'started' then
        Inventory.Type = "qbox"

    else
        Inventory.Type = "custom"
        print("^3[FireDept]^7 Using custom inventory mode.")
    end

end)

function Inventory.HasItem(source, item, amount)
    amount = amount or 1

    if Inventory.Type == "ox" then
        return exports.ox_inventory:Search(source, 'count', item) >= amount

    elseif Inventory.Type == "qb" or Inventory.Type == "qbox" then
        local Player = Framework.GetPlayer(source)
        if not Player then return false end
        local itemData = Player.Functions.GetItemByName(item)
        return itemData and itemData.amount >= amount

    elseif Inventory.Type == "custom" then
        return false -- define in custom_inventory.lua
    end

    return false
end
