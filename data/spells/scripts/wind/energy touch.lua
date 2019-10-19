local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_PURPLEENERGY)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

local condition = Condition(CONDITION_DRUNK)
condition:setParameter(CONDITION_PARAM_TICKS, 12000)
combat:setCondition(condition)

local condition3 = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 12000)
condition:setFormula(-0.2, 0, -0.2, 0)
combat:setCondition(condition3)

local condition2 = createConditionObject(CONDITION_ENERGY)
addDamageCondition(condition2, 1, 2000, 0)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
addDamageCondition(condition2, 1, 2000, -10)
setCombatCondition(combat, condition2)

local condition4 = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 12000)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 80)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 80)
condition:setParameter(CONDITION_PARAM_SKILL_AXEPERCENT, 80)
condition:setParameter(CONDITION_PARAM_SKILL_CLUBPERCENT, 80)
condition:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, 80)
condition:setParameter(CONDITION_PARAM_BUFF, true)
combat:setCondition(condition4)

function onGetFormulaValues(player, level, maglevel)
	local min = (60 + (level / 4) + (maglevel*maglevel)/85)*0.8
	local max = 60 + (level / 4) + (maglevel *maglevel)/85
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	--if(getPlayerStorageValue(creature,2062) == 0) then
		return combat:execute(creature, variant)
	--else
		--return false
	--end
end

