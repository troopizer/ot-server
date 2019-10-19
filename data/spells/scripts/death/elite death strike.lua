local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues(player, level, maglevel)
	local min = (80 + (level / 3) + (maglevel*maglevel)/50)*0.8
	local max = 80 + (level / 3) + (maglevel *maglevel)/50
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	--if(getPlayerStorageValue(creature,2065) == 0) then
		return combat:execute(creature, variant)
	--else
		--return false
	--end
end
