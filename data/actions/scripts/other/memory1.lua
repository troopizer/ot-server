function onUse(cid, item, fromPosition, itemEx, toPosition)
if(item.uid == 1000) then
if(getPlayerStorageValue(cid,2065) >= 0) then
	if(getPlayerStorageValue(cid,2142) < 0) then
		setPlayerStorageValue(cid,2142,0)
		doRemoveItem(item.uid, 1)
		return true
	else
		return false
	end
elseif(getPlayerStorageValue(cid,2064) >= 0) then
	if(getPlayerStorageValue(cid,2143) < 0) then
		setPlayerStorageValue(cid,2143,0)
		doRemoveItem(item.uid, 1)
		return true
	else
		return false
	end
elseif(getPlayerStorageValue(cid,2063) >= 0) then
	if(getPlayerStorageValue(cid,2144) < 0) then
		setPlayerStorageValue(cid,2144,0)
		doRemoveItem(item.uid, 1)
		return true
	else
		return false
	end
elseif(getPlayerStorageValue(cid,2062) >= 0) then
	if(getPlayerStorageValue(cid,2145) < 0) then
		setPlayerStorageValue(cid,2145,0)
		doRemoveItem(item.uid, 1)
		return true
	else
		return false
	end
elseif(getPlayerStorageValue(cid,2061) >= 0) then
	if(getPlayerStorageValue(cid,2146) < 0) then
		setPlayerStorageValue(cid,2146,0)
		doRemoveItem(item.uid, 1)
		return true
	else
		return false
	end
elseif(getPlayerStorageValue(cid,2060) >= 0) then
	if(getPlayerStorageValue(cid,2147) < 0) then
		setPlayerStorageValue(cid,2147,0)
		doRemoveItem(item.uid, 1)
		return true
	else
		return false
	end
else
		return false
end
end
end
