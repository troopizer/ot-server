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
if(msgcontains(msg, 'loot')) then
selfSay('I buy worm (1), cheese (2), leather (15), ham (3), meat (2), fish (3), wolf paw (20), bear paw (30), spider silk (8), white pearl (40), bat wing (15), honeycomb (15) and more. You may buy this items back, but for more money.', cid)
end
if(msgcontains(msg, 'creatures') or msgcontains(msg, 'hunting places')) then
selfSay('You may find some wolves, bears, rabbits and deer around Bree. To the east you may find some swamp creatures. South you will find spiders in the South Downs', cid)
end




end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


