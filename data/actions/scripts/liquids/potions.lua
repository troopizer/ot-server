local config = {
	removeOnUse = false,
	usableOnTarget = true, -- can be used on target? (fe. healing friend)
	splashable = false,
	range = -1,
	realAnimation = false, -- make text effect visible only for players in range 1x1
	multiplier = {
		health = 1.0,
		mana = 1.0
	}
}

local POTIONS = {
	[8704] = {empty = 7636, splash = 42, health = {50, 100}}, -- small health potion
	[7618] = {empty = 7636, splash = 42, health = {100, 200}}, -- health potion
	[7588] = {empty = 7634, splash = 42, health = {200, 400}, level = 50, vocations = {3, 4, 7, 8}, vocStr = "knights and paladins"}, -- strong health potion
	[7591] = {empty = 7635, splash = 42, health = {500, 700}, level = 80, vocations = {4, 8}, vocStr = "knights"}, -- great health potion
	[8473] = {empty = 7635, splash = 42, health = {800, 1000}, level = 130, vocations = {4, 8}, vocStr = "knights"}, -- ultimate health potion

	[7620] = {empty = 7636, splash = 47, mana = {70, 130}}, -- mana potion
	[7589] = {empty = 7634, splash = 47, mana = {110, 190}, level = 50, vocations = {1, 2, 3, 5, 6, 7}, vocStr = "sorcerers, druids and paladins"}, -- strong mana potion
	[7590] = {empty = 7635, splash = 47, mana = {200, 300}, level = 80, vocations = {1, 2, 5, 6}, vocStr = "sorcerers and druids"}, -- great mana potion

	[8472] = {empty = 7635, splash = 43, health = {200, 400}, mana = {110, 190}, level = 80, vocations = {3, 7}, vocStr = "paladins"} -- great spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end

	if(not isPlayer(itemEx.uid) or (not config.usableOnTarget and cid ~= itemEx.uid)) then
		if(not config.splashable) then
			return false
		end

		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(POOL, potion.splash, toPosition))
		doRemoveItem(item.uid, 1)
		if(not potion.empty or config.removeOnUse) then
			return true
		end

		if(fromPosition.x ~= CONTAINER_POSITION) then
			doCreateItem(potion.empty, fromPosition)
		else
			doPlayerAddItem(cid, potion.empty, 1)
		end

		return true
	end

	if(isExhaust(cid)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	if(((potion.level and getPlayerLevel(itemEx.uid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(itemEx.uid)))) and
		not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES))
	then
		doCreatureSay(itemEx.uid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return true
	end

	if(config.range > 0 and cid ~= itemEx.uid and getDistanceBetween(getThingPos(cid), getThingPos(itemEx.uid)) > config.range) then
		return false
	end

	local health = potion.health
	if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.multiplier.health))) then
		return false
	end

	local mana = potion.mana
	if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.multiplier.mana))) then
		return false
	end

	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	if(not config.realAnimation) then
		doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1)
	else
		for i, tid in ipairs(getSpectators(getThingPos(itemEx.uid), 1, 1)) do
			if(isPlayer(tid)) then
				doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1, false, tid)
			end
		end
	end

	doAddCondition(cid, exhaust)
	doRemoveItem(item.uid, 1)
	if(not potion.empty or config.removeOnUse) then
		return true
	end

	if(fromPosition.x ~= CONTAINER_POSITION) then
		doCreateItem(potion.empty, fromPosition)
	else
		doPlayerAddItem(cid, potion.empty, 1)
	end

	return true
end
