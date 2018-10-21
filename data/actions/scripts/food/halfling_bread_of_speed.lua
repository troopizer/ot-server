local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 60000) -- 1 minute
condition:setFormula(0.3, -24, 0.3, -24)
local FOODS =
{

	[2691] = {8, "Crunch."}
	
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local food = FOODS[item.itemid]
	if(not food) then
		return false
	end

	if((getPlayerFood(cid) + food[1]) >= 400) then
		doPlayerSendCancel(cid, "You are full.")
		return true
	end
	if(doAddCondition(cid, condition)) then
		doSendMagicEffect(fromPosition, CONST_ME_MAGIC_RED)
	end
	doPlayerFeed(cid, food[1] * 4)
	doCreatureSay(cid, food[2], TALKTYPE_ORANGE_1)
	doRemoveItem(item.uid, 1)
	return true
end
