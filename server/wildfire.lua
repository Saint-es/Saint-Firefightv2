FirebreakZones = {}

RegisterNetEvent("fire:server:createFirebreak", function(coords)
    table.insert(FirebreakZones, coords)
end)

function IsInFirebreak(coords)
    for _,zone in pairs(FirebreakZones) do
        if #(coords - zone) < Config.Wildfire.FirebreakRadius then
            return true
        end
    end
    return false
end

if IsInFirebreak(newCoords) then
    spreadChance = spreadChance * Config.Wildfire.SpreadReduction
end
