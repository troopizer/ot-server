function onSay(cid, words, param)

     -- max players on the highscore
     local players = 20 -- The amount of players that is shown in the list

     -- don't touch --
     local str = ""
     local value = ""
     local name = ""
     local player_id = 0
     local result = nil
	if param == "level" or param == "exp" or param == "lvl" then
		str = "# [Level] - Name\n"
		value = "level"
		name = "name"
		local i = 1
		--while isPlayer(i) do 
			str = str .. "\n " ..i.. ". [" .. getPlayerLevel(getPlayerByGUID(i)) .. "] - " .. getPlayerName(getPlayerByGUID(i))
			--i = i+1			
		--end
	end
	if str ~= "" then
		doPlayerPopupFYI(cid, str)
	end
	return TRUE
end