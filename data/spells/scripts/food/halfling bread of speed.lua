local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2114) == 0) then
		if(getPlayerItemCount(creature,2793) >= 5 and getPlayerItemCount(creature,2692) >= 5) then
			doPlayerRemoveItem(creature,2793, 5)
			doPlayerRemoveItem(creature,2692, 5)
			doPlayerAddItem(creature,2691, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

