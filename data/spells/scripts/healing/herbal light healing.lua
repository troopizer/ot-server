local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 4, 6)

function onCastSpell(cid, var)
if(getPlayerStorageValue(cid,2020) == 0) then
if(getPlayerItemCount(cid,2803) >= 1) then
			doPlayerRemoveItem(cid, 2803, 1)
	return doCombat(cid, combat, var)
else
	return false
end
else
	return false
end
end
