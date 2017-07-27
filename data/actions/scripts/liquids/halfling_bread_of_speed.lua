local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1 * 60 * 1000) -- 1 minutes
setConditionFormula(condition, 0.2, -16, 0.2, -16)
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
