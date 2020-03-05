local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
local random_texts = {
	'Nothing like a good coocked fish.',
	'Its hot in this kitchen... I need more windows.'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 40)
		if(math.random(100) < 30) then
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

if(msgcontains(msg, 'mission')) then
	if (getPlayerStorageValue(cid,2015) == 1 and getPlayerStorageValue(cid,2117) < 0) then
		selfSay('My friend. I need even more {rainbow trouts}. If you get me {40} more, I will teach you how to cook them by yourself. {ok}?', cid)
		talkState[talkUser] = 2
	end
end
if(msgcontains(msg, 'mission')) then
	if (getPlayerStorageValue(cid,2117) == 0) then
		if(getPlayerItemCount(cid, 7158) >= 40) then
			doPlayerRemoveItem(cid, 7158, 40)
			selfSay('Great!, This is the recipe .(You recived 15000 exp and look your cooking trait)', cid)
			setPlayerStorageValue(cid,2117,1)
			setPlayerStorageValue(cid,2116,0)
			doPlayerAddExperience(cid,15000)
		else
			selfSay('You dont have all the ingredients, please search for them.', cid)
		end
	end
	if (getPlayerStorageValue(cid,2015) == 0) then
		if(getPlayerItemCount(cid, 2803) >= 20 and  getPlayerItemCount(cid, 2793) >= 20 and getPlayerItemCount(cid, 7158) >= 20) then
			doPlayerRemoveItem(cid, 2803, 20)
			doPlayerRemoveItem(cid, 2793, 20)
			doPlayerRemoveItem(cid, 7158, 20)
			selfSay('Great!, now lets speak about {cook}.(You recived 5000 exp)', cid)
			setPlayerStorageValue(cid,2015,1)
			doPlayerAddExperience(cid,5000)
		else
			selfSay('You dont have all the ingredients, please search for them.', cid)
		end
	end
end
if (getPlayerStorageValue(cid,2015) == 1) then

	if(msgcontains(msg, 'cook')) then
		talkState[talkUser] = 1
		selfSay('I can cook: {corned fish}.', cid)


	elseif(msgcontains(msg, 'corned fish') and talkState[talkUser] == 1) then
	 	selfSay('Soo my special recipe, I would need {2 powder herbs}, {1 rainbow trout} and {10 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 2803) >= 2 and getPlayerItemCount(cid, 7158) >= 1) then
			if(doPlayerRemoveMoney(cid, 10)) then
				doPlayerRemoveItem(cid, 2803, 2)
				doPlayerRemoveItem(cid, 7158, 1)
				doPlayerAddItem(cid,11135,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough fish or herbs.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 3) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end
end
if (msgcontains(msg, 'mission')) then
	if (getPlayerStorageValue(cid,2015) < 0) then
		selfSay('I am the best chef in Buckland, but I dont get all the special ingredients that I need, would you help me? I will cook for you if yo do, {ok}?.', cid)
		talkState[talkUser] = 2
	end
end
if(msgcontains(msg,'ok')) then
	if (getPlayerStorageValue(cid,2015) < 0 and talkState[talkUser] == 2) then
		selfSay('Great!So please, bring me some herbs , rainbow trouts and mushrooms. I need 20 powder herbs, 20 mushrooms and 20 rainbow trout. You will find them in the countryside and river.', cid)
		setPlayerStorageValue(cid,30006,5)
		setPlayerStorageValue(cid,2015,0)
	end
end
if(msgcontains(msg,'ok')) then
	if (getPlayerStorageValue(cid,2117) < 0 and getPlayerStorageValue(cid,2015) == 1 and talkState[talkUser] == 2) then
		selfSay('Great! I will be waiting for you.', cid)
		setPlayerStorageValue(cid,30006,5)
		setPlayerStorageValue(cid,2117,0)
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
