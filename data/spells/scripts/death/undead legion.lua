function onTargetTile(cid, pos)
	local getPos = pos 
	local n = 6
	getPos.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
	local corpse = getThingfromPos(getPos)
		if (getPlayerSlotItem(cid, armor) == 8821) then
			n = 8
		end
	if(corpse.uid > 0 and isMoveable(corpse.uid)) then
	if (isCorpse(corpse.uid) or getItemId(corpse.uid) == 2229) then
		if (getCreatureSummonN(cid) < n) then
			doRemoveItem(corpse.uid)
			doConvinceCreature(cid, doSummonCreature("Skeleton Minion", pos))

			doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
			return true
		else
			return false
		end
	end
	end

	return false
end

local area, combat = createCombatArea(AREA_CIRCLE2X2), createCombatObject()
setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2065) >= 0) then
		return combat:execute(creature, variant)
	else
		return false
	end
end