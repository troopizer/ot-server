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
	if(msgcontains(msg, 'bless')) then
		if(getPlayerStorageValue(cid,2060) < 0 and getPlayerStorageValue(cid,2061) < 0 and getPlayerStorageValue(cid,2062) < 0 and getPlayerStorageValue(cid,2063) < 0 and getPlayerStorageValue(cid,2064) < 0 and getPlayerStorageValue(cid,2065) < 0)then
		if(getPlayerItemCount(cid,2177) >= 1)then
			selfSay('{Fire}, {Earth}, {Energy}, {Ice}, {Life} or {Death}?', cid)
				talkState[talkUser] = 1
		end
		elseif(getPlayerStorageValue(cid,2060) == 0) then
			if(getPlayerItemCount(cid,2177) >= 3 and getPlayerItemCount(cid,2147) >= 4)then
				doPlayerRemoveItem(cid,2177,3)
				doPlayerRemoveItem(cid,2147,4)
				setPlayerStorageValue(cid,2060,1)
				selfSay('You are now blessed as Fire Sorcerer tier 2.', cid)
				if(getPlayerStorageValue(cid,2156) == 1) then
					setPlayerStorageValue(cid,2156,2)
				end
				if(getPlayerStorageValue(cid,2157) == 1) then
					setPlayerStorageValue(cid,2157,2)
				end
			end	
		elseif(getPlayerStorageValue(cid,2061) == 0) then
			if(getPlayerItemCount(cid,2177) >= 3 and getPlayerItemCount(cid,2149) >= 4)then
				doPlayerRemoveItem(cid,2177,3)
				doPlayerRemoveItem(cid,2149,4)
				setPlayerStorageValue(cid,2061,1)
				selfSay('You are now blessed as Earth Sorcerer tier 2.', cid)
				if(getPlayerStorageValue(cid,2156) == 1) then
					setPlayerStorageValue(cid,2156,2)
				end
				if(getPlayerStorageValue(cid,2157) == 1) then
					setPlayerStorageValue(cid,2157,2)
				end
			end	
		elseif(getPlayerStorageValue(cid,2062) == 0) then
			if(getPlayerItemCount(cid,2177) >= 3 and getPlayerItemCount(cid,2150) >= 4)then
				doPlayerRemoveItem(cid,2177,3)
				doPlayerRemoveItem(cid,2150,4)
				setPlayerStorageValue(cid,2062,1)
				selfSay('You are now blessed as Energy Sorcerer tier 2.', cid)
				if(getPlayerStorageValue(cid,2156) == 1) then
					setPlayerStorageValue(cid,2156,2)
				end
				if(getPlayerStorageValue(cid,2157) == 1) then
					setPlayerStorageValue(cid,2157,2)
				end
			end	
		elseif(getPlayerStorageValue(cid,2063) == 0) then
			if(getPlayerItemCount(cid,2177) >= 3 and getPlayerItemCount(cid,2146) >= 4)then
				doPlayerRemoveItem(cid,2177,3)
				doPlayerRemoveItem(cid,2146,4)
				setPlayerStorageValue(cid,2063,1)
				selfSay('You are now blessed as Ice Sorcerer tier 2.', cid)
				if(getPlayerStorageValue(cid,2156) == 1) then
					setPlayerStorageValue(cid,2156,2)
				end
				if(getPlayerStorageValue(cid,2157) == 1) then
					setPlayerStorageValue(cid,2157,2)
				end
			end
		elseif(getPlayerStorageValue(cid,2064) == 0) then
			if(getPlayerItemCount(cid,2177) >= 3 and getPlayerItemCount(cid,2147) >= 2 and getPlayerItemCount(cid,2146) >= 2 and getPlayerItemCount(cid,2149) >= 2 and getPlayerItemCount(cid,2150) >= 2)then
				doPlayerRemoveItem(cid,2177,3)
				doPlayerRemoveItem(cid,2147,2)
				doPlayerRemoveItem(cid,2149,2)
				doPlayerRemoveItem(cid,2146,2)
				doPlayerRemoveItem(cid,2150,2)
				setPlayerStorageValue(cid,2064,1)
				selfSay('You are now blessed as Druid tier 2.', cid)
				if(getPlayerStorageValue(cid,2156) == 1) then
					setPlayerStorageValue(cid,2156,2)
				end
				if(getPlayerStorageValue(cid,2157) == 1) then
					setPlayerStorageValue(cid,2157,2)
				end
			end	
		elseif(getPlayerStorageValue(cid,2065) == 0) then
			if(getPlayerItemCount(cid,2177) >= 3 and getPlayerItemCount(cid,2147) >= 2 and getPlayerItemCount(cid,2146) >= 2 and getPlayerItemCount(cid,2149) >= 2 and getPlayerItemCount(cid,2150) >= 2)then
				doPlayerRemoveItem(cid,2177,3)
				doPlayerRemoveItem(cid,2147,2)
				doPlayerRemoveItem(cid,2149,2)
				doPlayerRemoveItem(cid,2146,2)
				doPlayerRemoveItem(cid,2150,2)
				setPlayerStorageValue(cid,2065,1)
				selfSay('You are now blessed as Necromancer tier 2.', cid)
				if(getPlayerStorageValue(cid,2156) == 1) then
					setPlayerStorageValue(cid,2156,2)
				end
				if(getPlayerStorageValue(cid,2157) == 1) then
					setPlayerStorageValue(cid,2157,2)
				end
			end	
		end
	end
	if(msgcontains(msg, 'Fire') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2060) < 0 and getPlayerStorageValue(cid,2061) < 0 and getPlayerStorageValue(cid,2062) < 0 and getPlayerStorageValue(cid,2063) < 0 and getPlayerStorageValue(cid,2064) < 0 and getPlayerStorageValue(cid,2065) < 0)then
			if(getPlayerItemCount(cid,2177) >= 1 and getPlayerItemCount(cid,2147) >= 1)then
				doPlayerRemoveItem(cid,2177,1)
				doPlayerRemoveItem(cid,2147,1)
				setPlayerStorageValue(cid,30014,13)
				setPlayerStorageValue(cid,2060,0)
				selfSay('You are now blessed as Fire Sorcerer tier 1.', cid)	
				talkState[talkUser] = 0	
				if(getPlayerStorageValue(cid,2066) == 1) then
					setPlayerStorageValue(cid,2066,2)
				end
				if(getPlayerStorageValue(cid,2067) == 1) then
					setPlayerStorageValue(cid,2067,2)
				end
			end
		end
	end
	if(msgcontains(msg, 'Earth') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2060) < 0 and getPlayerStorageValue(cid,2061) < 0 and getPlayerStorageValue(cid,2062) < 0 and getPlayerStorageValue(cid,2063) < 0 and getPlayerStorageValue(cid,2064) < 0 and getPlayerStorageValue(cid,2065) < 0)then
			if(getPlayerItemCount(cid,2177) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2177,1)
				doPlayerRemoveItem(cid,2149,1)
				setPlayerStorageValue(cid,30015,14)
				setPlayerStorageValue(cid,2061,0)
				selfSay('You are now blessed as Earth Sorcerer tier 1.', cid)	
				talkState[talkUser] = 0	
				if(getPlayerStorageValue(cid,2066) == 1) then
					setPlayerStorageValue(cid,2066,2)
				end
				if(getPlayerStorageValue(cid,2067) == 1) then
					setPlayerStorageValue(cid,2067,2)
				end
			end
		end
	end
	if(msgcontains(msg, 'Energy') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2060) < 0 and getPlayerStorageValue(cid,2061) < 0 and getPlayerStorageValue(cid,2062) < 0 and getPlayerStorageValue(cid,2063) < 0 and getPlayerStorageValue(cid,2064) < 0 and getPlayerStorageValue(cid,2065) < 0)then
			if(getPlayerItemCount(cid,2177) >= 1 and getPlayerItemCount(cid,2150) >= 1)then
				doPlayerRemoveItem(cid,2177,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,30016,15)
				setPlayerStorageValue(cid,2062,0)
				selfSay('You are now blessed as Energy Sorcerer tier 1.', cid)	
				talkState[talkUser] = 0	
				if(getPlayerStorageValue(cid,2066) == 1) then
					setPlayerStorageValue(cid,2066,2)
				end
				if(getPlayerStorageValue(cid,2067) == 1) then
					setPlayerStorageValue(cid,2067,2)
				end
			end
		end
	end
	if(msgcontains(msg, 'Ice') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2060) < 0 and getPlayerStorageValue(cid,2061) < 0 and getPlayerStorageValue(cid,2062) < 0 and getPlayerStorageValue(cid,2063) < 0 and getPlayerStorageValue(cid,2064) < 0 and getPlayerStorageValue(cid,2065) < 0)then
			if(getPlayerItemCount(cid,2177) >= 1 and getPlayerItemCount(cid,2146) >= 1)then
				doPlayerRemoveItem(cid,2177,1)
				doPlayerRemoveItem(cid,2146,1)
				setPlayerStorageValue(cid,30017,16)
				setPlayerStorageValue(cid,2063,0)
				selfSay('You are now blessed as Ice Sorcerer tier 1.', cid)	
				talkState[talkUser] = 0	
				if(getPlayerStorageValue(cid,2066) == 1) then
					setPlayerStorageValue(cid,2066,2)
				end
				if(getPlayerStorageValue(cid,2067) == 1) then
					setPlayerStorageValue(cid,2067,2)
				end
			end
		end
	end
	if(msgcontains(msg, 'Life') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2060) < 0 and getPlayerStorageValue(cid,2061) < 0 and getPlayerStorageValue(cid,2062) < 0 and getPlayerStorageValue(cid,2063) < 0 and getPlayerStorageValue(cid,2064) < 0 and getPlayerStorageValue(cid,2065) < 0)then
			if(getPlayerItemCount(cid,2177) >= 1 and getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2177,1) 
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,30018,17)
				setPlayerStorageValue(cid,2064,0)
				selfSay('You are now blessed as Druid tier 1.', cid)	
				talkState[talkUser] = 0	
				if(getPlayerStorageValue(cid,2066) == 1) then
					setPlayerStorageValue(cid,2066,2)
				end
				if(getPlayerStorageValue(cid,2067) == 1) then
					setPlayerStorageValue(cid,2067,2)
				end
			end
		end
	end
	if(msgcontains(msg, 'Death') and talkState[talkUser] == 1) then
		if(getPlayerStorageValue(cid,2060) < 0 and getPlayerStorageValue(cid,2061) < 0 and getPlayerStorageValue(cid,2062) < 0 and getPlayerStorageValue(cid,2063) < 0 and getPlayerStorageValue(cid,2064) < 0 and getPlayerStorageValue(cid,2065) < 0)then
			if(getPlayerItemCount(cid,2177) >= 1 and getPlayerItemCount(cid,2147) >= 1 and getPlayerItemCount(cid,2146) >= 1 and getPlayerItemCount(cid,2150) >= 1 and getPlayerItemCount(cid,2149) >= 1)then
				doPlayerRemoveItem(cid,2177,1) 
				doPlayerRemoveItem(cid,2147,1)
				doPlayerRemoveItem(cid,2149,1)
				doPlayerRemoveItem(cid,2146,1)
				doPlayerRemoveItem(cid,2150,1)
				setPlayerStorageValue(cid,30019,18)
				setPlayerStorageValue(cid,2065,0)
				selfSay('You are now blessed as Necromancer tier 1.', cid)	
				talkState[talkUser] = 0	
				if(getPlayerStorageValue(cid,2066) == 1) then
					setPlayerStorageValue(cid,2066,2)
				end
				if(getPlayerStorageValue(cid,2067) == 1) then
					setPlayerStorageValue(cid,2067,2)
				end
			end
		end
	end

		
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
