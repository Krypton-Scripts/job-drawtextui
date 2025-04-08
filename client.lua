local isInPromoZone = false
local currentPromo = nil

-- Define multiple promo locations with their content
local promoLocations = {
  -- Police Job
  {
    coords = vector3(440.84, -983.14, 30.69), -- Mission Row PD
    radius = 25.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/4335/4335542.png",
        title = "Los Santos Police Department",
        description = "Protect and Serve | Join LSPD Today!",
        tagline = "To Protect and Serve",
        colors = {
            title = "#003366",      -- Police blue
            description = "#ffffff", -- White
            tagline = "#003366",    -- Police blue
            border = {
                primary = "#003366",    
                secondary = "#001f3f",  
                glow = "0, 51, 102"    
            }
        }
    }
},

-- Ambulance Job
{
    coords = vector3(298.89, -584.51, 43.26), -- Pillbox Hospital
    radius = 25.0,
    content = {
        image = "https://files.fivemerr.com/images/9967d0a7-b778-42e8-acda-5f9bbbd11e85.png",
        title = "Emergency Medical Services",
        description = "Saving Lives | Professional Healthcare",
        tagline = "Your Health, Our Priority",
        colors = {
            title = "#ff0000",      -- Medical red
            description = "#ffffff", 
            tagline = "#ff0000",    
            border = {
                primary = "#ff0000",    
                secondary = "#cc0000",  
                glow = "255, 0, 0"    
            }
        }
    }
},

-- Mechanic Job
{
    coords = vector3(-211.55, -1324.55, 30.89), -- LS Customs
    radius = 20.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/1995/1995470.png",
        title = "Los Santos Mechanics",
        description = "Professional Auto Repair & Customization",
        tagline = "We Fix What Others Can't",
        colors = {
            title = "#ffa500",      -- Orange
            description = "#ffffff", 
            tagline = "#ffa500",    
            border = {
                primary = "#ffa500",    
                secondary = "#cc8400",  
                glow = "255, 165, 0"    
            }
        }
    }
},

-- Taxi Job
{
    coords = vector3(903.97, -170.27, 74.08), -- Downtown Cab Co
    radius = 15.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/2858/2858008.png",
        title = "Downtown Cab Co.",
        description = "Fast & Reliable Transportation",
        tagline = "Your Ride, Our Pride",
        colors = {
            title = "#ffd700",      -- Taxi yellow
            description = "#ffffff", 
            tagline = "#ffd700",    
            border = {
                primary = "#ffd700",    
                secondary = "#ccac00",  
                glow = "255, 215, 0"    
            }
        }
    }
},

-- Burger Shot
{
    coords = vector3(-1192.81, -899.12, 14.0),
    radius = 15.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/877/877951.png",
        title = "Burger Shot",
        description = "Murder Your Hunger!",
        tagline = "Quality You Can Taste",
        colors = {
            title = "#ff4444",      
            description = "#ffffff", 
            tagline = "#ff4444",    
            border = {
                primary = "#ff4444",    
                secondary = "#cc3333",  
                glow = "255, 68, 68"    
            }
        }
    }
},

-- Bean Machine
{
    coords = vector3(-633.72, 236.15, 81.88),
    radius = 12.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/924/924514.png",
        title = "Bean Machine",
        description = "Premium Coffee & Pastries",
        tagline = "Wake Up to Perfect Coffee",
        colors = {
            title = "#8b4513",      -- Coffee brown
            description = "#ffffff", 
            tagline = "#8b4513",    
            border = {
                primary = "#8b4513",    
                secondary = "#5c2d0c",  
                glow = "139, 69, 19"    
            }
        }
    }
},

-- UwU Cafe
{
    coords = vector3(-582.49, -1062.94, 22.34),
    radius = 12.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/1047/1047503.png",
        title = "UwU Cafe",
        description = "Cute Food, Kawaii Service!",
        tagline = "Making Your Day Cuter",
        colors = {
            title = "#ff69b4",      -- Pink
            description = "#ffffff", 
            tagline = "#ff69b4",    
            border = {
                primary = "#ff69b4",    
                secondary = "#cc5490",  
                glow = "255, 105, 180"    
            }
        }
    }
},

