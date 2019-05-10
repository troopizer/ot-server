function onSay(player, words, param)
	local housePrice = configManager.getNumber(configKeys.HOUSE_PRICE)
	if housePrice == -1 then
		return true
	end

	if not player:isPremium() then
		player:sendCancelMessage("You need a premium account.")
		return false
	end

	local position = player:getPosition()
	position:getNextPosition(player:getDirection())

	local tile = Tile(position)
	local house = tile and tile:getHouse()
	if not house then
		player:sendCancelMessage("You have to be in your house.")
		return false
	end
	if player:getHouse() then
	local i = 1
	while (house:getAccessList(i) ~= null) do
		i=i+1
	end
		house:setAccessList(i, param)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have successfully make your invitation.")
		return true
	end
	if house:getOwnerGuid() > 0 then
		player:sendCancelMessage("This house is not yours.")
		return false
	end
	return false
end
