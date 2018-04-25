local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2088) == 0) then
	--Axe
		if(getPlayerItemCount(creature,2430) >= 1 and getPlayerItemCount(creature,2147) >= 1) then
			doPlayerRemoveItem(creature,2430, 1)
			doPlayerRemoveItem(creature,2147, 1)
			doPlayerAddItem(creature,7750, 1)
			return combat:execute(creature, variant)
	--Sword
		elseif(getPlayerItemCount(creature,7383) >= 1 and getPlayerItemCount(creature,2147) >= 1) then
			doPlayerRemoveItem(creature,7383, 1)
			doPlayerRemoveItem(creature,2147, 1)
			doPlayerAddItem(creature,7745, 1)
			return combat:execute(creature, variant)
	--Club
		elseif(getPlayerItemCount(creature,7392) >= 1 and getPlayerItemCount(creature,2147) >= 1) then
			doPlayerRemoveItem(creature,7392, 1)
			doPlayerRemoveItem(creature,2147, 1)
			doPlayerAddItem(creature,7757, 1)
			return combat:execute(creature, variant)
	--Arrows
		elseif(getPlayerItemCount(creature,2544) >= 100 and getPlayerItemCount(creature,2147) >= 1) then
			doPlayerRemoveItem(creature,2544, 100)
			doPlayerRemoveItem(creature,2147, 1)
			doPlayerAddItem(creature,7840, 100)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

