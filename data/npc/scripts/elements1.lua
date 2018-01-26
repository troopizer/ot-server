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
				selfSay('You have evil power inside you, get out of here!', cid)
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
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'life cristal') or msgcontains(msg, 'sulphur')) then
			if(getPlayerStorageValue(cid,2067) == 0) then
				if(getPlayerItemCount(cid,5904) >= 100)then
					doPlayerRemoveItem(cid,5904,100)
					selfSay('Here you have your life crystal, you will have to look for an Ainurs Statue. You will find one in Fornost Erain.', cid)
					selfSay('You will also need an elemental jewel ({ruby}-fire, {amethyst}-energy, {emerald}-earth or {sapphire}-ice) or all four for life magic.', cid)
					doPlayerAddItem(cid,2177,1)
					setPlayerStorageValue(cid,2067,1)
				end
			end
	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2067) < 0) then
				selfSay('You look like a skilled warrior, but be careful! ', cid)
				setPlayerStorageValue(cid,30020,19)
				setPlayerStorageValue(cid,2067,0)
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
