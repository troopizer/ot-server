local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	if (getConfigValue("accountManager") == FALSE and getCreatureName(cid) == "Account Manager") then
		return false
	end

	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, str)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, sr)
			sr = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			doPlayerSendOutfitWindow(cid)
			local st ="Welcome, open the chest on your right and then go to the mayors office, to your left."
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, st)

		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	registerCreatureEvent(cid, "Outfit")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "SpellUp")
	registerCreatureEvent(cid, "StorageMonster")
	registerCreatureEvent(cid, "Larry Halfsnout")
	registerCreatureEvent(cid, "Renegades 10")
	registerCreatureEvent(cid, "DaisyGamwichCat")
	registerCreatureEvent(cid, "BootEaterTarantula")


	registerCreatureEvent(cid, "Idle")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "AdvanceSave")

return true
end
