local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:setArea(createCombatArea(AREA_BEAM5, AREADIAGONAL_BEAM5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 4) + (maglevel * 2) + 10
	local max = (level / 4) + (maglevel * 3) + 30
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if(getPlayerStorageValue(creature,2081) == 0) then
	return combat:execute(creature, variant)
else
	return false
end
end