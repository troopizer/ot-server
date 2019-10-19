local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
	local min = (100 + (level / 2) + (maglevel*maglevel)/20)*0.8
	local max = 100 + (level / 2) + (maglevel*maglevel)/20
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
--if(getPlayerStorageValue(creature,2084) == 0) then
	return combat:execute(creature, variant)
--else
	--return false
--end
end