function onSay(player, words, param)
if getPlayerGroupId(player) < 4 then
	return false
end

	local target = Creature(param)
	if target then
		player:teleportTo(target:getPosition())
	else
		player:sendCancelMessage("Creature not found.")
	end
	return false
end
