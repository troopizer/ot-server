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
	if (getPlayerStorageValue(cid,2136) == 0) then
		if(getPlayerItemCount(cid, 2687) >= 10 and getPlayerItemCount(cid, 2692) >= 20 and getPlayerItemCount(cid, 7158) >= 10) then
				doPlayerRemoveItem(cid, 2687, 10)
				doPlayerRemoveItem(cid, 2692, 20)
				doPlayerRemoveItem(cid, 7158, 10)
				selfSay('Thanks! But I have another problem.. Here in greefields the population of {greenfields rabbits} its too high, {kill 10} of them and we will finish our business.', cid)
				setPlayerStorageValue(cid,2136,1)
			else
				selfSay('I will wait...', cid)
			end
	elseif (getPlayerStorageValue(cid,2136) == 11) then
		selfSay('Thanks! You are very king for being of the big people.', cid)
		selfSay('Here is your payment and your new sheep.(You earned 1000 gp, a mount and 10000 exp)', cid)
		doPlayerAddMount(cid, 4)
		doPlayerAddExperience(cid,10000)
		doPlayerAddItem(cid,2152,10)
		setPlayerStorageValue(cid,2136,12)
	end
	if (getPlayerStorageValue(cid,2136) < 0) then
		selfSay('If you are looking for job, I can use some help... even if your an outsider.', cid)
		selfSay('I am in the need of some supplies. If you manage to get them, I will pay you and even teach you how to ride a black sheep, {ok}?.', cid)
		selfSay('Yes..thats right, I will teach you how to ride sheeps.', cid)
	end
end
if(msgcontains(msg, 'ok')) then
	if (getPlayerStorageValue(cid,2136) < 0) then
		selfSay('Nice! Bring me {20 portions of flour}, {10 cookies} and {10 rainbow trouts}. I will be waiting.', cid)
		setPlayerStorageValue(cid,30023,22)
		setPlayerStorageValue(cid,2136,0)
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
