local combat = createCombatObject()
combat:setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
combat:setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
local condition = createConditionObject(CONDITION_ATTRIBUTES)
condition:setConditionParam(condition, CONDITION_PARAM_TICKS, 600000)
condition:setConditionParam(condition, CONDITION_PARAM_SKILL_AXEPERCENT, 110)
condition:setConditionParam(condition, CONDITION_PARAM_BUFF, true)
condition:setCombatCondition(combat, condition)
combat:setCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2027) == 0) then
		if(getPlayerItemCount(creature,2804) >= 1) then
			doPlayerRemoveItem(creature, 2804, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end
