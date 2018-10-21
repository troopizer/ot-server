local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 2, 3000, -50)
addDamageCondition(condition, 4, 3000, -30)
addDamageCondition(condition, 2, 3000, -20)
addDamageCondition(condition, 3, 3000, -10)
addDamageCondition(condition, 2, 3000, -5)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)

	return doCombat(cid, combat, var)
end