-- Japanese Restaurant
{
    coords = vector3(-167.21, 295.11, 93.76),
    radius = 12.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/2252/2252075.png",
        title = "Krypton Japanese",
        description = "Authentic Japanese Cuisine",
        tagline = "A Taste of Japan",
        colors = {
            title = "#ff0000",      -- Japanese red
            description = "#ffffff", 
            tagline = "#ff0000",    
            border = {
                primary = "#ff0000",    
                secondary = "#cc0000",  
                glow = "255, 0, 0"    
            }
        }
    }
},

-- Mining Job
{
    coords = vector3(2962.40, 2746.20, 42.39),
    radius = 25.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/2422/2422778.png",
        title = "Davis Quartz Mining",
        description = "Dig Deep, Earn Big",
        tagline = "Mining Excellence",
        colors = {
            title = "#4a4a4a",      -- Stone gray
            description = "#ffffff", 
            tagline = "#4a4a4a",    
            border = {
                primary = "#4a4a4a",    
                secondary = "#2d2d2d",  
                glow = "74, 74, 74"    
            }
        }
    }
},

-- Garbage Job
{
    coords = vector3(-354.28, -1545.83, 27.72),
    radius = 15.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3517/3517305.png",
        title = "Waste Management",
        description = "Keeping Los Santos Clean",
        tagline = "Clean City, Happy Life",
        colors = {
            title = "#228b22",      -- Forest green
            description = "#ffffff", 
            tagline = "#228b22",    
            border = {
                primary = "#228b22",    
                secondary = "#165916",  
                glow = "34, 139, 34"    
            }
        }
    }
},

-- Farming Job - Main Hub
{
    coords = vector3(2832.9, 4557.61, 46.91), -- Farm Main Location
    radius = 25.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/2138/2138312.png",
        title = "Los Santos Agriculture",
        description = "Fresh From The Fields | Local Produce",
        tagline = "Growing Quality, Naturally",
        colors = {
            title = "#2e7d32",
            description = "#ffffff",
            tagline = "#2e7d32",
            border = {
                primary = "#2e7d32",
                secondary = "#1b5e20",
                glow = "46, 125, 50"
            }
        }
    }
},

-- Wheat Fields Area
{
    coords = vector3(2832.9, 4557.61, 46.91), -- Wheat Fields Area
    radius = 40.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3174/3174949.png",
        title = "Wheat Farming",
        description = "Fresh Wheat Fields | Multiple Growing Areas",
        tagline = "Golden Fields of Opportunity",
        colors = {
            title = "#ffd700",      -- Wheat gold
            description = "#ffffff",
            tagline = "#ffd700",
            border = {
                primary = "#ffd700",
                secondary = "#daa520",
                glow = "255, 215, 0"
            }
        }
    }
},

-- Cow Fields Area
{
    coords = vector3(2441.05, 4746.88, 34.3), -- Cow Fields Area
    radius = 40.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/2395/2395796.png",
        title = "Dairy Farm",
        description = "Fresh Milk Production | Multiple Cow Fields",
        tagline = "Quality Dairy Production",
        colors = {
            title = "#ffffff",      -- Milk white
            description = "#000000",
            tagline = "#ffffff",
            border = {
                primary = "#ffffff",
                secondary = "#f5f5f5",
                glow = "255, 255, 255"
            }
        }
    }
},

-- Melon Fields Area
{
    coords = vector3(2302.37, 5035.72, 44.58), -- Melon Fields Area
    radius = 30.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/590/590772.png",
        title = "Melon Fields",
        description = "Fresh Melon Growing Areas | Multiple Fields",
        tagline = "Sweet Harvest Fields",
        colors = {
            title = "#2ecc71",      -- Melon green
            description = "#ffffff",
            tagline = "#2ecc71",
            border = {
                primary = "#2ecc71",
                secondary = "#27ae60",
                glow = "46, 204, 113"
            }
        }
    }
},

