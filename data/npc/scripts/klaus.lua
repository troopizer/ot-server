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

		if(msgcontains(msg, 'mission') or msgcontains(msg, 'dunedain') or msgcontains(msg, 'ranger')) then
			if(getPlayerItemCount(cid,2450) >= 10 and getPlayerItemCount(cid,2110) >= 1) then
					selfSay('Nice work! As your payment take this lesser ring and this outfit.(you received 10000 exp and a life ring) ', cid)
					setPlayerStorageValue(cid,2052,1)
					doPlayerRemoveItem(cid,2450,10)
					doPlayerRemoveItem(cid,2110,1)
					doPlayerAddItem(cid,2168,1)
					doPlayerAddOutfit(cid, 142, 0)
					doPlayerAddOutfit(cid, 134, 0)
					doPlayerAddExperience(cid,10000)
			end			
 		elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)

		elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
			selfSay('Ok then.', cid)
			talkState[talkUser] = 0
		end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
