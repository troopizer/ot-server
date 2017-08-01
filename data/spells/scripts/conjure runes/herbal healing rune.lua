local combat = Combar()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2020) == 0) then
		if(getPlayerItemCount(creature,2798) >= 1 and getPlayerItemCount(creature,2260) >= 1) then
			doPlayerRemoveItem(creature,2798, 1)
			doPlayerRemoveItem(creature,2260, 1)
			doPlayerAddItem(creature,2265, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

