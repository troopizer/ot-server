local combat = createCombatObject()
combat:setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
combat:setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_POISON)

function onCastSpell(creature, variant, isHotkey)
	if(getPlayerStorageValue(creature,2024) == 0) then
		if(getPlayerItemCount(creature,2803) >= 1) then
			doPlayerRemoveItem(creature, 2803, 1)
			return combat:execute(creature, variant)
		else
			return false
		end
	else
		return false
	end
end

