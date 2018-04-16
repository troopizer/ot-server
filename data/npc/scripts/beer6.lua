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
selfSay('I sell bread for 2 gp, cheese for 2 gp and salmon for 10 gp.', cid)
end
if(msgcontains(msg, 'mission')) then
selfSay('What? a mission? I havent hear of any mission around here...', cid)
end
if(msgcontains(msg, 'herbs')) then
selfSay('This lands produce a lot of herbs and food, if you want to buy some ask around any town in the Shire.', cid)
end
if(msgcontains(msg, 'herb')) then
selfSay('This lands produce a lot of herbs and food, if you want to buy some ask around any town in the Shire.', cid)
end
if(msgcontains(msg, 'golden goblet')) then
selfSay('I havent hear about that...', cid)
end
if(msgcontains(msg, 'Buckland')) then
selfSay('Buckland lies to the east, crossing the Brandywine river, people there are a litle bit strange.', cid)
end
if(msgcontains(msg, 'Gorbadoc')) then
selfSay('He is the lord of Buckland.', cid)
end
if(msgcontains(msg, 'Shire')) then
selfSay('You are in the east part of the Shire.', cid)
end






end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
