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
shopModule:addBuyableItem({'mana potion'}, 7620, 70, 1, 'mana potion')



function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'herbs')) then
				selfSay('There are many herbs in this world, some have special properties. They can be used in {runes} and for {herbalist magic}.', cid)
	end
	if(msgcontains(msg, 'magic') or msgcontains(msg, 'rune')) then
				selfSay('There is many ways of using magic in this world, the most basic and easy way is the herbalist magic, that was created by the elves.', cid)
				selfSay('Herbalist magic dont need enforced spiritual power as other kinds of magic, you use the power of magical {herbs}. You may also put that power into a {rune} and use it later. ', cid)
				selfSay('If you want to learn young one, I may help you. But you have to help me with a {mission}. ', cid)
	end
	if(msgcontains(msg, 'mission')) then
			if(getPlayerStorageValue(cid,2036) < 0 and getPlayerStorageValue(cid,2020) == 0) then
				selfSay('Last month, 2 renegades broke into my house and stole a very old book of mine, I am too old to get it back, may you recover it for me, {yes}?', cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2036) == 0) then
				if(getPlayerItemCount(cid,1959) >= 1) then
					doPlayerRemoveItem(cid,1959,1)
					doPlayerAddExperience(cid,2000)
				 doPlayerAddItem(cid,2260,10)
					selfSay('Thanks you!! My old book!, now you will have to choose between 3 rune casting spells, {ok}? (You have received 2000 exp and 10 blank runes)', cid)
					setPlayerStorageValue(cid,2036,1)
				talkState[talkUser] = 2
				end
			elseif(getPlayerStorageValue(cid,2036) == 1) then
				selfSay('I dont have anymore missions for you, but thanks.', cid)
			else
				selfSay('Dont mind, Its look like you are not stronger enough to learn from me.', cid)
			end
			
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2036) < 0) then
				selfSay('Thanks you son.. The renegades have a litle town in the East Brandywine Hills, west from here, good luck! ', cid)
				setPlayerStorageValue(cid,30003,3)
				setPlayerStorageValue(cid,2036,0)
			end
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
				selfSay('I may teach you: {herbal poison rune}, {herbal paralyze rune}, {herbal healing rune}.', cid)
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
	if(msgcontains(msg, 'herbal healing')) then
		if(talkState[talkUser] == 3) then
			selfSay('You may now use {herbal healing rune}!.', cid)
			setPlayerStorageValue(cid,2035,0)
			talkState[talkUser] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())