function onSay(player, words, param)
if getPlayerGroupId(player) < 4 then
	return false
end
	local position = player:getPosition()
	position.z = position.z - 1
	player:teleportTo(position)
	return false
end
