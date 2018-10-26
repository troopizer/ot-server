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
if (getPlayerStorageValue(cid,2102) < 0) then
	selfSay('Soo you are looking for a job?.', cid)
 	selfSay('Im a leatherworker, the best one in this lands. I need some boar fur for my work.', cid)
 	 selfSay('If you get some fur for me, I will craft armors for you, but you will have to get the materials.{ok}?', cid)
end
if (getPlayerStorageValue(cid,2102) == 0) then
if(getPlayerItemCount(cid, 5883) >= 20) then
				doPlayerRemoveItem(cid, 5883, 20)
selfSay('Thanks! Now lets speak about {forge}.(You recived 10000 exp)', cid)
setPlayerStorageValue(cid,2102,1)
doPlayerAddExperience(cid,10000)
end
end
		talkState[talkUser] = 4
elseif(msgcontains(msg, 'ok') and talkState[talkUser] == 4) then
	setPlayerStorageValue(cid,30010,9)
	setPlayerStorageValue(cid,2102,0)
	selfSay('Thanks! Get 20 boar furs.', cid)
end
if (getPlayerStorageValue(cid,2040) == 1) then

	if(msgcontains(msg, 'forge')) then
		talkState[talkUser] = 1
		selfSay('Do you want to forge: {strong leather armor} or {hunter quilted armor}?', cid)

	elseif(msgcontains(msg, 'strong leather armor') and talkState[talkUser] == 1) then
	 	selfSay('Strong leather armor (Arm:12, Physical:-2%, meele: +2), I would need {5 iron ores},{30 boar furs} and {30 leathers}, do you have they?.', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if(getPlayerItemCount(cid, 5883) >= 30 and getPlayerItemCount(cid, 5880) >= 5 and getPlayerItemCount(cid, 5878) >= 30) then
				doPlayerRemoveItem(cid, 5883, 30)
				doPlayerRemoveItem(cid, 5880, 5)
				doPlayerRemoveItem(cid, 5878, 30)
				doPlayerAddItem(cid,8876,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough iron, fur or leather.', cid)
		end
		talkState[talkUser] = 0

	elseif(msgcontains(msg, 'hunter quilted armor') and talkState[talkUser] == 1) then
	 	selfSay('Hunter quilted armor (Arm:12, Dist:+2), I would need {20 warg wolf fur},{30 boar furs} and {30 leather}, do you have they?.', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		if(getPlayerItemCount(cid, 5883) >= 30 and getPlayerItemCount(cid, 11235) >= 20 and getPlayerItemCount(cid, 5878) >= 30) then
				doPlayerRemoveItem(cid, 5883, 30)
				doPlayerRemoveItem(cid, 11235, 20)
				doPlayerRemoveItem(cid, 5878, 30)
				doPlayerAddItem(cid,8874,1)
				selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have enough fur  or leather.', cid)
		end
		talkState[talkUser] = 0
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
