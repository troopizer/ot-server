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
	-- FILTER INTERACTION                                                --

	if (getPlayerStorageValue(cid,2007) ~= 4) then
		selfSay("What are you doing here? This is a very dangeurous place for someone like you. Go back to Bree and talk to it's Mayor.", cid)
		return false
	end

	-----------------------------------------------------------------------
	-- GENERAL INTERACTION                                               --

	if msgcontains(msg, 'explore') then
		selfSay("Exploring allows you to know places, stories and people.", cid)
		selfSay("We explorers and wanderers {know} stuff people on cities and towns haven't heard of.", cid)
	end
	if msgcontains(msg, 'know') then
		selfSay("As we travel we face many dangers. Therefore we are aware of our surroundings.", cid)
		selfSay("Ask we about the place where you find us.", cid)
	end

	-----------------------------------------------------------------------
	-- QUEST INTERACTION                                                 --

	if msgcontains(msg, 'mission') or msgcontains(msg, 'help') then
		if getPlayerStorageValue(cid,2016) < 0 then
			selfSay("I'm traveling with Urubb, but we got separeted while escaping from a bear.", cid)
			selfSay("It's probable he tries to reach the river and from there find me.", cid)
			selfSay("But this forest is so dense it might be the case there is no other way to the river other than this 'path'", cid)
			selfSay("I think he went south. So if you could go, I can stay by the river. Just in case.", cid)
			setPlayerStorageValue(cid,2016,0)
		end
	end

	return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
