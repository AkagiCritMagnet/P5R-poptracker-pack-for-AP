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
		local SeedList = {"Lust_Seeds", "Vanity_Seeds", "Gluttony_Seeds", "Wrath_Seeds", "Greed_Seeds", "Jealousy_Seeds", "Pride_Seeds", "Melancholy_Seeds"}
		Boss_Number = tonumber(Boss_Number)
		return has(SeedList[Boss_Number], 3)
	end	

end

