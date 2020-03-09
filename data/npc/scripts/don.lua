local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
local random_texts = {
	'What a day...',
	'Its so lonely tobe old..'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 34)
		if(math.random(100) < 20) then
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
   if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'information')) then
				selfSay('We are in the year 2900 of the third age, young one.', cid)
    end
if(msgcontains(msg, 'beer')) then
selfSay('If you want some, go to the Inn.', cid)
end
if(msgcontains(msg, 'food')) then
selfSay('I dont have food...', cid)
end
if(msgcontains(msg, 'edward')) then
		selfSay('Edward Mapleton is the mayor of Bree.', cid)
	end
if(msgcontains(msg, 'mission')) then
	if (getPlayerStorageValue(cid,2304) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2304,4)
			setPlayerStorageValue(cid,2305,150)
	end
	if (getPlayerStorageValue(cid,2304) > 4) then
		if (getPlayerStorageValue(cid,2312) < 0) then
			selfSay('I heard that you have been helping people around here.', cid)	
			selfSay('I am an old hobbit, my wife died some years ago and I only got my son. He lives in Staddle and he is doing allright, but I would like to help him as a present of his father', cid)
			selfSay('If you are looking for a job, I have a good amount of money. Would you go to Staddle and find how can I help him? {yes}?', cid)		
			talkState[talkUser] = 1
		elseif (getPlayerStorageValue(cid,2312) == 0) then
			selfSay('I will be waiting my friend.', cid)
		elseif (getPlayerStorageValue(cid,2312) == 1) then
			selfSay('Soo a black sheep... I dont know where can we found such a sheep, but if you manage to get one, I will pay you a good amount.', cid)
			setPlayerStorageValue(cid,2312,2)
		elseif (getPlayerStorageValue(cid,2312) == 2) then
			selfSay('Good luck my friend.', cid)
		elseif (getPlayerStorageValue(cid,2312) == 3) then
			selfSay('Good luck my friend.', cid)
		elseif (getPlayerStorageValue(cid,2312) == 4) then
			selfSay('Nice done! So you had to go to the Shire, I appreciate your help. Now just deliver the sheep to Otto and then I will pay you.', cid)
			setPlayerStorageValue(cid,2312,5)
		elseif (getPlayerStorageValue(cid,2312) == 6) then
			doPlayerAddExperience(cid,100000)
			doPlayerAddItem(cid,2152,100)
			selfSay('Thanks! you are a great man. I will never forget your help. (you received 100000 exp and 10000 gp)', cid)
			setPlayerStorageValue(cid,2312,7)
			x=getPlayerStorageValue(cid,2305)+3
				setPlayerStorageValue(cid,2305,x)
				if (getPlayerStorageValue(cid,2305) > 209 and getPlayerStorageValue(cid,2304) == 4) then
					setPlayerStorageValue(cid,2304,5)
				end
				if (getPlayerStorageValue(cid,2305) < 210 and getPlayerStorageValue(cid,2304) == 5) then
					setPlayerStorageValue(cid,2304,4)
				end
		else
			selfSay('I dont have another mission for you my good friend.', cid)
		end
	else
		selfSay('What? a mission? I havent hear of any mission around here.. You should speak with the mayor.', cid)
	end
end
if(msgcontains(msg, 'yes')) then
	if(talkState[talkUser] == 1) then
		if (getPlayerStorageValue(cid,2312) < 0) then
			selfSay('Thanks! My son is Otto, you may find him and his wife in Staddle. Find any problem or need he may have. ', cid)
			setPlayerStorageValue(cid,2312,0)
		end
	end
end
if(msgcontains(msg, 'herb')) then
selfSay('I have heard that in the lands to the west.. in the Shire.. Hobbits produce herbs in their fields.', cid)
end
if(msgcontains(msg, 'golden goblet')) then
selfSay('I havent hear about that...', cid)
end
if(msgcontains(msg, 'buckland')) then
selfSay('Buckland lies to the west.', cid)
end
if(msgcontains(msg, 'gorbadoc')) then
selfSay('I am not sure, but I think he is the lord of Buckland.', cid)
end
if(msgcontains(msg, 'shire')) then
selfSay('Thats the name of the lands west from here. A land of hobbits.. Quite strange hobbits.', cid)
end
if(msgcontains(msg, 'bree')) then
selfSay('This town is Bree, the biggest of men in Eriador. Its a good place to learn basic skills and start your adventures', cid)
end
if(msgcontains(msg, 'prancing pony')) then
selfSay('The Prancing Pony is a famous Inn in the north side of Bree, travelers of all kind stop there for drinks and food.', cid)
end
if(msgcontains(msg, 'nothing')) then
selfSay('Dont waste my time..', cid)
end
if(msgcontains(msg, 'aldur')) then
selfSay('I dont know that name..', cid)
end
if(msgcontains(msg, 'info')) then
selfSay('Sorry, thats a strange question.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'bandits')) then
selfSay('If you want to know about bandits.. Ask Hal Ferny, he may be a bandit himself.', cid)
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())