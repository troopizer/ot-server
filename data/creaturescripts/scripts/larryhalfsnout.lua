local name = "Larry Halfsnout"
local storage = 2038,1

function onKill(cid, target)
	if (getCreatureName(target) == "Larry Halfsnout") then
	if(getPlayerStorageValue(cid,2038) < 1) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed Larry Halfsnout.")
		setPlayerStorageValue(cid,30009,8)
		setPlayerStorageValue(cid,2038,1)
	end
	end
	return true
end