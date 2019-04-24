local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant, isHotkey)
local rareChance = math.random(1, 100)
	if(getPlayerStorageValue(creature,2131) == 0) then
		if(getPlayerItemCount(creature,5901) >= 1 and getPlayerItemCount(creature,2557) >= 1) then
			doPlayerRemoveItem(creature,5901, 1)
			if rareChance <= 20 then
			doPlayerAddItem(creature,2544, 10)
			creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You made 10 arrows.")
			elseif rareChance > 50 then
			doPlayerAddItem(creature,2544, 5)
			creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You made 5 arrows.")
			else
			creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You made 0 arrows.")
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

