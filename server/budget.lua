function LoadDepartmentBudget()
    local result = MySQL.single.await("SELECT budget FROM fire_department_data WHERE id = 1")
    if result then
        FireDepartment.budget = result.budget
    end
end

function SaveDepartmentBudget()
    MySQL.update("UPDATE fire_department_data SET budget = ? WHERE id = 1", {
        FireDepartment.budget
    })
end

function AddDepartmentFunds(amount)
    FireDepartment.budget += amount
    SaveDepartmentBudget()
end

function RemoveDepartmentFunds(amount)
    if FireDepartment.budget >= amount then
        FireDepartment.budget -= amount
        SaveDepartmentBudget()
        return true
    end
    return false
end

CreateThread(function()
    Wait(2000)
    LoadDepartmentBudget()
end)
