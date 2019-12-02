local positionx = {x = 139, y = 601, z = 7}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
if(getPlayerStorageValue(player,2158) == 0) then
	player:teleportTo(positionx, true)
	doSendMagicEffect(positionx, CONST_ME_TELEPORT)
	doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
	return true
else
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	player:sendTextMessage(TALKTYPE_BROADCAST, "You are not allowed to enter.")
	return false
end
end
