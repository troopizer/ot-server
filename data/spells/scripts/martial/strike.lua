-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, false)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

-- =============== CORE FUNCTIONS ===============
function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, player:getLevel() / 5
	return -(skill)*factor, -(skill)*factor
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
--if(getPlayerStorageValue(creature,2042) == 0) then
	return combat:execute(creature, variant)
--else
	--return false
--end
end