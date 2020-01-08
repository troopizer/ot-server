local name = "Eriador Renegades Looter"
local name1 = "Eriador Renegades Recruit"
local name2 = "Eriador Renegades Militia"
local name3 = "Eriador Renegades Warrior"
local name4 = "Eriador Renegades Sergeant"
local name5 = "Eriador Renegades Commander"
local storage = 2037

function onKill(cid, target)
if (getCreatureName(target) == name or getCreatureName(target) == name1 or getCreatureName(target) == name2 or getCreatureName(target) == name3 or getCreatureName(target) == name4 or getCreatureName(target) == name5) then
	if getPlayerStorageValue(cid,2037) >= 0 and getPlayerStorageValue(cid,2037) < 20 then
		local x = getPlayerStorageValue(cid,2037) + 1
		setPlayerStorageValue(cid, storage, x)
	end
end
	return true
end