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
if(msgcontains(msg, 'yes')) then
selfSay('Ok.. just ask, but some information cost money, hehe', cid)
end
if(msgcontains(msg, 'Osbald')) then
selfSay('Osbald Underhill is the most important hobbit in Staddle. He manages most of the village.', cid)
end
if(msgcontains(msg, 'bree')) then
selfSay('This town is Bree, the biggest of men in Erianor. Its a good place to learn basic skills and start your adventures', cid)
end
if(msgcontains(msg, 'prancing pony')) then
selfSay('The Prancing Pony is a famous Inn in the north side of Bree, travelers of all kind stop there for drinks and food.', cid)
end
if(msgcontains(msg, 'nothing')) then
selfSay('Get lost and dont waste my time!', cid)
end
if(msgcontains(msg, 'aldur')) then
selfSay('Aldur is an important merchant of the blue mountains.. he might be close to Thorin Oakenshield, their leader. I have heard that some {bandits} stole something from him.', cid)
end
if(msgcontains(msg, 'info')) then
selfSay('What information are you looking for?.', cid)
end


if(msgcontains(msg, 'mission')) then
selfSay('Do you have a mission? Good for you...', cid)
end

---------------------------------------------------------
if(msgcontains(msg, 'bandits')) then
if (getPlayerStorageValue(cid,2007) < 2) then
selfSay('Around Bree there are a large group of bandits with a strong leader...Larry Halfsnout.., I know about their last job with the dwarves, but that information will cost you 100 gold coins,{ok}?  ', cid)
end
end
if(msgcontains(msg, 'Larry Halfsnout')) then
selfSay('He is the leader of most of the robbers around Bree-Land. I have information about his lair, but it will cost you 200 gold coins,{ok}?  ', cid)
talkState[talkUser] = 1
end

if(msgcontains(msg, 'ok')) then
if (getPlayerStorageValue(cid,2007) < 2) then
if(doPlayerRemoveMoney(cid, 100)) then
setPlayerStorageValue(cid,2007,2)
selfSay('Well.. This bandits stole some jewel cases from Aldur and his friend, they took the jewels to their lair on the east side of Midgewater swamp. Go by the north road to Archet, but then take the side road east trough Chetwood..', cid)
else
selfSay('You dont have that amount of money..', cid)
end
end
if(talkState[talkUser] == 1) then
if(doPlayerRemoveMoney(cid, 200)) then
selfSay('His lair is on the east side of Midgewater swamp, Just under the start of the Wheater Hills. Go by the north road to Archet, but then take the side road east through Chetwood and then through Midgewater Swamp.', cid)
else
selfSay('You dont have that amount of money..', cid)
end
end
end



end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())