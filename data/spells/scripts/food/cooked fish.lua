local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2116) == 0) then
		if(getPlayerItemCount(creature,7158) >= 1 and getPlayerItemCount(creature,2803) >= 1) then
			doPlayerRemoveItem(creature,7158, 1)
			doPlayerRemoveItem(creature,2803, 1)
			doPlayerAddItem(creature,11135, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

