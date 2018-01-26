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
    if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'information')) then
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('I have been told that Gerontius Took "The Old Took" is currently the Thain of the Shire and since 50 years Thorin II Oakenshield is the king of Durins folk.', cid)
	end
	if(msgcontains(msg, 'dwarf') or msgcontains(msg, 'help')  or msgcontains(msg, 'lost') or msgcontains(msg, 'history')) then
				selfSay('We are a strong and proud raze, great miners and blacksmiths. I am actually a blacksmith returning from a business trip.', cid)
		if(getPlayerStorageValue(cid,2051) < 0 and getPlayerLevel(cid) > 34) then
				selfSay('But one of my comrades, was caugth by some goblins that have a camp in the north part of Weather Hills. This happends 2 weeks ago, while he was hunting for dinner.', cid)
				selfSay('We have been here waiting for a great warrior to help us, but all the rangers are else where. You seems strong, would you help us, {yes}? .', cid)	
					talkState[talkUser] = 1
		elseif(getPlayerLevel(cid) < 35)then
				selfSay('But one of my comrades, was caugth by some goblins that have a camp in the north part of Weather Hills. This happends 2 weeks ago, while he was hunting for dinner.', cid)
				selfSay('We have been here waiting for a great warrior to help us, but all the rangers are else where. You are not strong enough. (You should be level 35 at least)', cid)			
		end
	end
	if(msgcontains(msg, 'mission')) then
			if(getPlayerStorageValue(cid,2051) == 0) then
				if(getPlayerItemCount(cid,1961) >= 1) then
					doPlayerRemoveItem(cid,1961,1)
					doPlayerAddExperience(cid,8000)
				 doPlayerAddItem(cid,2152,10)
					selfSay('Thanks you!! Now Please choose one of this armors: {eriador guardian armor} (for defensive players), {eriador warrior armor} (for melee players) and {eriador ranger cape} (for distance players). (You have received 8000 exp and 10 platinum coins)', cid)
					setPlayerStorageValue(cid,2051,1)
				talkState[talkUser] = 2
				end
			elseif(getPlayerStorageValue(cid,2051) == 1) then
					selfSay('Thanks you!! Now Please choose one of this armors: {eriador guardian armor} (for defensive players), {eriador warrior armor} (for melee players) and {eriador ranger cape} (for distance players). (You have received 8000 exp and 10 platinum coins)', cid)
					setPlayerStorageValue(cid,2051,1)
				talkState[talkUser] = 2

			elseif(getPlayerStorageValue(cid,2051) == 2) then
				selfSay('I dont have anymore missions for you, but thanks.', cid)
			else
				selfSay('A mission? You should listen to my {history} first.', cid)
			end
			
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2051) < 0) then
				selfSay('Thanks you son.. Our friend is dead by sure, but he was carring a very important book, please search for his body. As reward I can give you a nice armor. ', cid)
				setPlayerStorageValue(cid,30010,9)
				setPlayerStorageValue(cid,2051,0)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'eriador guardian armor')) then
		if(talkState[talkUser] == 2) then
			selfSay('Here it is!', cid)
			doPlayerAddItem(cid,3968,1)
			setPlayerStorageValue(cid,2052,2)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'eriador warrior armor')) then
		if(talkState[talkUser] == 2) then
			selfSay('Here it is!', cid)
			doPlayerAddItem(cid,8891,1)
			setPlayerStorageValue(cid,2052,2)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'eriador ranger cape')) then
		if(talkState[talkUser] == 2) then
			selfSay('Here it is!', cid)
			doPlayerAddItem(cid,8872,1)
			setPlayerStorageValue(cid,2052,2)
			talkState[talkUser] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
