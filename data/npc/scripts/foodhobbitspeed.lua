local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if(msgcontains(msg, 'mission')) then
	if (getPlayerStorageValue(cid,2112) == 0) then
		if(getPlayerItemCount(cid, 2803) >= 20 and  getPlayerItemCount(cid, 2793) >= 20 and getPlayerItemCount(cid, 2692) >= 20) then
				doPlayerRemoveItem(cid, 2803, 20)
				doPlayerRemoveItem(cid, 2793, 20)
				doPlayerRemoveItem(cid, 2692, 20)
			selfSay('Great!, now lets speak about {cook}.(You recived 5000 exp)', cid)
			setPlayerStorageValue(cid,2112,1)
			doPlayerAddExperience(cid,5000)
		else
		selfSay('You dont have all the ingredients, please search for them.', cid)
		end
	end
	if (getPlayerStorageValue(cid,2115) == 0) then
		if(getPlayerItemCount(cid, 13297) >= 1) then
				doPlayerRemoveItem(cid, 13297, 1)
			selfSay('Thanks! this is the recipe for {halfling bread of speed} (You recived 8000 exp and look your cooking trait).', cid)
			setPlayerStorageValue(cid,2115,1)
			setPlayerStorageValue(cid,30024,23)
			setPlayerStorageValue(cid,2114,0)
			doPlayerAddExperience(cid,8000)
		else
		selfSay('I am sure you will get it.', cid)
		end
	end	
	if (getPlayerStorageValue(cid,2112) < 0) then
		selfSay('We are the best Inn along the Shire, so we always need more supplies, would you help me? I will cook for you if yo do, {ok}?.', cid)
	end
	if (getPlayerStorageValue(cid,2112) == 1 and getPlayerStorageValue(cid,2115) < 0) then
		selfSay('I have a new work for you. If you help me, I will teach you how to cook halfling bread of speed by yourself.{ok}?', cid)
		talkState[talkUser] = 2
	end
end
if (getPlayerStorageValue(cid,2112) == 1) then

	if(msgcontains(msg, 'cook')) then
		talkState[talkUser] = 1
		selfSay('I can cook: {halfling bread of speed} (look your cooking trait).', cid)


	elseif(msgcontains(msg, 'halfling bread of speed') and talkState[talkUser] == 1) then
	 	selfSay('Soo my special recipe, I would need {5 mushrooms}, {5 flour} and {5 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 2793) >= 5 and getPlayerItemCount(cid, 2692) >= 5) then
			if(doPlayerRemoveMoney(cid, 5)) then
				doPlayerRemoveItem(cid, 2793, 5)
				doPlayerRemoveItem(cid, 2692, 5)
				doPlayerAddItem(cid,2691,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough mushrooms or flour.', cid)
		end
		talkState[talkUser] = 0

	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end
if(msgcontains(msg, 'ok')) then
if (getPlayerStorageValue(cid,2112) < 0) then
selfSay('Great!So please, bring me some herbs and mushrooms. I need 20 powder herbs, 20 mushrooms and 20 flour. You will find them in the countryside and forests', cid)
setPlayerStorageValue(cid,30023,22)
setPlayerStorageValue(cid,2112,0)
end
if (getPlayerStorageValue(cid,2112) == 1 and getPlayerStorageValue(cid,2115) < 0 and talkState[talkUser] == 2) then
	selfSay('Thanks my friend, big people isnt as bad as I thought. I am in the need of a very rare meat here in the Shire, I need {1 haunch of boar}. I will be waiting for you.', cid)	
	setPlayerStorageValue(cid,2115,0)
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
