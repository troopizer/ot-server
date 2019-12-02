local positionx = {x = 135, y = 601, z = 7}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(positionx, true)
	return true
end
