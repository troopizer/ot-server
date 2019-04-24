local name = "Witches Delegate"
local name1 = "Witches Delegate"
local name2 = "Witches Delegate"
local name3 = "Witches Delegate"
local name4 = "Witches Delegate"
local name5 = "Witches Delegate"
local storage = 2108

function onKill(cid, target)
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2108) == 0 then
		setPlayerStorageValue(cid, storage, 1)
		end
	end
	return true
end