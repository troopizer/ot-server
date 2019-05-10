local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_GREENSTAR)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, 0, 1.0, 0)

local xCombat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_GREENSTAR)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, 0, 1.0, 0)

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 2000, -40)
addDamageCondition(condition, 4, 2000, -20)
addDamageCondition(condition, 5, 2000, -8)
addDamageCondition(condition, 5, 2000, -4)
setCombatCondition(xCombat, condition)

function onUseWeapon(cid, var)
	local ret = doCombat(cid, combat, var)
	if(ret == false) then
		return false
	end

	local target = variantToNumber(var)
	if(target ~= 0) then
		-- chance to poison the enemy
		local chance = math.random(0, 100)
		if(chance > 30) then
			ret = doCombat(cid, xCombat, var)
		end
	end
	return ret
end
