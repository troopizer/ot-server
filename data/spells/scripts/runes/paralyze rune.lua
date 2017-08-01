local combat = createCombatObject()
combat:setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)

local condition = createConditionObject(CONDITION_PARALYZE)
conditon:setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
conditon:setConditionFormula(condition, -0.7, 0, -0.7, 0)
conditon:setCombatCondition(combat, condition)
combat:setCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)

end

