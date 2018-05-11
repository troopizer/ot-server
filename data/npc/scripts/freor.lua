local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'mission')) then
			if(getPlayerStorageValue(cid,2098) == 0) then
				selfSay('Who send you?.', cid)
					talkState[talkUser] = 1
			else
				selfSay('I dont have time to this...', cid)
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)

	elseif(msgcontains(msg, 'bregor')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2098) == 0) then
				selfSay('Ok, so I found out that this necromancers are up to something very bad. I dont know what, but I know that it they have to do with a priestess or something like that.', cid)
				selfSay('In order to know more about it, you have to find their book of rituals. Its in the catacombs under their camp.', cid)
				selfSay('You may need a key that is in the box over there ...', cid)
				setPlayerStorageValue(cid,2098,1)
				talkState[talkUser] = 0
			end
		end
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
