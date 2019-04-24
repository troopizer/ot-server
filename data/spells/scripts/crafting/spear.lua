local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
local rareChance = math.random(1, 100)
	if(getPlayerStorageValue(creature,2130) == 0) then
		if(getPlayerItemCount(creature,5901) >= 1 and getPlayerItemCount(creature,2557) >= 1) then
			doPlayerRemoveItem(creature,5901, 1)
			if rareChance <= 60 then
			doPlayerAddItem(creature,2389, 1)
			else
			creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You broke the spear.")
			end
			return combat:execute(creature, variant)
		else
			creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You need a hammer and wood.")
			return false
		end
	else
		creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You need to learn this skill.")
		return false
	end
end

