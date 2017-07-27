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
if(msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2039) < 0) then
selfSay('Sorry kid, I dont have a mission for you..', cid)
end
if (getPlayerStorageValue(cid,2039) == 0) then
selfSay('Hey! the sergeant send you, thats great, I have a lot to report', cid)
selfSay('bla blabla bla bla', cid)
selfSay('blablabla bla blabla, BLA! bla blabla bla.', cid)
setPlayerStorageValue(cid,2039,1)
selfSay('Now go back to the sergeant and deliver my report. See you.', cid)
end
if (getPlayerStorageValue(cid,2039) == 2) then
selfSay('No mission for you right now.', cid)
end
end
return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())