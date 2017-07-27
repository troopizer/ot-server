local name = "Eriador Renegades Looter"
local name1 = "Eriador Renegades Recruit"
local name2 = "Eriador Renegades Militia"
local name3 = "Eriador Renegades Warrior"
local name4 = "Eriador Renegades Sergeant"
local name5 = "Eriador Renegades Commander"
local storage = 2037

function onKill(cid, target)
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 9 then
		setPlayerStorageValue(cid, storage, 10)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 8 then
		setPlayerStorageValue(cid, storage, 9)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 7 then
		setPlayerStorageValue(cid, storage, 8)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 6 then
		setPlayerStorageValue(cid, storage, 7)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 5 then
		setPlayerStorageValue(cid, storage, 6)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 4 then
		setPlayerStorageValue(cid, storage, 5)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 3 then
		setPlayerStorageValue(cid, storage, 4)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 2 then
		setPlayerStorageValue(cid, storage, 3)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 1 then
		setPlayerStorageValue(cid, storage, 2)
		end
	end
	if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
		if getPlayerStorageValue(cid,2037) == 0 then
		setPlayerStorageValue(cid, storage, 1)
		end
	end
	return true
end