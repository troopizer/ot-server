local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 8000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 150)
condition:setParameter(CONDITION_PARAM_BUFF, true)
combat:setCondition(condition)

local exhaust = Condition(CONDITION_EXHAUST)
exhaust:setParameter(CONDITION_PARAM_SUBID, 2)
exhaust:setParameter(CONDITION_PARAM_TICKS, 4000)
combat:setCondition(exhaust)

function onCastSpell(creature, variant)
if(getPlayerStorageValue(creature,2045) == 0) then
	return combat:execute(creature, variant)
else
	return false
end
end