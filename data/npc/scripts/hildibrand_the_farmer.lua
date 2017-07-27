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
	
	-----------------------------------------------------------------------
	-- GENERAL INTERACTION                                               --

	if (msgcontains(msg, 'mission')) then
		selfSay('The people from Buckland is old. We all need a little help with our daily tasks.', cid)
		return false
	end
	
	-----------------------------------------------------------------------
	-- FILTER INTERACTION                                                --

	if (getPlayerStorageValue(cid,2013) ~= 0) then
		selfSay("Good news, the harvest will be good.", cid)
		return false
	end

	-----------------------------------------------------------------------
	-- QUEST INTERACTIONS                                                --

	if(msgcontains(msg, 'Daisy') or msgcontains(msg, 'Gamwich') or msgcontains(msg, 'cat') or msgcontains(msg, 'food')) then
		selfSay("Misses Daisy asked you to bring her wheat ? That Lady helped my son once. It would be rightful to help her back. Take this. This scythe will allow you to obtain the grane from my field.", cid)
		doPlayerAddItem(cid,2550,1)
		setPlayerStorageValue(cid,2013,1)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


