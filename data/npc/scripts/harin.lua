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

if(msgcontains(msg, 'mission')) then
if (getPlayerStorageValue(cid,2040) < 0) then
	selfSay('A mission? I am a very old dwarf that use to live in Erebor, before the dragon came. Then I followed Thráin to the misty mountains and now I am here as prisoner.', cid)
 	selfSay('Now I am too old to scape, but this renegades still use me as armourer and I really like to work on that...', cid)
 	 selfSay('Maybe.. I do have a mission for you. If you go to Bree, look for an amulet that belong to my dead son and bring it to me, I will craft weapons for you, if you get the materials. I got coal, just iron I need too forge steel, {ok}?', cid)
end
if (getPlayerStorageValue(cid,2040) == 1) then
if(getPlayerItemCount(cid, 10218) >= 1) then
				doPlayerRemoveItem(cid, 10218, 1)
selfSay('Thanks! I can wait in peace now for my dead, now lets speak about {forge}.', cid)
setPlayerStorageValue(cid,2040,2)
end
end
		talkState[talkUser] = 4
elseif(msgcontains(msg, 'ok') and talkState[talkUser] == 4) then
	setPlayerStorageValue(cid,30003,3)
	setPlayerStorageValue(cid,2040,0)
	selfSay('I gave it to someone in Bree, but I cant remember who.. I will be waiting for you.', cid)
end
if (getPlayerStorageValue(cid,2040) == 2) then

	if(msgcontains(msg, 'forge')) then
		talkState[talkUser] = 1
		selfSay('Do you want to forge: {eriador great axe}, {eriador guardian sword} or {eriador battle mace}?', cid)

	elseif(msgcontains(msg, 'eriador great axe') and talkState[talkUser] == 1) then
	 	selfSay('eriador great axe, I would need {10 iron ores},{1 wood plank} and {1 leather}, do you have they?.', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 5880) >= 10 and getPlayerItemCount(cid, 5878) >= 1) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 5880, 10)
				doPlayerRemoveItem(cid, 5878, 1)
				doPlayerAddItem(cid,2415,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough iron, wood or leather.', cid)
		end
		talkState[talkUser] = 0

	elseif(msgcontains(msg, 'eriador guardian sword') and talkState[talkUser] == 1) then
	 	selfSay('eriador guardian sword, I would need {10 iron ores},{1 wood plank} and {1 leather}, do you have they?.', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 5880) >= 10 and getPlayerItemCount(cid, 5878) >= 1) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 5880, 10)
				doPlayerRemoveItem(cid, 5878, 1)
				doPlayerAddItem(cid,7386,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough iron, wood or leather.', cid)
		end
		talkState[talkUser] = 0

	elseif(msgcontains(msg, 'eriador battle mace') and talkState[talkUser] == 1) then
	 	selfSay('eriador battle mace, I would need {10 iron ores},{1 wood plank} and {1 leather}, do you have they?.', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 5880) >= 10 and getPlayerItemCount(cid, 5878) >= 1) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 5880, 10)
				doPlayerRemoveItem(cid, 5878, 1)
				doPlayerAddItem(cid,7452,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough iron, wood or leather.', cid)
		end
		talkState[talkUser] = 0
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
