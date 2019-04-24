local name = "Greenfields Rabbit"
local name1 = "greenfields rabbit"
local storage = 2136

function onKill(cid, target)
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 10 then
		setPlayerStorageValue(cid, storage, 11)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 9 then
		setPlayerStorageValue(cid, storage, 10)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 8 then
		setPlayerStorageValue(cid, storage, 9)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 7 then
		setPlayerStorageValue(cid, storage, 8)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 6 then
		setPlayerStorageValue(cid, storage, 7)
		end
	end
		if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 5 then
		setPlayerStorageValue(cid, storage, 6)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 4 then
		setPlayerStorageValue(cid, storage, 5)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 3 then
		setPlayerStorageValue(cid, storage, 4)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 2 then
		setPlayerStorageValue(cid, storage, 3)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 ) then
		if getPlayerStorageValue(cid,2136) == 1 then
		setPlayerStorageValue(cid, storage, 2)
		end
	end

	return true
end