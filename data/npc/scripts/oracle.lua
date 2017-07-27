local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 	npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg)		end
function onThink() 			npcHandler:onThink()					end

function oracle(cid, message, keywords, parameters, node)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	--local cityNode = node:getParent():getParent()
	local vocNode = node:getParent()

	--local destination = cityNode:getParameters().destination
	--local town = cityNode:getParameters().town
	local vocation = vocNode:getParameters().vocation

	if(getPlayerVocation(cid) ==0) then
		if(getPlayerLevel(cid) < 10) then
			npcHandler:say('You are too weak, reach level 10 and then come back here' ..getPlayerLevel(cid) .. '!', cid)
			npcHandler:resetNpc()
		else
			doPlayerSetVocation(cid, vocation)
			--doPlayerSetTown(cid, town)
			npcHandler:resetNpc()

			--local tmp = getCreaturePosition(cid)
			--doTeleportThing(cid, destination)
			--doSendMagicEffect(tmp, CONST_ME_POFF)
			--doSendMagicEffect(destination, CONST_ME_TELEPORT)

			return true
		end
	else
		local vocationString = {[1] = "archer",[2] = "warrior"}
		npcHandler:say("You already have a vocation. Greetings fellow " .. vocationString[getPlayerVocation(cid)] .. ".")
	end

	return false
end

function greetCallback(cid)
	if(getPlayerLevel(cid) < 10) then
		npcHandler:say('I dont have time for weak people like you, come back later')
		return false
	else
		return true
	end
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Hello |PLAYERNAME|. Do you want to get a combat vocation?')

-- NODES
local yesNode = KeywordNode:new({'yes'}, oracle, {level = 1})
local noNode = KeywordNode:new({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Then come back when you are ready.'})

local confirmationNode = KeywordNode:new({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, town = 1, destination = {x=615, y=986, z=6}, text = 'So what vocation do you wish to train? {Archer} or {Warrior}?'})
local archerNode = KeywordNode:new({'archer'}, StdModule.say, {npcHandler = npcHandler, vocation = 1, onlyFocus = true, text = 'So, you wish to be an Archer. Are you sure about that? This decision is irreversible!'})
local warriorNode = KeywordNode:new({'warrior'}, StdModule.say, {npcHandler = npcHandler, vocation = 2, onlyFocus = true, text = 'Are you sure that a warrior is what you wish to become? This decision is irreversible'})

-- Interation branching
local yes1_Branch = keywordHandler:addKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Great, I can train you, but it will be hard, are you sure?'})
	local yes1_ConfirmationBranch = yes1_Branch:addChildKeyword(confirmationNode)
		local archerBranch = yes1_ConfirmationBranch:addChildKeyword(archerNode)
			archerBranch:addChildKeywordNode(yesNode)
			archerBranch:addChildKeywordNode(noNode)
		local warriorBranch = yes1_ConfirmationBranch:addChildKeywordNode(warriorNode)
			warriorBranch:addChildKeywordNode(yesNode)
			warriorBranch:addChildKeywordNode(noNode)
		yes1_ConfirmationBranch:addChildKeywordNode(noNode)
keywordHandler:addKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Then come back when you are ready.'})

npcHandler:addModule(FocusModule:new())
