local annihilatorReward = {60047, 60048, 60049, 60050}
function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage = item.uid
		if(storage > 65535) then
			return false
		end
	if table.contains(annihilatorReward, item.uid) then
		if getPlayerStorageValue(cid, 40001) == -1 then
				if item.uid == 60047 then
					getThing(doCreateItemEx(7383, 1))
				elseif item.uid == 60048 then
					getThing(doCreateItemEx(2430, 1))
				elseif item.uid == 60049 then
					getThing(doCreateItemEx(7392, 1))
				elseif item.uid == 60050 then
					getThing(doCreateItemEx(8856, 1))
				end
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, 'You have found a nice reward.')
				setPlayerStorageValue(cid,40001, 1)
		else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		end
	else
	if(getPlayerStorageValue(cid, storage) > 0) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		return true
	end

	local items = {}
	local reward = 0
	local itemType = ItemType(item.uid)
	local container = Container(item.uid)


	local size = isContainer(item.uid) and getContainerSize(item.uid) or 0
	if(size == 0) then
		reward = doCopyItem(item, false)
	else
		for i = 0, size-1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				table.insert(items, tmp.itemid)
			end
		end
	end
	if(size == 1) then
			local et = getContainerItem(item.uid, 0)
			local rt = getItemDescriptions(et.uid)
			local tmp = getThing(doCreateItemEx(et.itemid, et.type))
			doSetItemActionId(tmp.uid,et.actionid)
	end

	local result = ""
	if(reward ~= 0) then
		name = getItemName(et.itemid)
		if(et.type > 0 and isItemRune(rt.itemid)) then
			result = et.type .. " charges " .. rt.name
		elseif(et.type > 0 and isItemStackable(rt.itemid)) then
			result = et.type .. " " .. rt.plural
		else
			result = rt.article .. " " .. rt.name
		end
	else
		if(size > 20) then
			reward = doCopyItem(item, false)
		elseif(size > 8) then
			reward = getThing(doCreateItemEx(1988, 1))
		else
			reward = getThing(doCreateItemEx(1987, 1))
		end

		for i = 0, size-1 do
			local et = getContainerItem(item.uid, i)
			local rt = getItemDescriptions(et.uid)
			local tmp = getThing(doCreateItemEx(et.itemid, et.type))
			doSetItemActionId(tmp.uid,et.actionid)
			if(doAddContainerItemEx(reward.uid, tmp.uid) ~= RETURNVALUE_NOERROR) then
				print("[Warning] QuestSystem:", "Could not add quest reward")
			else
				local ret = ", "
				if(i == size-1) then
					ret = " and "
				elseif(i == 0) then
					ret = ""
				end

				result = result .. ret
				name = getItemName(et.itemid)
				if(et.type > 0 and isItemRune(et.itemid)) then
					result = result .. et.type .. " charges " .. name
				elseif(tmp.type > 1 and isItemStackable(tmp.itemid)) then
					result = result .. et.type .. " " ..name.. rt.plural
				else
					result = result .. rt.article .. " " .. name
				end
			end
		end
	end

	if(doPlayerAddItemEx(cid, reward.uid, false) ~= RETURNVALUE_NOERROR) then
		result = "You have found a reward weighing " .. getItemWeight(reward.uid) .. " oz. It is too heavy or you have not enough space."
	else
		result = "You have found " .. result .. "."
		setPlayerStorageValue(cid, storage, 1)
	end
end
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, result)
	return true
end
