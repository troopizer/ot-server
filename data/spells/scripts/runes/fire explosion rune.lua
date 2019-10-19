local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onGetFormulaValues(player, level, maglevel)
	local min = (80 + (level / 3) + (maglevel*maglevel)/50)*0.8
	local max = 80 + (level / 3) + (maglevel*maglevel)/50
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
		return combat:execute(creature, variant)
end
