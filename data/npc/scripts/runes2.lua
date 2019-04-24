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


shopModule:addBuyableItem({'blank rune'}, 2260, 8, 1, 'blank rune')
shopModule:addBuyableItem({'mana potion'}, 7620, 40, 1, 'mana potion')
shopModule:addBuyableItem({'strong mana potion'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'strong health potion'}, 7588, 85, 1, 'strong health potion')


shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')



function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'information')) then
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('I have been told that Gerontius Took "The Old Took" is currently the Thain of the Shire and for 50 years Thorin II Oakenshield have been the king of Durins folk.', cid)
	end
	if(msgcontains(msg, 'thorin')) then
				selfSay('Thorin II son of Thráin is the leader of the dwarves living in the Blue Mountains, far west from here.', cid)
	end
	if(msgcontains(msg, 'Arnor')) then
				selfSay('Arnor was an ancient kingdom of men, once powerful, but the kingdom collapsed because of internal wars and because of the war against Angmar 1000 years ago.', cid)
	end
	if(msgcontains(msg, 'Angmar')) then
				selfSay('Angmar! Angmar was called the old kingdom ruled by the Witch King, the most powerful necromancer of this age. He had armys of undead soldiers, orc, humans.. even some dwarves.', cid)
				selfSay('The 1300 of the third age the Witch King founded Angmar in the north, he was defeated in 1975 here in Fornost and vanished from this lands...', cid)	
				selfSay('Fornost was then abandoned, but here remains many secrets about some forms of magic, buried underground along with some dangerous spectres. ', cid)	
	end
	if(msgcontains(msg, 'Fornost')) then
				selfSay('Fornost Erain is this ruined city where we stand now.. this building used to be a temple for the people of Arnor.', cid)
				selfSay('The city has 3 areas, the first one is here and is abandoned, the second one is east from here and its controlled by a cult of necromancers, the last one is the fortress to the north.', cid)
				selfSay('1000 years ago this city was taken by the Witch King and his troops build hidden catacombs, where they create new undead soldiers.', cid)	
	end
	if(msgcontains(msg, 'herbs')) then
				selfSay('There are many herbs in this world, some have special properties. They can be used in {runes} and for {herbalist magic}.', cid)
	end
	if(msgcontains(msg, 'magic')) then
		if(getPlayerStorageValue(cid,2059) == 1) then
				selfSay('I told you about herbalist magic, but I have heard about more powerful forms of magic, the elemental magic.', cid)
				selfSay('Elemental magic is divided in 6 elements. 4 basic elements (fire,earth, water and wind) and 2 more (life and death).', cid)
				selfSay('In order to achieve such power you need to be blessed by the Ainurs. You may only choose one of the six.', cid)
				selfSay('I can teach you about just one of the six forms, but I need you to {prove} yourself to me once more.', cid)
		else
				selfSay('There is many ways of using magic, the most basic and easy way is the herbalist magic, that may be created by the elves, but dwarves can master it too.', cid)
				selfSay('Herbalist magic dont need enforced spiritual power as other kinds of magic, you use the power of magical {herbs}. You may also put that power into a {rune} and use it later. ', cid)
				selfSay('If you want to learn some spells, I may help you. But you have to prove yourself by doing a {mission} for me. ', cid)
		end
	end
	if(msgcontains(msg, 'prove')) then
		if(getPlayerStorageValue(cid,2059) == 1 and getPlayerStorageValue(cid,2066) < 0 and getPlayerStorageValue(cid,2067) < 0 and getPlayerStorageValue(cid,2065) < 0) then
			if(getPlayerItemCount(cid,5904) >= 100)then
				selfSay('You must be pretty strong if you can get so much magic sulphur, now you have to choose what kind of magic you want learn', cid)	
				selfSay('{Fire}, {Earth}, {Ice}, {Energy}, {life}, {death}', cid)
				talkState[talkUser] = 4			
			else
				selfSay('Before you can prove me anything, you need to get a life crystal. So start by collecting 100 magic sulphurs', cid)
			end
		end
	end
	if(msgcontains(msg, 'fire') or msgcontains(msg, 'earth') or msgcontains(msg, 'ice') or msgcontains(msg, 'energy') or msgcontains(msg, 'life')) then
		if(talkState[talkUser] == 4) then
			if(getPlayerStorageValue(cid,2059) == 1) then
				if(getPlayerItemCount(cid,5904) >= 100 and talkState[talkUser] == 4)then
				selfSay('How disappointing.. You need that life crystal, so go to the south downs, somewhere over there you may find an old elf, he may help you...', cid)	
				selfSay('And dont make me waste my time anymore', cid)
				talkState[talkUser] = 0			
				else
				selfSay('Yes, that is one of the elements..', cid)
				end
			end
		end
	end
	if(msgcontains(msg, 'death')) then
		if(talkState[talkUser] == 4) then
			if(getPlayerStorageValue(cid,2059) == 1) then
				if(getPlayerItemCount(cid,5904) >= 100 and talkState[talkUser] == 4)then
				selfSay('Nice to hear that.. Its time to prove me if you have what is needed to learn death magic.', cid)	
				selfSay('Come back with white skull and I will teach you anything you need know to learn death magic.', cid)
				setPlayerStorageValue(cid,30020,19)
				setPlayerStorageValue(cid,2066,0)				
				talkState[talkUser] = 0			
				else
				selfSay('Yes, it is one of the elements.', cid)
				end
			end
		end
	end
	if(msgcontains(msg, 'mission') or msgcontains(msg, 'death') or msgcontains(msg, 'prove')) then
		if(getPlayerStorageValue(cid,2066) == 0 and getPlayerItemCount(cid,5904) >= 100) then
			doPlayerRemoveItem(cid,5904,100)
			selfSay('Here you have a life crystal, you will have to look for an Ainurs Statue. You will find one here in Fornost Erain. Do it quickly or you will have to get white skull again.', cid)
			doPlayerAddItem(cid,2177,1)
			setPlayerStorageValue(cid,2066,1)
		elseif(getPlayerStorageValue(cid,2066) == 0)then
			selfSay('You are missing something...', cid)
		end
	end
	if(msgcontains(msg, 'mission')) then
			if(getPlayerStorageValue(cid,2059) < 0 and getPlayerStorageValue(cid,2024) == 0) then
				selfSay('I am in the need of some magic sulphur. To get some of this sulphur,you have to kill ghosts.', cid)
				selfSay('Down in the dungeons you may find some ghosts and more dangerous spectres, got {5} magic sulphurs for me. {yes}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2059) == 0) then
				if(getPlayerItemCount(cid,5904) >= 5) then
					doPlayerRemoveItem(cid,5904,5)
					doPlayerAddExperience(cid,20000)
				 	doPlayerAddItem(cid,2260,10)
					selfSay('Thanks you!!, now I will teach you to choose between 2 spells, {ok}? (You have received 20000 exp and 10 blank runes)', cid)
					setPlayerStorageValue(cid,2059,1)
				talkState[talkUser] = 2
				end
			elseif(getPlayerStorageValue(cid,2059) == 1 and getPlayerStorageValue(cid,2054) < 0 and getPlayerStorageValue(cid,2068) < 0) then
					selfSay('Thanks you!!, now you will have to choose between 2 spells, {ok}?', cid)
					talkState[talkUser] = 2
			elseif(getPlayerStorageValue(cid,2059) == 1 and getPlayerStorageValue(cid,2066) < 0) then
				selfSay('I dont have anymore missions for you, but you didnt learn all I have to teach about magic...', cid)
			elseif(getPlayerStorageValue(cid,2066) == 1) then
				selfSay('Let the death guide you.', cid)
			elseif(getPlayerStorageValue(cid,2059) < 0)then
				selfSay('Dont mind, Its look like you are not stronger enough to learn from me.', cid)
			elseif(getPlayerStorageValue(cid,2086) < 0 and getPlayerStorageValue(cid,2065) == 0) then
				selfSay('It looks like you manage to get that blessing, well done! I can teach you more death magic if yo want.', cid)
				selfSay('Bring me 5 {small diamonds} and I will teach you, {ok}?.', cid)
				talkState[talkUser] = 5
			elseif(getPlayerItemCount(cid,2145) >= 5 and getPlayerStorageValue(cid,2086) == 0) then
					doPlayerRemoveItem(cid,2145,5)
					setPlayerStorageValue(cid,2086,1)
					doPlayerAddExperience(cid,10000)
					selfSay('Great! thanks you.', cid)
				if(getPlayerStorageValue(cid,2065) == 0) then
					selfSay('You may choose one of this 3 spells and I will teach you: {Death Spear} (distance), {Death Beam} (magic level) or {Twisting Death Slash} (melee)?', cid)
					talkState[talkUser] = 6
				end
			end
			
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2059) < 0) then
				selfSay('Thanks you son.. You look like a skilled warrior, but be careful! ', cid)
				setPlayerStorageValue(cid,30013,12)
				setPlayerStorageValue(cid,2059,0)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
				selfSay('I may teach you: {herbal light explosion rune} (phisical damage) or {herbal wide light explosion rune}(wide phisical damage).', cid)
				selfSay('Choose wisely, the spell should be related to your fighting style.', cid)
				talkState[talkUser] = 3	
		end
		if(talkState[talkUser] == 5) then
			if(getPlayerStorageValue(cid,2086) < 0) then
				selfSay('Ok, I will be waiting.', cid)
				setPlayerStorageValue(cid,30020,19)
				setPlayerStorageValue(cid,2086,0)
			end
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'herbal wide light explosion')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal wide light explosion rune}!.', cid)
			setPlayerStorageValue(cid,2068,0)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'herbal light explosion')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal light explosion rune}!.', cid)
			setPlayerStorageValue(cid,2054,0)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'death spear')) then
		if(talkState[talkUser] == 6) then
			setPlayerStorageValue(cid,2083,0)
		end
		selfSay('Ok, just see your quest log.', cid)
		talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'death beam')) then
		if(talkState[talkUser] == 6) then
			setPlayerStorageValue(cid,2084,0)
		end
		selfSay('Ok, just see your quest log.', cid)
		talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'twisting death slash')) then
		if(talkState[talkUser] == 6) then
			setPlayerStorageValue(cid,2085,0)
		end
		selfSay('Ok, just see your quest log.', cid)
		talkState[talkUser] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
