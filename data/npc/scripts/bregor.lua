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
			if(getPlayerStorageValue(cid,2046) == 0) then
				selfSay('I am waiting for you to finish the mission.', cid)
			elseif(getPlayerStorageValue(cid,2007) == 4 and getPlayerStorageValue(cid,2096) < 0) then
					selfSay('Hi friend, we are the dunedain, the descendants of old Arnor. Fornost once was our capital, now is a evil and forgotten place..', cid)
					selfSay('We were send by our leader Argonui, in order to control any evil power that raises here. If you want to help us, I can pay you for your work,{ok}?. ', cid)				
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2096) == 10) then
					selfSay('Great! You are quite strong, I have another {mission} for you (you received 10000 exp and 1000 gp) ', cid)
					setPlayerStorageValue(cid,2096,11)
					doPlayerAddExperience(cid,10000)
					doPlayerAddItem(cid,2152,10)
			elseif(getPlayerStorageValue(cid,2096) == 11) then
					selfSay('As you may noticed in the first area of the city there are just some wolves and bandits. Thats because an old dwarven sorcerer keeps any evil spirit and undead lock in the catacombs.', cid)
					selfSay('The second area of the city, the eastern area, is another story. A cult of sorcerers and necromancers use the ruins to make evil rituals, if you feel strong enough I want to kill some of them, {ok}?', cid)		
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2097) == 10) then
					selfSay('Nice done!(you received 20000 exp and 1000 gp) ', cid)
					setPlayerStorageValue(cid,2097,11)
					doPlayerAddExperience(cid,20000)
					doPlayerAddItem(cid,2152,10)			
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)

	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2096) < 0) then
				selfSay('Some outlaws are camping in the first area of the city, near the entrance. You look strong enough, teach them a lesson.', cid)
				setPlayerStorageValue(cid,30021,20)
				setPlayerStorageValue(cid,2096,0)
			if(getPlayerStorageValue(cid,2096) == 11 and getPlayerStorageValue(cid,2097) < 0) then
				selfSay('Kill 10 necromancer apprentices in order to spread fear among them.', cid)
				setPlayerStorageValue(cid,30021,20)
				setPlayerStorageValue(cid,2097,0)
			end
			end
		end
	elseif(msgcontains(msg, 'strong strike')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2042,0)
			end
		end
	elseif(msgcontains(msg, 'twisting slash')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2043,0)
			end
		end
	elseif(msgcontains(msg, 'shield wall')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2044,0)
			end
		end
	elseif(msgcontains(msg, 'sharp aim')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2045,0)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())