local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    if(msgcontains(msg, 'year') or msgcontains(msg, 'date') or msgcontains(msg, 'tales') or msgcontains(msg, 'info')) then
				selfSay('We are in the year 2900 of the third age.', cid)
				selfSay('I have been informed that Gerontius Took "The Old Took" is currently the Thain of the Shire, also Turin II is the 22th Steward of Gondor.', cid)
    end
	if(msgcontains(msg, 'bree')) then
		selfSay('Bree is a litle town, but the biggest of men in Erianor. Its a good place to learn basic skills and start your adventures. You may become a {citizen} of Bree.', cid)
	end
	if(msgcontains(msg, 'prancing pony')) then
		selfSay('The Prancing Pony is a famous Inn in the north side of Bree, travelers of all kind stop there for drinks and food.', cid)
	end
	if(msgcontains(msg, 'nothing')) then
		selfSay('I dont have time to lose...', cid)
	end
	if(msgcontains(msg, 'edward')) then
		selfSay('My name is Edward Mapleton. Since years I have been the mayor of Bree.', cid)
		selfSay('As mayor I have to look for the safety and stability of not only Bree, also Staddle, Archet and Combe. And I think that I have been doing a fairly good job.', cid)
		selfSay('Many years ago the mayor was also the commander of the Bree guards, but since the Eriador Renegades became more powerful. I gave the command of the guards to my son Jeff.', cid)
		selfSay('He grow up to be a fine warrior and everyone in Bree-Land respect him. He has manage to keep the renegades out of our lands.', cid)
	end
	if(msgcontains(msg, 'aldur')) then
		selfSay('Aldur is an important merchant of the blue mountains, he might be close to Thorin, their leader.', cid)
	end
	if(msgcontains(msg, 'bandit')) then
		selfSay('Sadly, there are many bandits gangs around Bree-Land. But they seem to have a common leader.', cid)
	end
	if(msgcontains(msg, 'renegade')) then
		selfSay('The Eriador Renegades! They are the biggest threat for Bree. They are organized Outlaws and they even have an stronghold in the East Brandywine Hills.', cid)
	end
	if(msgcontains(msg, 'east brandywine hills')) then
		selfSay('The East Brandywine Hills are a group of hills north-west of Bree. They lay east from the Brandywine river, between some marshland.', cid)
	end
	if(msgcontains(msg, 'citizen')) then
		selfSay('If you decide to be a citizen of Bree, you will lose your previous citizenship. Are you sure? {yes}?', cid)
		talkState[talkUser] = 10
	end
	if(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then
		doPlayerSetTown(cid, 1)
		selfSay('Ok.. sign this papers... Ready! you are now a citizen of Bree.', cid)
		talkState[talkUser] = 0
	end


	if(msgcontains(msg, 'mission')) then
		if (getPlayerStorageValue(cid,2000) < 0) then
			selfSay('Welcome to {Bree}, I am the Mayor of this town. By doing missions you will become stronger, also earn some money and position on the mens world, Are you here for missions?, {yes}?', cid)
			talkState[talkUser] = 1
		end
		if (getPlayerStorageValue(cid,2000) == 0) then
			selfSay('You are on a mission, do you have the {book}?', cid)
		end
		if (getPlayerStorageValue(cid,2001) == 0) then
			selfSay('You are on a mission.', cid)
		end
		if (getPlayerStorageValue(cid,2002) == 0) then
			selfSay('You are on a mission.', cid)
		end
		if (getPlayerStorageValue(cid,2003) == 0) then
			selfSay('You are on a mission.', cid)
		end
		if (getPlayerStorageValue(cid,2004) == 0) then
			selfSay('You are on a mission.', cid)
		end
		if (getPlayerStorageValue(cid,2005) == 0) then
			selfSay('You are on a mission.', cid)
		end
		if (getPlayerStorageValue(cid,2006) == 0) then
			selfSay('You are on a mission.', cid)
		end
		if (getPlayerStorageValue(cid,2007) == 0) then
			selfSay('You are on a mission.', cid)
		end
		if (getPlayerStorageValue(cid,2000) == 1 and getPlayerStorageValue(cid,2001) < 0 ) then
			selfSay('I have another mission for you, {ok}?', cid)
		end
		if (getPlayerStorageValue(cid,2004) == 1 and getPlayerStorageValue(cid,2005) < 0 ) then
			selfSay('I have another mission for you, {ok}?', cid)
		end
		if (getPlayerStorageValue(cid,2005) == 5)  then
			selfSay('So tell me about how went your mission, {ok}?', cid)
		end
		if (getPlayerStorageValue(cid,2005) == 6 and getPlayerStorageValue(cid,2006) < 0 ) then
			selfSay('I have another mission for you, {ok}?', cid)
		end
	end
	if(msgcontains(msg, 'mission')) then
		if (getPlayerStorageValue(cid,2001) == 2 and getPlayerStorageValue(cid,2002) < 0 ) then
			selfSay('Well, you need a better armor, {ok}?', cid)
		end
		if (getPlayerStorageValue(cid,2006) == 2 and getPlayerStorageValue(cid,2007) < 0 ) then
			selfSay('Well, I have one more mission for you, {ok}?', cid)
		end
		if (getPlayerStorageValue(cid,2007) == 4) then
			selfSay('As you got some experince, I can assign you new missions. I received some requests from different locations of Bree-land: {Bree Chapter 2},{South Downs}.', cid)
		end
	end

	---------------------------------------------------------
	if(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if (getPlayerStorageValue(cid,2000) < 0) then
			selfSay('Long time ago when brees {sewers} were made, the workers left behind some tools. Find this tools and keep them, I just dont want they down there, come back when you are ready,{ok}?', cid)
		end
		if (getPlayerStorageValue(cid,2000) == 0) then
			if(doPlayerRemoveItem(cid, 1958, 1) == TRUE) then
				setPlayerStorageValue(cid,2000,1)
				doPlayerAddExperience(cid,400)
				doPlayerAddItem(cid,2148,100)
				selfSay('Good work young one.(you have received 400 experience and 100 gp)', cid)
			end
		end
	end

	if(msgcontains(msg, 'ok')) then
		if (getPlayerStorageValue(cid,2000) < 0) then
			selfSay('You will find a old {book} too, bring it to me.',cid)
			setPlayerStorageValue(cid,30001,1)
			setPlayerStorageValue(cid,2000,0)
			talkState[talkUser] = 1
		end
		if (getPlayerStorageValue(cid,2000)== 1 and getPlayerStorageValue(cid,2001) < 0 ) then
			selfSay('Go to the market and talk to {Dimral} the loot vendor, he needs somo help.',cid)
			setPlayerStorageValue(cid,30001,1)
			setPlayerStorageValue(cid,2001,0)
			talkState[talkUser] = 1
		end
		if (getPlayerStorageValue(cid,2001)== 2 and getPlayerStorageValue(cid,2002) < 0 ) then
			selfSay('Go to the Armourer Workshop west to the market and talk to {Andrew the Armourer}, he can forge you a bronze studded armor, take this copper ore and tin ore. You will have to look for 2 leathers.',cid)
			setPlayerStorageValue(cid,30001,1)			
			setPlayerStorageValue(cid,2002,0)
			doPlayerAddItem(cid,2311,1)
			doPlayerAddItem(cid,2261,1)
			talkState[talkUser] = 0
		end
		if (getPlayerStorageValue(cid,2004) == 1 and getPlayerStorageValue(cid,2005) < 0 ) then
			selfSay('I want you to learn about the little villages around Bree, go to {Archet} north from here and talk to {Hudson}, he needs help delivering some wood supplies.', cid)
			setPlayerStorageValue(cid,30001,1)				
			setPlayerStorageValue(cid,2005,0)
		end
		if (getPlayerStorageValue(cid,2005) == 5) then
			selfSay('Well done, here is your reward (you have received 1000 experience points and 200 gp).', cid)
			setPlayerStorageValue(cid,2005,6)
			doPlayerAddExperience(cid,1000)
			doPlayerAddItem(cid,2148,200)
		end
		if (getPlayerStorageValue(cid,2005) == 6 and getPlayerStorageValue(cid,2006) < 0 ) then
			selfSay('Do you remember the old map that you found in the sewers? It talk about a old treasure called the {golden goblet}, this treasure seems to be in a old mine east of Archet, go to the village and talk to George the bar owner, he might know something about it.', cid)
			setPlayerStorageValue(cid,30001,1)				
			setPlayerStorageValue(cid,2006,0)
		end
		if (getPlayerStorageValue(cid,2006) == 2 and getPlayerStorageValue(cid,2007) < 0 ) then
			selfSay('Our town have some relations with the Blue Mountains Dwarfs, they use to trade jewels and treasures of their mines here. But yesterday, two dwarven merchants were assaulted and as mayor of this region, I want to help them. Go to the {Prancing Pony} and talk to {Aldur}.', cid)
			setPlayerStorageValue(cid,30001,1)				
			setPlayerStorageValue(cid,2007,0)
		end
	end
	if(msgcontains(msg, 'mission')) then
		if (getPlayerStorageValue(cid,2002) == 1) then
			setPlayerStorageValue(cid,2002,2)
			doPlayerAddExperience(cid,500)
			selfSay('Allright then.(you have received 500 experience points). ', cid)
			selfSay('Now you need a distance weapon, go to {Darren the Weaponsmaker} and tell him to build a spear for you, you will need this wood plank too.', cid)
			doPlayerAddItem(cid,5901,1)
			setPlayerStorageValue(cid,2003,0)
		end
		if (getPlayerStorageValue(cid,2003) == 1) then
			setPlayerStorageValue(cid,2003,2)
			doPlayerAddExperience(cid,300)
			selfSay('Allright then.(you have received 300 experience points). ', cid)
		end
		if (getPlayerStorageValue(cid,2003) == 2 and getPlayerStorageValue(cid,2004) < 0 ) then
			selfSay('Ok I have a new mission for you, I readed the book of your first mission, its look like they are more forgotten things down there in the sewer, go and find an old map, then come back with it,{ok}?', cid)
			talkState[talkUser] = 3
		end
		if (getPlayerStorageValue(cid,2004) == 0)then
			if(doPlayerRemoveItem(cid, 5091, 1) == TRUE) then
				setPlayerStorageValue(cid,2004,1)
				doPlayerAddExperience(cid,800)
				doPlayerAddItem(cid,2148,150)
				selfSay('Nice done, I will study this map now.(you received 800 experience and 150 gold).', cid)
			else
				selfSay('We need that map, please try harder.', cid)
			end
		end
		if (getPlayerStorageValue(cid,2006) == 1) then
			if(doPlayerRemoveItem(cid,5805,1) == TRUE) then
				setPlayerStorageValue(cid,2006,2)
				doPlayerAddExperience(cid,2000)
				doPlayerAddItem(cid,2148,200)
				selfSay('Nice done, Its a very important treasure for Bree.(you received 2000 experience and 200 gold).', cid)
			else
				selfSay('Where is the golden goblet?, bring it.', cid)
			end
		end
		if (getPlayerStorageValue(cid,2007) == 3) then
			setPlayerStorageValue(cid,2007,4)
			doPlayerAddExperience(cid,3000)
			doPlayerAddItem(cid,2148,300)
			selfSay('Allright then.(you have received 3000 experience points and 300 gold). ', cid)
		end
	end

	if(msgcontains(msg, 'golden goblet')) then
		if (getPlayerStorageValue(cid,2006) == 1) then
			if(doPlayerRemoveItem(cid,5805,1) == TRUE) then
				setPlayerStorageValue(cid,2006,2)
				doPlayerAddExperience(cid,2000)
				doPlayerAddItem(cid,2148,200)
				selfSay('Nice done, It a very important treasure for Bree.(you received 2000 experience and 200 gold).', cid)
			else
				selfSay('Where is the golden goblet?, bring it.', cid)
			end
		end
	end

	if(msgcontains(msg, 'ok') and getPlayerStorageValue(cid,2003) == 2 ) then
		if (getPlayerStorageValue(cid,2004) < 0) then
			setPlayerStorageValue(cid,2004,0)
			selfSay('Be Careful you might find spiders down there!', cid)
			talkState[talkUser] = 0
		end
	end

	if(msgcontains(msg, 'book') or msgcontains(msg, 'yes')) then
		if (getPlayerStorageValue(cid,2000) == 0) then
			if(doPlayerRemoveItem(cid, 1958, 1) == TRUE) then
				setPlayerStorageValue(cid,2000,1)
				doPlayerAddExperience(cid,400)
				doPlayerAddItem(cid,2148,100)
				selfSay('Good work young one.(you have received 400 experience and 100 gp)', cid)
			else
				selfSay('Too hard those rats,go to {Aldo} he sells equipment, but you will need money', cid)
			end
		end
	end
	if(msgcontains(msg, 'south downs') ) then
		if (getPlayerStorageValue(cid,2007) == 4 and getPlayerStorageValue(cid,2008) <= 0)  then
			selfSay('If you want to take this mission go to the South Downs, there you will find the camp of Sergeant Farflank, you will have to report to him along the mission.', cid)
			setPlayerStorageValue(cid,30002,4)
			setPlayerStorageValue(cid,2008,0)
		end
	end
	if(msgcontains(msg, 'bree chapter 2') ) then
		if (getPlayerStorageValue(cid,2007) == 4) then
			selfSay('If you want to take this missions go to Captain Jeff, he is in the Bree´s Barracks, you will have to report to him along the missions.', cid)
		end
	end
	if msgcontains(msg, 'buckland') then
		if (getPlayerStorageValue(cid,2007) == 4) then
			selfSay('Buckland is a town to the west from Bree. You could find some people to help there and gain their trust.', cid)
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())