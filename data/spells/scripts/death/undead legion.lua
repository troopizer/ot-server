function onTargetTile(cid, pos)
	local getPos = pos
	getPos.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE

	local corpse = getThingfromPos(getPos)
	if(corpse.uid > 0 and isCorpse(corpse.uid) and isMoveable(corpse.uid)) then
		if (getCreatureSummonN(cid) < 8) then
			doRemoveItem(corpse.uid)
			doConvinceCreature(cid, doSummonCreature("Skeleton", pos))

			doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
			return true
		else
			return false
		end
	end

	return false
end

local area, combat = createCombatArea(AREA_CIRCLE2X2), createCombatObject()
setCombatArea(combat, area)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	if(getPlayerStorageValue(creature,2065) == 0) then
		return doCombat(cid, combat, var)
	else
		return false
	end
end