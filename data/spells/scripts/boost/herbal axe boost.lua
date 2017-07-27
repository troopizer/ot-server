local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 600000)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXEPERCENT, 110)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
if(getPlayerStorageValue(cid,2027) == 0) then
if(getPlayerItemCount(cid,2804) >= 1) then
			doPlayerRemoveItem(cid, 2804, 1)
	return doCombat(cid, combat, var)
else
	return false
end
else
	return false
end
end
