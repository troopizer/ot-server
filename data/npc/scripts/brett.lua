local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid) 		npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 	npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 			npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, 'fish')or msgcontains(msg, 'fishing')) then
			selfSay('Fishing is the best use of your time! I love fishing. You can catch not only regular fish, also rainbow trouts. And is some places even more fishes. Would you like to try?, {ok}?', cid)
			talkState[talkUser] = 1
	end

	if(msgcontains(msg, 'ok')) then
		if (talkState[talkUser] == 1) then
				selfSay('Great! First you need this fishing rod and worms. Use the rod on a water tile and you will be fishing as long as you have worms in your bag. Have a nice fishing day!', cid)
				doPlayerAddItem(cid,2580,1)
				doPlayerAddItem(cid,3976,20)
		end
	end
	if(msgcontains(msg, 'no')) then
				selfSay('What a waste.', cid)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


