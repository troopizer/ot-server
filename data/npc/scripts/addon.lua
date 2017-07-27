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

if(msgcontains(msg, 'mission') or msgcontains(msg, 'addon')) then
	if (getPlayerStorageValue(cid,2023) == 0) then
		if(getPlayerItemCount(cid, 5878) >= 10 and  getPlayerItemCount(cid, 5913) >= 10) then
				doPlayerRemoveItem(cid, 5878, 10)
				doPlayerRemoveItem(cid, 5913, 10)
				selfSay('Great!, now I can make your backpack.', cid)
				doPlayerAddAddon(cid, 1, 1)
				setPlayerStorageValue(cid,2023,1)
		else
				selfSay('I need the materials to start working, you have to get them.', cid)
		end
	end
	if (getPlayerStorageValue(cid,2023) == 1) then
		selfSay('Are you enjoying your backpack?', cid)
		return false
	end
	if (getPlayerStorageValue(cid,2023) < 0) then
		selfSay('My name is Jim and I am a backpack crafter. Its been a while since I did my last job.. Staddle is so boring!', cid)
		selfSay(' If you bring me the materials, I will craft one for you, {ok}?.', cid)
	end
end
if(msgcontains(msg, 'ok')) then
	if (getPlayerStorageValue(cid,2023) < 0) then
		selfSay('Nice! Bring me {10 leathers} and {10 brown pieces of cloth}. There is no production of cloth, but if you defeat some robbers and bandits, you can get them.', cid)
		setPlayerStorageValue(cid,30003,3)
		setPlayerStorageValue(cid,2023,0)
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())