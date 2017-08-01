-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat = createCombatObject()
combat:setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
combat:setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
local condition = createConditionObject(CONDITION_ATTRIBUTES)
condition:setConditionParam(condition, CONDITION_PARAM_TICKS, 1000)
condition:setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, 800)
condition:setConditionParam(condition, CONDITION_PARAM_BUFF, true)
condition:setCombatCondition(combat, condition)
combat:setCondition(condition)

-- =============== CORE FUNCTIONS ===============
function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal, levelTotal = (skill/8) + attack, player:getLevel() / 10
	return -(skillTotal * 0.5 + levelTotal), -(skillTotal * 1.0 + levelTotal)
end
combat:setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end