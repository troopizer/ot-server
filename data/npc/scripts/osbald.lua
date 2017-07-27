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
	
	if(msgcontains(msg, 'supplies')or msgcontains(msg, 'mission')) then
		if (getPlayerStorageValue(cid,2005) == 1 and doPlayerRemoveItem(cid, 5901, 10) == TRUE) then
			selfSay('Thanks you. We were waiting this wood for reparations,.. you look strong enough to help us again. Can you hunt a wolf that is killing our sheeps?,{ok}.', cid)
			setPlayerStorageValue(cid,2005,2) 
			talkState[talkUser] = 1
		end
	end

	if(msgcontains(msg, 'ok')) then
		if (getPlayerStorageValue(cid,2005) == 2 and talkState[talkUser] == 1) then
			selfSay('Great, There is a hill near here, to the north, there lives the Raging Wolf, kill it and come back here, good luck.', cid)
			setPlayerStorageValue(cid,2005,3) 
		end
	end
	if(msgcontains(msg, 'mission')) then
		if (getPlayerStorageValue(cid,2005) == 4) then
			selfSay('Good job! Go back to the Mayor and tell him about this.', cid)
			setPlayerStorageValue(cid,2005,5)
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


