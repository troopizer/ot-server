local name = "Gerald Ford"
local storage = 2111,1

function onKill(cid, target)
	if (getCreatureName(target) == "Gerald Ford") then
	if(getPlayerStorageValue(cid,2154) < 1) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed Gerald Ford.")
		setPlayerStorageValue(cid,30009,8)
		setPlayerStorageValue(cid,2154,1)
	end
	end
	return true
end