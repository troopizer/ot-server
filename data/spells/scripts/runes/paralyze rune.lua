local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)
condition:setFormula(-0.5, 0, -0.5, 0)
combat:setCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)

end

