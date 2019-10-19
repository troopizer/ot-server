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
    end
if(msgcontains(msg, 'beer')) then
selfSay('Dont have beer right now...', cid)
end
if(msgcontains(msg, 'food')) then
selfSay('I sell bread for 2 gp and cheese for 2 gp.', cid)
end
if(msgcontains(msg, 'mission')) then
selfSay('I dont have missions for you.. You should talk to the mayor of Bree or maybe go to Jims house, he might need some help.', cid)
end
if(msgcontains(msg, 'herbs')) then
selfSay('We have no production of herbs, if you want to buy some you should travel to the shire, west from Bree.', cid)
end
if(msgcontains(msg, 'golden goblet')) then
selfSay('I havent hear about that...', cid)
end
if(msgcontains(msg, 'Buckland')) then
selfSay('Buckland lies to the west, right before the Brandywine river.', cid)
end
if(msgcontains(msg, 'Gorbadoc')) then
selfSay('He is the lord of Buckland.', cid)
end
if(msgcontains(msg, 'Shire')) then
selfSay('Thats the name of the lands west of the Brandywine river. I dont know much about the hobbits around there.', cid)
end






end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
