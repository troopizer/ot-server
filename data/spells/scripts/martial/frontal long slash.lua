local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setArea(createCombatArea(AREA_BEAM3))

function onGetFormulaValues(player, skill, attack, factor)
	local min = ((player:getLevel() / 2) + (skill*skill + attack*attack)/70 + 70)*0.8
	local max = (player:getLevel() / 2) + (skill*skill + attack *attack)/70 + 70
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if(getPlayerStorageValue(creature,2057) == 0) then
	return combat:execute(creature, variant)
else
	return false
end
end
