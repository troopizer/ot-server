local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local a = 0
local v = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local balance = getPlayerBalance(cid)
	if(msgcontains(msg, 'account')) then
				selfSay('Do you wan to chek your {balance}, {deposit}, {withdrawn} or {transfer}.', cid)
	end
	if(msgcontains(msg, 'balance')) then
				selfSay('Your account balance is: '..balance..' coins.', cid)
	end
	if (msgcontains(msg, 'deposit') and msgcontains(msg, 'all')) then
		if getPlayerMoney(cid) == 0 then
			npcHandler:say('You don\'t have any coins with you.', cid)
			talkState[talkUser] = 0
		else
			npcHandler:say('Would you like to deposit ' .. getPlayerMoney(cid) .. ' coins?', cid)
			talkState[talkUser] = 1
		end
	elseif (msgcontains(msg, 'withdrawn') and msgcontains(msg, 'all')) then
		if getPlayerBalance(cid) == 0 then
			npcHandler:say('You don\'t have any coins in your account.', cid)
			talkState[talkUser] = 0
		else
			npcHandler:say('Would you like to withdraw ' .. getPlayerBalance(cid) .. ' coins?', cid)
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, 'deposit')) then
			if (getCount(msg) == 0) then
				npcHandler:say('You are joking, aren\'t you??', cid)
				talkState[talkUser] = 0
			elseif (getCount(msg) > 0) then
			if getPlayerMoney(cid) >= getCount(msg) then
				a = getCount(msg)
				npcHandler:say('Would you like to deposit ' .. a .. ' coins?', cid)
				talkState[talkUser] = 3
			else
				npcHandler:say('You do not have enough coins.', cid)
				talkState[talkUser] = 0
			end
			else
				selfSay('How much do you want to deposit? .', cid)
				talkState[talkUser] = 2
			end
	elseif (getCount(msg) > 0 and talkState[talkUser] == 2) then
			if getPlayerMoney(cid) >= getCount(msg) then
				a = getCount(msg)
				npcHandler:say('Would you like to deposit ' .. a .. ' coins?', cid)
				talkState[talkUser] = 3
			else
				npcHandler:say('You do not have enough coins.', cid)
				talkState[talkUser] = 0
			end

	elseif(msgcontains(msg, 'withdrawn')) then
			if (getCount(msg) == 0) then
				npcHandler:say('You are joking, aren\'t you??', cid)
				talkState[talkUser] = 0
			elseif (getCount(msg) > 0) then
			if getPlayerBalance(cid) >= getCount(msg) then
				a = getCount(msg)
				npcHandler:say('Would you like to withdraw ' .. a .. ' coins?', cid)
				talkState[talkUser] = 4
			else
				npcHandler:say('You do not have enough coins.', cid)
				talkState[talkUser] = 0
			end
			else
				selfSay('How much do you want to withdraw? .', cid)
				talkState[talkUser] = 5
			end
	elseif (getCount(msg) > 0 and talkState[talkUser] == 5) then
			if getPlayerMoney(cid) >= getCount(msg) then
				a = getCount(msg)
				npcHandler:say('Would you like to withdraw ' .. a .. ' coins?', cid)
				talkState[talkUser] = 4
			else
				npcHandler:say('You do not have enough coins.', cid)
				talkState[talkUser] = 0
			end
	elseif(msgcontains(msg, 'transfer')) then
			if (getCount(msg) == 0) then
				npcHandler:say('You are joking, aren\'t you??', cid)
				talkState[talkUser] = 0
			elseif (getCount(msg) > 0) then
			if getPlayerBalance(cid) >= getCount(msg) then
				a = getCount(msg)
				npcHandler:say('To which player do you want to transfer ' .. a .. ' coins?', cid)
				talkState[talkUser] = 6
			else
				npcHandler:say('You do not have enough coins.', cid)
				talkState[talkUser] = 0
			end
			else
				selfSay('How much do you want to transfer?', cid)
				talkState[talkUser] = 7
			end
	elseif (getCount(msg) > 0 and talkState[talkUser] == 7) then
			if getPlayerMoney(cid) >= getCount(msg) then
				a = getCount(msg)
				npcHandler:say('To which player do you want to transfer ' .. a .. ' coins?', cid)
				talkState[talkUser] = 6
			else
				npcHandler:say('You do not have enough coins.', cid)
				talkState[talkUser] = 0
			end
	elseif (talkState[talkUser] == 6) then
		v = getPlayerByName(msg)
		npcHandler:say('Do you want to transfer ' .. a .. ' coins to '.. a ..' ?', cid)
		talkState[talkUser] = 8
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		local s = getPlayerMoney(cid)
		if (doPlayerRemoveMoney(cid, getPlayerMoney(cid))) then
			doPlayerSetBalance(cid, getPlayerBalance(cid) + s)
			npcHandler:say('Alright, we have added the amount of ' .. s .. ' coins to your balance. You can withdraw your money anytime you want to.', cid)
		else
			npcHandler:say('I am inconsolable, but it seems you have lost your coins. I hope you get it back.', cid)
		end
		talkState[talkUser] = 0
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		if (doPlayerRemoveMoney(cid, a)) then
			doPlayerSetBalance(cid, getPlayerBalance(cid) + a)
			npcHandler:say('Alright, we have added the amount of ' .. a .. ' coins to your balance. You can withdraw your money anytime you want to.', cid)
		else
			npcHandler:say('I am inconsolable, but it seems you have lost your coins. I hope you get it back.', cid)
		end
		talkState[talkUser] = 0
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		if (doPlayerAddMoney(cid, a)) then
			doPlayerSetBalance(cid, getPlayerBalance(cid) - a)
			npcHandler:say('Alright, we have withdrawn the amount of ' .. a .. ' coins from your balance.', cid)
		else
			npcHandler:say('I am inconsolable, but it seems you have lost your coins. I hope you get it back.', cid)
		end
		talkState[talkUser] = 0
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 6) then
		local s = getPlayerBalance(cid)
		if (doPlayerAddMoney(cid, s)) then
			doPlayerSetBalance(cid, getPlayerBalance(cid) - s)
			npcHandler:say('Alright, we have withdrawn the amount of ' .. s .. ' coins from your balance.', cid)
		else
			npcHandler:say('I am inconsolable, but it seems you have lost your coins. I hope you get it back.', cid)
		end
		talkState[talkUser] = 0
elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 8) then
		local s = getPlayerBalance(cid)
		--if (findPlayer(getPlayerName(v))) then
		if (s>=a) then
			doPlayerSetBalance(v, getPlayerBalance(v) + a)
			doPlayerSetBalance(cid, getPlayerBalance(cid) - a)
			npcHandler:say('Alright, we have transferred the amount of ' .. a .. ' coins from your account, to the player '.. a ..'.', cid)
		else
			npcHandler:say('I am inconsolable, but it seems you have lost your coins. I hope you get it back.', cid)
		end
	--else
		--npcHandler:say('Thats not even a name...', cid)
	--end
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

