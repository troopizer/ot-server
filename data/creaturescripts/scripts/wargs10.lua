local name = "Warg Wolf"
local name1 = "Warg"
local name2 = "Black Warg Leader"
local name3 = "Black Warg Leader"
local name4 = "Black Warg Leader"
local name5 = "Black Warg Leader"
local storage = 2106

function onKill(cid, target)
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 9 then
		setPlayerStorageValue(cid, storage, 10)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 8 then
		setPlayerStorageValue(cid, storage, 9)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 7 then
		setPlayerStorageValue(cid, storage, 8)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 6 then
		setPlayerStorageValue(cid, storage, 7)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 5 then
		setPlayerStorageValue(cid, storage, 6)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 4 then
		setPlayerStorageValue(cid, storage, 5)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 3 then
		setPlayerStorageValue(cid, storage, 4)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 2 then
		setPlayerStorageValue(cid, storage, 3)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 1 then
		setPlayerStorageValue(cid, storage, 2)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2106) == 0 then
		setPlayerStorageValue(cid, storage, 1)
		end
	end
	return true
end