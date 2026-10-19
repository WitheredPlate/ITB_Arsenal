--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--   Tip Image Tracker Library    --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.1"

--## A simple lib that tracks the tip image boards of every individual weapon.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_TipTracker.IsTip
-- ( skill [String or Skill] )
-- Checks and returns if a tip image of the specified skill id or skill object is currently being shown.
-- If skill is not specified, then this returns true as long as any tip image is being shown.

--## ffrg_TipTracker.GetTip
-- ( no options )
-- Returns the skill object of the tip image that is currently being shown.
-- Returns nil if no tip image is currently being shown.

--## ffrg_TipTracker.GetTipBoard
-- ( no options )
-- Returns the board object of the tip image that is currently being shown.
-- Returns nil if no tip image is currently being shown.


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--

local tipSkill
local tipSkillLast
local function buildGetUpgradeDescriptionOverride(skill)
	local originalFn = skill.GetUpgradeDescription

	return function(self, pawn, ...)
		tipSkill = self

		return originalFn(self, pawn, ...)
	end
end
local function buildGetTipDamageOverride(skill)
	local originalFn = skill.GetTipDamage

	return function(self, pawn, ...)
		tipSkill = self

		return originalFn(self, pawn, ...)
	end
end

local function replaceFrame()
    tipSkillLast = tipSkill
	tipSkill = nil
end

local function overrideSkillFunction(skill, functionName, fn)
	skill[functionName] = fn
end

local function overrideAllSkills()
	for k, v in pairs(_G) do
		if type(v) == "table" and v.GetSkillEffect then
			overrideSkillFunction(v, "GetUpgradeDescription", buildGetUpgradeDescriptionOverride(v))
            overrideSkillFunction(v, "GetTipDamage", buildGetTipDamageOverride(v))
		end
	end
end

local TipImageBoards = {}

local function ffrg_onTargetAreaBuild(mission, pawn, weaponId, p1, p2, skillEffect)
    if Board and Board:IsTipImage() then
        TipImageBoards[_G[weaponId]] = Board
    end
end

local function ffrg_onSecondTargetAreaBuild(mission, pawn, weaponId, p1, p2, p3, skillEffect)
    if Board and Board:IsTipImage() then
        TipImageBoards[_G[weaponId]] = Board
    end
end

local function ffrg_GetTipBoard()
    return TipImageBoards[tipSkillLast]
end

local function ffrg_IsTip(skill)
    if not tipSkillLast then return false end
    if not skill then return true end
    if tipSkillLast == skill or _G[skill] and _G[skill] == tipSkillLast then return true end
    return false
end

local function ffrg_GetTip()
    return tipSkillLast
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_TipTracker or ( modApi:isVersion(ffrg_TipTracker.version, VERSION) and ffrg_TipTracker.version ~= VERSION ) then

 --[[     Library    ]] ffrg_TipTracker = ffrg_TipTracker or {}
 --[[     Version    ]] ffrg_TipTracker.version = VERSION
 --[[ Initialization ]] ffrg_TipTracker.initialized = false

 --[[    Overseer    ]] ffrg_TipTracker.events = {}
 --[[      Event     ]] ffrg_TipTracker.events.onTemplateEvent = Event()

end
local function ffrg_onModsInitialized()
if ffrg_TipTracker.version == VERSION and not ffrg_TipTracker.initialized then

 --[[     Library    ]] ttrg_TipTracker = ttrg_TipTracker or {}
 --[[ Initialization ]] ffrg_TipTracker.initialized = true

 --[[     Global     ]] ffrg_TipTracker.IsTip = ffrg_IsTip
 --[[     Global     ]] ffrg_TipTracker.GetTip = ffrg_GetTip
 --[[     Global     ]] ffrg_TipTracker.GetTipBoard = ffrg_GetTipBoard

 --[[  Subscription  ]] modApi.events.onFrameDrawStart:subscribe(replaceFrame)
 --[[  Subscription  ]] modapiext.events.onTargetAreaBuild:subscribe(ffrg_onTargetAreaBuild)
 --[[  Subscription  ]] modapiext.events.onSecondTargetAreaBuild:subscribe(ffrg_onSecondTargetAreaBuild)
 --[[    Function    ]] overrideAllSkills()

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_TipTracker


--////////////////////////////////--
