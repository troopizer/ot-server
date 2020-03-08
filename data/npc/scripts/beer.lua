local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
local random_texts = {
	'SNOB!',
	'SNOB!',
	'SNOB! Go and take the order.',
	'SNOB! Can you clean the floor?.',
	'WE HAVE FRESH BREAD! Who wants some?',
	'WE HAVE FRESH BREAD! Who wants some?',
	'What a nice day...'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 20)
		if(math.random(100) < 30) then
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
	if(msgcontains(msg, 'bree')) then
	selfSay('This town is Bree, the biggest of men in Eriador. Its a good place to learn basic skills and start your adventures', cid)
	if (getPlayerStorageValue(cid,2304) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2304,4)
			setPlayerStorageValue(cid,2305,150)
		end
	end
	if(msgcontains(msg, 'prancing pony')) then
	selfSay('The Prancing Pony is my Inn, travelers of all kind stop here for drinks and food.', cid)
	end
	if(msgcontains(msg, 'bandits')) then
		selfSay('Dear.. around all towns you can find groups of bandits and Bree isnt the exception. But I dont know where is their lair.', cid)
	end
	if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'info')) then
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('I have been told that Gerontius Took "The Old Took" is currently the Thain of the Shire and Edward Oatny is our Mayor, he is a fine mayor, but his clothes.. anyway.', cid)
	end
	if(msgcontains(msg, 'butterbur')) then
				selfSay('I am Hopnis Butterbur. My father pass away a few years ago and left me this Inn as heritage.', cid)
				selfSay('I have been taking care of this place since I was a little lady, and I will keep doing until my last day.', cid)
				selfSay('Ohh my dear, I am not so young now, but I love this place. The only thing that drives me crazy is that little hobbit, Snob. I have to tell him everything twice.. , but is a good boy.', cid)
				selfSay('He is the only one helping me. My husband is constantly traveling, he dont like working here (maybe because we use the last name of my family). So he often travel selling stuff.', cid)
				selfSay('This time he went to Tharbad, I hope he returns soon, that ugly city is a hotbed of thieves.', cid)
				if (getPlayerStorageValue(cid,2304) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2304,4)
			setPlayerStorageValue(cid,2305,150)
		end
	end
	if(msgcontains(msg, 'mission')) then
    if (getPlayerStorageValue(cid,2040) == 0) then 
    	selfSay('A mission? who send you?.', cid)
	else
		selfSay('I dont know nothing about a mission, so sorry my dear.', cid)
	end
    elseif(msgcontains(msg, 'harin')) then
     if (getPlayerStorageValue(cid,2040) == 0) then
	selfSay('Harin.. harin.. mmhh, let my see my notations book, I see so many people that its wise to have one.', cid)
	selfSay('Harin! here he is, almost 15 years ago he left here an amulet and never came back. It has been so long. If you say that you come in his name, it should be truth, wait.. .', cid)
	selfSay('Here it is. Send my regards to Harin.', cid)
	doPlayerAddItem(cid, 10218, 1)
	setPlayerStorageValue(cid,2040,1)
end
end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

