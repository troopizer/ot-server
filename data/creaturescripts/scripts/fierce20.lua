local name = "Fierce Wolf"
local name1 = "Fierce Wolf"
local storage = 2046

function onKill(cid, target)
if (getCreatureName(target) == name or getCreatureName(target) == name1) then
	if getPlayerStorageValue(cid,storage) >= 0 and getPlayerStorageValue(cid,storage) < 50 then
		local x = getPlayerStorageValue(cid,storage) + 1
		setPlayerStorageValue(cid, storage, x)
	end
end

	return true
end