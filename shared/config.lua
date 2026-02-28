Config = {}

-- Framework Options
Config.Framework = {
    FireJobName = "fire"
}


Config.WaterSystem = {
    AuthorizedVehicles = {
        ['firetruk'] = {
            maxWater = 2000,
            hasPump = true,
            hasFoam = true
        },
        ['firetruk2'] = {
            maxWater = 2500,
            hasPump = true,
            hasFoam = true
        },
        ['bfire'] = {
            maxWater = 1000,
            hasPump = true,
            hasFoam = false
        }
    }
}


Config.Wildfire = {
    BulldozerModel = "bulldozer",
    FirebreakRadius = 6.0,
    SpreadReduction = 0.5
}

-- Inventory Item Names
Config.Items = {
    HazmatSuit = "hazmat_suit",
    SCBA = "scba_tank",
    RescueCushion = "rescue_cushion"
}

-- Department
Config.Department = {
    StartingBudget = 100000
}

-- Rescue Cushion
Config.RescueCushion = {
    AuthorizedVehicles = {
        ['firetruk'] = true,
        ['firetruk2'] = true,
        ['laddertruck'] = true
    },
    InflateTime = 5000,
    Radius = 4.5,
    SafeHeight = 8.0,
    DamageReduction = 0.9
}

-- Fire Types
Config.FireTypes = {
    Chemical = {
        requiredMethod = "foam",
        waterMakesWorse = true,
        spreadRate = 1.5
    },
    Bin = {
        requiredMethod = "water",
        spreadRate = 0.3
    },
    House = {
        requiredMethod = "water",
        spreadRate = 1.0
    },
    Shop = {
        requiredMethod = "water",
        requiresSCBA = true,
        spreadRate = 1.2
    },
    Wild = {
        requiredMethod = "water",
        windAmplified = true,
        spreadRate = 2.0
    }
}
