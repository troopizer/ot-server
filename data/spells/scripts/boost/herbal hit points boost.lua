local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 600000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAXHEALTH, 100)
setConditionParam(condition, CONDITION_PARAM_STAT_HEALTH, 100)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
if(getPlayerStorageValue(cid,2030) == 0) then
if(getPlayerItemCount(cid,2798) >= 1) then
			doPlayerRemoveItem(cid, 2798, 1)
	return doCombat(cid, combat, var)
else
	return false
end
else
	return false
end
end
