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
			elseif(getPlayerStorageValue(cid,2106) == 11 and getPlayerStorageValue(cid,2107) < 0) then
					selfSay('My father, Argonui, send me here in order to ensure peace in {Lone Lands}. But we are just a few rangers and the enemies are hundreds.', cid)
					selfSay('We must face packs of wargs as big as horses, outlaws that even have a leader and some witches with them. And as you should know there is a camp of goblins in the Weather Hills.', cid)			
					selfSay('You have proven to be a good friend of the Dunedain many times, you have earned my trust, friend. If you have the time I want you to join us in this campaign. Can you help us? {Yes}? ', cid)			
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2107) == 2) then
					selfSay('Thanks you, let me see that report. (you received 30000 exp) ', cid)
					setPlayerStorageValue(cid,2107,3)
					doPlayerAddExperience(cid,30000)		
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)
	elseif(msgcontains(msg, 'arador')) then
				selfSay('Yes my name is Arador, son of Argonui. My father is currently the chieftain of the Dúnedain. My son Arathorn is being trained for now.', cid)
	elseif(msgcontains(msg, 'lone lands')) then
				selfSay('The Lone Lands is the name used by Hobbits and Bree-landers for the wilderness east of Bree-land. The west border are the Weather Hills and the east border is considered the Hoarwell river, where lies the last bridge.', cid)
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2106) < 0) then
				selfSay('Ok hunt 10 of them.', cid)
				setPlayerStorageValue(cid,30022,21)
				setPlayerStorageValue(cid,2106,0)
			end
			if(getPlayerStorageValue(cid,2106) == 11 and getPlayerStorageValue(cid,2107) < 0) then
				selfSay('Great! I need you to talk with one of my men, Eranuir. He is spying the outlaws in the area. You might find him west from here.', cid)
				setPlayerStorageValue(cid,2107,0)
			end
		end
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok. I understand, I hope to see you again.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
