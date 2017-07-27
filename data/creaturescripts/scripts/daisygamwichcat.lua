function onKill(cid, target)
	if getCreatureName(target) == "Daisy Gamwich's cat" and getPlayerStorageValue(cid,2014) == 0 then
		setPlayerStorageValue(cid, 2014, 1)
	end
	return true
end