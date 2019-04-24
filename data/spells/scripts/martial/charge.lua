local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 8000)
condition:setFormula(0.6, -48, 0.6, -48)
combat:setCondition(condition)

function onCastSpell(cid, var)
	if(getPlayerStorageValue(cid,2134) == 0) then
		return doCombat(cid, combat, var)
	else
		return false
	end
end
