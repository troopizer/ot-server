local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2093) == 0) then
	--Axe
		if(getPlayerItemCount(creature,7875) >= 1) then
			doPlayerRemoveItem(creature,7875, 1)
			doPlayerAddItem(creature,2150, 1)
			doPlayerAddItem(creature,2430, 1)
			return combat:execute(creature, variant)
	--Sword
		elseif(getPlayerItemCount(creature,7870) >= 1) then
			doPlayerRemoveItem(creature,7870, 1)
			doPlayerAddItem(creature,2150, 1)
			doPlayerAddItem(creature,7383, 1)
			return combat:execute(creature, variant)
	--Club
		elseif(getPlayerItemCount(creature,7882) >= 1) then
			doPlayerRemoveItem(creature,7882, 1)
			doPlayerAddItem(creature,2150, 1)
			doPlayerAddItem(creature,7392, 1)
			return combat:execute(creature, variant)
	--Arrows
		elseif(getPlayerItemCount(creature,7838) >= 100) then
			doPlayerRemoveItem(creature,7838, 100)
			doPlayerAddItem(creature,2150, 1)
			doPlayerAddItem(creature,2544, 100)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

