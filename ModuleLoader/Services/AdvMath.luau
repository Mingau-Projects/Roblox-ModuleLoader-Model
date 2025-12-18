local AdvMath = {}

AdvMath.noise = function(seed: number, x: number, z: number, octaves: number, amplitude: number, lacunarity: number): number
	
	local sum = 0
	
	for i = 1, octaves do
		
		local octaveValue = math.noise(seed, x/(lacunarity/i), z/(lacunarity/i)) * (amplitude/i)
		sum += octaveValue
		
	end
	
	return sum
	
end

AdvMath.tridNoise = function(seed:number, x:number, y:number, z:number, octaves:number, amplitude:number, lacunarity:number):number
	
	local sum = 0
	
	for i = 1, octaves do
		
		local octaveValue = math.noise((x + seed)/(lacunarity/i), (y + seed)/(lacunarity/i), (z + seed)/(lacunarity/i)) * (amplitude/i)
		sum += octaveValue
		
	end
	
	return sum
	
end

AdvMath.getAverageValue = function(array: {number}): number
	
	local sum = 0
	
	for i = 1, #array do
		
		if not (typeof(array[i]) == "number") then
			error("Passed table contains things other than numbers!")
			return
		end
		
		sum += array[i]
		
	end
	
	return (sum / #array)
	
end

return AdvMath
