local name = "Warg Wolf"
local name1 = "Warg"
local name2 = "Black Warg Leader"
local storage = 2106

function onKill(cid, target)
if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2) then
	if getPlayerStorageValue(cid,storage) >= 0 and getPlayerStorageValue(cid,storage) < 20 then
		local x = getPlayerStorageValue(cid,storage) + 1
		setPlayerStorageValue(cid, storage, x)
	end
end
	return true
end