local name = "Harald Ferner"
local storage = 2048,1

function onKill(cid, target)
	if (getCreatureName(target) == "Harald Ferner") then
		if getPlayerStorageValue(cid,2048) == 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed Harald Ferner.")
		setPlayerStorageValue(cid,2048,1)
	end
    end
	return true
end