local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2137) == 0) then
		if(getPlayerItemCount(creature,2692) >= 1 and getPlayerItemCount(creature,2677) >= 1) then
			doPlayerRemoveItem(creature,2692, 1)
			doPlayerRemoveItem(creature,2677, 1)
			doPlayerAddItem(creature,2687, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

