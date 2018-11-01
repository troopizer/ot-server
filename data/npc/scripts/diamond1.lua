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
		selfSay('Do you want to buy:{helmets} or {shields}?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'helmets') and talkState[talkUser] == 1) then
	 	selfSay('I sell: {west dwarven helmet}(Arm:8, Club fighting:+1, Axe fighting:+1, Physical abs:2%).', cid)
		talkState[talkUser] = 2 
	elseif(msgcontains(msg, 'west dwarven helmet') and talkState[talkUser] == 2) then
	 	selfSay('For one west dwarven helmet, it would be {10 small diamonds}, do you have them?.', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 2145) >= 10) then
				doPlayerRemoveItem(cid, 2145, 10)
				doPlayerAddItem(cid,2479,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough small diamonds.', cid)
		end
		talkState[talkUser] = 1

elseif(msgcontains(msg, 'shields') and talkState[talkUser] == 1) then
	 	selfSay('I sell: {west dwarven shield} (def:33).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'west dwarven shield') and talkState[talkUser] == 2) then
	 	selfSay('For 1 west dwarven shield, it would be {10 small diamonds}, do you have them?.', cid)
		talkState[talkUser] = 5
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
		
		if(getPlayerItemCount(cid, 2145) >= 10) then
				doPlayerRemoveItem(cid, 2145, 10)
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
