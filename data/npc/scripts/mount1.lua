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

if(msgcontains(msg, 'mission') or msgcontains(msg, 'mount')) then
	if (getPlayerStorageValue(cid,2058) == 0) then
		if(getPlayerItemCount(cid, 5954) >= 3) then
			if(doPlayerRemoveMoney(cid, 5000)) then
				doPlayerRemoveItem(cid, 5954, 3)
				selfSay('Great!, This donkey will be very useful for you.(You recived 8000 exp)', cid)
				doPlayerAddMount(cid, 13)
				setPlayerStorageValue(cid,2058,1)
				doPlayerAddExperience(cid,8000)
				x=getPlayerStorageValue(cid,2305)+1
				setPlayerStorageValue(cid,2305,x)
				if (getPlayerStorageValue(cid,2305) > 209 and getPlayerStorageValue(cid,2304) == 4) then
					setPlayerStorageValue(cid,2304,5)
				end
				if (getPlayerStorageValue(cid,2305) < 210 and getPlayerStorageValue(cid,2304) == 5) then
					setPlayerStorageValue(cid,2304,4)
				end
			else
				selfSay('Bring more money.', cid)
			end
			else
				selfSay('You need to get 3 horns.', cid)
			end
	elseif (getPlayerStorageValue(cid,2058) == 1) then
		selfSay('Are you enjoying your donkey?', cid)
		return false
	end
	if (getPlayerStorageValue(cid,2058) < 0) then
		selfSay('Im John the owner of this farm, the best farm of Bree. I may have a mission for you and if you help me, I will sell you a nice donkey.', cid)
		selfSay('I enjoy collecting animals trophies, but I have never hunted water buffaloes. If you bring me 3 horns, I will sell you a donkey for 5000 gp, {ok}?.', cid)
		if (getPlayerStorageValue(cid,2304) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2304,4)
			setPlayerStorageValue(cid,2305,150)
		end
	end
end
if(msgcontains(msg, 'ok')) then
	if (getPlayerStorageValue(cid,2058) < 0) then
		selfSay('Nice! Bring me {3 horns} from {water buffaloes}. If you follow the north road north, you can find them.', cid)
		setPlayerStorageValue(cid,30003,3)
		setPlayerStorageValue(cid,2058,0)
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
