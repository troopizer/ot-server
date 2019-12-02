local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

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
				selfSay('There are many herbs in this world, some have special properties. They can be used in runes and for herbalist magic.', cid)
	end
	if(msgcontains(msg, 'yes')) then
		if(getPlayerStorageValue(cid,2302) < 0) then
			if(talkState[talkUser] >= 2) then
				selfSay('To learn you fisrt spell here, you will have to defeat 40 cultists and bring 1 of each elemental jewels.', cid)
				setPlayerStorageValue(cid,2302,0)
				talkState[talkUser] = 0
			end
		end
		if(getPlayerStorageValue(cid,2302) == 41 and getPlayerStorageValue(cid,2303) < 0) then
			if(talkState[talkUser] >= 2) then
				selfSay('To learn your second spell, you will have to defeat 40 elemental masters and bring 1 of each elemental jewels.', cid)
				setPlayerStorageValue(cid,2303,0)
				talkState[talkUser] = 0
			end
		end
		if(getPlayerStorageValue(cid,2303) == 41 or getPlayerStorageValue(cid,2303) == 42) then
			if(talkState[talkUser] >= 2) then
				selfSay('You cant learn anymore spells with me. You have mastered our spells', cid)
				setPlayerStorageValue(cid,2303,0)
				talkState[talkUser] = 0
			end
		end
		if(getPlayerStorageValue(cid,2302) == 40) then
			if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2185) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2185,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 4) then
			if(getPlayerStorageValue(cid,2186) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2186,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 5) then
			if(getPlayerStorageValue(cid,2180) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2180,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 6) then
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2077,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			elseif(talkState[talkUser] == 7) then
			if(getPlayerStorageValue(cid,2184) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2184,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 8) then
			if(getPlayerStorageValue(cid,2183) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2183,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 9) then
			if(getPlayerStorageValue(cid,2182) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2182,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 10) then
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2079,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			elseif(talkState[talkUser] == 11) then
			if(getPlayerStorageValue(cid,2181) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2181,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 12) then
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2302,41)
				setPlayerStorageValue(cid,2078,0)
				selfSay('You have learned the spell, look at your quest log. Session 1 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
		end
		if(getPlayerStorageValue(cid,2303) == 40) then
			if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2185) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2185,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 4) then
			if(getPlayerStorageValue(cid,2186) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2186,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 5) then
			if(getPlayerStorageValue(cid,2180) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2180,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 6) then
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2077,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			elseif(talkState[talkUser] == 7) then
			if(getPlayerStorageValue(cid,2184) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2184,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 8) then
			if(getPlayerStorageValue(cid,2183) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2183,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 9) then
			if(getPlayerStorageValue(cid,2182) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2182,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 10) then
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2079,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			elseif(talkState[talkUser] == 11) then
			if(getPlayerStorageValue(cid,2181) == 0) then
				selfSay('You already learned this spell.', cid)
			else
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2181,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
			elseif(talkState[talkUser] == 12) then
			if(getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,2303,41)
				setPlayerStorageValue(cid,2078,0)
				selfSay('You have learned the spell, look at your quest log. Session 2 of 2.', cid)
			else
				selfSay('You need 1 of each elemental jewels.', cid)
			end
			end
		end
	elseif(msgcontains(msg, 'list')) then
	if(getPlayerStorageValue(cid,2063) > 0) then
		selfSay('I can teach you: ', cid)
		if(getPlayerStorageValue(cid,2185) < 0) then
		selfSay('{Elite Ice Strike} (Magic level) - Tier 2', cid)
		end
		if(getPlayerStorageValue(cid,2186) < 0) then
		selfSay('{Ice Touch} (Magic level) - Tier 2', cid)
		end
		if(getPlayerStorageValue(cid,2077) == 0) then
		if(getPlayerStorageValue(cid,2180) < 0) then
		selfSay('{Elite Ice Spear} (Distace skill) - Tier 2', cid)
		end
		if(getPlayerStorageValue(cid,2184) < 0) then
		selfSay('{Ice Grenade} (Distace skill) - Tier 2', cid)
		end
		else
		selfSay('{Ice Spear} (Distace skill) - Tier 1', cid)
		end
		if(getPlayerStorageValue(cid,2078) == 0) then
		if(getPlayerStorageValue(cid,2181) < 0) then
		selfSay('{Ice Explosion} (Magic level) - Tier 2', cid)
		end
		else
		selfSay('{Ice Beam} (Magic level) - Tier 1', cid)
		end
		if(getPlayerStorageValue(cid,2079) == 0) then
		if(getPlayerStorageValue(cid,2183) < 0) then
		selfSay('{Elite Ice Slash} (Melee skill) - Tier 2', cid)
		end
		if(getPlayerStorageValue(cid,2182) < 0) then
		selfSay('{Elite Twisting Ice Slash} (Melee skill) - Tier 2', cid)
		end
		else
		selfSay('{Twisting Ice Slash} (Melee skill) - Tier 1', cid)
		end
		talkState[talkUser] = 1
	end
	elseif(msgcontains(msg, 'elite ice strike') and talkState[talkUser] == 1) then
		selfSay('{Elite Ice Strike}, is a better version of the basic Tier 1 spell, ice Strike. Its a {Tier 2} spell that uses {Magic Level} for the damage formula. It uses {100 mana} and shoots a single ice strike with 3 of max range. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'ice touch') and talkState[talkUser] == 1) then
		selfSay('{Ice Touch}, is a {Tier 2} spell that deals ice damage and paralyzes the target. It uses {60 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 4
	elseif(msgcontains(msg, 'elite ice spear') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2077) == 0) then
		selfSay('{Elite Ice Spear}, is a better version of the basic Tier 1 spell, ice Spear. Its a {Tier 2} spell that uses {Distance Skill} for the damage formula. It shoots a strong ice spear to your target with 5 of max range. It uses {80 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 5
		else
		selfSay('You cant learn that spell.', cid)
		end
	elseif(msgcontains(msg, 'ice grenade') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2077) == 0) then
		selfSay('{Ice Grenade}. Its a {Tier 2} spell that uses {Distance Skill} for the damage formula. It shoots a 2x2 circle of ice damage to your target with 5 of max range. It uses {100 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 7
		else
		selfSay('You cant learn that spell.', cid)
		end
	elseif(msgcontains(msg, 'ice spear') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2077) < 0) then
		selfSay('Ice Spear}, is a {Tier 1} spell that uses {Distance Skill} for the damage formula. It shoots a ice spear to your target with 5 of max range. It uses {50 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 6
		else
		selfSay('You know that spell.', cid)
		end
	elseif(msgcontains(msg, 'elite ice slash') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2079) == 0) then
		selfSay('{Elite Ice Slash}. Its a {Tier 2} spell that uses {Melee Skill} for the damage formula. It deals a strong ice strike to your target with 1 of max range. It uses {80 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 8
		else
		selfSay('You cant learn that spell.', cid)
		end
	elseif(msgcontains(msg, 'elite twisting ice slash') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2079) == 0) then
		selfSay('{Elite Twisting Ice Slash}, is a better version of the basic Tier 1 spell, Twisting ice Slash. Its a {Tier 2} spell that uses {Melee Skill} for the damage formula. It deals ice damage all around you. It uses {100 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 9
		else
		selfSay('You cant learn that spell.', cid)
		end
	elseif(msgcontains(msg, 'twisting ice slash') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2079) < 0) then
		selfSay('Twisting Ice Slash}, is a {Tier 1} spell that uses {Melee Skill} for the damage formula. It deals ice damage all around you. It uses {60 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 10
		else
		selfSay('You know that spell.', cid)
		end
	elseif(msgcontains(msg, 'ice explosion') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2078) == 0) then
		selfSay('{Ice Explosion}. Its a {Tier 2} spell that uses {Magic Level} for the damage formula. It makes a wide ice explosion around you with very high damage. It uses {1000 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 11
		else
		selfSay('You cant learn that spell.', cid)
		end
	elseif(msgcontains(msg, 'ice beam') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2078) < 0) then
		selfSay('Ice Beam}, is a {Tier 1} spell that uses {Magic Skill} for the damage formula. It creates a ice beam of high damage in front of you 5 sqm long. It uses {200 mana}. Do you want to learn this? {Yes}?', cid)
		talkState[talkUser] = 12
		else
		selfSay('You know that spell.', cid)
		end
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'train') or msgcontains(msg, 'cult')) then
		if(getPlayerStorageValue(cid,2302) < 40 and getPlayerStorageValue(cid,2302) >= 0) then
			selfSay('Finish your mission', cid)
		elseif(getPlayerStorageValue(cid,2303) < 40 and getPlayerStorageValue(cid,2303) >= 0) then
			selfSay('Finish your mission', cid)
		elseif(getPlayerStorageValue(cid,2302) == 40) then
			selfSay('Great! this is the {list} of the spells I can teach you..choose one.', cid)
		elseif(getPlayerStorageValue(cid,2303) == 40) then
			selfSay('Nice! this is the {list} of the spells I can teach you..choose one.', cid)
		elseif(getPlayerStorageValue(cid,2303) == 41 or getPlayerStorageValue(cid,2303) == 42) then
			selfSay('You have finished our trainings, I know you will be able to achieve great deeds.', cid)
		elseif(getPlayerStorageValue(cid,2302) == 41 and getPlayerStorageValue(cid,2303) < 0) then
			selfSay('As I told you, I can teach you 2 spells. Check the {list} for the second spell you want to learn.', cid)
		elseif(getPlayerStorageValue(cid,2302) < 0) then
			selfSay('This is our temple to the ice powers, we believe only in strength and ice. As you are here, you should be pretty strong', cid)
			if(getPlayerStorageValue(cid,2063) >= 0) then
			selfSay('I can teach you no more than 2 spells. For each spell you will have to complete the tasks I will give you.', cid)
			selfSay('This is the {list} of the spells you can learn from us. But It wont be easy.', cid)
			else
			selfSay('You dont have ice powers.. go to other primate.', cid)	
			end
		end
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
