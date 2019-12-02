local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'blank rune'}, 2260, 10, 1, 'blank rune')
shopModule:addBuyableItem({'mana potion'}, 7620, 60, 1, 'mana potion')



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
				selfSay('There are many herbs in this world, some have special properties. They can be used in {runes} and for {herbalist magic}.', cid)
	end
	if(msgcontains(msg, 'magic') or msgcontains(msg, 'rune') or msgcontains(msg, 'element')) then
		if(getPlayerStorageValue(cid,2024) == 0 and getPlayerStorageValue(cid,2066) < 0 and getPlayerStorageValue(cid,2067) < 0) then
				selfSay('You should know about herbalist magic, but there are more powerful forms of magic, the elemental magic.', cid)
				selfSay('Elemental magic is divided in 6 elements. 4 basic elements (fire,earth, water and wind) and 2 more (life and death).', cid)
				selfSay('In order to achieve such power you need to be blessed by the Ainurs. You may only choose one of the six.', cid)
				selfSay('I can teach you about any form but not death magic, its an evil power used by dark beings..., so do you want to learn young sorcerer, {yes}?', cid)
								talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid,2066) >= 0) then
				selfSay('You have evil powers inside you, get out of here!', cid)
				talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid,2067) == 0) then
				selfSay('Are you ready with your {mission}?', cid)
				talkState[talkUser] = 0
		else
				selfSay('There is many ways of using magic, the most basic and easy way is the herbalist magic, that was created by the elves.', cid)
				selfSay('Herbalist magic dont need enforced spiritual power as other kinds of magic, you use the power of magical {herbs}. You may also put that power into a {rune} and use it later. ', cid)
		end
	end
	if(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2066) < 0 and getPlayerStorageValue(cid,2067) < 0) then
				selfSay('In order to teach you elemental magic, we need to craft a life crystal.', cid)
				selfSay('If you defeat ghost you can get magic sulphurs, get {100} magic sulphurs. {ok}?', cid)
				talkState[talkUser] = 2
			end
		end	
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'life crystal') or msgcontains(msg, 'sulphur')) then
			if(getPlayerItemCount(cid,11237) >= 1 and getPlayerStorageValue(cid,2098) == 2) then
					selfSay('Soo.. you come in behave of Bregor the dunedain. I am friend of the dunedains so I will help you.', cid)
					selfSay('...It looks like the ritual that this necromancers want to realice is to wake up elemental spirits, strange.. they need to sacrifice some priestesses in order to achieve the ritual.', cid)
					selfSay('Go back to Bregor and told him the details.', cid)
					setPlayerStorageValue(cid,2098,3)
			end
			if(getPlayerStorageValue(cid,2067) == 0) then
				if(getPlayerItemCount(cid,5904) >= 100)then
					doPlayerRemoveItem(cid,5904,100)
					selfSay('Here you have your life crystal, you will have to look for an Ainurs Statue. You will find one in Fornost Erain.', cid)
					selfSay('You will also need an elemental jewel ({ruby}-fire, {amethyst}-energy, {emerald}-earth or {sapphire}-ice) or all four for life magic.', cid)
					doPlayerAddItem(cid,2177,1)
					setPlayerStorageValue(cid,2067,1)
				end
			end
			if(getPlayerStorageValue(cid,2067) == 2 or getPlayerStorageValue(cid,2060) == 0 or getPlayerStorageValue(cid,2061) == 0 or getPlayerStorageValue(cid,2062) == 0 or getPlayerStorageValue(cid,2063) == 0 or getPlayerStorageValue(cid,2064) == 0) then
				if(getPlayerStorageValue(cid,2086) < 0) then
					selfSay('Its looks like you are a fellow sorcerer now, I am glad. But you still have a lot to learn.', cid)
					selfSay('I am in the need of some diamonds, soo.. if you get {3 small diamonds} for me, I will teach you some spells, {ok}?', cid)
					talkState[talkUser] = 3
				end
			end
			if(getPlayerStorageValue(cid,2086) == 1 and getPlayerStorageValue(cid,2060) == 0) then
				if(getPlayerStorageValue(cid,2087) < 0) then
					selfSay('I can keep teaching you new spells if you help me.', cid)
					selfSay('Right now Im looking for elemental jewels, soo.. if you get {2 small rubies} for me, I will teach you how to enchant weapons and arrows, {ok}?', cid)
					talkState[talkUser] = 9
				end
			end
			if(getPlayerStorageValue(cid,2086) == 1 and getPlayerStorageValue(cid,2061) == 0) then
				if(getPlayerStorageValue(cid,2087) < 0) then
					selfSay('I can keep teaching you new spells if you help me.', cid)
					selfSay('Right now Im looking for elemental jewels, soo.. if you get {2 small emeralds} for me, I will teach you how to enchant weapons and arrows, {ok}?', cid)
					talkState[talkUser] = 9
				end
			end
			if(getPlayerStorageValue(cid,2086) == 1 and getPlayerStorageValue(cid,2062) == 0) then
				if(getPlayerStorageValue(cid,2087) < 0) then
					selfSay('I can keep teaching you new spells if you help me.', cid)
					selfSay('Right now Im looking for elemental jewels, soo.. if you get {2 small amethysts} for me, I will teach you how to enchant weapons and arrows, {ok}?', cid)
					talkState[talkUser] = 9
				end
			end
			if(getPlayerStorageValue(cid,2086) == 1 and getPlayerStorageValue(cid,2063) == 0) then
				if(getPlayerStorageValue(cid,2087) < 0) then
					selfSay('I can keep teaching you new spells if you help me.', cid)
					selfSay('Right now Im looking for elemental jewels, soo.. if you get {2 small sapphires} for me, I will teach you how to enchant weapons and arrows, {ok}?', cid)
					talkState[talkUser] = 9
				end
			end
			if(getPlayerItemCount(cid,2145) >= 3 and getPlayerStorageValue(cid,2086) == 0) then
					doPlayerRemoveItem(cid,2145,3)
					setPlayerStorageValue(cid,2086,1)
					doPlayerAddExperience(cid,10000)
					selfSay('Great! thanks you.', cid)
				if(getPlayerStorageValue(cid,2060) == 0) then
					selfSay('You may choose one of this 3 spells and I will teach you: {Fire Spear} (distance), {Fire Beam} (magic level) or {Twisting Fire Slash} (melee)?', cid)
					talkState[talkUser] = 4
				end
				if(getPlayerStorageValue(cid,2061) == 0) then
					selfSay('You may choose one of this 3 spells and I will teach you: {Earth Spear} (distance), {Earth Beam} (magic level) or {Twisting Earth Slash} (melee)?', cid)
					talkState[talkUser] = 5
				end
				if(getPlayerStorageValue(cid,2062) == 0) then
					selfSay('You may choose one of this 3 spells and I will teach you: {Energy Spear} (distance), {Energy Beam} (magic level) or {Twisting Energy Slash} (melee)?', cid)
					talkState[talkUser] = 6
				end
				if(getPlayerStorageValue(cid,2063) == 0) then
					selfSay('You may choose one of this 3 spells and I will teach you: {Ice Spear} (distance), {Ice Beam} (magic level) or {Twisting Ice Slash} (melee)?', cid)
					talkState[talkUser] = 7
				end
				if(getPlayerStorageValue(cid,2064) == 0) then
					selfSay('You may choose one of this 3 spells and I will teach you: {Life Spear} (distance), {Life Beam} (magic level) or {Twisting Life Slash} (melee)?', cid)
					talkState[talkUser] = 8
				end
			end
			if(getPlayerStorageValue(cid,2087) == 0 and getPlayerItemCount(cid,2147) >= 2) then
					doPlayerRemoveItem(cid,2147,2)
					setPlayerStorageValue(cid,2087,1)
					setPlayerStorageValue(cid,2088,0)
					setPlayerStorageValue(cid,2089,0)
					doPlayerAddExperience(cid,10000)
					selfSay('Great! Now you can enchant and disenchant weapons.', cid)
			end
			if(getPlayerStorageValue(cid,2087) == 0 and getPlayerItemCount(cid,2149) >= 2) then
					doPlayerRemoveItem(cid,2149,2)
					setPlayerStorageValue(cid,2087,1)
					setPlayerStorageValue(cid,2090,0)
					setPlayerStorageValue(cid,2091,0)
					doPlayerAddExperience(cid,10000)
					selfSay('Great! Now you can enchant and disenchant weapons.', cid)
			end
			if(getPlayerStorageValue(cid,2087) == 0 and getPlayerItemCount(cid,2150) >= 2) then
					doPlayerRemoveItem(cid,2150,2)
					setPlayerStorageValue(cid,2087,1)
					setPlayerStorageValue(cid,2092,0)
					setPlayerStorageValue(cid,2093,0)
					doPlayerAddExperience(cid,10000)
					selfSay('Great! Now you can enchant and disenchant weapons.', cid)
			end
			if(getPlayerStorageValue(cid,2087) == 0 and getPlayerItemCount(cid,2146) >= 2) then
					doPlayerRemoveItem(cid,2146,2)
					setPlayerStorageValue(cid,2087,1)
					setPlayerStorageValue(cid,2094,0)
					setPlayerStorageValue(cid,2095,0)
					doPlayerAddExperience(cid,10000)
					selfSay('Great! Now you can enchant and disenchant weapons.', cid)
			end
			if(getPlayerStorageValue(cid,2066) == 2) then
					selfSay('A mission?! for an evil one like you?.', cid)
					selfSay('get out!!', cid)
			end

	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2067) < 0) then
				selfSay('You look like a skilled warrior, but be careful! ', cid)
				setPlayerStorageValue(cid,30020,19)
				setPlayerStorageValue(cid,2067,0)
			end
			talkState[talkUser] = 0
		end

		if(talkState[talkUser] == 3) then
			if(getPlayerStorageValue(cid,2086) < 0) then
				selfSay('Ok, I will be waiting.', cid)
				setPlayerStorageValue(cid,30020,19)
				setPlayerStorageValue(cid,2086,0)
			end
		talkState[talkUser] = 0
	    end
		if(talkState[talkUser] == 9) then
			if(getPlayerStorageValue(cid,2087) < 0) then
				selfSay('Ok, I will be waiting for you.', cid)
				setPlayerStorageValue(cid,30020,19)
				setPlayerStorageValue(cid,2087,0)
			end
		talkState[talkUser] = 0
	    end
	elseif(msgcontains(msg, 'Spear')) then
		if(talkState[talkUser] == 4) then
			setPlayerStorageValue(cid,2068,0)
		end
		if(talkState[talkUser] == 5) then
			setPlayerStorageValue(cid,2071,0)
		end
		if(talkState[talkUser] == 6) then
			setPlayerStorageValue(cid,2074,0)
		end
		if(talkState[talkUser] == 7) then
			setPlayerStorageValue(cid,2077,0)
		end
		if(talkState[talkUser] == 8) then
			setPlayerStorageValue(cid,2080,0)
		end
		selfSay('Ok, just see your quest log.', cid)
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'Beam')) then
		if(talkState[talkUser] == 4) then
			setPlayerStorageValue(cid,2069,0)
		end
		if(talkState[talkUser] == 5) then
			setPlayerStorageValue(cid,2072,0)
		end
		if(talkState[talkUser] == 6) then
			setPlayerStorageValue(cid,2075,0)
		end
		if(talkState[talkUser] == 7) then
			setPlayerStorageValue(cid,2078,0)
		end
		if(talkState[talkUser] == 8) then
			setPlayerStorageValue(cid,2081,0)
		end
		selfSay('Ok, just see your quest log.', cid)
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'Twisting')) then
		if(talkState[talkUser] == 4) then
			setPlayerStorageValue(cid,2070,0)
		end
		if(talkState[talkUser] == 5) then
			setPlayerStorageValue(cid,2073,0)
		end
		if(talkState[talkUser] == 6) then
			setPlayerStorageValue(cid,2076,0)
		end
		if(talkState[talkUser] == 7) then
			setPlayerStorageValue(cid,2079,0)
		end
		if(talkState[talkUser] == 8) then
			setPlayerStorageValue(cid,2082,0)
		end
		selfSay('Ok, just see your quest log.', cid)
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
