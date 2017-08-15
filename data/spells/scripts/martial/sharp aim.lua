local combat = Combat()
comat:setParam(COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
comat:setParam(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condtion(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 8000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 200)
condition:setParameter(CONDITION_PARAM_BUFF, true)
combat:setCondition(condition)

local exhaust = Condtion(CONDITION_EXHAUST)
exhaust:setParameter(CONDITION_PARAM_SUBID, 2)
exhaust:setParameter(CONDITION_PARAM_TICKS, 8000)
exhaust:setCondition(exhaust)

function onCastSpell(cid, var)
	if(getPlayerStorageValue(cid,2045) == 0) then
		return doCombat(cid, combat, var)
	else
		return false
	end
end