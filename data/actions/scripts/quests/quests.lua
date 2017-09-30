local annihilatorReward = {60047, 60048, 60049, 60050}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid <= 999 or item.uid >= 70000 then
		return false
	end

	local itemType = ItemType(item.uid)
	if itemType:getId() == 0 then
		return false
	end

	local itemWeight = itemType:getWeight()
	local playerCap = player:getFreeCapacity()
	if table.contains(annihilatorReward, item.uid) then
		if player:getStorageValue(30015) == -1 then
			if playerCap >= itemWeight then
				if item.uid == 60047 then
					player:addItem(7383, 1)
				elseif item.uid == 60048 then
					player:addItem(2430, 1)
				elseif item.uid == 60049 then
					player:addItem(7392, 1)
				elseif item.uid == 60050 then
					player:addItem(8856, 1)
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. itemType:getName() .. '.')
				player:setStorageValue(30015, 1)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. itemType:getName() .. ' weighing ' .. itemWeight .. ' oz it\'s too heavy.')
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
		end
	elseif player:getStorageValue(item.uid) == -1 then
		if playerCap >= itemWeight then
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. itemType:getName() .. '.')
			player:addItem(item.uid, 1)
			player:setStorageValue(item.uid, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. itemType:getName() .. ' weighing ' .. itemWeight .. ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end
