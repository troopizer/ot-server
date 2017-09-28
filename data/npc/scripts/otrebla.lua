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

	if(msgcontains(msg, 'guard')) then
				selfSay('We have people in many posts around Bree, and they are fighting bandits and renegades. ', cid)
				selfSay('Ahh the renegades! They are our most dangerous enemy. In this region there isnt Orc, but men can be evil as well.', cid)

	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'bree chapter 2')) then
			if(getPlayerStorageValue(cid,2018) == 0) then
				selfSay('Soo the Captain send you, thats great, you look strong enough to help.', cid)
				setPlayerStorageValue(cid,2018,1)
				selfSay('Do want to start working? I have a {mission} for you.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2018) < 0) then
					selfSay('Our Captain in Bree may give you a mission..', cid)
			elseif(getPlayerStorageValue(cid,2018) == 1 and getPlayerStorageValue(cid,2019) < 0) then
					selfSay('The renegades have a town north from here, and near the town some bandits have a camp to sell them supplies, can you go there an still some weapons from them?, {yes}?', cid)
			end
			if(getPlayerStorageValue(cid,2019) == 0) then
				if(getPlayerItemCount(cid, 7385) >= 3) then
					doPlayerRemoveItem(cid, 7385, 3)
					setPlayerStorageValue(cid,2019,1)
					doPlayerAddExperience(cid,1000)
					doPlayerAddItem(cid,2148,200)					
					selfSay('Good job! (You have received 1000 experience and 200 gp)', cid)
				end
			elseif(getPlayerStorageValue(cid,2019) == 1 and getPlayerStorageValue(cid,2037) < 0) then
				selfSay('Its time to teach those renegades who owns this land. Are you up to the task? Would you kill 10 of them?, {yes}?', cid)
				talkState[talkUser] = 2
			end
			if(getPlayerStorageValue(cid,2037) == 10) then
					setPlayerStorageValue(cid,2037,11)
					doPlayerAddExperience(cid,3000)
					doPlayerAddItem(cid,2152,5)					
					selfSay('Just Great! You teach those bastards a good lesson. (You have received 3000 experience and 500 gp)', cid)
			elseif(getPlayerStorageValue(cid,2037) == 11 and getPlayerStorageValue(cid,2039) < 0) then			
					selfSay('You really like to work, I like that kid.. man! I should say after that last mission. I need you to break into the renegades town, are you ready?, {yes}?', cid)
						talkState[talkUser] = 3
			end
			if(getPlayerStorageValue(cid,2039) == 1) then
					setPlayerStorageValue(cid,2039,2)
					doPlayerAddExperience(cid,3000)
					doPlayerAddItem(cid,2152,5)					
					selfSay('Thanks that info will be very useful. (You have received 3000 experience and 500 gp)', cid)
			elseif(getPlayerStorageValue(cid,2039) == 2 and getPlayerStorageValue(cid,2048) < 0) then		
					selfSay('The spy told us that one of the renegades generals is in this fortress, his name is Harald Ferner and is in the northern part of the settlement.', cid)			
					selfSay('Harald Ferner is a very strong warrior, but you have proved your self as well, can you go after him?, {yes}?', cid)	
						talkState[talkUser] = 4		
			end
			if(getPlayerStorageValue(cid,2048) == 1) then
					setPlayerStorageValue(cid,2048,2)
					doPlayerAddExperience(cid,15000)
					doPlayerAddItem(cid,2152,15)
					doPlayerAddItem(cid,2483,1)
				    doPlayerAddOutfit(cid, 4, 1)					
					selfSay('Thanks for all your work, you are a great warrior! I will tell everyone about your strong spirit, take this reward. (You have received 15000 experience, 1500 gp, an addon and a iron scale armor)', cid)
 			elseif(getPlayerStorageValue(cid,2048) == 2) then		
					selfSay('I dont have more missions for you my friend', cid)			
	
			end	
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this beatiful town where we are, is the center of men in this area. It might be just a little town, but we work every day to make it greater.', cid)

	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2019) < 0) then
				selfSay('Thats the spirit! Still 3 crimson swords from them and bring them here, good luck.', cid)
				setPlayerStorageValue(cid,2019,0)
			end
		elseif(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2019) == 1 and getPlayerStorageValue(cid,2037) < 0) then
				selfSay('You are a great warrior! Go north from the bandits camp and yo will find the town of the renegades. Kill 10 of them, but be careful.', cid)
				setPlayerStorageValue(cid,2037,0)
			end
		elseif(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2037) == 11 and getPlayerStorageValue(cid,2039) < 0) then
				selfSay('Great! Into the town the renegades have a prison under the town hall, there you will find Harry, he is an agent of us that let the renegades to capture him.', cid)
				selfSay('Find him and listen to his report, good luck!', cid)				
				setPlayerStorageValue(cid,2039,0)
			end
		elseif(talkState[talkUser] == 4) then
			if(getPlayerStorageValue(cid,2039) == 2 and getPlayerStorageValue(cid,2048) < 0) then
				selfSay('Good luck! Look for more warriors to go with you. I will be waiting for you.', cid)		
				setPlayerStorageValue(cid,2048,0)
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
