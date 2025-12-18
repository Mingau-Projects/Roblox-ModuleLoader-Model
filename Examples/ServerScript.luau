local ModuleLoader = require(game.ReplicatedStorage.ModuleLoader.ModuleLoader)
ModuleLoader:FetchAllServices()

local AdvMath = ModuleLoader:GetService("AdvMath")

local average = AdvMath.getAverageValue({10, 51, 22.5})

print(average)
