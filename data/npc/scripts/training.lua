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

	if(msgcontains(msg, 'training')) then
				selfSay('By this training you can balance your 3 basic abilities: {Agility},{Strength} and {Intelligence}.', cid)
				selfSay('You have 3 training points that you can assign to this abilities as you want, you start with 1 point in each ability. ', cid)
				selfSay('Soo.. Can we start your training, {yes}? ', cid)
				talkState[talkUser] = 1
	elseif(msgcontains(msg, 'agility')) then
				selfSay('Agility let all types of attacks to be stronger', cid)
				selfSay('0 points -- Damage x 0.8', cid)
				selfSay('1 points -- Damage x 1', cid)
				selfSay('2 points -- Damage x 1.3', cid)
				selfSay('3 points -- Damage x 1.6', cid)
	elseif(msgcontains(msg, 'strength')) then
				selfSay('Strength gives you more Hitpoints per player level (levels you got and every new level) and faster health regeneration', cid)
				selfSay('0 points -- Max Hitpoints x 0.5 and regeneration 2 hp', cid)
				selfSay('1 points -- Max Hitpoints x 1 and regeneration 2 hp', cid)
				selfSay('2 points -- Max Hitpoints x 1.5 and regeneration 3 hp', cid)
				selfSay('3 points -- Max Hitpoints x 2 and regeneration 4 hp', cid)
	elseif(msgcontains(msg, 'intelligence')) then
				selfSay('Intelligence gives you more Manapoints per player level (levels you got and every new level) and faster mana regeneration', cid)
				selfSay('0 points -- Max Manapoints x 0.5 and regeneration 2 hp', cid)
				selfSay('1 points -- Max Manapoints x 1 and regeneration 2 hp', cid)
				selfSay('2 points -- Max Manapoints x 2 and regeneration 4 hp', cid)
				selfSay('3 points -- Max Manapoints x 3 and regeneration 6 hp', cid)
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
				selfSay('Your points balance is ' ..getPlayerVocationName(cid) .. '.', cid)
				selfSay('To change this balance you will have to pay {10000 gp}, {ok}? ', cid)
				talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, 'A1 S1 I1')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 0) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 0)
			 		local h = (getPlayerLevel(cid)-1)*10
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*10
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A0 S2 I1')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 1) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 1)
			 		local h = (getPlayerLevel(cid)-1)*15
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*10
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A0 S1 I2')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 2) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 2)
			 		local h = (getPlayerLevel(cid)-1)*10
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*20
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A0 S3 I0')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 3) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 3)
			 		local h = (getPlayerLevel(cid)-1)*20
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*5
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A0 S0 I3')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 4) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 4)
			 		local h = (getPlayerLevel(cid)-1)*5
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*30
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A1 S2 I0')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 5) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 5)
			 		local h = (getPlayerLevel(cid)-1)*15
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*5
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A1 S0 I2')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 6) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 6)
			 		local h = (getPlayerLevel(cid)-1)*5
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*20
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A2 S1 I0')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 7) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 7)
			 		local h = (getPlayerLevel(cid)-1)*10
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*5
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A2 S0 I1')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 8) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 8)
			 		local h = (getPlayerLevel(cid)-1)*5
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*10
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'A3 S0 I0')) then
		if(talkState[talkUser] == 3) then
 			if(getPlayerVocation(cid) == 9) then
				selfSay('Thats your current points balance.', cid)
				selfSay('Wich balance do you want? {A1 S1 I1}, {A0 S2 I1}, {A0 S1 I2}, {A0 S3 I0}, {A0 S0 I3}, {A1 S2 I0}, {A1 S0 I2}, {A2 S1 I0}, {A2 S0 I1}, {A3 S0 I0} ', cid)
				talkState[talkUser] = 3
			else
			 	if(doPlayerRemoveMoney(cid, 10000)) then
			 		doPlayerSetVocation(cid, 9)
			 		local h = (getPlayerLevel(cid)-1)*5
			 		doCreatureSetMaxHealth(cid, 150+h)
			 		local m = (getPlayerLevel(cid))*5
			 		doCreatureSetMaxMana(cid, m)
					selfSay('Your points balance have been change.', cid)
				else
					selfSay('You need more money.', cid)
				end
					talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
