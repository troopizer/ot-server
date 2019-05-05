local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 4) + (maglevel*1.2) -20
	local max = (level / 4) + (maglevel *2.3) -20
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
		return combat:execute(creature, variant)
end
