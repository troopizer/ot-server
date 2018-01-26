local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 			end
function onCreatureSay(cid, type, msg) 			npcHandler:onCreatureSay(cid, type, msg) 		end
function onThink() 					npcHandler:onThink() 					end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'information')) then
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('I have been told that Gerontius Took "The Old Took" is currently the Thain of the Shire and Edward Oatny is our Mayor, he is a fine mayor, but his clothes.. anyway.', cid)
	end
	if(msgcontains(msg, 'mission')) then
    if (getPlayerStorageValue(cid,2040) == 0) then
		selfSay('A mission? who send you?.', cid)
	else
		selfSay('I dont know nothing about a mission, so sorry my dear.', cid)
	end
    elseif(msgcontains(msg, 'harin')) then
     if (getPlayerStorageValue(cid,2040) == 0) then
	selfSay('Harin.. harin.. mmhh, let my see my notation book, I see so many people that its wise to have one.', cid)
	selfSay('Harin! here he is, almost 15 years ago he left here an amulet and never came back, it has been so long that if you say that you come in his name, it should be truth, wait.. .', cid)
	selfSay('Here it is. Send my regards to Harin.', cid)
	doPlayerAddItem(cid, 10218, 1)
	setPlayerStorageValue(cid,2040,1)
end
end
end
-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local node1 = keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I dont have right now my dear.'})
local node2 = keywordHandler:addKeyword({'tales'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My dear, I have heard many things, but I dont have time now.'})
npcHandler:addModule(FocusModule:new())
local node3 = keywordHandler:addKeyword({'bandits'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dear, around all towns you can find groups of bandits and Bree isnt the exception. But I dont know where is their lair.'})
npcHandler:addModule(FocusModule:new())

