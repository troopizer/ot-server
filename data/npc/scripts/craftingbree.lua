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

	if(msgcontains(msg, 'crafting') or msgcontains(msg, 'guild')) then
		selfSay('The Crafting Guild is an organization of crafters and blacksmiths spread around Middle Earth. We give work and training to crafters that are looking for new skills.', cid)
		selfSay('If you join the guild you will get the oportunity to learn how to craft useful items.', cid)
	end
	if(msgcontains(msg, 'mission')) then
			if(getPlayerStorageValue(cid,2125) == 0 and getPlayerItemCount(cid,5901) >= 30 and getPlayerItemCount(cid,2311) >= 2 and getPlayerItemCount(cid,2261) >= 2) then
				doPlayerRemoveItem(cid,2261, 2)
				doPlayerRemoveItem(cid,2311, 2)
				doPlayerRemoveItem(cid,5901, 30)
				selfSay('Great job! Now you are one of us, so lets speak about {recipes}.(You received 1000 exp and a hammer)', cid)
				setPlayerStorageValue(cid,2125,1)
				doPlayerAddExperience(cid,1000)
				doPlayerAddItem(cid,2557, 1)
			elseif(getPlayerStorageValue(cid,2125) < 0) then
					selfSay('I am the leader of the {Crafting Guild} in Bree. If you want to join us, you will have to prove that you can do hard work. {ok}?', cid)
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2126) == 0 and getPlayerItemCount(cid,3965) >= 5) then
					selfSay('Well done... This is the way to craft spears, you will need to have your hammer with you. (You received 2000 exp)', cid)
					setPlayerStorageValue(cid,2126,1)
					doPlayerRemoveItem(cid,3965, 5)
					setPlayerStorageValue(cid,30029,28)
					setPlayerStorageValue(cid,2130,0)
					doPlayerAddExperience(cid,2000)
			elseif(getPlayerStorageValue(cid,2127) == 0 and getPlayerItemCount(cid,7364) >= 100) then
					selfSay('Well done... This is the way to craft arrows, you will need to have your hammer with you. (You received 2000 exp)', cid)
					setPlayerStorageValue(cid,2127,1)
					doPlayerRemoveItem(cid,7364, 100)
					setPlayerStorageValue(cid,30029,28)
					setPlayerStorageValue(cid,2131,0)
					doPlayerAddExperience(cid,2000)
			elseif(getPlayerStorageValue(cid,2128) == 0 and getPlayerItemCount(cid,5880) >= 5) then
					selfSay('Well done... This is the way to craft throwing knifes, you will need to have your hammer with you. (You received 3000 exp)', cid)
					setPlayerStorageValue(cid,2128,1)
					doPlayerRemoveItem(cid,5880,5)
					setPlayerStorageValue(cid,30029,28)
					setPlayerStorageValue(cid,2132,0)
					doPlayerAddExperience(cid,3000)
			elseif(getPlayerStorageValue(cid,2129) == 0 and getPlayerItemCount(cid,2478) >= 1) then
					selfSay('Well done... This is the way to craft sbronze amulets, you will need to have your hammer with you. (You received 4000 exp)', cid)
					setPlayerStorageValue(cid,2129,1)
					doPlayerRemoveItem(cid,2478,1)
					setPlayerStorageValue(cid,30029,28)
					setPlayerStorageValue(cid,2133,0)
					doPlayerAddExperience(cid,4000)					
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area.', cid)
 	elseif(msgcontains(msg, 'recipes')) then
 		if(getPlayerStorageValue(cid,2125) == 1) then
				selfSay('As you are a member of this Guild, I will teach you how to craft some items if you acomplish some tasks.', cid)
				selfSay('Would you like to learn about: {distance weapons} or {bronze items}.', cid)
				talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2125) < 0) then
				selfSay('I am glad to hear that. This are your first mission. Finish it and I will let you join. (To get wood you will need this axe, remember to look for death trees) ', cid)
				setPlayerStorageValue(cid,30027,26)
				setPlayerStorageValue(cid,2125,0)
				doPlayerAddItem(cid,2559, 1)
			end
		end
	elseif(msgcontains(msg, 'distance weapons')) then
		if(talkState[talkUser] == 2) then
				selfSay('I can teach you how to craft: {spears}, {arrows} and {throwing knifes}.', cid)
				talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, 'bronze items')) then
		if(talkState[talkUser] == 2) then
				selfSay('I can teach you how to craft: {bronze amulets}.', cid)
				talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, 'spears')) then
		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2126) < 0) then
				selfSay('This is your mission.', cid)
				setPlayerStorageValue(cid,30028,27)
				setPlayerStorageValue(cid,2126,0)
			end
		end
	elseif(msgcontains(msg, 'arrows')) then
		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2127) < 0) then
				selfSay('This is your mission.', cid)
				setPlayerStorageValue(cid,30028,27)
				setPlayerStorageValue(cid,2127,0)
			end
		end
	elseif(msgcontains(msg, 'throwing knifes')) then
		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2128) < 0) then
				selfSay('This is your mission.', cid)
				setPlayerStorageValue(cid,30028,27)
				setPlayerStorageValue(cid,2128,0)
			end
		end
	elseif(msgcontains(msg, 'bronze amulets')) then
		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2129) < 0) then
				selfSay('This is your mission.', cid)
				setPlayerStorageValue(cid,30028,27)
				setPlayerStorageValue(cid,2129,0)
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
