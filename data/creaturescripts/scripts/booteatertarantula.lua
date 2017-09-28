local name = "Boot Eater Tarantula"

function onKill(cid, target)
	if (getCreatureName(target) == "Boot Eater Tarantula" and getPlayerStorageValue(cid,2011) == 2) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed the Boot Eater Tarantula.")
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have recovered Sergaent Farflank's boots.")
		setPlayerStorageValue(cid, 2011, 3)
	end
	return true
end