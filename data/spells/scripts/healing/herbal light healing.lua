local combat = createCombatObject()
combat:setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
combat:setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
--setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 4, 6)

-- Mean and Differance between max and min
local levelConstantFactor  = 5.0
local mlevelConstantFactor = 5.0
local radiousFactor        = (levelConstantFactor+mlevelConstantFactor)*1.0/2.0

function onGetFormulaValues(player, level, maglevel)
	local min = level*levelConstantFactor + maglevel*mlevelConstantFactor - radiousFactor
	local max = level*levelConstantFactor + maglevel*mlevelConstantFactor + radiousFactor
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
