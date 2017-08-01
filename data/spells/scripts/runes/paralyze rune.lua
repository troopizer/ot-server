local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)

local condition = Condition(CONDITION_PARALYZE)
conditon:setParameter(CONDITION_PARAM_TICKS, 10000)
conditon:setFormula(-0.7, 0, -0.7, 0)
combat:setCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)

end

