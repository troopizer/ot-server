local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if(msgcontains(msg, 'mission') or msgcontains(msg, 'addon')) then
	if (getPlayerStorageValue(cid,2308) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2308,4)
			setPlayerStorageValue(cid,2309,150)
end
	if (getPlayerStorageValue(cid,2113) == 0) then
		if(getPlayerItemCount(cid, 2110) >= 1) then
			doPlayerRemoveItem(cid, 2110, 1)
			selfSay('Thanks! You are a very kind man, Bilbo will love this doll. You have my gratitude and will be always welcome in Bag End. Take this present (new Addon and 50000 exp).', cid)
			doPlayerAddOutfit(cid, 140, 1)
			doPlayerAddOutfit(cid, 132, 1)
			doPlayerAddExperience(cid,50000)
			setPlayerStorageValue(cid,2113,1)
			x=getPlayerStorageValue(cid,2309)+4
				setPlayerStorageValue(cid,2309,x)
				if (getPlayerStorageValue(cid,2309) > 60 and getPlayerStorageValue(cid,2308) == 4) then
					setPlayerStorageValue(cid,2308,5)
				end
		else
			selfSay('I hope you can find a nice doll.', cid)
		end
	elseif (getPlayerStorageValue(cid,2113) == 1) then
		selfSay('My friend, I dont have any mission for you, but take some cheese.', cid)
		doPlayerAddItem(cid,2696,1)
		return false
	end
	if (getPlayerStorageValue(cid,2113) < 0) then
		selfSay('A mission here in hobbiton? You are not of around here, arent you?', cid)
		if (getPlayerStorageValue(cid,2032) == 1) then
			selfSay('But I actually may have a favour to ask. I got a little son, Bilbo. I want to give him a nice doll, but its impossible to get a good one in this lands. If you find one in your journeys, would you bring it to me?, {yes}?.', cid)
			talkState[talkUser] = 1
		else
			selfSay('I will give you an advice.. If you get a nice suit, people will be more open to give you jobs around here. Go to Buckland, there is a tailor that may help you.', cid)
		end
	end
end
if(msgcontains(msg, 'yes')) then
	if (getPlayerStorageValue(cid,2113) < 0 and talkState[talkUser] == 1) then
		selfSay('Thats great to hear. I will be waiting for you.', cid)
		setPlayerStorageValue(cid,30023,22)
		setPlayerStorageValue(cid,2113,0)
	end
end
if(msgcontains(msg, 'bungo baggins')) then
	selfSay('Yes, I am Bungo Baggins, husband of Belladonna Took and father of Bilbo Baggins.', cid)
end
if(msgcontains(msg, 'bilbo')) then
	selfSay('Bilbo is my little son. He isnt at home right now.', cid)
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
