local name = "Raging Wolf"
local storage = 2005,4

function onKill(cid, target)
	if getCreatureName(target) == name then
		if getPlayerStorageValue(cid,2005) == 3 then
		setPlayerStorageValue(cid, storage, 4)
		end
	end
	return true
end