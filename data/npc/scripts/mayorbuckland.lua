local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'information')) then
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('Gerontius Took "The Old Took" is currently the Thain of the Shire.', cid)
end
if(msgcontains(msg, 'bree')) then
selfSay('Bree is a litle town, but the biggest of men in Erianor. Its a good place to learn basic skills and start your adventures', cid)
end
if(msgcontains(msg, 'prancing pony')) then
selfSay('The Prancing Pony is a famous Inn in the north side of Bree, travelers of all kind stop there for drinks and food.', cid)
end
if(msgcontains(msg, 'nothing')) then
selfSay('I dont have time to lose...', cid)
end
if(msgcontains(msg, 'shire')) then
selfSay('The Shire is the land west from the river, its a nice place, but hobbits there are a little bit strange. ', cid)
end
if(msgcontains(msg, 'buckland')) then
selfSay('Buckland is this green and beautiful land, the most eastern hobbit settlement, it was founded by my ancestor Gorhendad Oldbuck. People here love our river and fear the old forest, but we live in peace. You may become a {citizen} of Buckland.', cid)
end
	if(msgcontains(msg, 'citizen')) then
		selfSay('If you decide to be a citizen of Buckland, you will lose your previous citizenship. Are you sure? {yes}?', cid)
		talkState[talkUser] = 10
	end
	if(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then
		doPlayerSetTown(cid, 2)
		selfSay('Ok.. sign this papers... Ready! you are now a citizen of Buckland.', cid)
		talkState[talkUser] = 0
	end



if(msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2306) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2306,4)
			setPlayerStorageValue(cid,2307,150)
end
selfSay('Sorry I dont have any job for you now.', cid)
end

---------------------------------------------------------





end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
