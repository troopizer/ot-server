local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2091) == 0) then
	--Axe
		if(getPlayerItemCount(creature,7860) >= 1) then
			doPlayerRemoveItem(creature,7860, 1)
			doPlayerAddItem(creature,2149, 1)
			doPlayerAddItem(creature,2430, 1)
			return combat:execute(creature, variant)
	--Sword
		elseif(getPlayerItemCount(creature,7855) >= 1) then
			doPlayerRemoveItem(creature,7855, 1)
			doPlayerAddItem(creature,2149, 1)
			doPlayerAddItem(creature,7383, 1)
			return combat:execute(creature, variant)
	--Club
		elseif(getPlayerItemCount(creature,7867) >= 1) then
			doPlayerRemoveItem(creature,7867, 1)
			doPlayerAddItem(creature,2149, 1)
			doPlayerAddItem(creature,7392, 1)
			return combat:execute(creature, variant)
	--Arrows
		elseif(getPlayerItemCount(creature,7850) >= 100) then
			doPlayerRemoveItem(creature,7850, 100)
			doPlayerAddItem(creature,2149, 1)
			doPlayerAddItem(creature,2544, 100)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end
