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


shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')

shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'herbs')) then
				selfSay('There are many herbs in this world, some have special properties. They can be used in potions and for {herbalist magic}.', cid)
	end
	if(msgcontains(msg, 'magic') or msgcontains(msg, 'herbalist magic')) then
				selfSay('There is many ways of using magic in this world, the most basic and easy way is the herbalist magic, that was created by the elves.', cid)
				selfSay('Herbalist magic dont need enforced spiritual power as other kinds of magic, you use the power of magical {herbs}. Not many humans nor dwarves know about it. ', cid)
				selfSay('If you want to learn, I can teach you the basics. But you have to help me with a {mission}. ', cid)
	end
	if(msgcontains(msg, 'mission') or msgcontains(msg, 'barrow downs')) then
			if(getPlayerStorageValue(cid,2017) < 0) then
				selfSay('If you leave Bree using the south road and then take a side path to the west, you will find the Barrow Downs. If you help me with some tasks over there, I will pay you and maybe teach you something about {herbalist magic}, {yes}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2017) == 0) then
				if(getPlayerItemCount(cid,2798) >= 5) then
					doPlayerRemoveItem(cid,2798,5)
					doPlayerAddExperience(cid,1000)
					doPlayerAddItem(cid,7618,2)
					selfSay('Great! You are really brave, I have another {mission} for you. (You have received 1000 exp and 2 health potions)', cid)
					setPlayerStorageValue(cid,2017,1)
				end
			end
			if(getPlayerStorageValue(cid,2021) < 0 and getPlayerStorageValue(cid,2017) == 1) then
				selfSay('So.. Now I need some skulls in order to create some potions, you can get them after defeating some skeletons. If you help me I will teach you a very useful herbalist magic {yes}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2021) == 0) then
				if(getPlayerItemCount(cid,2229) >= 5) then
					doPlayerRemoveItem(cid,2229,5)
					doPlayerAddExperience(cid,1500)
					doPlayerAddItem(cid,7618,2)
					selfSay('Thanks! You are really strong, I will teach you the spell I told you. I also have another {mission} for you. (You have received 1500 exp and 2 health potions)', cid)
					setPlayerStorageValue(cid,2021,1)
					if(getPlayerStorageValue(cid,2020) < 0) then
						setPlayerStorageValue(cid,30008,7)
						setPlayerStorageValue(cid,2020,0)
						selfSay('You can now use {herbal light healing}.', cid)
						selfSay('(You opened your {herbalist magic trait}, you can find information about your magic abilities in the {Quest Menu}) ', cid)
					end
				end
			end
			if(getPlayerStorageValue(cid,2022) < 0 and getPlayerStorageValue(cid,2021) == 1) then
				selfSay('Ok, you have probed to be a strong and brave man. So I will tell you about something I discovered in an old journal.', cid)
				selfSay('It seems that in the Barrow Downs lies the tomb of Gharazon, a great sorcerer. There you will find a {memory stone}, that saves some of his knowledge.', cid)
				selfSay('If you go there and bring me this stone, I will teach you another useful herbalist spell. Do we have a deal, {yes}?', cid)
				talkState[talkUser] = 1

			elseif(getPlayerStorageValue(cid,2022) == 0) then
				if(getPlayerItemCount(cid,4852) >= 1) then
					doPlayerRemoveItem(cid,4852,1)
					doPlayerAddExperience(cid,2000)
					doPlayerAddItem(cid,7618,2)
					selfSay('Thanks! You have a great spirit, should become a sorcerer, anyway I will teach you the spell I told you.(You have received 2000 exp and 2 health potions)', cid)
					setPlayerStorageValue(cid,2022,1)
					if(getPlayerStorageValue(cid,2024) < 0) then
						setPlayerStorageValue(cid,2024,0)
						selfSay('You can now use {herbal antidote}.', cid)
					end
				end

			end
			if(getPlayerStorageValue(cid,2031) < 0 and getPlayerStorageValue(cid,2022) == 1) then
				selfSay('You really want to learn more, if you are asking for another mission', cid)
				selfSay('The memory stone yo bring me is very hard to use, but I have read that there was a man in the army of Elendil, that marched and died during the war with the dark lord.', cid)
				selfSay('His name was Aerdinul and he knew how to use the memory stones, he was burried in the barrow downs along the warriors that feld in the battle of Dagorlad. You can find that book, {yes}?', cid)
				talkState[talkUser] = 1

			elseif(getPlayerStorageValue(cid,2031) == 0) then
				if(getPlayerItemCount(cid,6533) >= 1) then
					doPlayerRemoveItem(cid,6533,1)
					doPlayerAddExperience(cid,2500)
					doPlayerAddItem(cid,7618,2)
					selfSay('You are amazing child, as I promise I will teach you one spell, but you will have to choose between 6 spells, {ok}? (You have received 2500 exp and 2 health potions)', cid)
					setPlayerStorageValue(cid,2031,1)
				talkState[talkUser] = 2
				end

			end
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2017) < 0) then
				selfSay('Barrow Downs is a dangerous place, full of evil spirits. But this beings are vessels of magic powers, so there you can find ingredients for potions and spells, bring me {5 blood herbs}, if you are brave enough. ', cid)
				setPlayerStorageValue(cid,30004,6)
				setPlayerStorageValue(cid,2017,0)
			elseif(getPlayerStorageValue(cid,2021) < 0) then
				selfSay('Great! Bring me {5 skulls}, good luck and be careful.', cid)
				setPlayerStorageValue(cid,2021,0)
			elseif(getPlayerStorageValue(cid,2022) < 0) then
				selfSay('Ok, I will be waiting for you.', cid)
				setPlayerStorageValue(cid,2022,0)
			elseif(getPlayerStorageValue(cid,2031) < 0) then
				selfSay('You are really a brave one, bring me that book and I will teach one of my most powerful spells.', cid)
				setPlayerStorageValue(cid,2031,0)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
				selfSay('I may teach you: {herbal sword boost}, {herbal axe boost}, {herbal club boost}, {herbal distance boost}, {herbal shielding boost} and {herbal hit points boost}.', cid)
				selfSay('Choose wisely, the spell should be related to your fighting style (warrior,archer or blocker).', cid)
				talkState[talkUser] = 3	
		end
	end
	if(msgcontains(msg, 'sword')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal sword boost}!.', cid)
			setPlayerStorageValue(cid,2025,0)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'club')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal club boost}!.', cid)
			setPlayerStorageValue(cid,2026,0)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'axe')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal axe boost}!.', cid)
			setPlayerStorageValue(cid,2027,0)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'distance')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal distance boost}!.', cid)
			setPlayerStorageValue(cid,2028,0)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'shielding')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal shielding boost}!.', cid)
			setPlayerStorageValue(cid,2029,0)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'hit points')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal hit points boost}!.', cid)
			setPlayerStorageValue(cid,2030,0)
			talkState[talkUser] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())