function onTargetTile(cid, pos)
	local getPos = pos
	getPos.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
	if (getCreatureSummonN(cid) == 0) then
		doConvinceCreature(cid, doSummonCreature("Wisp", pos))
		doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
		return true
	else
	return false
	end
end

local area, combat = createCombatArea(AREA_BEAM1), createCombatObject()
setCombatArea(combat, area)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2064) == 0) then
		return combat:execute(creature, variant)
	else
		return false
	end
end

