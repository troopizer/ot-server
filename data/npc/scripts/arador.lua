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
					selfSay('Great! you are a skilled hunter. (you received 50000 exp) ', cid)
					setPlayerStorageValue(cid,2106,11)
					doPlayerAddExperience(cid,50000)
			elseif(getPlayerStorageValue(cid,2106) == 11 and getPlayerStorageValue(cid,2107) < 0) then
					selfSay('My father, Argonui, send me here in order to ensure peace in {Lone Lands}. But we are just a few rangers and the enemies are hundreds.', cid)
					selfSay('We must face packs of wargs as big as horses, outlaws that even have a leader and some witches with them. And as you should know there is a camp of goblins in the Weather Hills.', cid)			
					selfSay('You have proven to be a good friend of the Dunedain many times, you have earned my trust, friend. If you have the time I want you to join us in this campaign. Can you help us? {Yes}? ', cid)			
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2107) == 2) then
					selfSay('Thanks you, let me see that report. (you received 80000 exp) ', cid)
					setPlayerStorageValue(cid,2107,3)
					doPlayerAddExperience(cid,80000)
			elseif(getPlayerStorageValue(cid,2107) == 3 and getPlayerStorageValue(cid,2108) < 0) then
					selfSay('This is serious... Eranuir says that a group of witches is gatering an army in an old castle of Rhudaur, north-west from here.', cid)
					selfSay('They have many lone lands outlaws under their comand. And that is not all, the witches are working along with eriador renerages and the Weather Hills goblins!', cid)
					selfSay('It looks like the renegades have a camp on the Weather Hills next to the goblin camp that you attacked with Nargor, they are sending supplies from there to the old castle.', cid)					
					selfSay('We need to act quickly.. You are one of the strongest warriors I have ever seen. Would you go in a dangerous mission to give these bastards a good hit?,{yes}?', cid)						
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2108) == 2) then
					selfSay('You did it! Great work.. As a reward I will teach you one of the best moves I know, {ok}? (you received 120000 exp) ', cid)
					talkState[talkUser] = 2
					doPlayerAddExperience(cid,120000)	
					setPlayerStorageValue(cid,2108,3)
			elseif(getPlayerStorageValue(cid,2108) == 3) then
					selfSay('As a reward I will teach you one of the best moves I know, {ok}?', cid)
					talkState[talkUser] = 2							
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
			if(getPlayerStorageValue(cid,2107) == 3 and getPlayerStorageValue(cid,2108) < 0) then
				selfSay('You are very brave. Go to the renegades camp in the Weather Hills and kill the {witches delegate} that is there, also search for a {key}, that Eranuir told me they have there.', cid)
				selfSay('Then go to the witches castle and search for the {renegades delegate} in the surrounding camp and kill him. Also look for a {second key}.', cid)				
				selfSay('Then come back to me with both keys. Good luck my friend!', cid)		
				setPlayerStorageValue(cid,2108,0)
			end
		end
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
		selfSay('I may teach you: {Frontal Long Slash} (melee) or {Charge} (speed), which one do you want to learn?', cid)
		talkState[talkUser] = 3
		end		
	elseif(msgcontains(msg, 'frontal long slash')) then
		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2108) == 3) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2057,0)
				setPlayerStorageValue(cid,2108,4)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'charge')) then
		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2108) == 3) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2134,0)
				setPlayerStorageValue(cid,2108,4)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok. I understand, I hope to see you again.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
