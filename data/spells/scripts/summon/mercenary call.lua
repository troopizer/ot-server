function onTargetTile(cid, pos)
	local getPos = pos 
	getPos.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
		if (getCreatureSummonN(cid) == 0) then
			doConvinceCreature(cid, doSummonCreature("Bree Mercenary", pos))
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
if (getCreatureSummonN(creature) == 0) then
	if(getPlayerStorageValue(creature,2201) == 0) then
		setPlayerStorageValue(creature,2201,1)
		return combat:execute(creature, variant)
	elseif(getPlayerStorageValue(creature,2201) == 1) then
		setPlayerStorageValue(creature,2201,2)
		return combat:execute(creature, variant)
	elseif(getPlayerStorageValue(creature,2201) == 2) then
		setPlayerStorageValue(creature,2201,3)
		return combat:execute(creature, variant)
	else
		return false
	end
else
	return false
end
end

