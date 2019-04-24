local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setArea(createCombatArea(AREA_BEAM5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 4) + (maglevel*3)
	local max = (level / 4) + (maglevel *5)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if(getPlayerStorageValue(creature,2075) == 0) then
	return combat:execute(creature, variant)
else
	return false
end
end