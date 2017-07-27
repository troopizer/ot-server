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

	if(msgcontains(msg, 'make')) then
		selfSay('Do you want to make: {club}, {axe}, {sword} or {distance weapon} ?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'distance weapon') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {1 spear} (atk:25),{5 spear} (atk:25), {5 hunting spears} (atk:32), {bow}, {10 arrows} (atk:25), {100 arrows} (atk:25) or {100 sniper arrows} (atk:28) .', cid)
		talkState[talkUser] = 2 
	elseif(msgcontains(msg, '1 spear') and talkState[talkUser] == 2) then
	 	selfSay('To make a spear, I would need {1 wood plank} and {5 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		
		if(getPlayerItemCount(cid, 5901) >= 1) then
			if(doPlayerRemoveMoney(cid, 5)) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerAddItem(cid,2389,1)
				selfSay('Here you are.', cid)
if (getPlayerStorageValue(cid,2003) == 0) then
setPlayerStorageValue(cid,2003,1)
end

			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, 'bow') and talkState[talkUser] == 2) then
	 	selfSay('to build a bow, I would need {1 wood plank},{5 spider silk} and {50 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 4
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		
		if(getPlayerItemCount(cid, 5901) >= 1 and  getPlayerItemCount(cid, 5879) >= 5)then
			if(doPlayerRemoveMoney(cid, 50)) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 5879, 5)
				doPlayerAddItem(cid,2456,1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood or silk.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, '10 arrows') and talkState[talkUser] == 2) then
	 	selfSay('Nice, some arrows, I would need {1 wood plank} and {2 gold coins} to make 10 arrows, do you have they?.', cid)
		talkState[talkUser] = 5
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
		
		if(getPlayerItemCount(cid, 5901) >= 1)then
			if(doPlayerRemoveMoney(cid, 2)) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerAddItem(cid,2544,10)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, '100 arrows') and talkState[talkUser] == 2) then
	 	selfSay('Nice, so a lot of arrows, I would need {10 wood plank} and {20 gold coins} to make 100 arrows, do you have they?.', cid)
		talkState[talkUser] = 9
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 9) then
		
		if(getPlayerItemCount(cid, 5901) >= 10)then
			if(doPlayerRemoveMoney(cid, 20)) then
				doPlayerRemoveItem(cid, 5901, 10)
				doPlayerAddItem(cid,2544,100)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, '5 hunting spears') and talkState[talkUser] == 2) then
	 	selfSay('Nice, so hunting spears, I would need {5 wood plank} , {1 iron ore} and {30 gold coins} to make 5 hunting spears, do you have they?.', cid)
		talkState[talkUser] = 10
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then
		
		if(getPlayerItemCount(cid, 5901) >= 5  and getPlayerItemCount(cid, 5880) >= 1)then
			if(doPlayerRemoveMoney(cid, 30)) then
				doPlayerRemoveItem(cid, 5901, 5)
				doPlayerRemoveItem(cid, 5880, 1)
				doPlayerAddItem(cid,3965,5)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood or ores.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, '100 sniper arrows') and talkState[talkUser] == 2) then
	 	selfSay('Nice, so a lot of  sniper arrows, I would need {10 wood plank}, {1 iron ore} and {100 gold coins} to make 100 sniper arrows, do you have they?.', cid)
		talkState[talkUser] = 11
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then
		
		if(getPlayerItemCount(cid, 5901) >= 10 and getPlayerItemCount(cid, 5880) >= 1)then
			if(doPlayerRemoveMoney(cid, 20)) then
				doPlayerRemoveItem(cid, 5901, 10)
				doPlayerRemoveItem(cid, 5880, 1)
				doPlayerAddItem(cid,7364,100)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood or ores.', cid)
		end
		talkState[talkUser] = 1
elseif(msgcontains(msg, '5 spears') and talkState[talkUser] == 2) then
	 	selfSay('Nice, so spears, I would need {5 wood plank} , and {25 gold coins} to make 5 spears, do you have they?.', cid)
		talkState[talkUser] = 12
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 12) then
		
		if(getPlayerItemCount(cid, 5901) >= 5)then
			if(doPlayerRemoveMoney(cid, 25)) then
				doPlayerRemoveItem(cid, 5901, 5)
				doPlayerAddItem(cid,2389,5)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood.', cid)
		end
		talkState[talkUser] = 1

elseif(msgcontains(msg, 'club') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {iron morning star} (atk:25 def:18).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'iron morning star') and talkState[talkUser] == 2) then
	 	selfSay('To make a iron morning star, I would need {1 wood plank},{4 iron ores}, {1 leather} and {200 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 6
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then
		
		if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 5880) >= 4 and getPlayerItemCount(cid, 5878) >= 1) then
			if(doPlayerRemoveMoney(cid, 200)) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 5880, 4)
				doPlayerRemoveItem(cid, 5878, 1)
				doPlayerAddItem(cid,2394,1)
				selfSay('Here you are.', cid)
if (getPlayerStorageValue(cid,2003) == 0) then
setPlayerStorageValue(cid,2003,1)
end

			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood, iron or leather.', cid)
		end
		talkState[talkUser] = 1

elseif(msgcontains(msg, 'axe') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {iron battle axe} (atk:26 def:14).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'iron battle axe') and talkState[talkUser] == 2) then
	 	selfSay('To make a iron battle axe, I would need {1 wood plank},{4 iron ores}, {1 leather} and {200 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 7
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then
		
		if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 5880) >= 4 and getPlayerItemCount(cid, 5878) >= 1) then
			if(doPlayerRemoveMoney(cid, 200)) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 5880, 4)
				doPlayerRemoveItem(cid, 5878, 1)
				doPlayerAddItem(cid,8601,1)
				selfSay('Here you are.', cid)
if (getPlayerStorageValue(cid,2003) == 0) then
setPlayerStorageValue(cid,2003,1)
end

			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood, iron or leather.', cid)
		end
		talkState[talkUser] = 1

elseif(msgcontains(msg, 'sword') and talkState[talkUser] == 1) then
	 	selfSay('I can forge: {iron spike sword} (atk:24 def:21).', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'iron spike sword') and talkState[talkUser] == 2) then
	 	selfSay('To make a iron spike sword, I would need {1 wood plank},{4 iron ores}, {1 leather} and {200 gold coins}, do you have they?.', cid)
		talkState[talkUser] = 8
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then
		
		if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 5880) >= 4 and getPlayerItemCount(cid, 5878) >= 1) then
			if(doPlayerRemoveMoney(cid, 200)) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 5880, 4)
				doPlayerRemoveItem(cid, 5878, 1)
				doPlayerAddItem(cid,2383,1)
				selfSay('Here you are.', cid)
if (getPlayerStorageValue(cid,2003) == 0) then
setPlayerStorageValue(cid,2003,1)
end

			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have enough wood, iron or leather.', cid)
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
