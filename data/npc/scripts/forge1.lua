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

	if(msgcontains(msg, 'forge')) then
		selfSay('Do you want to forge: {armor}, {shield}, {legs} or {helmet}?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'armor') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {leather armor} (arm:4), {iron studded armor} (arm:6), {bronze scale armor} (arm:8), {iron chain armor} (arm:9).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'leather armor') and talkState[talkUser] == 2) then
	 	selfSay('So.. leather armor, I would need {2 leather} and {8 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 5878) >= 2) then
			if(doPlayerRemoveMoney(cid, 8)) then
				doPlayerRemoveItem(cid, 5878, 2)
				doPlayerAddItem(cid,2467,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough leather.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'iron studded armor') and talkState[talkUser] == 2) then
	 	selfSay('Ok then.. iron studded armor, I would need {2 leather},{1 iron ore} and {30 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 4
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		
		if(getPlayerItemCount(cid, 5878) >= 2 and  getPlayerItemCount(cid, 5880) >= 1)then
			if(doPlayerRemoveMoney(cid, 30)) then
				doPlayerRemoveItem(cid, 5878, 2)
				doPlayerRemoveItem(cid, 5880, 1)
				doPlayerAddItem(cid,2464,1)
				selfSay('Here you are.', cid)
if (getPlayerStorageValue(cid,2002) == 0) then
setPlayerStorageValue(cid,2002,1)
end

			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough leather or iron.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'bronze scale armor') and talkState[talkUser] == 2) then
	 	selfSay('Nice, a bronze scale armor, I would need {5 copper ores},{5 tin ores} and {50 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 5
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
		
		if(getPlayerItemCount(cid, 2261) >= 5 and getPlayerItemCount(cid, 2311) >= 5) then
			if(doPlayerRemoveMoney(cid, 50)) then
				doPlayerRemoveItem(cid, 2261, 5)
				doPlayerRemoveItem(cid, 2311, 5)
				doPlayerAddItem(cid,2476,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough copper or tin.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'iron chain armor') and talkState[talkUser] == 2) then
	 	selfSay('Great!, a iron chain armor, I would need {5 iron ores} and {50 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 12
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 12) then
		
		if(getPlayerItemCount(cid, 5880) >= 5) then
			if(doPlayerRemoveMoney(cid, 50)) then
				doPlayerRemoveItem(cid, 5880, 5)
				doPlayerAddItem(cid,2485,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough iron.', cid)
		end
		talkState[talkUser] = 1


elseif(msgcontains(msg, 'shield') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {iron studded shield} (Def:17), {bronze kite shield} (Def:22), {iron kite shield} (Def:25).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'iron studded shield') and talkState[talkUser] == 2) then
	 	selfSay('So.. Iron Studded Shield, I would need {3 wood planks}, {1 iron ore}  and {8 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 6
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 5901) >= 3 and  getPlayerItemCount(cid, 5880) >= 1) then
			if(doPlayerRemoveMoney(cid, 8)) then
				doPlayerRemoveItem(cid, 5901, 3)
				doPlayerRemoveItem(cid, 5880, 1)
				doPlayerAddItem(cid,2467,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood or iron.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'bronze kite shield') and talkState[talkUser] == 2) then
	 	selfSay('Ok then.. bronze kite shield, I would need {5 copper ores}, {5 tin ores} and {20 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 7
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		
				if(getPlayerItemCount(cid, 2261) >= 5 and getPlayerItemCount(cid, 2311) >= 5) then
			if(doPlayerRemoveMoney(cid, 20)) then
				doPlayerRemoveItem(cid, 2261, 5)
				doPlayerRemoveItem(cid, 2311, 5)
				doPlayerAddItem(cid,2511,1)
				selfSay('Here you are.', cid)
			else
				
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough copper or tin.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'iron kite shield') and talkState[talkUser] == 2) then
	 	selfSay('Nice, a iron kite shield, I would need {5 iron ores} and {25 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 8
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then
		
		if(getPlayerItemCount(cid, 5880) >= 5)then
			if(doPlayerRemoveMoney(cid, 25)) then
				doPlayerRemoveItem(cid, 5880, 5)
				doPlayerAddItem(cid,2513,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough iron.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'helmet') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {studded helmet} (Arm:2), {iron helmet} (Arm:5).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'studded helmet') and talkState[talkUser] == 2) then
	 	selfSay('So.. Studded helmet, I would need {2 leathers}, and {8 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 9
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 9) then
		
		if(getPlayerItemCount(cid, 5878) >= 2 )then
			if(doPlayerRemoveMoney(cid, 8)) then
				doPlayerRemoveItem(cid, 5878, 2)
				doPlayerAddItem(cid,2482,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough leather.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'iron helmet') and talkState[talkUser] == 2) then
	 	selfSay('Ok, one iron helmet, I would need {3 iron ore} and {50 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 10
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then
		
		if(getPlayerItemCount(cid, 5880) >= 3)then
			if(doPlayerRemoveMoney(cid, 10)) then
				doPlayerRemoveItem(cid, 5880, 3)
				doPlayerAddItem(cid,2459,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough iron.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'legs') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {iron chain legs} (Arm:4).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'iron chain legs') and talkState[talkUser] == 2) then
	 	selfSay('So.. iron chain legs, I would need {4 iron ores}, and {30 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 11
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then
		
		if(getPlayerItemCount(cid, 5880) >= 4)then
			if(doPlayerRemoveMoney(cid, 30))then
				doPlayerRemoveItem(cid, 5880, 4)
				doPlayerAddItem(cid,2648,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough iron.', cid)
		end
		talkState[talkUser] = 1


	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
