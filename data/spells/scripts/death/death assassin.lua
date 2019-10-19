function onTargetTile(cid, pos)
	local getPos = pos 
	local n = 1
	getPos.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
	local corpse = getThingfromPos(getPos)
		if (getPlayerSlotItem(cid, armor) == 8821) then
			n = 2
		end
		if (getCreatureSummonN(cid) < n) then
			doConvinceCreature(cid, doSummonCreature("Skeleton Assassin", pos))

			doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
			return true
		else
			return false
		end

	return false
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(creature, variant, isHotkey)
	--if(getPlayerStorageValue(creature,2065) == 0) then
		return combat:execute(creature, variant)
	--else
		--return false
	--end
end
