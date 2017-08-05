local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(condition, CONDITION_PARAM_TICKS, 8000)
condition:setParameter(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, 300)
condition:setParameter(condition, CONDITION_PARAM_BUFF, true)
condition:setCondition(condition)

local disable = Condition(CONDITION_PACIFIED)
disable:setParameter(CONDITION_PARAM_TICKS, 8000)
combat:setCondition(disable)

local exhaust = Condition(CONDITION_EXHAUST)
exhaust:setParameter(exhaust, CONDITION_PARAM_SUBID, 1)
exhaust:setParameter(exhaust, CONDITION_PARAM_TICKS, 8000)
combat:setCondition(exhaust)

function onCastSpell(cid, var)
if(getPlayerStorageValue(cid,2044) == 0) then
	return doCombat(cid, combat, var)
else
	return false
end
end
