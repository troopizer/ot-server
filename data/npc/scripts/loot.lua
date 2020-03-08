local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
local random_texts = {
	'COME HERE TO SELL YOUR LOOT!',
	'COME HERE TO SELL YOUR LOOT!',
	'COME HERE TO SELL YOUR LOOT!',
	'HEY NIMRAL! WHEN WAST THE LAST TIME YOU SOLD A TOOL?!',
	'A good day for hunting.'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 17)
		if(math.random(100) < 40) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end
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
if(msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2001) == 0) then
selfSay('Soo..The Mayor send you, I do have a request for you. I need some feathers that a costumer requested, just 2 feathers, {ok}? ', cid)
talkState[talkUser] = 1
end
if (getPlayerStorageValue(cid,2001) == 1) then
if(doPlayerRemoveItem(cid, 5890, 2) == TRUE) then
setPlayerStorageValue(cid,2001,2)
doPlayerAddExperience(cid,400)
x=getPlayerStorageValue(cid,2305)+3
				setPlayerStorageValue(cid,2305,x)
				if (getPlayerStorageValue(cid,2305) > 60 and getPlayerStorageValue(cid,2304) == 4) then
					setPlayerStorageValue(cid,2304,5)
				end
doPlayerAddItem(cid,2148,50)
selfSay('Well done, now go back to the mayor.(you have received 400 experience and 50 gp)', cid)
else
selfSay('Patience, keep trying.', cid)
end
end
end
if(msgcontains(msg, 'ok')) then
if (getPlayerStorageValue(cid,2001) == 0 and talkState[talkUser] == 1) then
selfSay('Nice, go right next to my stand, you will find chickens and sheeps on the chiken run.', cid)
setPlayerStorageValue(cid,2001,1) 
end
end




end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


