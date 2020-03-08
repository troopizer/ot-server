local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
local random_texts = {
	'Long are the days when you are old..',
	'Strong armors can be made with bronze...',
	'COFF! COFF!.'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 40)
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

if(msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2012) == 0) then
if(getPlayerItemCount(cid, 2668) >= 3 and  getPlayerItemCount(cid, 2689) >= 5) then
				doPlayerRemoveItem(cid, 2668, 3)
				doPlayerRemoveItem(cid, 2689, 5)
selfSay('Great! I really like eating bread with salmon!, now lets speak about {forge}. (you received 5000 exp)', cid)
setPlayerStorageValue(cid,2012,1)
doPlayerAddExperience(cid,5000)
x=getPlayerStorageValue(cid,2305)+1
				setPlayerStorageValue(cid,2305,x)
				if (getPlayerStorageValue(cid,2305) > 60 and getPlayerStorageValue(cid,2304) == 4) then
					setPlayerStorageValue(cid,2304,5)
				end
end
end
end
if (getPlayerStorageValue(cid,2012) == 1) then

	if(msgcontains(msg, 'forge')) then
		talkState[talkUser] = 1
		selfSay('Do you want to forge: {armor}, {legs} or?', cid)

	elseif(msgcontains(msg, 'armor') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {bronze armor} (arm:10).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'bronze armor') and talkState[talkUser] == 2) then
	 	selfSay('bronze armor, I would need {6 copper ores}, {6 tin ores} and {20 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 2261) >= 6 and  getPlayerItemCount(cid, 2311) >= 6) then
			if(doPlayerRemoveMoney(cid, 20)) then
				doPlayerRemoveItem(cid, 2261, 6)
				doPlayerRemoveItem(cid, 2311, 6)
				doPlayerAddItem(cid,2465,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough copper or tin ores.', cid)
		end
		talkState[talkUser] = 0


elseif(msgcontains(msg, 'legs') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {bronze legs} (Arm:5).', cid)
		talkState[talkUser] = 4
	elseif(msgcontains(msg, 'bronze legs') and talkState[talkUser] == 4) then
	 	selfSay('So.. bronze legs, I would need {6 copper ores}, {6 tin ores} and {20 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 11
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then
		
		if(getPlayerItemCount(cid, 2261) >= 6 and  getPlayerItemCount(cid, 2311) >= 6) then
			if(doPlayerRemoveMoney(cid, 20)) then
				doPlayerRemoveItem(cid, 2261, 6)
				doPlayerRemoveItem(cid, 2311, 6)
				doPlayerAddItem(cid,2478,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough copper or tin.', cid)
		end
		talkState[talkUser] = 0


	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end
if (getPlayerStorageValue(cid,2012) < 0) then
selfSay('If you want me to forge something for you, I need your help with something, {ok}?.', cid)
if (getPlayerStorageValue(cid,2304) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2304,4)
			setPlayerStorageValue(cid,2305,150)
		end
if(msgcontains(msg, 'ok')) then
if (getPlayerStorageValue(cid,2012) < 0) then
selfSay('Great! So please, bring me some supplies. I need 5 bread and 3 salmons. Then I will help you.', cid)
setPlayerStorageValue(cid,30003,3)
setPlayerStorageValue(cid,2012,0)
end
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
