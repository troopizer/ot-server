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


shopModule:addBuyableItem({'blank rune'}, 2260, 7, 1, 'blank rune')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong mana potion'}, 7589, 90, 1, 'strong mana potion')
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
				selfSay('I have been told that Argonui is currently the 13th captain of the dunedain. And his son Arador is in charge of this area.', cid)
	end
	if(msgcontains(msg, 'herbs')) then
				selfSay('There are many herbs in this world, some have special properties. They can be used in {runes} and for {herbalist magic}.', cid)
	end
	if(msgcontains(msg, 'magic') or msgcontains(msg, 'rune')) then
				selfSay('There is many ways of using magic in this world, the most basic and easy way is the herbalist magic, that was created by the elves.', cid)
				selfSay('Herbalist magic dont need enforced spiritual power as other kinds of magic, you use the power of magical {herbs}. You may also put that power into a {rune} and use it later. ', cid)
				selfSay('I may teach you. But you have to help me with a {mission}. ', cid)
	end
	if(msgcontains(msg, 'mission')) then
			if(getPlayerStorageValue(cid,2118) < 0 and getPlayerStorageValue(cid,2036) == 0) then
				selfSay('You are very kind my dear.. I am a very peaceful witch, you know? I practice just herbalist magic, nothing dark as the others witches.', cid)
				selfSay('Despite that the dunedain dont trust me, so I want to send Arador a gift. I want to give him a nice armor.', cid)
				selfSay('There is an outlawz camp west from here, where lives a very good leather worker. Convince him to make a {Strong Leather Armor} for me, I will pay and teach you, {yes}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2118) == 0) then
				if(getPlayerItemCount(cid,8876) >= 1) then
					doPlayerRemoveItem(cid,8876,1)
					doPlayerAddExperience(cid,60000)
				 	doPlayerAddItem(cid,2260,10)
				 	doPlayerAddItem(cid,2152,50)
					selfSay('Thanks you!!It seems that you know something about runes. Now you will have to choose between 3 rune casting spells. If you already knew one, I will help you to make it stronger, {ok}? (You have received 60000 exp, 5000 gp and 10 blank runes)', cid)
					setPlayerStorageValue(cid,2118,1)
				talkState[talkUser] = 2
				end
			elseif(getPlayerStorageValue(cid,2118) == 1) then
				selfSay('I dont have anymore missions for you, but thanks.', cid)
			else
				selfSay('Dont mind, Its look like you are not stronger enough to learn from me.', cid)
			end		
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2118) < 0) then
				selfSay('Thanks you son.. I will be waiting and be careful they dont like outsiders in that camp.', cid)
				setPlayerStorageValue(cid,30010,9)
				setPlayerStorageValue(cid,2118,0)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	if(getPlayerStorageValue(cid,2033) == 0) then	
		if(msgcontains(msg, 'ok')) then
			if(talkState[talkUser] == 2) then
				selfSay('I may teach you: {herbal strong poison rune} (new), {herbal paralyze rune}, {herbal healing rune}.', cid)
				selfSay('Choose wisely, the spell should be related to your fighting style.', cid)
				talkState[talkUser] = 3	
			end
		end
		if(msgcontains(msg, 'herbal strong poison')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal strong poison rune}!.', cid)
				setPlayerStorageValue(cid,2103,0)
				talkState[talkUser] = 0
			end
		end
		if(msgcontains(msg, 'herbal paralyze')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal paralyze rune}!.', cid)
				setPlayerStorageValue(cid,2034,0)
				talkState[talkUser] = 0
			end
		end
		if(msgcontains(msg, 'herbal healing')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal healing rune}!.', cid)
				setPlayerStorageValue(cid,2035,0)
				talkState[talkUser] = 0
			end
		end
	end
	if(getPlayerStorageValue(cid,2034) == 0) then	
		if(msgcontains(msg, 'ok')) then
			if(talkState[talkUser] == 2) then
				selfSay('I may teach you: {herbal poison rune}, {herbal strong paralyze rune} (new), {herbal healing rune}.', cid)
				selfSay('Choose wisely, the spell should be related to your fighting style.', cid)
				talkState[talkUser] = 3	
			end
		end
		if(msgcontains(msg, 'herbal poison')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal poison rune}!.', cid)
				setPlayerStorageValue(cid,2033,0)
				talkState[talkUser] = 0
			end
		end
		if(msgcontains(msg, 'herbal strong paralyze')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal strong paralyze rune}!.', cid)
				setPlayerStorageValue(cid,2104,0)
				talkState[talkUser] = 0
			end
		end
		if(msgcontains(msg, 'herbal healing')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal healing rune}!.', cid)
				setPlayerStorageValue(cid,2035,0)
				talkState[talkUser] = 0
			end
		end
	end
	if(getPlayerStorageValue(cid,2035) == 0) then	
		if(msgcontains(msg, 'ok')) then
			if(talkState[talkUser] == 2) then
				selfSay('I may teach you: {herbal poison rune}, {herbal paralyze rune}, {herbal strong healing rune} (new).', cid)
				selfSay('Choose wisely, the spell should be related to your fighting style.', cid)
				talkState[talkUser] = 3	
			end
		end
		if(msgcontains(msg, 'herbal poison')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal poison rune}!.', cid)
				setPlayerStorageValue(cid,2033,0)
				talkState[talkUser] = 0
			end
		end
		if(msgcontains(msg, 'herbal paralyze')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal paralyze rune}!.', cid)
				setPlayerStorageValue(cid,2034,0)
				talkState[talkUser] = 0
			end
		end
		if(msgcontains(msg, 'herbal strong healing')) then
			if(talkState[talkUser] == 3) then
				selfSay('You may now use {herbal strong healing rune}!.', cid)
				setPlayerStorageValue(cid,2105,0)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
