local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'recruit')) then
			if(getPlayerStorageValue(cid,2201) < 0 and getPlayerStorageValue(cid,2202) < 0) then
				selfSay('I can recruit a {bree mercenary} or a {bree archer} for you chief.', cid)
				talkState[talkUser] = 1	
			elseif(getPlayerStorageValue(cid,2201) < 0) then
				selfSay('I can recruit a {bree mercenary} for you chief.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2202) < 0) then
				selfSay('I can recruit a {bree archer} for you chief.', cid)
				talkState[talkUser] = 1			
			elseif(getPlayerStorageValue(cid,2201) == 3 and getPlayerStorageValue(cid,2202) == 3) then
				selfSay('I can recruit a {bree mercenary} or a {bree archer} for you chief.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2201) == 3) then
				selfSay('I can recruit a {bree mercenary} for you chief.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2202) == 3) then
				selfSay('I can recruit a {bree archer} for you chief.', cid)
				talkState[talkUser] = 1
			else
				selfSay('you cant hire any more mercenaries chief.', cid)
			end
			
 	elseif(msgcontains(msg, 'bree mercenary')) then
 		if(talkState[talkUser] == 1) then
			selfSay('For 1000 gp you can hire one mercenary and call him 3 times. You will have to say {bree mercenary call}, it will consume 200 mana and 40 soul points, {ok}?.', cid)
		talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2201) < 0 or getPlayerStorageValue(cid,2201) == 3) then
				if(doPlayerRemoveMoney(cid, 1000)) then
				selfSay('Ok, now he is yours to call.', cid)
				doPlayerRemoveMoney(cid, 1000)
				setPlayerStorageValue(cid,30031,30)
				setPlayerStorageValue(cid,2201,0)
				talkState[talkUser] = 0
				else
				selfSay('You will need more gold.', cid)
				talkState[talkUser] = 0			
				end
			end
		end
		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2202) < 0 or getPlayerStorageValue(cid,2202) == 3) then
				if(doPlayerRemoveMoney(cid, 2000)) then
				selfSay('Ok, now he is yours to call.', cid)
				setPlayerStorageValue(cid,30031,30)
				setPlayerStorageValue(cid,2202,0)
				talkState[talkUser] = 0
				else
				selfSay('You will need more gold.', cid)
				talkState[talkUser] = 0			
				end
			end
		end
 	elseif(msgcontains(msg, 'bree archer')) then
 		if(talkState[talkUser] == 1) then
			selfSay('For 2000 gp you can hire one archer and call him 3 times. You will have to say {bree archer call}, it will consume 200 mana and 40 soul points, {ok}?.', cid)
		talkState[talkUser] = 3
		end

	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok. I understand.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
