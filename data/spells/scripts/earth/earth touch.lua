local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

local condition = Condition(CONDITION_MUTED)
condition:setParameter(CONDITION_PARAM_TICKS, 4000)
combat:setCondition(condition)

local condition2 = createConditionObject(CONDITION_POISON)
addDamageCondition(condition2, 1, 2000, 0)
addDamageCondition(condition2, 2, 3000, -40)
addDamageCondition(condition2, 5, 3000, -20)
addDamageCondition(condition2, 2, 3000, -10)
setCombatCondition(combat, condition2)

function onGetFormulaValues(player, level, maglevel)
	local min = (60 + (level / 4) + (maglevel*maglevel)/85)*0.8
	local max = 60 + (level / 4) + (maglevel *maglevel)/85
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	--if(getPlayerStorageValue(creature,2061) == 0) then
		return combat:execute(creature, variant)
	--lse
		--return false
	--end
end
