function onLogin(player)
	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. "   Please choose your outfit."

		player:sendOutfitWindow()
	player:popupFYI("Your journey on Middle Earth has begun. As your first steps in this world:\n   1) You should open the chest at your right.\n   2) You should try to get a mission from Edward the Mayor, in order to start earning experience and money.\n   3) This is difficult server and you will have to work in order to become stronger.\n   4) Explore Middle Earth!\nImportant aspects you should know about Middle Earth Adventures:\n   - Even if some monsters or items have the same shape as in normal Tibia, they stats may be different.\n   - The spell system uses the Quest Log. If you learn any new spell, you should check the Quest Log.\n   - This is Middle Earth, humans dont suppose to have any magic. But in this server, using herbs or winning the bless of an Ainur, you may achieve some magic.\n   - Premium Features will be soon published.\nBUGS REPORTED:\n   - The market is not working for now. But you can find your items in any depot chest, on any town.\n   - Poison antidote isnt working for now.")
    player:sendTextMessage(TALKTYPE_BROADCAST, "Your journey on Middle Earth has begun. As your first steps in this world: 1) You may open the chest at your right  2) You should try to get a mission from Edward the Mayor, in order to start earning experience and money.  3) This is difficult server and you will have to work in order to become stronger. 4) Explore Middle Earth!")
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
	player:registerEvent("Wargs 10")
	player:registerEvent("Bear 20 Hunt")
	player:registerEvent("Great Bear 40 Hunt")
	player:registerEvent("Tarantula 40 Hunt")
	player:registerEvent("Fierce Wolf 40 Hunt")
	player:registerEvent("Green Rabbit 10")
	player:registerEvent("Gerald Ford")
	player:registerEvent("Cult 40")
	player:registerEvent("Cult Master 40")
	return true
end
