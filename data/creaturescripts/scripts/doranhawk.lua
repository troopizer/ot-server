local name = "Doran Hawk"
local storage = 2111,1

function onKill(cid, target)
	if (getCreatureName(target) == "Doran Hawk") then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed Doran Hawk.")
		setPlayerStorageValue(cid,2111,1)
	end
	return true
end