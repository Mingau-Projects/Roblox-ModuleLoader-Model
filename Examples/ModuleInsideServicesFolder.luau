local ModuleLoader = require(game.ReplicatedStorage.ModuleLoader.ModuleLoader)

local module = {}

function module:Init()
  module.AdvMath = ModuleLoader:GetService("AdvMath")
end

local average = module.AdvMath.getAverage({10, 32, 52.2})

print(average)

return module
