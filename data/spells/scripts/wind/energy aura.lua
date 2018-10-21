local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onGetFormulaValues(player, skill, attack, factor)
	local min = (level / 4) + (maglevel * 1.5) + 10
	local max = (level / 4) + (maglevel * 2) + 30
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	--if(getPlayerStorageValue(creature,2030) == 0) then
			return combat:execute(creature, variant)
	--else
		--return false
	--end
end
