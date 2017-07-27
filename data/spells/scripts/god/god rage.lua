-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{1, 1, 1},
{1, 2, 1},
{1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (800)*-1,(1200)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 400ms
local combat4_Brush = createCombatObject()
setCombatParam(combat4_Brush, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat4_Brush, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat4_Brush,createCombatArea({{1, 1, 1, 1, 1},
{1, 0, 0, 0, 1},
{1, 0, 2, 0, 1},
{1, 0, 0, 0, 1},
{1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (800)*-1,(1200)*-1 
end
setCombatCallback(combat4_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 800ms
local combat8_Brush = createCombatObject()
setCombatParam(combat8_Brush, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat8_Brush, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat8_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 2, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (800)*-1,(1200)*-1 
end
setCombatCallback(combat8_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 1200ms
local combat12_Brush = createCombatObject()
setCombatParam(combat12_Brush, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat12_Brush, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat12_Brush,createCombatArea({{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 2, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0}}))
function getDmg_Brush(cid, level, maglevel)
	return (800)*-1,(1200)*-1 
end
setCombatCallback(combat12_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 1600ms
local combat16_Brush = createCombatObject()
setCombatParam(combat16_Brush, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat16_Brush, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat16_Brush,createCombatArea({{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}}))
function getDmg_Brush(cid, level, maglevel)
	return (800)*-1,(1200)*-1 
end
setCombatCallback(combat16_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
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
end

function onCastSpell(cid, var)
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush,cid,var)
	addEvent(RunPart,400,combat4_Brush,cid,var)
	addEvent(RunPart,800,combat8_Brush,cid,var)
	addEvent(RunPart,1200,combat12_Brush,cid,var)
	addEvent(RunPart,1600,combat16_Brush,cid,var)
	return true
end