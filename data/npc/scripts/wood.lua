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
if(msgcontains(msg, 'wood')) then
selfSay('I can sell you high cuality wood planks for just 10 gp.', cid)
end

if(msgcontains(msg, 'supplies')or msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2005) == 0) then
selfSay('Ok,The Mayor send you, I need your help delivering 10 wood planks to {Osbald} in {Staddle}, {ok}? ', cid)
talkState[talkUser] = 1
end
end
if(msgcontains(msg, 'ok')) then
if (getPlayerStorageValue(cid,2005) == 0 and talkState[talkUser] == 1) then
selfSay('Great, take them and dont leave the path or you might find bandits on the woods, good luck.', cid)
setPlayerStorageValue(cid,2005,1) 
doPlayerAddItem(cid,5901,10)
end
end




end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


