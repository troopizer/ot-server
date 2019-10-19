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

	if(msgcontains(msg, 'mission') or msgcontains(msg, 'dunedain') or msgcontains(msg, 'ranger')) then
			if(getPlayerStorageValue(cid,2053) < 2) then
				selfSay('I have no mission for you, but thanks.', cid)
			elseif(getPlayerStorageValue(cid,2107) == 0) then
					selfSay('Shhh... there are some bandits around here.', cid)			
					selfSay('Shit! They discovered us!', cid)
				setPlayerStorageValue(cid,2107,1)
				x=getPlayerPosition(cid)
				doSummonCreature("lone lands horseman",x)
				doSummonCreature("lone lands horseman",x)
				doSummonCreature("lone lands hunter",x)
			elseif(getPlayerStorageValue(cid,2107) == 1) then
				selfSay('That was a close one! You are a very strong fighter, almost too much for a man.', cid)
				selfSay('Soo.. Arador send you. I have been spying most groups of outlaws and I manage to get some information. Can you give my report to Arador? {yes}?', cid)		
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2106) < 1) then
				selfSay('You should talk to Arador, my leader.', cid)		
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them from evil.', cid)
	elseif(msgcontains(msg, 'lone lands')) then
				selfSay('The Lone Lands is the name used by Hobbits and Bree-landers for the wilderness east of Bree-land. The west border are the Weather Hills and the east border is considered the Hoarwell river, where lies the last bridge.', cid)
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2107) == 1) then
				selfSay('Thanks! Send my regards to Arador.', cid)
				setPlayerStorageValue(cid,2107,2)
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
