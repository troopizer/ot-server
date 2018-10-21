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
	
	if(msgcontains(msg, 'mill')or msgcontains(msg, 'flour')) then
			selfSay('You, foreigners, arent very clever. I suppose you need me to explain how to make flour. For 300 gold I will be happy to tell you,{ok}.', cid)
			talkState[talkUser] = 1
	end

	if(msgcontains(msg, 'ok')) then
		if (talkState[talkUser] == 1) then
			if(doPlayerRemoveMoney(cid, 300)) then
				selfSay('Ok genius. First you need to get a scythe, you can buy one from that Rumble guy. Use the scythe to cut some wheat from the fields and then come here and use the wheat over the millstone. Thats all...', cid)
			else
				selfSay('For my grandfathers feet! Bring some money!', cid)
			end
		end
	end
	if(msgcontains(msg, 'no')) then
				selfSay('Get out of here!', cid)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


