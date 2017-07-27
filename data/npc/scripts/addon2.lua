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

if(msgcontains(msg, 'mission') or msgcontains(msg, 'addon') or msgcontains(msg, 'outfit')) then
	if (getPlayerStorageValue(cid,2032) == 0) then
		if(getPlayerItemCount(cid, 5909) >= 10 and  getPlayerItemCount(cid, 5913) >= 20) then
			if(doPlayerRemoveMoney(cid,300)) then
				doPlayerRemoveItem(cid, 5909, 10)
				doPlayerRemoveItem(cid, 5913, 20)
				selfSay('Great!, I will make your suit.', cid)
				doPlayerAddAddon(cid, 5, 0)
				setPlayerStorageValue(cid,2032,1)
			else
				selfSay('I need that payment, please bring enough money.', cid)
			end
		else
				selfSay('I need the materials to start working, you have to get them.', cid)
		end
	end
	if (getPlayerStorageValue(cid,2032) == 1) then
		selfSay('Do you like your new outfit?', cid)
		return false
	end
	if (getPlayerStorageValue(cid,2032) < 0) then
		selfSay('My name is Haroc, my friend, and Im the best tailor in Buckland and the Shire, right now I am expecting some materials, but it´s very hard to get cloth this days.', cid)
		selfSay(' If you want a new outfit, bring me the materials and some gold and I will make a nice suit for you, {ok}?.', cid)
	end
end
if(msgcontains(msg, 'ok')) then
	if (getPlayerStorageValue(cid,2032) < 0) then
		selfSay('Great! Bring me {10 white pieces of cloth} and {20 brown pieces of cloth} and only {300 gold coins}. There is no production of cloth, but if you defeat some robbers and bandits, you should be able to get them.', cid)
		setPlayerStorageValue(cid,30006,5)
		setPlayerStorageValue(cid,2032,0)
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
