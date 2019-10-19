local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_BEAM5))

function onGetFormulaValues(player, level, maglevel)
	local min = (100 + (level / 2) + (maglevel*maglevel)/25)*0.8
	local max = 100 + (level / 2) + (maglevel*maglevel)/25
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if(getPlayerStorageValue(creature,2072) == 0) then
	return combat:execute(creature, variant)
else
	return false
end
end