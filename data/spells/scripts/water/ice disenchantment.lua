local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2095) == 0) then
	--Axe
		if(getPlayerItemCount(creature,7769) >= 1) then
			doPlayerRemoveItem(creature,7769, 1)
			doPlayerAddItem(creature,2146, 1)
			doPlayerAddItem(creature,2430, 1)
			return combat:execute(creature, variant)
	--Sword
		elseif(getPlayerItemCount(creature,7764) >= 1) then
			doPlayerRemoveItem(creature,7764, 1)
			doPlayerAddItem(creature,2146, 1)
			doPlayerAddItem(creature,7383, 1)
			return combat:execute(creature, variant)
	--Club
		elseif(getPlayerItemCount(creature,7776) >= 1) then
			doPlayerRemoveItem(creature,7776, 1)
			doPlayerAddItem(creature,2146, 1)
			doPlayerAddItem(creature,7392, 1)
			return combat:execute(creature, variant)
	--Arrows
		elseif(getPlayerItemCount(creature,7839) >= 100) then
			doPlayerRemoveItem(creature,7839, 100)
			doPlayerAddItem(creature,2146, 1)
			doPlayerAddItem(creature,2544, 100)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

