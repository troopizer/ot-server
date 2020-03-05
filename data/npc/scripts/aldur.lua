local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
local random_texts = {
	'The safest road to the east.. What a joke!',
	'The safest road to the east.. What a joke!',
	'FUCKIN BANDITS!',
	'FUCKIN BANDITS!',
	'Niroh! Go to the mayor again, we need help quickly.',
	'CAN YOU KEEP QUIET DRUNK MAN?!',
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 20)
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
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('I know that Gerontius Took "The Old Took" is currently the Thain of the Shire and since 50 years Thorin II Oakenshield is the king of our people and a great one!', cid)
	end
if(msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2007) < 0) then
selfSay('Sorry kid, I dont have a mission for you..', cid)
end
if (getPlayerStorageValue(cid,2007) == 0) then
selfSay('So.., the mayor send you to help us?', cid)
end
if (getPlayerStorageValue(cid,2007) == 2) then
selfSay('Hi! Did you find our jewels?', cid)
end
end
if(msgcontains(msg, 'yes')) then
if (getPlayerStorageValue(cid,2007) == 0) then
selfSay('Fine, as you know some bandits attacked us and stole 4 jewel cases, we dont know who the robbers are, but someone in this town knows. Please, investigate this matter.', cid)
setPlayerStorageValue(cid,2007,1)
end
if (getPlayerStorageValue(cid,2007) == 2 and doPlayerRemoveItem(cid, 6104, 4) == TRUE) then
selfSay('Well done! You must be a great warrior, report your actions to the mayor, he will pay you.', cid)
setPlayerStorageValue(cid,2007,3)
end

end
return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())