local firstItems = {2050, 2382}

function onLogin(player)
	if player:getLastLoginSaved() <= 0 then
		for i = 1, #firstItems do
			doPlayerAddItem(player,firstItems[i],1)
		end
		if (getPlayerSex(player) == 0)then
			doPlayerAddItem(player,2651,1)
		else
			doPlayerAddItem(player,2650,1)
		end
		doPlayerAddItem(player,1987,1)
		doPlayerAddItem(player,2674,1)
		doPlayerAddItem(player,2405,1)
		doPlayerAddItem(player,2403,1)
	end
	return true
end