-- Pumpkin Fields Area
{
    coords = vector3(2235.95, 5076.02, 46.71), -- Pumpkin Fields Area
    radius = 30.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/1135/1135445.png",
        title = "Pumpkin Fields",
        description = "Fresh Pumpkin Growing Areas | Multiple Fields",
        tagline = "Fall's Finest Harvest",
        colors = {
            title = "#ff5722",      -- Pumpkin orange
            description = "#ffffff",
            tagline = "#ff5722",
            border = {
                primary = "#ff5722",
                secondary = "#e64a19",
                glow = "255, 87, 34"
            }
        }
    }
},

-- Farm Shop
{
    coords = vector3(2304.63, 4984.23, 42.04), -- Farm Shop
    radius = 10.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3982/3982034.png",
        title = "Farm Supply Shop",
        description = "Seeds, Tools & Equipment | Everything You Need",
        tagline = "Your Farming Success Starts Here",
        colors = {
            title = "#795548",      -- Brown
            description = "#ffffff",
            tagline = "#795548",
            border = {
                primary = "#795548",
                secondary = "#5d4037",
                glow = "121, 85, 72"
            }
        }
    }
},

-- Farm Sell Point
{
    coords = vector3(2367.51, 4881.81, 42.8), -- Sell Point
        radius = 10.0,
        content = {
        image = "https://cdn-icons-png.flaticon.com/512/3082/3082011.png",
        title = "Farmers Market",
        description = "Sell Your Produce | Best Prices Guaranteed",
        tagline = "From Farm to Market",
        colors = {
            title = "#4caf50",      -- Market green
            description = "#ffffff",
            tagline = "#4caf50",
            border = {
                primary = "#4caf50",
                secondary = "#388e3c",
                glow = "76, 175, 80"
            }
        }
    }
},

-- Trucker Job
{
    coords = vector3(925.35, -1560.16, 30.75), -- Trucking Depot
    radius = 20.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3774/3774270.png",
        title = "LS Trucking",
        description = "Moving The City Forward | Professional Logistics",
        tagline = "Delivering Excellence",
        colors = {
            title = "#1565c0",      -- Trucking blue
            description = "#ffffff",
            tagline = "#1565c0",
            border = {
                primary = "#1565c0",
                secondary = "#0d47a1",
                glow = "21, 101, 192"
            }
        }
    }
},

-- Tow Job
{
    coords = vector3(409.36, -1622.99, 29.29), -- Tow Yard
    radius = 17.5,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/2076/2076774.png",
        title = "LS Towing Services",
        description = "24/7 Roadside Assistance | Professional Recovery",
        tagline = "We'll Get You Moving",
        colors = {
            title = "#f57c00",      -- Tow orange
            description = "#ffffff",
            tagline = "#f57c00",
            border = {
                primary = "#f57c00",
                secondary = "#e65100",
                glow = "245, 124, 0"
            }
        }
    }
},

-- Electrician Job
{
    coords = vector3(731.58, 134.83, 80.75), -- Power Station
    radius = 17.5,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/1983/1983275.png",
        title = "LS Power & Electric",
        description = "Powering The City | Professional Electrical Services",
        tagline = "Keeping The Lights On",
        colors = {
            title = "#ffd600",      -- Electric yellow
            description = "#ffffff",
            tagline = "#ffd600",
            border = {
                primary = "#ffd600",
                secondary = "#ffab00",
                glow = "255, 214, 0"
            }
        }
    }
},

-- Taco Shop
{
    coords = vector3(11.35, -1605.69, 29.37), -- Taco Shop
    radius = 12.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/6462/6462772.png",
        title = "Taco Shop",
        description = "Authentic Mexican Street Food",
        tagline = "Taste The Difference",
        colors = {
            title = "#e65100",      -- Taco orange
            description = "#ffffff",
            tagline = "#e65100",
            border = {
                primary = "#e65100",
                secondary = "#bf360c",
                glow = "230, 81, 0"
            }
        }
    }
},

