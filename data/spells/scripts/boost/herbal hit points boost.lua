local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 600000)
condition:setParameter(CONDITION_PARAM_STAT_MAXHEALTH, 100)
condition:setParameter(CONDITION_PARAM_STAT_HEALTH, 100)
condition:setParameter(CONDITION_PARAM_BUFF, true)
combat:setCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(cid,2030) == 0) then
		if(getPlayerItemCount(cid,2798) >= 1) then
			doPlayerRemoveItem(cid, 2798, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end
