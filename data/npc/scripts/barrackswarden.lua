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

	if(msgcontains(msg, 'administrate')) then
			if(getPlayerStorageValue(cid,2202) < 0) then
				selfSay('Do you want to hire a {Bree Mercenaries Officer}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2202) == 0) then
					selfSay('You cant hire any more officers.', cid)
			end			
 	elseif(msgcontains(msg, 'bree mercenaries officer')) then
 		if(talkState[talkUser] == 1) then
			selfSay('For 30000 gp you can hire a bree mercenaries officer. He will help you to hire bree mercenary infantry, {ok}?.', cid)
		talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2202) < 0) then
				if(doPlayerRemoveMoney(cid, 30000)) then
					selfSay('Its done my lord.', cid)
					setPlayerStorageValue(cid,2202,0)
					x=Position(573, 952, 6)
					doCreateNpc("Bree Mercenaries Officer",x)
					talkState[talkUser] = 0
					selfSay('Anything else?', cid)
				else
					selfSay('You need more gold.', cid)
				end
			end
		end
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok. I understand.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
