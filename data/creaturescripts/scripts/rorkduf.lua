local name = "Rorkduf"
local storage = 2053,1

function onKill(cid, target)
	if (getCreatureName(target) == "Rorkduf") then
	if getPlayerStorageValue(cid,2053) == 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have defeated Rorkduf, but he run away an left another goblins body behind to cover his retreat.")
		setPlayerStorageValue(cid,2053,1)
	else
		return false
	end
	end
	return true
end