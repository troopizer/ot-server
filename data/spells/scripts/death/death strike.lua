local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

local exhaust = Condition(CONDITION_EXHAUST)
exhaust:setParameter(CONDITION_PARAM_SUBID, 1)
exhaust:setParameter(CONDITION_PARAM_TICKS, 10000)
combat:setCondition(exhaust)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 4) + (maglevel*2) -30
	local max = (level / 4) + (maglevel *3) -30
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2065) == 0) then
		return combat:execute(creature, variant)
	else
		return false
	end
end
