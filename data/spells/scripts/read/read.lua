local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
function onCastSpell(creature, variant, isHotkey)
	if(getPlayerItemCount(creature,7535) >= 1) then
		if(getPlayerStorageValue(creature,2065) == 0) then
			if(getPlayerStorageValue(creature,2142) < 0) then
				setPlayerStorageValue(creature,2142,0)
				doPlayerRemoveItem(creature,7535, 1)
			else
				return false
			end
		elseif(getPlayerStorageValue(creature,2064) == 0) then
			if(getPlayerStorageValue(creature,2143) < 0) then
				setPlayerStorageValue(creature,2143,0)
				doPlayerRemoveItem(creature,7535, 1)
			else
				return false
			end
		elseif(getPlayerStorageValue(creature,2063) == 0) then
			if(getPlayerStorageValue(creature,2144) < 0) then
				setPlayerStorageValue(creature,2144,0)
				doPlayerRemoveItem(creature,7535, 1)
			else
				return false
			end
		elseif(getPlayerStorageValue(creature,2062) == 0) then
			if(getPlayerStorageValue(creature,2145) < 0) then
				setPlayerStorageValue(creature,2145,0)
				doPlayerRemoveItem(creature,7535, 1)
			else
				return false
			end
		elseif(getPlayerStorageValue(creature,2061) == 0) then
			if(getPlayerStorageValue(creature,2146) < 0) then
				setPlayerStorageValue(creature,2146,0)
				doPlayerRemoveItem(creature,7535, 1)
			else
				return false
			end
		elseif(getPlayerStorageValue(creature,2060) == 0) then
			if(getPlayerStorageValue(creature,2147) < 0) then
				setPlayerStorageValue(creature,2147,0)
				doPlayerRemoveItem(creature,7535, 1)
			else
				return false
			end
		else
			return false
		end
			return combat:execute(creature, variant)
	else
		return false
	end
end
