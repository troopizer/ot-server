local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

-- Mean and Differance between max and min
local levelConstantFactor  = 1.0
local mlevelConstantFactor = 5.0
local radiousFactor        = 0.8

function onGetFormulaValues(player, level, maglevel)
	local min = (80 + (level / 3) + (maglevel*maglevel)/30)*0.8
	local max = 80 + (level / 3) + (maglevel*maglevel)/30
	return min, max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
