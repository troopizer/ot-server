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

	if(msgcontains(msg, 'mission') or msgcontains(msg, 'dunedain') or msgcontains(msg, 'ranger')) then
			if (getPlayerStorageValue(cid,2310) < 0) then
			setPlayerStorageValue(cid,30034,33)
			setPlayerStorageValue(cid,2310,4)
			setPlayerStorageValue(cid,2311,150)
			end
			if(getPlayerStorageValue(cid,2096) == 0) then
				selfSay('I am waiting for you to finish the mission.', cid)
			elseif(getPlayerStorageValue(cid,2007) == 4 and getPlayerStorageValue(cid,2096) < 0) then
					selfSay('Hi friend, we are the dunedain, the descendants of old Arnor. Fornost was once our capital, now is an evil and forgotten place..', cid)
					selfSay('We were send by our leader Argonui, in order to control any evil power that raises here. If you want to help us, I can pay you for your work,{ok}?. ', cid)				
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2096) == 20) then
					selfSay('Great! You are quite strong, I have another {mission} for you (you received 10000 exp and 1000 gp) ', cid)
					setPlayerStorageValue(cid,2096,21)
					doPlayerAddExperience(cid,10000)
					doPlayerAddItem(cid,2152,10)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2096) == 21 and getPlayerStorageValue(cid,2097) < 0) then
					selfSay('As you may noticed in the first area of the city there are just some wolves and bandits. Thats because an old dwarven sorcerer keeps any evil spirit and undead lock in the catacombs.', cid)
					selfSay('The second area of the city, the eastern area, is another story. A cult of sorcerers and necromancers use the ruins to make evil rituals, if you feel strong enough I want to kill some of them, {ok}?', cid)		
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2097) == 30) then
					selfSay('Nice done! I have another {mission} for you (you received 20000 exp and 1000 gp) ', cid)
					setPlayerStorageValue(cid,2097,31)
					doPlayerAddExperience(cid,20000)
					doPlayerAddItem(cid,2152,10)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2097) == 31 and getPlayerStorageValue(cid,2098) < 0) then
					selfSay('I have a spy located near the necromancers camp, he send a message telling that he found something important, can you go there?, {ok}? ', cid)
					talkState[talkUser] = 1
			elseif(getPlayerItemCount(cid,11237) >= 1 and getPlayerStorageValue(cid,2098) == 1) then
					selfSay('I see! Its very important to know about their plan. But I cant read this... there is a elven sorcerer in the South Downs, find this elf and ask him to read this book.', cid)
					setPlayerStorageValue(cid,2098,2)
			elseif(getPlayerItemCount(cid,11237) >= 1 and getPlayerStorageValue(cid,2098) == 3) then
					selfSay('Thanks you! Wellcome back!.. I see! they are doing rituals in order to summon powerful spirits. I will try to build a plan against them. (you received 30000 exp and 3000 gp)', cid)
					setPlayerStorageValue(cid,2098,4)
					doPlayerRemoveItem(cid,11237,1)
					doPlayerAddExperience(cid,30000)
					doPlayerAddItem(cid,2152,30)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2098) == 4 and getPlayerStorageValue(cid,2099) < 0) then
					selfSay('I am still planning our next move, for the time being we should get rid of some of their priestesses. Go to Fornost and get that done, {ok}? ', cid)
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2099) == 30) then
					selfSay('All right, you are true warrior. Now you should choose between 2 martial spells: {Warrior Rage} (Meele) or {Spear Throw} (Distance). (you received 50000 exp)', cid)
					doPlayerAddExperience(cid,50000)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
					talkState[talkUser] = 2	
			elseif(getPlayerStorageValue(cid,2099) == 31 and getPlayerStorageValue(cid,2100) < 0) then
					selfSay('Well... Freor found out that there are some elemental cultists in the necromancers area in Fornost. This cultists have strong elemental powers.', cid)
					selfSay('It looks like that the cultists are key for the necromancers plans. You may be able to kill them and stop the ritual, {ok}? ', cid)
					talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid,2100) == 4) then
					selfSay('You are strong one my friend! Because of you the necromancers have lost this time.(you received a might ring, 100000 exp and 5000 gp) ', cid)
					setPlayerStorageValue(cid,2100,5)
					doPlayerAddExperience(cid,100000)
					doPlayerAddItem(cid,2152,50)
					doPlayerAddItem(cid,2164,1)
					x=getPlayerStorageValue(cid,2311)+4
				setPlayerStorageValue(cid,2311,x)
				if (getPlayerStorageValue(cid,2311) > 60 and getPlayerStorageValue(cid,2310) == 4) then
					setPlayerStorageValue(cid,2310,5)
				end
			elseif(getPlayerStorageValue(cid,2100) == 5) then
					selfSay('I dont have more missions for now.', cid)
			end
			
 	elseif(msgcontains(msg, 'bree')) then
				selfSay('Bree is this peaceful town, is the center of men in this area. It might be just a little town, but we will protect them of evil.', cid)

	elseif(msgcontains(msg, 'ok')) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid,2096) < 0) then
				selfSay('Some outlaws are camping in the first area of the city, near the entrance. You look strong enough, teach them a lesson.', cid)
				setPlayerStorageValue(cid,30021,20)
				setPlayerStorageValue(cid,2096,0)
			elseif(getPlayerStorageValue(cid,2096) == 21 and getPlayerStorageValue(cid,2097) < 0) then
				selfSay('Kill 30 necromancer apprentices in order to spread fear among them.', cid)
				setPlayerStorageValue(cid,30021,20)
				setPlayerStorageValue(cid,2097,0)
			elseif(getPlayerStorageValue(cid,2097) == 31 and getPlayerStorageValue(cid,2098) < 0) then
				selfSay('Thanks!', cid)
				setPlayerStorageValue(cid,30021,20)
				setPlayerStorageValue(cid,2098,0)
			elseif(getPlayerStorageValue(cid,2098) == 4 and getPlayerStorageValue(cid,2099) < 0) then
				selfSay('Great! Kill 30 priestesses, then I may teach you some martial skills.', cid)
				setPlayerStorageValue(cid,30021,20)
				setPlayerStorageValue(cid,2099,0)
			elseif(getPlayerStorageValue(cid,2099) == 31 and getPlayerStorageValue(cid,2100) < 0) then
				selfSay('Kill 4 cultists and we will stop them for now.', cid)
				setPlayerStorageValue(cid,30021,20)
				setPlayerStorageValue(cid,2100,0)
			end
		end
	elseif(msgcontains(msg, 'warrior rage')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2099) == 30) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2101,0)
				setPlayerStorageValue(cid,2099,31)
			end
		end
	elseif(msgcontains(msg, 'spear throw')) then
		if(talkState[talkUser] == 2) then
			if(getPlayerStorageValue(cid,2099) == 30) then
				selfSay('You have learned.', cid)
				setPlayerStorageValue(cid,30011,10)
				setPlayerStorageValue(cid,2056,0)
				setPlayerStorageValue(cid,2099,31)
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