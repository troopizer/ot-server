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
if (getPlayerStorageValue(cid,2006) == 0) then
selfSay('What? a mission? what is your mission here?.', cid)
else
selfSay('What? a mission? I havent hear of any mission around here..but if you want a job, go to the Brandy Hall.', cid)
end
end
if(msgcontains(msg, 'old mine')) then
selfSay('the old mine? I dont know about any old mine, but I know that under the hills north from here, there is a iron mine. But.. the renegades build their town over it..', cid)
end
if(msgcontains(msg, 'mine')) then
selfSay('I know that under the hills north from here, there is a iron mine. But.. the renegades build their town over it..', cid)
end

if(msgcontains(msg, 'golden goblet')) then
selfSay('I havent hear about that...', cid)
end
if(msgcontains(msg, 'Buckland')) then
selfSay('We are in Buckland right now, all the land surrounded by the hedge. If you are looking for a job, talk to the mayor in Brandy Hall.', cid)
end
if(msgcontains(msg, 'Brandy Hall')) then
selfSay('The Brandy Hall is a very big house under the hill to the south. Is the house of Gorbadoc the mayor.', cid)
end
if(msgcontains(msg, 'Gorbadoc')) then
selfSay('He is the lord of Buckland, a very respected hobbit, he always needs people for jobs.', cid)
end







end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
