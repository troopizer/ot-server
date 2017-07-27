local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(cid, var)
if(getPlayerStorageValue(cid,2020) == 0) then
if(getPlayerItemCount(cid,2798) >= 1 and getPlayerItemCount(cid,2260) >= 1) then
			doPlayerRemoveItem(cid, 2798, 1)
			doPlayerRemoveItem(cid, 2260, 1)
			doPlayerAddItem(cid, 2265, 1)
	return doCombat(cid, combat, var)
else
	return false
end
else
	return false
end
end

