local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 			end
function onCreatureSay(cid, type, msg) 			npcHandler:onCreatureSay(cid, type, msg) 		end
local random_texts = {
	'GET NEW TOOLS AT GOOD PRICES!',
	'GET NEW TOOLS AT GOOD PRICES!',
	'Dont buy cheap ropes, stay safe with my great quality ropes.',
	'LOOK! the best quality shovels in Bree-Land.',
	'HEY DIMRAL! STILL SMELING LIKE ROTTEN RABBIT?!',
	'Do you wanna go fishing? check this fishing rod.'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 20)
		if(math.random(100) < 40) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end
-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local node1 = keywordHandler:addKeyword({'tools'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell rope (40), shovel (50), fishing rod (120), torch (5) and more.'})
npcHandler:addModule(FocusModule:new())
