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
		selfSay('If you want to join us, you will have to talk to our leader Ryan, he is upstairs.', cid)
	end
	if(msgcontains(msg, 'training') or msgcontains(msg, 'sessions')) then
    if(getPlayerStorageValue(cid,2119) < 21 or getPlayerStorageValue(cid,2120) < 21 or getPlayerStorageValue(cid,2121) < 21) then
					selfSay('In order to do training sessions, you have to join us first. You should talk to our leader Ryan, he is upstairs.', cid)
	elseif(getPlayerLevel(cid) < 40) then
					selfSay('You have to be at least level 40, come back later', cid)
	elseif(getPlayerStorageValue(cid,2119) == 21 and getPlayerStorageValue(cid,2120) == 21 and getPlayerStorageValue(cid,2121) == 21 and getPlayerLevel(cid) > 39) then
		selfSay('I can give you training sessions. I am allowed to give up to 3 sessions per player. The first one will cost you 10.000 coins, the second one 20.000 coins and the third one 40.000 coins.', cid)
		selfSay('Each session will give you as much skill tries as you can get in 24 hours of continued training. In case of magic level, it will grant you mana spend in function of your mana recovery speed. (also 24 hrs of continued use)', cid)		
		selfSay('Do you want to start? {ok}?', cid)
		talkState[talkUser] = 1
	end
	end

			
 	if(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area.', cid)

	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2155) < 2) then
				selfSay('Which skill do you want to train? {fist}, {sword}, {club}, {axe}, {distance}, {shield} or {magic}.', cid)
                talkState[talkUser] = 2
            else
            	selfSay('You cant do more sessions here, maybe in other cities you can continue your training.', cid)
            end
        elseif(talkState[talkUser] == 3) then
        	if(getPlayerStorageValue(cid,2155) < 0) then
        		if (doPlayerRemoveMoney(cid, 10000)) then
        			doPlayerAddSkillTry(cid, 1, 43200)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
            elseif(getPlayerStorageValue(cid,2155) == 0) then
        		if (doPlayerRemoveMoney(cid, 20000)) then
        			doPlayerAddSkillTry(cid, 1, 43200)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	elseif(getPlayerStorageValue(cid,2155) == 1) then
        		if (doPlayerRemoveMoney(cid, 40000)) then
        			doPlayerAddSkillTry(cid, 1, 43200)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	end
        elseif(talkState[talkUser] == 4) then
        	if(getPlayerStorageValue(cid,2155) < 0) then
        		if (doPlayerRemoveMoney(cid, 10000)) then
        			doPlayerAddSkillTry(cid, 2, 43200)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
            elseif(getPlayerStorageValue(cid,2155) == 0) then
        		if (doPlayerRemoveMoney(cid, 20000)) then
        			doPlayerAddSkillTry(cid, 2, 43200)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	elseif(getPlayerStorageValue(cid,2155) == 1) then
        		if (doPlayerRemoveMoney(cid, 40000)) then
        			doPlayerAddSkillTry(cid, 2, 43200)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	end
        elseif(talkState[talkUser] == 5) then
        	if(getPlayerStorageValue(cid,2155) < 0) then
        		if (doPlayerRemoveMoney(cid, 10000)) then
        			doPlayerAddSkillTry(cid, 3, 43200)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
            elseif(getPlayerStorageValue(cid,2155) == 0) then
        		if (doPlayerRemoveMoney(cid, 20000)) then
        			doPlayerAddSkillTry(cid, 3, 43200)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	elseif(getPlayerStorageValue(cid,2155) == 1) then
        		if (doPlayerRemoveMoney(cid, 40000)) then
        			doPlayerAddSkillTry(cid, 3, 43200)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	end
        elseif(talkState[talkUser] == 6) then
        	if(getPlayerStorageValue(cid,2155) < 0) then
        		if (doPlayerRemoveMoney(cid, 10000)) then
        			doPlayerAddSkillTry(cid, 4, 43200)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
            elseif(getPlayerStorageValue(cid,2155) == 0) then
        		if (doPlayerRemoveMoney(cid, 20000)) then
        			doPlayerAddSkillTry(cid, 4, 43200)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	elseif(getPlayerStorageValue(cid,2155) == 1) then
        		if (doPlayerRemoveMoney(cid, 40000)) then
        			doPlayerAddSkillTry(cid, 4, 43200)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	end
        elseif(talkState[talkUser] == 7) then
        	if(getPlayerStorageValue(cid,2155) < 0) then
        		if (doPlayerRemoveMoney(cid, 10000)) then
        			doPlayerAddSkillTry(cid, 0, 43200)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
            elseif(getPlayerStorageValue(cid,2155) == 0) then
        		if (doPlayerRemoveMoney(cid, 20000)) then
        			doPlayerAddSkillTry(cid, 0, 43200)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	elseif(getPlayerStorageValue(cid,2155) == 1) then
        		if (doPlayerRemoveMoney(cid, 40000)) then
        			doPlayerAddSkillTry(cid, 0, 43200)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	end
        elseif(talkState[talkUser] == 8) then
        	if(getPlayerStorageValue(cid,2155) < 0) then
        		if (doPlayerRemoveMoney(cid, 10000)) then
        			doPlayerAddSkillTry(cid, 5, 43200)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
            elseif(getPlayerStorageValue(cid,2155) == 0) then
        		if (doPlayerRemoveMoney(cid, 20000)) then
        			doPlayerAddSkillTry(cid, 5, 43200)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	elseif(getPlayerStorageValue(cid,2155) == 1) then
        		if (doPlayerRemoveMoney(cid, 40000)) then
        			doPlayerAddSkillTry(cid, 5, 43200)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	end
        elseif(talkState[talkUser] == 9) then
        	if(getPlayerStorageValue(cid,2155) < 0) then
        		if (doPlayerRemoveMoney(cid, 10000)) then
        			if(getPlayerVocation(cid) == 4) then
        			doPlayerAddManaSpent(cid,444344)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			elseif(getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6) then
        			doPlayerAddManaSpent(cid, 269229)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			else
        			doPlayerAddManaSpent(cid, 86400)
        			setPlayerStorageValue(cid,30032,31)
        			setPlayerStorageValue(cid,2155,0)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			end
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
            elseif(getPlayerStorageValue(cid,2155) == 0) then
        		if (doPlayerRemoveMoney(cid, 20000)) then
        			if(getPlayerVocation(cid) == 4) then
        			doPlayerAddManaSpent(cid, 444344)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			elseif(getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6) then
        			doPlayerAddManaSpent(cid, 296229)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			else
        			doPlayerAddManaSpent(cid, 86400)
        			setPlayerStorageValue(cid,2155,1)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			end
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
        	elseif(getPlayerStorageValue(cid,2155) == 1) then
        		if (doPlayerRemoveMoney(cid, 40000)) then
        			if(getPlayerVocation(cid) == 4) then
        			doPlayerAddManaSpent(cid, 444344)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			elseif(getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6) then
        			doPlayerAddManaSpent(cid, 296229)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			else
        			doPlayerAddManaSpent(cid, 86400)
        			setPlayerStorageValue(cid,2155,2)
        			selfSay('You have trained 24 hours.', cid)
        			talkState[talkUser] = 0
        			end
        		else
        		selfSay('You dont have enough coins.', cid)
        		end
			end
		end
	elseif(msgcontains(msg, 'club')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2155) < 0) then
				selfSay('This is your first session, you will have to pay 10.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 0) then
				selfSay('This is your second session, you will have to pay 20.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 1) then
				selfSay('This is your third session, you will have to pay 40.000 coins. You will get 24 hrs of training. {ok}?', cid)
			end
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, 'sword')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2155) < 0) then
				selfSay('This is your first session, you will have to pay 10.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 0) then
				selfSay('This is your second session, you will have to pay 20.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 1) then
				selfSay('This is your third session, you will have to pay 40.000 coins. You will get 24 hrs of training. {ok}?', cid)
			end
			talkState[talkUser] = 4
		end
	elseif(msgcontains(msg, 'axe')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2155) < 0) then
				selfSay('This is your first session, you will have to pay 10.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 0) then
				selfSay('This is your second session, you will have to pay 20.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 1) then
				selfSay('This is your third session, you will have to pay 40.000 coins. You will get 24 hrs of training. {ok}?', cid)
			end
			talkState[talkUser] = 5
		end
	elseif(msgcontains(msg, 'distance')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2155) < 0) then
				selfSay('This is your first session, you will have to pay 10.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 0) then
				selfSay('This is your second session, you will have to pay 20.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 1) then
				selfSay('This is your third session, you will have to pay 40.000 coins. You will get 24 hrs of training. {ok}?', cid)
			end
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, 'fist')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2155) < 0) then
				selfSay('This is your first session, you will have to pay 10.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 0) then
				selfSay('This is your second session, you will have to pay 20.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 1) then
				selfSay('This is your third session, you will have to pay 40.000 coins. You will get 24 hrs of training. {ok}?', cid)
			end
			talkState[talkUser] = 7
		end
	elseif(msgcontains(msg, 'shield')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2155) < 0) then
				selfSay('This is your first session, you will have to pay 10.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 0) then
				selfSay('This is your second session, you will have to pay 20.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 1) then
				selfSay('This is your third session, you will have to pay 40.000 coins. You will get 24 hrs of training. {ok}?', cid)
			end
			talkState[talkUser] = 8
		end
	elseif(msgcontains(msg, 'magic')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2155) < 0) then
				selfSay('This is your first session, you will have to pay 10.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 0) then
				selfSay('This is your second session, you will have to pay 20.000 coins. You will get 24 hrs of training. {ok}?', cid)
			elseif(getPlayerStorageValue(cid,2155) == 1) then
				selfSay('This is your third session, you will have to pay 40.000 coins. You will get 24 hrs of training. {ok}?', cid)
			end
			talkState[talkUser] = 9
		end			
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
