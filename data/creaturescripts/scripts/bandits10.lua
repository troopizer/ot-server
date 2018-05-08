local name = "Bree Bandit"
local name1 = "Bree Robber"
local name2 = "Bree Thief"
local name3 = "Smuggler"
local name4 = "Smuggler"
local name5 = "Smuggler"
local storage = 2096

function onKill(cid, target)
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 9 then
		setPlayerStorageValue(cid, storage, 10)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 8 then
		setPlayerStorageValue(cid, storage, 9)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 7 then
		setPlayerStorageValue(cid, storage, 8)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 6 then
		setPlayerStorageValue(cid, storage, 7)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 5 then
		setPlayerStorageValue(cid, storage, 6)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 4 then
		setPlayerStorageValue(cid, storage, 5)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 3 then
		setPlayerStorageValue(cid, storage, 4)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 2 then
		setPlayerStorageValue(cid, storage, 3)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 1 then
		setPlayerStorageValue(cid, storage, 2)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2096) == 0 then
		setPlayerStorageValue(cid, storage, 1)
		end
	end
	return true
end