local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
local random_texts = {
	'Otto.. ',
	'Otto says that the wool may be good this season.',
	'I would like to plant some flowers. ',
	'I would like to plant some flowers.',
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 34)
		if(math.random(100) < 30) then
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
if(msgcontains(msg, 'sheep')) then
selfSay('Sheeps are very beautiful animals, my husband loves them.', cid)
end
if(msgcontains(msg, 'janice')) then
selfSay('My name is Janice Underhill, I am the daughter of Osbald Underhill. but my husband is Otto Brockhouse.', cid)
selfSay('My father is the most important hobbit in Staddle, he let Otto marry me  with the condition of keeping my lastname', cid)
end
if(msgcontains(msg, 'food')) then
selfSay('sorry, the dinner is not ready', cid)
end
if(msgcontains(msg, 'Osbald')) then
selfSay('Osbald Underhill is the most important hobbit in Staddle. He manages most of the village.', cid)
selfSay('He is my father.', cid)
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
			selfSay('I dont have missions for you, go to the tavern, you may find something there.', cid)	
		elseif (getPlayerStorageValue(cid,2312) == 0) then
			selfSay('I dont have missions for you, go to the tavern, you may find something there.', cid)	
		else
			selfSay('I dont have a mission for you.', cid)
		end
	else
		selfSay('A mission? I havent hear of any mission around here.. Maybe Osbald Underhill may help you.', cid)
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
if(msgcontains(msg, 'don')) then
	if(talkState[talkUser] == 1) then
		if (getPlayerStorageValue(cid,2312) == 0) then
			selfSay('I knew it... So he wants to help his son. Of course I would help you, the relation between father and son is very important. ', cid)
			selfSay('Otto is obsessed with having a black sheep. That would be the perfect present for him.. ', cid)
			setPlayerStorageValue(cid,2312,1)
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
if(msgcontains(msg, 'staddle')) then
selfSay('Staddle is this beautiful and little town, you may find almost only hobbits living here.', cid)
end
if(msgcontains(msg, 'otto')) then
selfSay('Otto is my husband. He is in charge of the sheep herd of Staddle. He really love them.', cid)
end
if(msgcontains(msg, 'shire')) then
selfSay('Thats the name of the lands far west from here.', cid)
end
if(msgcontains(msg, 'bree')) then
selfSay('Bree.. is the biggest town of men and hobbits in Eriador. Its a good place to learn basic skills and start your adventures. I used to leave there with my parents.', cid)
end
if(msgcontains(msg, 'prancing pony')) then
selfSay('The Prancing Pony is a famous Inn in the north side of Bree, travelers of all kind stop there for drinks and food.', cid)
end
if(msgcontains(msg, 'problem') or msgcontains(msg, 'present')) then
if (getPlayerStorageValue(cid,2312) == 0) then
selfSay('Mmm.. who send you?', cid)
talkState[talkUser] = 1
else
selfSay('..', cid)
end
end
if(msgcontains(msg, 'aldur')) then
selfSay('I dont know that name..', cid)
end
if(msgcontains(msg, 'info')) then
selfSay('Sorry, I dont know ...', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'bandits')) then
selfSay('If you want to find bandits.. Go to South Downs, but be careful.', cid)
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())