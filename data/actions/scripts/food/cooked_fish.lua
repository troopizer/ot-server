local condition = Condition(CONDITION_DROWN)
condition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, 15)
condition:setParameter(CONDITION_PARAM_TICKS, 60000)
condition:setParameter(CONDITION_PARAM_TICKINTERVAL, 2000)
local FOODS =
{

	[11135] = {15, "Mmmm."}
	
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local food = FOODS[item.itemid]
	if(not food) then
		return false
	end

	if((getPlayerFood(cid) + food[1]) >= 1200) then
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
