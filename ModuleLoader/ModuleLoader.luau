local ModuleLoaderFolder = script.Parent
local servicesFolder = ModuleLoaderFolder:WaitForChild("Services")

local runService = game:GetService("RunService")

local ModuleLoader = {}

ModuleLoader.Services = {}

function ModuleLoader:GetService(_serviceName)
	
	local getServiceAttempts = 3
	local attemptCooldown = 0.5
	
	local function attempt()
		
		for serviceName, serviceData in pairs(self.Services) do

			if serviceName == _serviceName then

				return serviceData

			end

		end
		
	end
	
	for i = 1, getServiceAttempts, 1 do
		
		task.wait(attemptCooldown)
		
		local attemptResult = attempt()
		
		if attemptResult then
			
			return attemptResult
			
		end

	end
end

function ModuleLoader:FetchAllServices()
	
	local function getRunningIn()

		if runService:IsServer() then

			return "Server"

		else

			return "Client"

		end

	end
	
	local runningIn = getRunningIn()
	
	if not (#ModuleLoader.Services == 0) then
		return
	end
	
	for i, serviceModule in pairs(servicesFolder:GetChildren()) do

		if not (serviceModule:IsA("ModuleScript") and (serviceModule:GetAttribute("ServiceRunType") == "Global" or serviceModule:GetAttribute("ServiceRunType") == runningIn)) then
			continue
		end
		
		local serviceName = serviceModule.Name
		local serviceData = require(serviceModule)

		if serviceData["Init"] then

			task.spawn(function()

				local initResult = serviceData:Init()

				if initResult then
					print('[MODULE LOADER]: Successfully initiated "'..serviceName..'" service')
				else
					warn('[MODULE LOADER]: Error while initiating "'..serviceName..'" service')
				end

			end)

		end

		self.Services[serviceName] = serviceData

	end
	
	return ModuleLoader.Services
	
end

return ModuleLoader