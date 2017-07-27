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

	if (msgcontains(msg, 'Daisy') or msgcontains(msg, 'cat')) then
		selfSay("I'm old, but hadn't any problem until that cat came. It's hair is all over Buckland.", cid)
		selfSay('Misses Daisy Gamwich is my neightboard. Before she owned that cat of hers, I already had a {problem} with her, all started when a kid broked my window and she helped him. What a needy old lady. She did it only to have someone at her side.', cid)
		selfSay('Then that cat arrived. You know cats have no sense of territory. It started to frequent my house, peing and leaving traces of hair all over the place, no, more ! All over Buckland !', cid)
		return false
	end

	if (getPlayerStorageValue(cid,2014) == 2) then
		if (msgcontains(msg, 'addon')) then
			if (doPlayerRemoveItem(cid,5878,30) and doPlayerRemoveItem(cid,5896,1) ) then
				selfSay("sorry I am a thief.", cid)
			else
				selfSay("I used to mend the hunters of the citzen of Buckland and Bree.", cid)
				selfSay("I would fabric you new clothes without any cost, but nowadays I don't have the materials anymore.", cid)
				selfSay("If you bring me 30 leathers and a bear paw I mend you a hunter's clothes.", cid)
			end
		end
	end

	-- addon interaction

	-----------------------------------------------------------------------
	-- QUEST INTERACTION                                                 --

	if (getPlayerStorageValue(cid,2014) < 0) then
		if (msgcontains(msg, 'problem')) then
			selfSay("Yes, that little problem of mine. If only that could be {solved}.", cid)
			return true
		end
		if (msgcontains(msg, 'solved')) then
			selfSay("It seems you are on my side. Well, then I encourage you to kill that cat.", cid)
			selfSay("If you bring me back its collar I could you help with my craft. I can make you very special clothing. Would you agree ? ({yes}/{no})", cid)
			return true
		end
		if (msgcontains(msg, 'yes')) then
			selfSay("Excellent ! come back when you have killed that cat.")
			setPlayerStorageValue(cid,2014,0)
			return true
		end
		if (msgcontains(msg, 'no')) then
			selfSay('What a waste of my time. Get out of my sieght!', cid)
			return false
		end
	end
	if (getPlayerStorageValue(cid,2014) == 1) then
		selfSay("You have killed Misses Daisy Gamwich's cat. Now I'm free to work properlly. If you will I can make you new clothes to improve your battle appearance. ({addon})")
		setPlayerStorageValue(cid,2014,2)
		return true
	end

	return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
