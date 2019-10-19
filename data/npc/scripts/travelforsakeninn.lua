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

if(msgcontains(msg, 'travel')) then
	selfSay('We provide the travel service, but you must have traveled by your own to the desire location, in order to travel there by our service.', cid)
 	selfSay('To achieve that you need to speak with our traveling agent in that location and ask for a "travel".', cid)
 	selfSay('Soo.. Where do you want to travel? {bywater},{bree},{buckland} or {last bridge}?', cid)
 		if (getPlayerStorageValue(cid,2140) < 0) then
 				setPlayerStorageValue(cid,30030,29)
				setPlayerStorageValue(cid,2140,0)
		end
 	talkState[talkUser] = 1

elseif(msgcontains(msg, 'bywater') and talkState[talkUser] == 1) then
	 	selfSay('Traveling to Bywater will cost 300 gp, do you have they?.', cid)
		talkState[talkUser] = 2
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if(getPlayerStorageValue(cid,2139) == 0) then
			if(doPlayerRemoveMoney(cid, 300)) then
				destination = Position(196, 968, 7)
				npcHandler:releaseFocus(cid)
				doCreatureTeleport(cid, destination)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			 selfSay('You need to unlock this location first!', cid)
		end
		talkState[talkUser] = 0
elseif(msgcontains(msg, 'bree') and talkState[talkUser] == 1) then
	 	selfSay('Traveling to Bywater will cost 100 gp, do you have they?.', cid)
		talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
			if(doPlayerRemoveMoney(cid, 100)) then
				destination2 = Position(652, 993, 7)
				npcHandler:releaseFocus(cid)
				doCreatureTeleport(cid, destination2)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		talkState[talkUser] = 0
elseif(msgcontains(msg, 'buckland') and talkState[talkUser] == 1) then
	 	selfSay('Traveling to Buckland will cost 200 gp, do you have they?.', cid)
		talkState[talkUser] = 4
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		if(getPlayerStorageValue(cid,2138) == 0) then
			if(doPlayerRemoveMoney(cid, 200)) then
				destination = Position(395, 1009, 6)
				npcHandler:releaseFocus(cid)
				doCreatureTeleport(cid, destination)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			 selfSay('You need to unlock this location first!', cid)
		end
		talkState[talkUser] = 0
elseif(msgcontains(msg, 'last bridge') and talkState[talkUser] == 1) then
	 	selfSay('Traveling to the Last Bridge will cost 600 gp, do you have they?.', cid)
		talkState[talkUser] = 5
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
		if(getPlayerStorageValue(cid,2141) == 0) then
			if(doPlayerRemoveMoney(cid, 600)) then
				destination4 = Position(1526, 882, 7)
				npcHandler:releaseFocus(cid)
				doCreatureTeleport(cid, destination4)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			 selfSay('You need to unlock this location first!', cid)
		end
		talkState[talkUser] = 0
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())