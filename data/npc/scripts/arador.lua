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
			if(getPlayerStorageValue(cid,2053) < 2) then
				selfSay('I heard that you are working with Nargor in the Weather Hills. You should finish your work there.', cid)
			elseif(getPlayerStorageValue(cid,2053) == 2 and getPlayerStorageValue(cid,2106) < 0) then
					selfSay('Nargor told me that you did an excelent job in the Weather Hills. I am sure that you can be very useful here, I need someone to hunt some wargs. Are you in? {Yes}?.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2106) == 10) then
					selfSay('Great! you are a skilled hunter. (you received 20000 exp) ', cid)
					setPlayerStorageValue(cid,2106,11)
					doPlayerAddExperience(cid,20000)
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)

	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2106) < 0) then
				selfSay('You have a strong spirit, go and teach a lesson to the lone land poachers and savages, defeat 20 of them and I will pay you with a nice item.', cid)
				setPlayerStorageValue(cid,30022,21)
				setPlayerStorageValue(cid,2106,0)
			end
		end
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
