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
				selfSay('I have been told that Gerontius Took "The Old Took" is currently the Thain of the Shire and Elrond keeps being the lord of Rivendell.', cid)
	end
	if(msgcontains(msg, 'Arnor')) then
				selfSay('Arnor was an ancient kingdom of men, once powerful, but the kingdom collapsed because of internal wars and because of the war against Angmar 1000 years ago.', cid)
	end
	if(msgcontains(msg, 'Angmar')) then
				selfSay('Angmar was called the old kingdom ruled by the Witch King.', cid)
				selfSay('The 1300 of the third age the Witch King founded Angmar in the north, he was defeated in 1975 in Fornost and vanished from this lands...', cid)		
	end
	if(msgcontains(msg, 'herbs')) then
				selfSay('There are many herbs in this world, some have special properties. They can be used in runes and for herbalist magic.', cid)
	end
	if(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2066) == 2) then
				selfSay('In order to improve to tier 2 your elemental magic, we need to craft 3 life crystals.', cid)
				selfSay('We will need {300} magic sulphurs, get them and come back to me.', cid)
				selfSay('Our members are always looking for fight to get stronger or die. So dont feel bad for killing them...if you can.', cid)
				setPlayerStorageValue(cid,2157,0)
				talkState[talkUser] = 0
			end
			if(getPlayerStorageValue(cid,2067) == 2) then
				selfSay('In order to improve to tier 2 your elemental magic, we need to craft 3 life crystals.', cid)
				selfSay('We will need {300} magic sulphurs, get them and come back to me.', cid)
				selfSay('Our members are always looking for fight to get stronger or die. So dont feel bad for killing them...if you can.', cid)
				setPlayerStorageValue(cid,2156,0)
				talkState[talkUser] = 0
			end
		end	
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2060) == 0) then
				selfSay('Here you have 3 life crystals.', cid)
				selfSay('Now you will have to search for an ainur statue, we dont have active statue here, but maybe in Fornost Erain you may find one.', cid)
				selfSay('You will also need to have 4 small rubies.', cid)
				doPlayerRemoveItem(cid,5904,300)
				doPlayerAddItem(cid,2177,3)
				setPlayerStorageValue(cid,2156,1)
				talkState[talkUser] = 0
			end
			if(getPlayerStorageValue(cid,2061) == 0) then
				selfSay('Here you have 3 life crystals.', cid)
				selfSay('Now you will have to search for an ainur statue, we dont have active statue here, but maybe in Fornost Erain you may find one.', cid)
				selfSay('You will also need to have 4 small emeralds.', cid)
				doPlayerRemoveItem(cid,5904,300)
				doPlayerAddItem(cid,2177,3)
				setPlayerStorageValue(cid,2156,1)
				talkState[talkUser] = 0
			end
			if(getPlayerStorageValue(cid,2062) == 0) then
				selfSay('Here you have 3 life crystals.', cid)
				selfSay('Now you will have to search for an ainur statue, we dont have active statue here, but maybe in Fornost Erain you may find one.', cid)
				selfSay('You will also need to have 4 small amethysts.', cid)
				doPlayerRemoveItem(cid,5904,300)
				doPlayerAddItem(cid,2177,3)
				setPlayerStorageValue(cid,2156,1)
				talkState[talkUser] = 0
			end
			if(getPlayerStorageValue(cid,2063) == 0) then
				selfSay('Here you have 3 life crystals.', cid)
				selfSay('Now you will have to search for an ainur statue, we dont have active statue here, but maybe in Fornost Erain you may find one.', cid)
				selfSay('You will also need to have 4 small sapphires.', cid)
				doPlayerRemoveItem(cid,5904,300)
				doPlayerAddItem(cid,2177,3)
				setPlayerStorageValue(cid,2156,1)
				talkState[talkUser] = 0
			end
			if(getPlayerStorageValue(cid,2064) == 0) then
				selfSay('Here you have 3 life crystals.', cid)
				selfSay('Now you will have to search for an ainur statue, we dont have active statue here, but maybe in Fornost Erain you may find one.', cid)
				selfSay('You will also need to have 2 of each elemental jewels.', cid)
				doPlayerRemoveItem(cid,5904,300)
				doPlayerAddItem(cid,2177,3)
				setPlayerStorageValue(cid,2156,1)
				talkState[talkUser] = 0
			end
			if(getPlayerStorageValue(cid,2065) == 0) then
				selfSay('Here you have 3 life crystals.', cid)
				selfSay('Now you will have to search for an ainur statue, we dont have active statue here, but maybe in Fornost Erain you may find one.', cid)
				selfSay('You will also need to have 2 of each elemental jewel.', cid)
				doPlayerRemoveItem(cid,5904,300)
				doPlayerAddItem(cid,2177,3)
				setPlayerStorageValue(cid,2157,1)
				talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'life crystal') or msgcontains(msg, 'cult')) then
		if(getPlayerStorageValue(cid,2156) < 0 and getPlayerStorageValue(cid,2157) < 0) then
		if(getPlayerStorageValue(cid,2067) == 2 or getPlayerStorageValue(cid,2066) == 2) then
			selfSay('This is our temple, to the elemental powers, and we believe only in strength. You are not of our cult, but as you have elemental power, we may let you enter and learn from us.', cid)
			selfSay('You have elemental powers of tier 1, thats what most of our members have, but I will ask more from you. In order to enter you will have to achieve the tier 2!', cid)
			selfSay('I will help you by crafting life crystals for you,if you get enough magic sulphurs. Do you agree?, {yes}?', cid)
			talkState[talkUser] = 1
		else
			selfSay('You dont have elemental powers, we dont recive people like you here...', cid)
		end
		end
		if(getPlayerStorageValue(cid,2156) == 0 or getPlayerStorageValue(cid,2157) == 0) then
		if(getPlayerItemCount(cid,5904) >= 300) then
			selfSay('Well done. Now I will craft the life crystals. Do you still want to do this? {yes}?', cid)
			talkState[talkUser] = 2
		end
		end
		if(getPlayerStorageValue(cid,2156) == 2 or getPlayerStorageValue(cid,2157) == 2) then
		if(getPlayerStorageValue(cid,2158) < 0) then
			selfSay('Its great to see a new elemental master rising. You now may enter to our temple.', cid)
			selfSay('Go down to the lower level. I blessed you with my powers. Now you can se the statue there to teleport into the main temple.', cid)
			selfSay('Inside the temple you will find my Primates, they can teach you tier 2 spells.', cid)
			selfSay('Don forget that in this cult you will have to fight every member to survive.', cid)
			setPlayerStorageValue(cid,30033,32)
			setPlayerStorageValue(cid,2158,0)
		elseif(getPlayerStorageValue(cid,2303) == 41) then
			selfSay('You have mastered all our temple have to teach you. As a final reward I will let you use the clothes of an elementalist.', cid)
			doPlayerAddOutfit(cid, 432, 0)
			doPlayerAddOutfit(cid, 433, 0)
			setPlayerStorageValue(cid,2303,42)
		else
			selfSay('I dont have any mission for you.', cid)
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