-- Luchetti Restaurant
{
    coords = vector3(288.83, -979.63, 29.43), -- Luchetti Restaurant
    radius = 12.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3480/3480618.png",
        title = "Luchetti's Restaurant",
        description = "Authentic Italian Cuisine | Fine Dining",
        tagline = "A Taste of Italy",
            colors = {
            title = "#d32f2f",      -- Italian red
            description = "#ffffff",
            tagline = "#d32f2f",
                border = {
                primary = "#d32f2f",
                secondary = "#b71c1c",
                glow = "211, 47, 47"
            }
        }
    }
},

-- Unicorn Club
{
    coords = vector3(127.95, -1283.44, 29.26), -- Vanilla Unicorn
    radius = 15.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3460/3460335.png",
        title = "Vanilla Unicorn",
        description = "Premium Entertainment Venue",
        tagline = "Where Dreams Come True",
        colors = {
            title = "#e91e63",      -- Pink
            description = "#ffffff",
            tagline = "#e91e63",
            border = {
                primary = "#e91e63",
                secondary = "#c2185b",
                glow = "233, 30, 99"
                }
            }
        }
    },

-- Butcher Shop
    {
    coords = vector3(-68.95, 6253.87, 31.09), -- Butcher Shop
    radius = 12.0,
        content = {
        image = "https://cdn-icons-png.flaticon.com/512/3082/3082041.png",
        title = "LS Butcher Shop",
        description = "Premium Quality Meats | Fresh Daily",
        tagline = "Cut Above The Rest",
            colors = {
            title = "#c62828",      -- Butcher red
            description = "#ffffff",
            tagline = "#c62828",
                border = {
                primary = "#c62828",
                secondary = "#b71c1c",
                glow = "198, 40, 40"
            }
        }
    }
},

-- Pizza Job
{
    coords = vector3(538.37, 101.25, 96.54), -- Pizza Restaurant
    radius = 12.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3132/3132693.png",
        title = "Los Santos Pizza",
        description = "Authentic Italian Pizza | Fresh Ingredients",
        tagline = "Slice of Heaven",
        colors = {
            title = "#d84315",      -- Pizza orange
            description = "#ffffff",
            tagline = "#d84315",
            border = {
                primary = "#d84315",
                secondary = "#bf360c",
                glow = "216, 67, 21"
                }
            }
        }
    },

-- Additional Garbage Location
{
    coords = vector3(-321.56, -1545.83, 31.02), -- Another Garbage Location
    radius = 15.0,
    content = {
        image = "https://cdn-icons-png.flaticon.com/512/3126/3126647.png",
        title = "LS Sanitation Department",
        description = "City Cleanup Crew | Environmental Services",
        tagline = "For a Cleaner Tomorrow",
        colors = {
            title = "#388e3c",      -- Dark green
            description = "#ffffff", 
            tagline = "#388e3c",    
            border = {
                primary = "#388e3c",    
                secondary = "#2e7d32",  
                glow = "56, 142, 60"    
            }
        }
    }
}
    -- Add more locations as needed
}

-- Function to check if player is in any promo zone
local function IsPlayerInPromoZone()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    for _, promo in ipairs(promoLocations) do
        local distance = #(playerCoords - promo.coords)
        if distance <= promo.radius then
            return true, promo
        end
    end
    
    return false, nil
end

-- Main thread to check player location
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local wasInPromoZone = isInPromoZone
        local inZone, promo = IsPlayerInPromoZone()
        
        if inZone ~= wasInPromoZone then
            isInPromoZone = inZone
            if inZone then
                currentPromo = promo
                SendNUIMessage({
                    type = "toggleUI",
                    show = true,
                    content = promo.content
                })
            else
                currentPromo = nil
                SendNUIMessage({
                    type = "toggleUI",
                    show = false
                })
            end
        end
    end
end)

-- Register NUI Callback
RegisterNUICallback('closeUI', function(data, cb)
    cb('ok')
end) 