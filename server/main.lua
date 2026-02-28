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
