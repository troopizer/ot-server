local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 			end
function onCreatureSay(cid, type, msg) 			npcHandler:onCreatureSay(cid, type, msg) 		end
local random_texts = {
	'Something to eat traveler?.',
	'Something to eat traveler?.',
	'You may buy a room.',
	'You may have a room.',
	'Be careful around here. There ara fierce wolves in the Lone Lands.',
	'Take the wild boars seriously, they are dangerous.',
	'the outlaws in Lone Lands, are stronger than in Bree-land.',
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 25)
		if(math.random(100) < 40) then
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
    if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'information')) then
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('I heard that Folcwine is the king of Rohan. Also Annúminas, the old city near Evendim lake west of Fornost, is under the control of the renegades and full of outlaws.', cid)
    end
	if(msgcontains(msg, 'mission')) then
    if(getPlayerStorageValue(cid,2050) == 0) then
		selfSay('A mission? who send you?.', cid)
    elseif(getPlayerStorageValue(cid,2050) == 1) then
    	if(getPlayerItemCount(cid,2668) >= 20) then
		doPlayerRemoveItem(cid,2668,20)
		selfSay('Nice, im sure it was a long journey, thanks you. Go back to Nargor with the supplies. (No item, you are carring the supplies)', cid)
		setPlayerStorageValue(cid,2050,2)
	    end
	elseif(getPlayerStorageValue(cid,2050) < 0 or getPlayerStorageValue(cid,2050) > 1) then
		selfSay('I dont know nothing about a mission, so sorry sweetheart.', cid)
	end
    elseif(msgcontains(msg, 'Nargor')) then
     if(getPlayerStorageValue(cid,2050) == 0) then
	selfSay('Nargor, the fierce ranger..so he needs supplies, but he knows that nothing is for free these days.', cid)
	selfSay('Many customers, especially dwarfs. Just love a recipe of salmon, that I cook time to time. But I am out of salmon.', cid)
	selfSay('The only place to get salmon, is buckland, too the far west. If you bring me 20 salmon units, I will give you the supplies.', cid)
	setPlayerStorageValue(cid,2050,1)
end
end
end
-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local node1 = keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Im afraid that we are out of beer.'})
local node2 = keywordHandler:addKeyword({'tales'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'sweetheart, I have heard many things, but I dont have time now.'})
npcHandler:addModule(FocusModule:new())
local node3 = keywordHandler:addKeyword({'bandits'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Around all towns you can find groups of bandits and here in the lone lands the pochers and savage are more dangerous than any bandit.'})
npcHandler:addModule(FocusModule:new())


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
