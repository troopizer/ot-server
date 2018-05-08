local name = "Necromancer Apprentice"
local name1 = "necromancer apprentice"
local storage = 2097

function onKill(cid, target)
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 9 then
		setPlayerStorageValue(cid, storage, 10)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 8 then
		setPlayerStorageValue(cid, storage, 9)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 7 then
		setPlayerStorageValue(cid, storage, 8)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 6 then
		setPlayerStorageValue(cid, storage, 7)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 5 then
		setPlayerStorageValue(cid, storage, 6)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 4 then
		setPlayerStorageValue(cid, storage, 5)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 3 then
		setPlayerStorageValue(cid, storage, 4)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 2 then
		setPlayerStorageValue(cid, storage, 3)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 1 then
		setPlayerStorageValue(cid, storage, 2)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2097) == 0 then
		setPlayerStorageValue(cid, storage, 1)
		end
	end

	return true
end