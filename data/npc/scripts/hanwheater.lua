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
	if (getPlayerStorageValue(cid,2308) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2308,4)
			setPlayerStorageValue(cid,2309,150)
end
	if (getPlayerStorageValue(cid,2135) == 0) then
		if(getPlayerItemCount(cid, 2691) >= 10) then
			doPlayerRemoveItem(cid, 2691, 10)
			selfSay('Thanks! this is the recipe for {cookies} (You recived 7000 exp, 1000 gp and look your cooking trait).', cid)
			setPlayerStorageValue(cid,2135,1)
			setPlayerStorageValue(cid,30024,23)
			setPlayerStorageValue(cid,2137,0)
			doPlayerAddExperience(cid,7000)
			doPlayerAddItem(cid,2152,10)
			x=getPlayerStorageValue(cid,2309)+4
				setPlayerStorageValue(cid,2309,x)
				if (getPlayerStorageValue(cid,2309) > 60 and getPlayerStorageValue(cid,2308) == 4) then
					setPlayerStorageValue(cid,2308,5)
				end
		else
		selfSay('I am sure you will get it.', cid)
		end
	end	
	if(getPlayerStorageValue(cid,2135) < 0) then
		selfSay('I really like to cook, I can make the best cookies in the Shire.', cid)
		selfSay('But I have heared about a very strange bread that is made in Bywater. If you get some of that bread for me, I will pay you. {ok}?.', cid)
	end
elseif(msgcontains(msg, 'no')) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
end
if(msgcontains(msg, 'ok')) then
if(getPlayerStorageValue(cid,2135) < 0) then
selfSay('Good. Bring me 10 of those breads.. {halfling bread of speed} are they called. If you manage to get them I will teach you how to make cookies.', cid)
setPlayerStorageValue(cid,30023,22)
setPlayerStorageValue(cid,2135,0)
end
end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
