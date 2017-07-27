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
if(msgcontains(msg, 'beer')) then
selfSay('I sell beer casks for 10 gp.', cid)
end
if(msgcontains(msg, 'food')) then
selfSay('I sell bread for 2 gp.', cid)
end
if(msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2006) == 0) then
selfSay('What? a mission? what is your mission here?.', cid)
end
if (getPlayerStorageValue(cid,2006) < 0 ) then
selfSay('I dont know nothing about a mission.', cid)
end
end
if(msgcontains(msg, 'old mine')) then
if (getPlayerStorageValue(cid,2006) == 0) then
selfSay('Soo.. the mayor send you, I know something about that mine, it used to produce iron and some jewels, but huge rotworms infected the mine. I know that some adventurers explored the first floor and find nothing, but they are deeper floors, go to the east of Archet.', cid)
setPlayerStorageValue(cid,2006,1)
else
selfSay('the old mine? I know that it used to produce iron and jewels, but its infected by rotworms. ', cid)
end
end
if(msgcontains(msg, 'golden goblet')) then
if (getPlayerStorageValue(cid,2006) == 0) then
selfSay('Let me see.. Its a old piece of a treasure of a old kingdom of Eriador, long time ago it was property of the mayors of Bree but it was hidden somewhere...', cid)
else
selfSay('Mm.. Its a old piece of a treasure of a old kingdom of Eriador, long time ago it was property of the mayors of Bree.', cid)
end
end





end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())