function onLogin(player)
	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Stamina
	nextUseStaminaTime[player.uid] = 0

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("StorageMonster")
	player:registerEvent("Larry Halfsnout")
	player:registerEvent("Renegades 10")
	player:registerEvent("Savage 20")
	player:registerEvent("Fierce 20")
	player:registerEvent("DaisyGamwichCat")
	player:registerEvent("BootEaterTarantula")
	player:registerEvent("Harald Ferner")
	player:registerEvent("Rorkduf")
	player:registerEvent("Bandits 10")
	player:registerEvent("Necroapp 10")
	player:registerEvent("Priestess 20")
	player:registerEvent("Cult 4")
	player:registerEvent("Witches Delegate")
	player:registerEvent("Eriador Renegades Delegate")
	player:registerEvent("Cave Rat 20 Hunt")
	player:registerEvent("Wolf 20 Hunt")
	player:registerEvent("Bear 20 Hunt")
	player:registerEvent("Great Bear 40 Hunt")
	player:registerEvent("Tarantula 40 Hunt")
	player:registerEvent("Fierce Wolf 40 Hunt")
	player:registerEvent("Green Rabbit 10")
	return true
end
