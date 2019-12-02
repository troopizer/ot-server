local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
--setHealingFormula(COMBAT_FORMULA_LEVELMAGIC, 5, 5, 4, 6)

-- Mean and Differance between max and min
local levelConstantFactor  = 1.0
local mlevelConstantFactor = 2.2
local radiousFactor        = 0.8

function onGetFormulaValues(player, level, maglevel)
	local min = (80 + (level / 3) + (maglevel*maglevel)/50)*0.8
	local max = 80 + (level / 3) + (maglevel*maglevel)/50
	return min, max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2020) == 0) then
		if(getPlayerItemCount(creature,2803) >= 1) then
			doPlayerRemoveItem(creature,2803, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end
