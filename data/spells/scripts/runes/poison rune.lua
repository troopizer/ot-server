local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1496)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 2, 5000, -20)
addDamageCondition(condition, 2, 5000, -15)
addDamageCondition(condition, 4, 5000, -10)
addDamageCondition(condition, 4, 5000, -5)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)

	return doCombat(cid, combat, var)
end
