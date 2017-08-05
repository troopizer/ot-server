-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = Combat()
combat0_Brush:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)
combat0_Brush:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat0_Brush:setArea(createCombatArea({{2}}))

local con_boost__combat0_Brush = Condition(CONDITION_ATTRIBUTES)
con_boost__combat0_Brush:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
con_boost__combat0_Brush:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
con_boost__combat0_Brush:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
con_boost__combat0_Brush:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
con_boost__combat0_Brush:setArea(createCombatArea({{2, 0},{0, 1}}))
combat0_Brush:setCondition(con_boost__combat0_Brush)
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.4 + levelTotal), -(skillTotal * 0.8 + levelTotal)
end

local combat0_Brush_2 = Combat()
combat0_Brush_2:setCombatCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat0_Brush_2 = {CONST_ANI_WEAPONTYPE,1,1}

-- Areas/Combat for 700ms
local combat7_Brush_2 = Combat()
combat7_Brush_2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat7_Brush_2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat7_Brush_2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat7_Brush_2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat7_Brush_2:setArea(createCombatArea({{2, 1}}))
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.3 + levelTotal), -(skillTotal * 0.7 + levelTotal)
end
combat7_Brush_2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat7_Brush_2 = {CONST_ANI_WEAPONTYPE,1,0}

-- Areas/Combat for 400ms
local combat4_Brush_2 = Combat()
combat4_Brush_2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat4_Brush_2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat4_Brush_2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat4_Brush_2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat4_Brush_2:setArea(createCombatArea({{1, 0},
{0, 2}}))
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.3 + levelTotal), -(skillTotal * 0.7 + levelTotal)
end
setCombatCallback(combat4_Brush_2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat4_Brush_2 = {CONST_ANI_WEAPONTYPE,-1,-1}

-- Areas/Combat for 500ms
local combat5_Brush_2 = Combat()
combat5_Brush_2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat5_Brush_2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat5_Brush_2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat5_Brush_2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat5_Brush_2:setArea(createCombatArea({{1},{2}}))
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.3 + levelTotal), -(skillTotal * 0.7 + levelTotal)
end
combat5_Brush_2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat5_Brush_2 = {CONST_ANI_WEAPONTYPE,0,-1}

-- Areas/Combat for 600ms
local combat6_Brush_2 = Combat()
combat6_Brush_2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat6_Brush_2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat6_Brush_2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat6_Brush_2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat6_Brush_2:setArea(createCombatArea({{0, 1},{2, 0}}))
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.3 + levelTotal), -(skillTotal * 0.7 + levelTotal)
end
combat6_Brush_2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat6_Brush_2 = {CONST_ANI_WEAPONTYPE,1,-1}

-- Areas/Combat for 100ms
local combat1_Brush_2 = Combat()
combat1_Brush_2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat1_Brush_2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat1_Brush_2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1_Brush_2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1_Brush_2:setArea(createCombatArea({{2},{1}}))
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.3 + levelTotal), -(skillTotal * 0.7 + levelTotal)
end
setCombatCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat1_Brush_2 = {CONST_ANI_WEAPONTYPE,0,1}

-- Areas/Combat for 200ms
local combat2_Brush_2 = Combat()
combat2_Brush_2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat2_Brush_2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat2_Brush_2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2_Brush_2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2_Brush_2:setArea(createCombatArea({{0, 2},{1, 0}}))
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.3 + levelTotal), -(skillTotal * 0.7 + levelTotal)
end
combat2_Brush_2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat2_Brush_2 = {CONST_ANI_WEAPONTYPE,-1,1}

-- Areas/Combat for 300ms
local combat3_Brush_2 = Combat()
combat3_Brush_2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat3_Brush_2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat3_Brush_2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3_Brush_2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3_Brush_2:setArea(createCombatArea({{1, 2}}))
function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = (skill) + attack, level / 5
	return -(skillTotal * 0.3 + levelTotal), -(skillTotal * 0.7 + levelTotal)
end
combat3_Brush_2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local dfcombat3_Brush_2 = {CONST_ANI_WEAPONTYPE,-1,0}

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
if(getPlayerStorageValue(cid,2043) == 0) then
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
			local i = 2;
			while (i < #dirList) do
				doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				i = i + 2
			end		
		end
	end
else
	return false
end
end

function onCastSpell(cid, var)
if(getPlayerStorageValue(cid,2043) == 0) then
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush,cid,var)
	RunPart(combat0_Brush_2,cid,var,dfcombat0_Brush_2,startPos)
	addEvent(RunPart,700,combat7_Brush_2,cid,var,dfcombat7_Brush_2,startPos)
	addEvent(RunPart,400,combat4_Brush_2,cid,var,dfcombat4_Brush_2,startPos)
	addEvent(RunPart,500,combat5_Brush_2,cid,var,dfcombat5_Brush_2,startPos)
	addEvent(RunPart,600,combat6_Brush_2,cid,var,dfcombat6_Brush_2,startPos)
	addEvent(RunPart,100,combat1_Brush_2,cid,var,dfcombat1_Brush_2,startPos)
	addEvent(RunPart,200,combat2_Brush_2,cid,var,dfcombat2_Brush_2,startPos)
	addEvent(RunPart,300,combat3_Brush_2,cid,var,dfcombat3_Brush_2,startPos)
else
	return false
end
end