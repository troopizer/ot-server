local name = "Bree Bandit"
local name1 = "Bree Robber"
local name2 = "Bree Thief"
local name3 = "Smuggler"
local name4 = "Smuggler"
local name5 = "Smuggler"
local storage = 2096

function onKill(cid, target)
if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
	if getPlayerStorageValue(cid,storage) >= 0 and getPlayerStorageValue(cid,storage) < 20 then
		local x = getPlayerStorageValue(cid,storage) + 1
		setPlayerStorageValue(cid, storage, x)
	end
end
	return true
end