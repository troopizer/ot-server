local combat = createCombatObject()
combat:setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
combat:setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
combat:setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1496)

local condition = createConditionObject(CONDITION_POISON)
condition:addDamageCondition(condition, 2, 5000, -20)
condition:addDamageCondition(condition, 2, 5000, -15)
condition:addDamageCondition(condition, 4, 5000, -10)
condition:addDamageCondition(condition, 4, 5000, -5)
condition:setCombatCondition(combat, condition)
combat:setCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
