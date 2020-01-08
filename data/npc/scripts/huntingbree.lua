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

	if(msgcontains(msg, 'adventurers') or msgcontains(msg, 'guild')) then
		selfSay('The Adventurers Guild is an organization of adventurers spread around Middle Earth. We give work and training to adventurers that are looking for the power to explore this lands.', cid)
		selfSay('If you join the guild you will get rewards like experience, money and some items, for accomplishing hunting missions. Or you can improve your skills with training {sessions}', cid)
		selfSay('If you want to join us, you will have to do a little {mission}.', cid)
	end
	if(msgcontains(msg, 'training') or msgcontains(msg, 'sessions')) then
		selfSay('As a member of the Adventurers Guild, you can take up to 3 training sessions with our trainer, Jovan. You will have to pay a good amount of money and be at least lvl 40.', cid)
		selfSay('You should speak with him for more information.', cid)
	end
	if(msgcontains(msg, 'mission')) then
			if(getPlayerStorageValue(cid,2119) == 0 and getPlayerStorageValue(cid,2120) == 0 and getPlayerStorageValue(cid,2121) == 0) then
				selfSay('I am waiting for you to finish the mission.', cid)
			elseif(getPlayerStorageValue(cid,2119) < 0 or getPlayerStorageValue(cid,2120) < 0 or getPlayerStorageValue(cid,2121) < 0) then
					selfSay('I am the leader of the {Adventurers Guild} in Bree. If you want to join us, you will have to prove your basic hunting skills. {ok}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2119) == 50) then
					selfSay('Well done. (You received 100 gp and 500 exp)', cid)
					setPlayerStorageValue(cid,2119,51)
					doPlayerAddExperience(cid,500)
					doPlayerAddItem(cid,2152,1)
			elseif(getPlayerStorageValue(cid,2120) == 50) then
					selfSay('Well done. (You received 200 gp and 700 exp)', cid)
					setPlayerStorageValue(cid,2120,51)
					doPlayerAddExperience(cid,700)
					doPlayerAddItem(cid,2152,2)
			elseif(getPlayerStorageValue(cid,2121) == 50) then
					selfSay('Well done. (You received 300 gp and 1000 exp)', cid)
					setPlayerStorageValue(cid,2121,51)
					doPlayerAddExperience(cid,1000)
					doPlayerAddItem(cid,2152,3)
			elseif(getPlayerStorageValue(cid,2122) == 100) then
					selfSay('Well done. (You received 3000 gp and 80000 exp)', cid)
					setPlayerStorageValue(cid,2122,101)
					doPlayerAddExperience(cid,80000)
					doPlayerAddItem(cid,2152,30)
			elseif(getPlayerStorageValue(cid,2123) == 100) then
					selfSay('Well done. (You received 5000 gp and 100000 exp)', cid)
					setPlayerStorageValue(cid,2123,101)
					doPlayerAddExperience(cid,100000)
					doPlayerAddItem(cid,2152,50)
			elseif(getPlayerStorageValue(cid,2124) == 100) then
					selfSay('Well done. (You received 5000 gp and 100000 exp)', cid)
					setPlayerStorageValue(cid,2124,101)
					doPlayerAddExperience(cid,100000)
					doPlayerAddItem(cid,2152,50)								
			elseif(getPlayerStorageValue(cid,2119) == 51 and getPlayerStorageValue(cid,2120) == 51 and getPlayerStorageValue(cid,2121) == 51 and getPlayerStorageValue(cid,2122) < 0 and getPlayerStorageValue(cid,2123) < 0 and getPlayerStorageValue(cid,2124) < 0) then
					selfSay('Soo.. you know how to hunt. Wellcome to our Guild, here you have the missions for our area.', cid)
					selfSay('Remember to check the missions in other cities and here as well, we might add new ones.', cid)
				setPlayerStorageValue(cid,30026,25)
				setPlayerStorageValue(cid,2122,0)
				setPlayerStorageValue(cid,2123,0)
				setPlayerStorageValue(cid,2124,0)
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area.', cid)

	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2119) < 0 or getPlayerStorageValue(cid,2120) < 0 or getPlayerStorageValue(cid,2121) < 0) then
				selfSay('I am glad to hear that. This are your first hunting missions. Finish them all and I will let you join.', cid)
				setPlayerStorageValue(cid,30025,24)
				setPlayerStorageValue(cid,2119,0)
				setPlayerStorageValue(cid,2120,0)
				setPlayerStorageValue(cid,2121,0)
			end
		end
	elseif(msgcontains(msg, 'club ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 21) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2209,1)
			end
		end
	elseif(msgcontains(msg, 'sword ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 21) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2207,1)
			end
		end
	elseif(msgcontains(msg, 'axe ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 21) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2208,1)
			end
		end
	elseif(msgcontains(msg, 'distance ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 21) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2203,1)
			end
		end
	elseif(msgcontains(msg, 'life ring')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2041) == 21) then
				selfSay('here you are.', cid)
					doPlayerAddItem(cid,2205,1)
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
