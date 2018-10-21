local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 2, 3000, -100)
addDamageCondition(condition, 4, 3000, -60)
addDamageCondition(condition, 2, 3000, -40)
addDamageCondition(condition, 3, 3000, -20)
addDamageCondition(condition, 2, 3000, -10)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)

	return doCombat(cid, combat, var)
end
