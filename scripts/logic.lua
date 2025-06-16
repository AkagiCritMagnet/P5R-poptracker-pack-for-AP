function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    if not amount then
        return count > 0
    else
        amount = tonumber(amount)
        return count >= amount
    end
end

function hasnot(item)
	local count2 = Tracker:ProviderCountForCode(item)
    if count2 > 0 then
		return false
	else return true
	end
end

function hasBossAccess(Boss_Number)
	local AccessBossOption = Tracker:FindObjectForCode("Boss_Access").CurrentStage
	if AccessBossOption == 0 then
		local SeedList = {"Lust", "Vanity", "Gluttony", "Wrath", "Greed", "Jealousy", "Pride", "Sorrow"}
		Boss_Number = tonumber(Boss_Number)
		local numberSeeds = 0
	
		if has("Red_" .. SeedList[Boss_Number] .. "_Seed") then
			numberSeeds = numberSeeds+1
		end
	
		if has("Green_" .. SeedList[Boss_Number] .. "_Seed") then
			numberSeeds = numberSeeds+1
		end
	
		if has("Blue_" .. SeedList[Boss_Number] .. "_Seed") then
			numberSeeds = numberSeeds+1
		end		
		
		return (numberSeeds == 3)
	end	

end




function changeSeedState(Boss_Number)
	local SeedList = {"Lust", "Vanity", "Gluttony", "Wrath", "Greed", "Jealousy", "Pride", "Sorrow"}
	Boss_Number = tonumber(Boss_Number)
	seedType = SeedList[Boss_Number]
	collectedSeeds = 0

	
	if has("Red_" .. SeedList[Boss_Number] .. "_Seed") then
		collectedSeeds = collectedSeeds+1
	end
	
	if has("Green_" .. SeedList[Boss_Number] .. "_Seed") then
		collectedSeeds = collectedSeeds+10
	end
	
	if has("Blue_" .. SeedList[Boss_Number] .. "_Seed") then
		collectedSeeds = collectedSeeds+100
	end
	
	
	if collectedSeeds == 0 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 0
		return
	end
	
	if collectedSeeds == 1 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 1
		return
	end
	
	if collectedSeeds == 10 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 2
		return
	end
	
	if collectedSeeds == 100 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 3
		return
	end
	
	if collectedSeeds == 11 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 4
		return
	end
	
	if collectedSeeds == 101 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 5
		return
	end
	
	if collectedSeeds == 110 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 6
		return
	end
	
	if collectedSeeds == 111 then
		Tracker:FindObjectForCode(seedType .. "_Seeds").CurrentStage = 7
		return
	end
	
	
end


ScriptHost:AddWatchForCode("WatchRedLustSeed", "Red_Lust_Seed", function(code) changeSeedState(1) end)
ScriptHost:AddWatchForCode("WatchGreenLustSeed", "Green_Lust_Seed", function(code) changeSeedState(1) end)
ScriptHost:AddWatchForCode("WatchBlueLustSeed", "Blue_Lust_Seed", function(code) changeSeedState(1) end)

ScriptHost:AddWatchForCode("WatchRedVanitySeed", "Red_Vanity_Seed", function(code) changeSeedState(2) end)
ScriptHost:AddWatchForCode("WatchGreenVanitySeed", "Green_Vanity_Seed", function(code) changeSeedState(2) end)
ScriptHost:AddWatchForCode("WatchBlueVanitySeed", "Blue_Vanity_Seed", function(code) changeSeedState(2) end)

ScriptHost:AddWatchForCode("WatchRedGluttonySeed", "Red_Gluttony_Seed", function(code) changeSeedState(3) end)
ScriptHost:AddWatchForCode("WatchGreenGluttonySeed", "Green_Gluttony_Seed", function(code) changeSeedState(3) end)
ScriptHost:AddWatchForCode("WatchBlueGluttonySeed", "Blue_Gluttony_Seed", function(code) changeSeedState(3) end)

ScriptHost:AddWatchForCode("WatchRedWrathSeed", "Red_Wrath_Seed", function(code) changeSeedState(4) end)
ScriptHost:AddWatchForCode("WatchGreenWrathSeed", "Green_Wrath_Seed", function(code) changeSeedState(4) end)
ScriptHost:AddWatchForCode("WatchBlueWrathSeed", "Blue_Wrath_Seed", function(code) changeSeedState(4) end)

ScriptHost:AddWatchForCode("WatchRedGreedSeed", "Red_Greed_Seed", function(code) changeSeedState(5) end)
ScriptHost:AddWatchForCode("WatchGreenGreedSeed", "Green_Greed_Seed", function(code) changeSeedState(5) end)
ScriptHost:AddWatchForCode("WatchBlueGreedSeed", "Blue_Greed_Seed", function(code) changeSeedState(5) end)

ScriptHost:AddWatchForCode("WatchRedJealousySeed", "Red_Jealousy_Seed", function(code) changeSeedState(6) end)
ScriptHost:AddWatchForCode("WatchGreenJealousySeed", "Green_Jealousy_Seed", function(code) changeSeedState(6) end)
ScriptHost:AddWatchForCode("WatchBlueJealousySeed", "Blue_Jealousy_Seed", function(code) changeSeedState(6) end)

ScriptHost:AddWatchForCode("WatchRedPrideSeed", "Red_Pride_Seed", function(code) changeSeedState(7) end)
ScriptHost:AddWatchForCode("WatchGreenPrideSeed", "Green_Pride_Seed", function(code) changeSeedState(7) end)
ScriptHost:AddWatchForCode("WatchBluePrideSeed", "Blue_Pride_Seed", function(code) changeSeedState(7) end)

ScriptHost:AddWatchForCode("WatchRedSorrowSeed", "Red_Sorrow_Seed", function(code) changeSeedState(8) end)
ScriptHost:AddWatchForCode("WatchGreenSorrowSeed", "Green_Sorrow_Seed", function(code) changeSeedState(8) end)
ScriptHost:AddWatchForCode("WatchBlueSorrowSeed", "Blue_Sorrow_Seed", function(code) changeSeedState(8) end)