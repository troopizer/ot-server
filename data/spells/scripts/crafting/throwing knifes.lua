function onTargetTile(cid, pos)
	local getPos = pos 
	local n = 2555
	local rareChance = math.random(1, 100)
	getPos.stackpos = STACKPOS_TOP_ITEM
	local corpse = getThingfromPos(getPos)
	local rt = getItemDescriptions(corpse.uid)
	if(corpse.itemid == 424) then
		if(getPlayerItemCount(cid,5880) >= 1 and getPlayerItemCount(cid,2557) >= 1) then
			doPlayerRemoveItem(cid,5880, 1)
			if rareChance <= 70 then
				doPlayerAddItem(cid,2410, 2)
				cid:sendTextMessage(MESSAGE_STATUS_SMALL, "You made 2 throwing knifes.")
			elseif rareChance > 80 then
				doPlayerAddItem(cid,2410, 1)
				cid:sendTextMessage(MESSAGE_STATUS_SMALL, "You made 1 throwing knifes.")
			else
				cid:sendTextMessage(MESSAGE_STATUS_SMALL, "You made 0 throwing knifes.")
			end
			return true
		else
			cid:sendTextMessage(MESSAGE_STATUS_SMALL, "You need a hammer and iron.")
			return false
		end
	else
		cid:sendTextMessage(MESSAGE_STATUS_SMALL, "You need to be near an anvil.")
	return false
end
end
local combat = Combat()
combat:setArea(createCombatArea(AREA_BEAM1))
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(creature, variant, isHotkey, pos)
	if(getPlayerStorageValue(creature,2132) == 0) then
			return combat:execute(creature, variant)
	else
		creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You need to learn this skill.")
		return false
	end
end

