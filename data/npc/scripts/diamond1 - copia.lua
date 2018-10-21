local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'trade')) then
		selfSay('Do you want to buy: {clubs}, {axes}, {swords}, {helmets} or {shields}?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'helmets') and talkState[talkUser] == 1) then
	 	selfSay('I sell: {west dwarven helmet}(Arm:8, Club fighting:+1, Axe fighting:+1, Physical abs:2%).', cid)
		talkState[talkUser] = 2 
	elseif(msgcontains(msg, 'west dwarven helmet') and talkState[talkUser] == 2) then
	 	selfSay('For one west dwarven helmet, it would be {6 small diamonds}, do you have them?.', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 2145) >= 6) then
				doPlayerRemoveItem(cid, 2145, 6)
				doPlayerAddItem(cid,2479,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough small diamonds.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'clubs') and talkState[talkUser] == 1) then
	 	selfSay('I sell: {steel sceptre} (atk:32 def:24).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'steel sceptre') and talkState[talkUser] == 2) then
	 	selfSay('For 1 steel sceptre, it would be {10 small diamonds}, do you have them?.', cid)
		talkState[talkUser] = 6
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then
		
		if(getPlayerItemCount(cid, 2145) >= 10) then
				doPlayerRemoveItem(cid, 2145, 10)
				doPlayerAddItem(cid,7387,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough small diamonds.', cid)
		end
		talkState[talkUser] = 1

elseif(msgcontains(msg, 'axes') and talkState[talkUser] == 1) then
	 	selfSay('I sell: {steel lance} (atk:33 def:18).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'steel lance') and talkState[talkUser] == 2) then
	 	selfSay('For 1 steel lance, it would be {10 small diamonds}, do you have them?.', cid)
		talkState[talkUser] = 7
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then
		
		if(getPlayerItemCount(cid, 2145) >= 10) then
				doPlayerRemoveItem(cid, 2145, 10)
				doPlayerAddItem(cid,3964,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough small diamonds.', cid)
		end
		talkState[talkUser] = 1

elseif(msgcontains(msg, 'swords') and talkState[talkUser] == 1) then
	 	selfSay('I sell: {steel sword} (atk:31 def:27).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'steel sword') and talkState[talkUser] == 2) then
	 	selfSay('For 1 steel sword, it would be {10 small diamonds}, do you have them?.', cid)
		talkState[talkUser] = 8
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then
		
		if(getPlayerItemCount(cid, 2145) >= 10) then
				doPlayerRemoveItem(cid, 2145, 10)
				doPlayerAddItem(cid,7385,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough small diamonds.', cid)
		end
		talkState[talkUser] = 1

elseif(msgcontains(msg, 'shields') and talkState[talkUser] == 1) then
	 	selfSay('I sell: {dwarven light shield} (def:29).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'dwarven light shield') and talkState[talkUser] == 2) then
	 	selfSay('For 1 dwarven light shield, it would be {5 small diamonds}, do you have them?.', cid)
		talkState[talkUser] = 5
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
		
		if(getPlayerItemCount(cid, 2145) >= 5) then
				doPlayerRemoveItem(cid, 2145, 5)
				doPlayerAddItem(cid,2525,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough small diamonds.', cid)
		end
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 1
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
