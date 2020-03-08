local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
local random_texts = {
	'Annun adanath aglareb.',
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 20)
		if(math.random(100) < 10) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'mission') or msgcontains(msg, 'dunedain') or msgcontains(msg, 'ranger')) then
		if (getPlayerStorageValue(cid,2310) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2310,4)
			setPlayerStorageValue(cid,2311,150)
		end
		selfSay('...I dont have missions for you.', cid)

			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)
	elseif(msgcontains(msg, 'arador')) then
				selfSay('Yes, my name is Arador, son of Argonui. My father is currently the chieftain of the Dúnedain. My son Arathorn is being trained for now.', cid)
	elseif(msgcontains(msg, 'lone lands')) then
				selfSay('The Lone Lands is the name used by Hobbits and Bree-landers for the wilderness east of Bree-land. The west border are the Weather Hills and the east border is considered the Hoarwell river, where lies the last bridge.', cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
