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
selfSay('Aldur is an important merchant of the blue mountains.. he might be close to Thorin, their leader. I have heard that some {bandits} stole something from him.', cid)
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

if(msgcontains(msg, 'ok')) then
if (getPlayerStorageValue(cid,2007) < 2) then
if(doPlayerRemoveItem(cid, 2148, 100) == TRUE) then
setPlayerStorageValue(cid,2007,2)
selfSay('Well.. This bandits stole some jewel cases from Aldur and his friend, they take the cases to their lair on the east side of Midgewater swamp. Go to the north road to Archet, but take the road trough Chetwood..', cid)
else
selfSay('You dont have that amount of money..', cid)

end
end
end



end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())