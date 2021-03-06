local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
local random_texts = {
	'Some day the renegades will fall...',
	'We need more men...',
	'Some day the renegades will fall...',
	'We need more men...',
	'Sergeant! Come here!'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 35)
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

	if(msgcontains(msg, 'edward') or msgcontains(msg, 'mayor')) then
		selfSay('Edward Mapleton is the mayor of Bree and my father.', cid)
	end
	if(msgcontains(msg, 'Osbald')) then
selfSay('Osbald Underhill is the most important hobbit in Staddle. He manages most of the village.', cid)
end
	if(msgcontains(msg, 'jeff')) then
		selfSay('My name is Jeff Mapleton. Since a few years I have been the captain of the Bree guards.', cid)
		selfSay('My father, the mayor, gave me this task. He is no warrior, so I take the responsibility of defending our land.', cid)
		selfSay('Since then, me and my men have been fighting those bastards of the renegades.', cid)
	end
	if(msgcontains(msg, 'captain') or msgcontains(msg, 'guard')) then
				selfSay('I am the leader of Brees militia, this is our headquarter. Here we train in order to defend peace.', cid)
				selfSay('We have people in many posts around Bree, and they are fighting bandits and renegades. ', cid)
				selfSay('Ahh the renegades! They are our most dangerous enemy. In this region there are no Orcs, but men can be evil as well. Maybe you may want to work with us in some {mission}? ', cid)
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'bree chapter 2')) then
			if(getPlayerStorageValue(cid,2018) < 0) then
				selfSay('The Eriador Renegades give us problems in many areas, but in east Brandiwyne hills (To the west of Bree) they have a great settlement, full of warriors.', cid)
				selfSay('One of my comrades is leading a force over there, Can you go there and help him? {yes}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2018) >= 0) then
					selfSay('I dont have more missions for you right now. You can see our {most wanted} list. Or maybe you are here for a {reward}?', cid)
			end
	elseif(msgcontains(msg, 'most wanted') or msgcontains(msg, 'dead or alive')) then
			selfSay('This is our newest most wanted list, kill the targets and get a nice reward.', cid)
			if (getPlayerStorageValue(cid,2304) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2304,4)
			setPlayerStorageValue(cid,2305,150)
		end
			if(getPlayerStorageValue(cid,2038) < 0) then
				selfSay('New Target.', cid)
				setPlayerStorageValue(cid,30009,8)
				setPlayerStorageValue(cid,2038,0)
			end
			if(getPlayerStorageValue(cid,2111) < 0) then
				selfSay('New Target.', cid)
				setPlayerStorageValue(cid,30009,8)
				setPlayerStorageValue(cid,2111,0)
			end
			if(getPlayerStorageValue(cid,2154) < 0) then
				selfSay('New Target.', cid)
				setPlayerStorageValue(cid,30009,8)
				setPlayerStorageValue(cid,2154,0)
			end
	elseif(msgcontains(msg, 'reward')) then
			if(getPlayerStorageValue(cid,2038) == 1) then
				selfSay('Great job! (you received 10000 experience, 500 gold and 1 iron soldier helmet).', cid)
				doPlayerAddExperience(cid,10000)
				doPlayerAddItem(cid,2148,500)
				doPlayerAddItem(cid,2481,1)
				setPlayerStorageValue(cid,2038,2)
				x=getPlayerStorageValue(cid,2305)+2
				setPlayerStorageValue(cid,2305,x)
				if (getPlayerStorageValue(cid,2305) > 209 and getPlayerStorageValue(cid,2304) == 4) then
					setPlayerStorageValue(cid,2304,5)
				end
				if (getPlayerStorageValue(cid,2305) < 210 and getPlayerStorageValue(cid,2304) == 5) then
					setPlayerStorageValue(cid,2304,4)
				end
			elseif(getPlayerStorageValue(cid,2111) == 1) then
				selfSay('Great job! (you received 50000 experience, 8000 gold and 1 small diamond).', cid)
				doPlayerAddExperience(cid,50000)
				doPlayerAddItem(cid,2152,80)
				doPlayerAddItem(cid,2145,1)
				setPlayerStorageValue(cid,2111,2)
				x=getPlayerStorageValue(cid,2305)+2
				setPlayerStorageValue(cid,2305,x)
				if (getPlayerStorageValue(cid,2305) > 209 and getPlayerStorageValue(cid,2304) == 4) then
					setPlayerStorageValue(cid,2304,5)
				end
				if (getPlayerStorageValue(cid,2305) < 210 and getPlayerStorageValue(cid,2304) == 5) then
					setPlayerStorageValue(cid,2304,4)
				end
			elseif(getPlayerStorageValue(cid,2154) == 1) then
				selfSay('Great job! (you received 60000 experience, 10000 gold and 1 small diamond).', cid)
				doPlayerAddExperience(cid,60000)
				doPlayerAddItem(cid,2152,100)
				doPlayerAddItem(cid,2145,1)
				setPlayerStorageValue(cid,2154,2)
				x=getPlayerStorageValue(cid,2305)+2
				setPlayerStorageValue(cid,2305,x)
				if (getPlayerStorageValue(cid,2305) > 209 and getPlayerStorageValue(cid,2304) == 4) then
					setPlayerStorageValue(cid,2304,5)
				end
				if (getPlayerStorageValue(cid,2305) < 210 and getPlayerStorageValue(cid,2304) == 5) then
					setPlayerStorageValue(cid,2304,4)
				end
			else
				selfSay('You have not earned any rewards.', cid)
			end
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this beatiful town where we are, is the center of men in this area. It might be just a little town, but we work every day to make it greater.', cid)

	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2018) < 0 and getPlayerStorageValue(cid,2007) == 4) then
				selfSay('Great Sergeant Otrebla will be very pleased with your reinforcement.', cid)
				setPlayerStorageValue(cid,30007,2)
				setPlayerStorageValue(cid,2018,0)
				doPlayerAddExperience(cid,500)
			elseif(getPlayerStorageValue(cid,2007) < 4) then
				selfSay('You haven´t enough experience, go and talk with the mayor about missions.', cid)
			elseif(getPlayerStorageValue(cid,2018) >= 0) then
				selfSay('I dont have more missions for you right now.', cid)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
