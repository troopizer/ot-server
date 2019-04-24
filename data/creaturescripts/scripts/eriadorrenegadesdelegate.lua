local name = "Eriador Renegades Delegate"
local name1 = "Eriador Renegades Delegate"
local name2 = "Eriador Renegades Delegate"
local name3 = "Eriador Renegades Delegate"
local name4 = "Eriador Renegades Delegate"
local name5 = "Eriador Renegades Delegate"
local storage = 2108

function onKill(cid, target)
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2108) == 1 then
		setPlayerStorageValue(cid, storage, 2)
		end
	end
	return true
end