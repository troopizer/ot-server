local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT,  CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)
condition:setFormula(0.7, -56, 0.7, -56)
combat:setCondition(condition)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat3:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat4:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat5:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
local combat6 = Combat()
combat6:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat6:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local function RunPart(c,player,variant) -- Part
		doCombat(player, c, variant)
end

function onCastSpell(player, variant)
	--if(getPlayerStorageValue(cid,2134) == 0) then
			RunPart(combat,player,variant)
				addEvent(RunPart,2000,combat2,player,variant)
				addEvent(RunPart,4000,combat3,player,variant)
				addEvent(RunPart,6000,combat4,player,variant)
				addEvent(RunPart,8000,combat5,player,variant)
				addEvent(RunPart,10000,combat6,player,variant)
			return  true
	--else
		--return false
	--end
end
