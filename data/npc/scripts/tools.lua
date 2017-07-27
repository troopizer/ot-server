local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 			end
function onCreatureSay(cid, type, msg) 			npcHandler:onCreatureSay(cid, type, msg) 		end
function onThink() 					npcHandler:onThink() 					end

-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local node1 = keywordHandler:addKeyword({'tools'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell rope (40), shovel (50), fishing rod (120), torch (5) and more.'})
npcHandler:addModule(FocusModule:new())
