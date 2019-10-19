local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 12000)
condition:setFormula(-0.9, 72, -0.9, 72)
combat:setCondition(condition)

local condition2 = createConditionObject(CONDITION_FREEZING)
addDamageCondition(condition2, 1, 2000, 0)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
setCombatCondition(combat, condition2)

function onGetFormulaValues(player, level, maglevel)
	local min = (60 + (level / 4) + (maglevel*maglevel)/85)*0.8
	local max = 60 + (level / 4) + (maglevel *maglevel)/85
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	--if(getPlayerStorageValue(creature,2063) == 0) then
		return combat:execute(creature, variant)
	--else
		--return false
	--end
end
