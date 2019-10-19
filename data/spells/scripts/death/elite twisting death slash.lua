local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, skill, attack, factor)
	local min = ((player:getLevel() / 4) + (skill*skill + attack*attack)/60 + 60)*0.8
	local max = (player:getLevel() / 4) + (skill*skill + attack *attack)/60 + 60
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
--if(getPlayerStorageValue(creature,2085) == 0) then
	return combat:execute(creature, variant)
--else
	--return false
--end
end