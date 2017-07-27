local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if (not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = (NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid)

	-----------------------------------------------------------------------
	-- GENERAL INTERACTION                                               --

	if (msgcontains(msg, 'Daisy')) then
		selfSay("Poor {cat}. I have no more food for it and I'm old.", cid)
		return false
	end

	if (getPlayerStorageValue(cid,2013) == 2) then
		if (msgcontains(msg, 'addon')) then
			if (doPlayerRemoveItem(cid,5890,10) and doPlayerRemoveItem(cid,5878,20) and doPlayerRemoveItem(cid,5897,1) ) then
				selfSay("sorry I am a thief.", cid)
			else
				selfSay("I used to mend the clothes of the citzen of Buckland and Bree.", cid)
				selfSay("I would fabric you new clothes without any cost, but nowadays I don't have the materials anymore.", cid)
				selfSay("If you bring me 10 chicken feathers, 20 leathers and a wolf paw I mend you a citezen's clothes.", cid)
			end
		end
	end

	-- addon interaction

	-----------------------------------------------------------------------
	-- QUEST INTERACTION                                                 --

	if (getPlayerStorageValue(cid,2013) < 0) then
		
		if (msgcontains(msg, 'cat')) then
			selfSay("As I told you. I'm old and my cat needs food. Could you get me some wheat? ({yes}/{no})", cid)
			return true
		end
		if (msgcontains(msg, 'yes')) then
			selfSay("This is wonderful. You could talk to Hildibrand to southern Buckland. He would help you if you tell him your intention. Good luck !", cid)
			setPlayerStorageValue(cid,2013,0)
			return true
		end
		if (msgcontains(msg, 'no')) then
			selfSay("Well, I'd manage my self.", cid)
		end
	end

	if (getPlayerStorageValue(cid,2013) == 1) then
		if msgcontains(msg, 'wheat') then
			if doPlayerRemoveItem(cid, 2694, 10) then
				selfSay("You brought the wheat for my cat ! Thank you very much. Now I ought you a favor. I'm a little old, but I can design clothes to improve your appearance. Just ask for it. ({addon})", cid)
				setPlayerStorageValue(cid,2013,2)
				return true
			else
				selfSay("Thank you, but I would need 10 wheats.", cid)
			end
		end
	end

	return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
