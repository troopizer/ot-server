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

if(msgcontains(msg, 'mission') or msgcontains(msg, 'addon')) then
	if (getPlayerStorageValue(cid,2113) == 0) then
		if(getPlayerItemCount(cid, 2110) >= 1) then
				doPlayerRemoveItem(cid, 2110, 1)
				selfSay('Thanks! You are a very kind man, Bilbo will love this doll. You have my gratitude and will be always welcome in Bag End. Take this present (new Addon).', cid)
				doPlayerAddOutfit(cid, 140, 1)
				doPlayerAddOutfit(cid, 132, 1)
				setPlayerStorageValue(cid,2113,1)
		else
				selfSay('I hope you can find a nice doll.', cid)
		end
	elseif (getPlayerStorageValue(cid,2113) == 1) then
		selfSay('My friend, I dont have any mission for you, but take some cheese.', cid)
		doPlayerAddItem(cid,2696,1)
		return false
	end
	if (getPlayerStorageValue(cid,2113) < 0) then
		selfSay('A mission here in hobbiton? You are not of arounf here, arent you? But I actually may have a favour to ask', cid)
		selfSay('I got a little son, Bilbo. I want to give him a nice doll, but its impossible to get a good one in this lands. If you find one in your journeys, would you bring it to me?, {yes}?.', cid)
	end
end
if(msgcontains(msg, 'yes')) then
	if (getPlayerStorageValue(cid,2113) < 0) then
		selfSay('Thats great to hear. I will be waiting for you.', cid)
		setPlayerStorageValue(cid,30023,22)
		setPlayerStorageValue(cid,2113,0)
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
