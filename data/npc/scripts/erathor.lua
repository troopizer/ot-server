local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
local random_texts = {
	'Annun adanath aglareb.',
	'Long days and even longer nights.. but we are dunedain, we dont get tired.',
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 35)
		if(math.random(100) < 40) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'mission') or msgcontains(msg, 'dunedain') or msgcontains(msg, 'ranger')) then
		if (getPlayerStorageValue(cid,2310) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2310,4)
			setPlayerStorageValue(cid,2311,150)
		end
			if(getPlayerStorageValue(cid,2041) == 0) then
				selfSay('I am waiting for you to finish the mission.', cid)
			elseif(getPlayerStorageValue(cid,2041) < 0) then
					selfSay('Hi brave man, we are the dunedain, the descendants of the mighty warriors of Arnor, if you want to help us in a mission, I can give you a pretty nice reward,{ok}?.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2041) == 40) then
					selfSay('Great! you are pretty strong, you can now pick one of this rings. They are lesser magic rings I found in Eregion and they are very valuable: {meele ring}, {distance ring} and {magic ring}, wich one? (you received 10000 exp) ', cid)
					setPlayerStorageValue(cid,2041,41)
					doPlayerAddExperience(cid,10000)
					x=getPlayerStorageValue(cid,2311)+2
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
					talkState[talkUser] = 2
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)

	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2041) < 0) then
				selfSay('You have a strong spirit, go and teach a lesson to the lone land poachers and savages, defeat 40 of them and I will pay you with a nice item.', cid)
				setPlayerStorageValue(cid,30010,9)
				setPlayerStorageValue(cid,2041,0)
			end
		end
	elseif(msgcontains(msg, 'magic ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 41) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2209,1)
			end
		end
	elseif(msgcontains(msg, 'melee ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 41) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2207,1)
			end
		end
	elseif(msgcontains(msg, 'distance ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 41) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2203,1)
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
