local oldTrees = {2709, 2710, 2713,2714, 2715, 2716, 2717, 2718, 2719, 2720, 2722}
local axes = {2559}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	local rareChance = math.random(1, 100)
	if itemId == 2559 then
		if target.type == 1 and table.contains(oldTrees, target.itemid) then
			if rareChance <= 40 then
				doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
				player:addItem(5901, 1)
				return true
			else
				doSendMagicEffect(toPosition, CONST_ME_POFF)
				return true
			end
		end
	end
	return false
end
