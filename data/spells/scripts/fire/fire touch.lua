local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local condition = createConditionObject(CONDITION_FIRE)
addDamageCondition(condition, 1, 3000, 0)
addDamageCondition(condition, 1, 3000, -80)
addDamageCondition(condition, 1, 3000, -60)
addDamageCondition(condition, 2, 3000, -50)
addDamageCondition(condition, 1, 3000, -40)
addDamageCondition(condition, 1, 3000, -20)
setCombatCondition(combat, condition)

function onGetFormulaValues(player, level, maglevel)
	local min = (80 + (level / 4) + (maglevel*maglevel)/80)*0.8
	local max = 80 + (level / 4) + (maglevel *maglevel)/80
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	--if(getPlayerStorageValue(creature,2060) == 0) then
		return combat:execute(creature, variant)
	--else
		--return false
	--end
end
