local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
local random_texts = {
	'something to eat?',
	'something to eat?',
	'Big people are wellcome here.. ',
	'Take a sit my friend.'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 25)
		if(math.random(100) < 40) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local balance = getPlayerBalance(cid)
    if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'information')) then
				selfSay('We are in the year 2900 of the third age.', cid)
    end
if(msgcontains(msg, 'beer')) then
selfSay('Dont have beer right now...', cid)
end
if(msgcontains(msg, 'food')) then
selfSay('I sell bread for 2 gp, cheese for 2 gp and salmon for 10 gp.', cid)
end
if(msgcontains(msg, 'mission')) then
selfSay('What? a mission? I havent hear of any mission around here...', cid)
end
if(msgcontains(msg, 'herbs')) then
selfSay('This lands produce a lot of herbs and food, if you want to buy some ask around any town in the Shire.', cid)
end
if(msgcontains(msg, 'herb')) then
selfSay('This lands produce a lot of herbs and food, if you want to buy some ask around any town in the Shire.', cid)
end
if(msgcontains(msg, 'golden goblet')) then
selfSay('I havent hear about that...', cid)
end
if(msgcontains(msg, 'Buckland')) then
selfSay('Buckland lies to the east, crossing the Brandywine river, people there are a litle bit strange.', cid)
end
if(msgcontains(msg, 'Gorbadoc')) then
selfSay('He is the lord of Buckland.', cid)
end
if(msgcontains(msg, 'Shire')) then
selfSay('You are in the east part of the Shire.', cid)
end
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
	end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
