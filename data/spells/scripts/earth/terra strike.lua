local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 4) + (maglevel) + 10
	local max = (level / 4) + (maglevel * 2) + 20
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2061) == 0) then
		return combat:execute(creature, variant)
	else
		return false
	end
end
