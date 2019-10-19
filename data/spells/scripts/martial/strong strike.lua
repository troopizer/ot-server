-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

-- =============== CORE FUNCTIONS ===============
function onGetFormulaValues(player, skill, attack, factor)
	local min = ((player:getLevel() / 4) + (skill*skill + attack*attack)/95 + 50)*0.8
	local max = (player:getLevel() / 4) + (skill*skill + attack *attack)/95 + 50
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if(getPlayerStorageValue(creature,2042) == 0) then
	return combat:execute(creature, variant)
else
	return false
end
end