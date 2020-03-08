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

	if(msgcontains(msg, 'mission') or msgcontains(msg, 'dunedain') or msgcontains(msg, 'ranger')) then
		if (getPlayerStorageValue(cid,2310) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2310,4)
			setPlayerStorageValue(cid,2311,150)
		end
			if(getPlayerStorageValue(cid,2046) == 0) then
				selfSay('I am waiting for you to finish the mission.', cid)
			elseif(getPlayerStorageValue(cid,2046) < 0) then
					selfSay('Hi young man, we are the dunedain, the descendants of the kingdom of Arnor, if you want to help us, I can give you rewards,{ok}?.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2046) == 50) then
					selfSay('You are quite strong, I have anothe {mission} for you (you received 10000 exp and 500 gp) ', cid)
					setPlayerStorageValue(cid,2046,51)
					doPlayerAddExperience(cid,10000)
					doPlayerAddItem(cid,2148,500)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2047) < 0 and getPlayerStorageValue(cid,2046) == 51) then
					selfSay('I am sure that you have met the Lone Lands Savages, show your streng and teach them a lesson,{ok}?.', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2047) == 0 and getPlayerItemCount(cid,5924) >= 5) then
					talkState[talkUser] = 2
					selfSay('Great! Choose one of this abilities: {strong strike}, {twisting slash}, {shield wall} and {sharp aim}. (you received 15000 exp) ', cid)
					setPlayerStorageValue(cid,2047,1)
					doPlayerRemoveItem(cid,5924,5)
					doPlayerAddExperience(cid,15000)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2047) == 1 and getPlayerStorageValue(cid,2042) < 0   and getPlayerStorageValue(cid,2043) < 0  and getPlayerStorageValue(cid,2044) < 0  and getPlayerStorageValue(cid,2045) < 0) then
					selfSay('Choose one of this abilities: {strong strike}, {twisting slash}, {shield wall} and {sharp aim}.', cid)
					talkState[talkUser] = 2					
			elseif(getPlayerStorageValue(cid,2047) == 1 and getPlayerStorageValue(cid,2050) < 0) then
					selfSay('I have another mission for you, I know that you are a warrior, but if you bring me some supplies. I will teach you more about martial arts, {ok}?.', cid)
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2050) == 2) then
					selfSay('Nice done, it looks like you had to do a long journey. Any way I will teach you {Forced March}.(You have received 10000 exp)', cid)
					setPlayerStorageValue(cid,2050,3)
					setPlayerStorageValue(cid,2049,0)
					doPlayerAddExperience(cid,10000)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2050) == 3 and getPlayerStorageValue(cid,2052) < 0) then
					selfSay('I have a mission for you, you are a truth fighter and if you accomplish this mission, I will give you a outfit to prove it, {ok}?.', cid)
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2052) == 0 and getPlayerItemCount(cid,2450) < 10) then
					selfSay('You need to kill more of those goblins.', cid)
				    setPlayerStorageValue(cid,2052,0)
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2052) == 0 and getPlayerItemCount(cid,2450) >= 10) then
					selfSay('Nice work! As your payment take this lesser ring and this outfit.(you received 30000 exp and a life ring) ', cid)
					setPlayerStorageValue(cid,2052,1)
					doPlayerRemoveItem(cid,2450,10)
					doPlayerAddItem(cid,2168,1)
					doPlayerAddOutfit(cid, 142, 0)
					doPlayerAddOutfit(cid, 134, 0)
					doPlayerAddExperience(cid,30000)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			end
			if(getPlayerStorageValue(cid,2052) == 1 and getPlayerStorageValue(cid,2053) < 0) then
					selfSay('A new problem have come to us, the goblins you fighted have a leader, Rorkduf, he isnt a big chief among the Misty Mountains goblins, but he is smart and is looking for an alliacne with the renegades and savages.', cid)
					selfSay('You are one of our greatest warrior, go to their camp and defeat Rorkduf, before its too late, {ok}?.', cid)
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2053) == 1) then
					selfSay('Nice done! As your payment take this diamond, you have worked as one of us.(you received 50000 exp and a small diamond) ', cid)
					setPlayerStorageValue(cid,2053,2)
					doPlayerAddItem(cid,2145,1)
					doPlayerAddExperience(cid,50000)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2053) == 2) then
					selfSay('I dont have more missions for you my friend ', cid)
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)

	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2046) < 0) then
				selfSay('They are many dangerous wolves in this area, defeat 50 fierce wolves and I will pay you.', cid)
				setPlayerStorageValue(cid,30012,11)
				setPlayerStorageValue(cid,2046,0)
			end
		end
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2047) < 0 and getPlayerStorageValue(cid,2046) == 21) then
				setPlayerStorageValue(cid,30012,11)
				selfSay('Bring me 5 damaged steel helmet form the bodies of the savages you defeat, and I will train you in martial arts.', cid)
				setPlayerStorageValue(cid,2047,0)
			end
		end
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2050) < 0 and getPlayerStorageValue(cid,2047) == 1) then
				setPlayerStorageValue(cid,30012,11)
				selfSay('Go to the Forsaken Inn for supplies, it lies south of here where the weather hills end.', cid)
				setPlayerStorageValue(cid,2050,0)
			end
		end
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2052) < 0 and getPlayerStorageValue(cid,2050) == 3) then
				setPlayerStorageValue(cid,30012,11)
				selfSay('To the north lies a goblin camp. It was build by goblins of the Misty Mountains, that use it to stay during the day an then hunt when the sun goes down.', cid)
				selfSay('Go there and kill some goblins in order to control their expansion, bring me 10 bone swords, that they use to carry, be careful! they are small, but good fighters.', cid)				
				setPlayerStorageValue(cid,2052,0)
			end
		end
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2053) < 0 and getPlayerStorageValue(cid,2052) == 1) then
				setPlayerStorageValue(cid,30012,11)
				selfSay('Run to the north and search for Rorkduf in the deapest corner of the goblins camp. Good luck!', cid)			
				setPlayerStorageValue(cid,2053,0)
			end
		end
	elseif(msgcontains(msg, 'strong strike')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2042,0)
			end
		end
	elseif(msgcontains(msg, 'twisting slash')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2043,0)
			end
		end
	elseif(msgcontains(msg, 'shield wall')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2044,0)
			end
		end
	elseif(msgcontains(msg, 'sharp aim')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2047) == 1) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2045,0)
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
