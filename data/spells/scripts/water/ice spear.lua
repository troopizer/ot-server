local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SPEAR)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
	local distSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
	local min = ((player:getLevel() / 4) + (distSkill* distSkill/90) + 50)*0.8
	local max = (player:getLevel() / 4) + (distSkill * distSkill/90) + 50
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if(getPlayerStorageValue(creature,2077) == 0) then
	return combat:execute(creature, variant)
else
	return false
end
end
