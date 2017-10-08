function onSay(player, words, param)
if getPlayerGroupId(player) < 4 then
	return false
end
	local position = player:getPosition()
	local monster = Game.createMonster(param, position)
	if monster ~= nil then
		monster:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		player:sendCancelMessage("There is not enough room.")
		position:sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
