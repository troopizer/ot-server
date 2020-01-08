local name = "Necromancer Apprentice"
local name1 = "necromancer apprentice"
local storage = 2097

function onKill(cid, target)
if (getCreatureName(target) == name or getCreatureName(target) == name1) then
	if getPlayerStorageValue(cid,storage) >= 0 and getPlayerStorageValue(cid,storage) < 30 then
		local x = getPlayerStorageValue(cid,storage) + 1
		setPlayerStorageValue(cid, storage, x)
	end
end
	return true
end