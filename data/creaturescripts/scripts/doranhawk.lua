local name = "Doran Hawk"
local storage = 2111,1

function onKill(cid, target)
	if (getCreatureName(target) == "Doran Hawk") then
	if(getPlayerStorageValue(cid,2111) < 1) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have killed Doran Hawk.")
		setPlayerStorageValue(cid,30009,8)
		setPlayerStorageValue(cid,2111,1)
	end
	end
	return true
end