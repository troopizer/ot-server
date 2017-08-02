local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if (not npcHandler:isFocused(cid)) then
		return false
	end
	
	-----------------------------------------------------------------------
	-- GENERAL INTERACTION                                               --

	if (msgcontains(msg, 'mayor')) then
		selfSay('So, the {Mayor} send you to us?', cid)
		selfSay('Did you come to help us? It seems the fat sit sitter thinks we are not doing our duties well enough.', cid)
		return false
	end

	-----------------------------------------------------------------------
	-- FILTER INTERACTION                                                --

	if (getPlayerStorageValue(cid,2007) ~= 4) then
		selfSay("Come back later you pilgrim. Get back to the city and talk to {Mayor} to complete the baby steps. You don't belong here.", cid)
		return false
	end

	-----------------------------------------------------------------------
	-- QUEST INTERACTIONS                                                --

	if (msgcontains(msg, 'mission')) then

		if (getPlayerStorageValue(cid,2008) == 0) then
			selfSay("This is the more dangerous place guarded by our forces. Nobody wants to stay. (You received 100 exp)", cid)
			doPlayerAddExperience(cid,500)
			setPlayerStorageValue(cid,2008,1)
			return true
		end

		if (getPlayerStorageValue(cid,2009) < 0) then
			selfSay("I don't believe in your strength pilgrim. I guess i'll test you first.", cid)
			selfSay("Go and get me 11 spider silks.", cid)
			selfSay("You can find some nasty aracnids to the east.", cid)
			setPlayerStorageValue(cid,2009,0)
			return true
		end
		if (getPlayerStorageValue(cid,2009) == 0) then
			if (doPlayerRemoveItem(cid, 5879, 11) == TRUE) then -- item : spider silk
				setPlayerStorageValue(cid,2009,1)
				selfSay("Well done! Now I can give you a real {mission}. (You received 1500 exp)", cid)
				doPlayerAddExperience(cid,1500)
				return true
			else
				selfSay("Can't you get just 11 spider silks?", cid)
				return false
			end
		end

		if (getPlayerStorageValue(cid,2010) < 0) then
			selfSay("This proof isn't enough kiddo.", cid)
			selfSay("Any one can kill some spiders, even the red ones.", cid)
			selfSay("Go and get me a tarantula egg. Those creamy and salty eggs make the best breakfast for me and the Boys, isn' it so ?!", cid)
			setPlayerStorageValue(cid,2010,0)
			return true
		end
		if (getPlayerStorageValue(cid,2010) == 0) then
			if (doPlayerRemoveItem(cid, 11192, 1) == true) then -- item : tarantula egg
				selfSay("R-r-rea ...", cid)
				selfSay("It seams the Mayor and his incertion plan are getting results. You are an example for the fat populiest's policies.", cid)
				selfSay("You have earn the most precious item on this mountain. Hey, boys! Learn from this Kido that brought us breakfast !", cid)
				selfSay("You could achive great respect. You remind me of an elf I knew onces. Oh his sister, her ears, so sticky ...(You received 2500 exp)", cid)
				doPlayerAddExperience(cid,2500)
				setPlayerStorageValue(cid,2010,1)
				return true
			else
				selfSay("Can't you get just 1 tarantula egg?")
				return false
			end
		end

		if (getPlayerStorageValue(cid,2011) < 0) then
			selfSay("You probed your self worthily. From now on you will be rembembered here as the 'the One Egg Bringer'",cid)
			selfSay("Now, I would like to propose you a very import mission. This is 'Top Secret', the Mayor cannot know, nothing you hear?! Is our little secret, you, me and the Boys, ISN'T it BOYS !?",cid)
			selfSay("At the far east of this mountains percnotates some remaining bandits we coudln't catch last time.",cid)
			selfSay("That last time I lost my boots and I'm sure the bandits took them. If you go and get my boots back I'll reward you.")
			selfSay("For this jorney you will require proper equipment. A shovel and a rope is what you will use to explore this mountain.")
			setPlayerStorageValue(cid,2011,0)
		end
		if (getPlayerStorageValue(cid,2011) < 3) then
			selfSay("Go and get me my boots!",cid)
		end
		if (getPlayerStorageValue(cid,2011) == 3) then
			if (doPlayerRemoveItem(cid, 9817, 1) == true) then
				selfSay("You got them !",cid)
				selfSay("You truely are a heroe ! Hey ! Your good for nothing monkeys ! This kiddo could bring my rusty father's useless boots !",cid)
				selfSay("Thank you very much. I cannot sleep without this old boots. (You received 3000 exp and 20 platinum coins)", cid)
				doPlayerAddExperience(cid,6000)
				doPlayerAddItem(cid,2152,20)
				setPlayerStorageValue(cid,2011,4)
			end
		end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
