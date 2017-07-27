local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition, -0.7, 0, -0.7, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)

	return doCombat(cid, combat, var)

end

