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
if(getPlayerItemCount(cid, 2803) >= 20 and  getPlayerItemCount(cid, 2793) >= 20 and getPlayerItemCount(cid, 2694) >= 20) then
				doPlayerRemoveItem(cid, 2803, 20)
				doPlayerRemoveItem(cid, 2793, 20)
				doPlayerRemoveItem(cid, 2694, 20)
selfSay('Great!, now lets speak about {cook}.', cid)
setPlayerStorageValue(cid,2112,1)
else
selfSay('You dont have all the ingredients, please search for them.', cid)
end
end
end
if (getPlayerStorageValue(cid,2112) == 1) then

	if(msgcontains(msg, 'cook')) then
		talkState[talkUser] = 1
		selfSay('I can cook: {halfling bread of speed}.', cid)


	elseif(msgcontains(msg, 'halfling bread of speed') and talkState[talkUser] == 1) then
	 	selfSay('Soo my special recipe, I would need {5 mushrooms}, {5 bunches of wheat} and {5 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 2793) >= 5 and getPlayerItemCount(cid, 2694) >= 5) then
			if(doPlayerRemoveMoney(cid, 5)) then
				doPlayerRemoveItem(cid, 2793, 5)
				doPlayerRemoveItem(cid, 2694, 5)
				doPlayerAddItem(cid,2691,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough mushrooms or herbs.', cid)
		end
		talkState[talkUser] = 0

	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end
if (getPlayerStorageValue(cid,2112) < 0) then
selfSay('We are the best Inn along the Shire, so we always need more supplies, would you help me? I will cook for you if yo do, {ok}?.', cid)
end
if(msgcontains(msg, 'ok')) then
if (getPlayerStorageValue(cid,2112) < 0) then
selfSay('Great!So please, bring me some herbs and mushrooms. I need 20 powder herbs, 20 mushrooms and 20 bunches of wheat. You will find them in the countryside and forests', cid)
setPlayerStorageValue(cid,30023,22)
setPlayerStorageValue(cid,2112,0)
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
