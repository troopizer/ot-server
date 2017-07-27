local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if (not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = (NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid)
	
	-----------------------------------------------------------------------
	-- GENERAL INTERACTION                                               --

	if (getPlayerStorageValue(cid,2011) < 0) then
		selfSay("It was self defense ! There is anything in here.", cid)
		return false
	end
	if (getPlayerStorageValue(cid,2011) == 0) then
		selfSay("What interested a Bree citizen from the Souther Downs so much that come all the way up here to fight some bandits?", cid)
		setPlayerStorageValue(cid,2011,1)
		return false
	end

	-----------------------------------------------------------------------
	-- QUEST INTERACTION                                                 --

	if (msgcontains(msg, 'boots') or msgcontains(msg, 'lost') or msgcontains(msg, 'farflank') or msgcontains(msg, 'sergaent') or msgcontains(msg, 'mission')) then
		if (getPlayerStorageValue(cid,2011) == 1) then
			selfSay("The boots? That good-for-nothing Sergaent tried to catch us and threw his boots at us. Obviuosly he didn't aimed. Those boots do not worth a gold coin (now a days inflation is scary high, thats why I'm here, saving my family from hunger).", cid)
			selfSay("Anyway, the boots went straight down to the pit where the spiders are. It's probable a tarantula ate them.", cid)
			setPlayerStorageValue(cid,2011,2)
			return true
		end

		return false
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
