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
		selfSay("What are you doing here? This is a very dangerous place for someone like you. Go back to Bree and talk to it's Mayor.", cid)
		return false
	end

	-----------------------------------------------------------------------
	-- GENERAL INTERACTION                                               --

	if msgcontains(msg, 'forest') or msgcontains(msg, 'information') then
		selfSay("To know where you are heading is key in a journey. To gather good information of the destination is a skill all wanderers require.", cid)
		selfSay("In every town there are people who know hidden or forbidden places. As a traveler one have to know how to get this information.", cid)
		selfSay("Sometimes is just by talking at a bar. Others just ask for gold in return.", cid)
		selfSay("Good Luck", cid)
	end

	-----------------------------------------------------------------------
	-- QUEST INTERACTION                                                 --
if msgcontains(msg,'ulubb') or msgcontains(msg,'Ulubb') or msgcontains(msg,'travel') or msgcontains(msg,'mission') then
	if getPlayerStorageValue(cid,2016) < 0 then
		selfSay("I' traveling with Ulubb, but we got separeted while escaping from a bear.", cid)
		selfSay("Have you seen him?", cid)
		return false
	end
	if getPlayerStorageValue(cid,2016) == 0 then
		selfSay("Have you seen Ulubb?!", cid)
	if msgcontains(msg,'yes') then
		selfSay("So he went north. I know how to reach him now. It's only one way.", cid)
		selfSay("Thank you kind extranger. I reward you with in what we explorers are rich: experience. (you received 1500 experience)", cid)
		setPlayerStorageValue(cid,2016,1)
		doPlayerAddExperience(cid,1500)
	elseif msgcontains(msg,'no') then
		selfSay("Ok.. thanks anyway.", cid)
	end
	end

	return false
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
