-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, 800)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

-- =============== CORE FUNCTIONS ===============
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill/8) + attack, level / 10
	return -(skillTotal * 0.5 + levelTotal), -(skillTotal * 1.0 + levelTotal)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end