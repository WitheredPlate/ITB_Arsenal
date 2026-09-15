--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--    Queued Previewer Library    --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.3"

--## A library for showing previewed additions to queued attacks. Supports alternatives for whether or not the attack is selected.
--## This library can do certain things WeaponPreview can't for queued attacks and will catch certain bugs that WeaponPreview doesn't, but it is far less flexible, has more limitations, and is marginally harder to use.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_QueuedPreview.AddQueuedSet
-- ( id [Integer],  set [Table] )
-- Adds the specified set of queued marks to the Board for the specified pawn id.
-- Queued marks in the specified set have the following properties:
-- focused [Boolean] indicates whether the mark should appear when the host pawn is focused or when the pawn is not focused. When not present, the mark is shown for both.
-- type [String] indicates what form the mark is.
    -- "damage" indicates that the mark is a SpaceDamage.
    -- "animation" indicates that the mark is a 1-frame Animation. The animation must have 1 frame, not loop, and have zero duration.
-- data [SpaceDamage or String] is the actual data of what is being placed on the board. This varies depending on what the type of the mark is.
-- loc [Point] is only used for marks of type "animation" and indicates where the animation is to be placed on the board.


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local time_past = 0
local time_delta = 0
local ffrg_QueuedDataStorage = {}

local function ffrg_AddQueuedSet(id, set)
    if not Board.ffrg_QueuedData then
        Board.ffrg_QueuedData = {}
    end
    Board.ffrg_QueuedData[id] = set
    if not Board:IsTipImage() then
        ffrg_QueuedDataStorage[id] = set
    end
end

local function ffrg_QueuedActConclude(pawn)
    if Board and not Board:IsTipImage() then
        if Board.ffrg_QueuedActedIds then
            table.insert(Board.ffrg_QueuedActedIds, pawn:GetId())
        else
            Board.ffrg_QueuedActedIds = { pawn:GetId() }
        end
    end
end

local function ffrg_onTargetAreaBuild(mission, pawn, weaponId, p1, pointList)
    if Board and Board:IsTipImage() then
        if pawn:GetUndoLoc() == nil or pawn:GetUndoLoc() ~= Point(6,9) then
            _G[weaponId].ffrg_QueuedTipTimer = 0
        end
        pawn:SetUndoLoc(Point(6,9))
    end
end

local function ffrg_onSecondTargetAreaBuild(mission, pawn, weaponId, p1, p2, pointList)
    if Board and Board:IsTipImage() then
        if pawn:GetUndoLoc() == nil or pawn:GetUndoLoc() ~= Point(6,9) then
            _G[weaponId].ffrg_QueuedTipTimer = 0
        end
        pawn:SetUndoLoc(Point(6,9))
    end
end


local function ffrg_onQueuedSkillStart(mission, pawn, weaponId, p1, p2)
    ffrg_QueuedActConclude(pawn)
end

local function ffrg_onQueuedFinalEffectStart(mission, pawn, weaponId, p1, p2, p3)
    ffrg_QueuedActConclude(pawn)
end

local function ffrg_IsFocused(boardTemp, pawn, tipDuration)
    if boardTemp:IsTipImage() then
        local skill = ffrg_TipTracker.GetTip()
        if skill and skill.ffrg_QueuedTipTimer then
            if (skill.ffrg_QueuedTipTimer/tipDuration) >= 0.2 and (skill.ffrg_QueuedTipTimer/tipDuration) <= 0.5 then return true end
        end
    else
        if not boardTemp:IsBusy() and pawn:GetSpace() then
            local point = pawn:GetSpace()
            if boardTemp:IsHighlighted(point) then
                if not Board:GetSelectedPawn() or not Board:GetSelectedPawn():IsWeaponArmed() or Board:GetSelectedPawn():GetArmedWeaponId() == 0 then
                    return true
                end
            end
        end
        if Game:GetTeamTurn() == TEAM_PLAYER and pawn:IsSelected() and boardTemp.ffrg_QueuedReady  then
            if not boardTemp.ffrg_QueuedActedIds then
                boardTemp.ffrg_QueuedActedIds = {}
            end
            pawnId = pawn:GetId()
            for _, id in ipairs(boardTemp.ffrg_QueuedActedIds) do
                if pawnId == id then
                    return false
                end
            end
            return true
        end
        return false
    end
    return false
end

EXCL = {"GetAmbience", "GetBonusStatus", "BaseUpdate", "UpdateMission", "GetCustomTile", "GetDamage", "GetTurnLimit", "BaseObjectives", "UpdateObjectives",}

for i,v in pairs(Mission) do
    if type(v) == 'function' then
        local oldfn = v
        Mission[i] = function(...)
			if not list_contains(_G["EXCL"], i) then
                if i == "IsEnvironmentEffect" then
                    if Board then
                        Board.ffrg_QueuedReady = true
                    end
				end
            end
            return oldfn(...)
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_QueuedMarkOverview(boardTemp)
    for id, set in pairs(boardTemp.ffrg_QueuedData) do
        if boardTemp:GetPawn(id) then
            local pawn = boardTemp:GetPawn(id)
            if ( ( pawn:GetQueuedTarget() and boardTemp:IsValid(pawn:GetQueuedTarget()) and not pawn:IsDead()) or boardTemp:IsTipImage() ) then -- Pawn exists on board and has a queued attack with data.
                for _, mark in ipairs(set) do
                    if boardTemp:IsTipImage() then
                        local tipDuration = 3
                        local skill = ffrg_TipTracker.GetTip()
                        if skill and skill.TipImage then
                            tipDuration = skill.TipImage.Length or 3
                        end
                        if mark.focused == nil or mark.focused == ffrg_IsFocused(boardTemp, pawn, tipDuration) then -- Focused state DNE or matches.
                            if mark.type == "damage" then
                                boardTemp:MarkSpaceDamage(mark.data)
                            elseif mark.type == "animation" then
                                boardTemp:AddAnimation(mark.loc, mark.data, 1)
                            end
                        end
                    else
                        if mark.focused == nil or mark.focused == ffrg_IsFocused(boardTemp, pawn) then -- Focused state DNE or matches.
                            if mark.type == "damage" then
                                boardTemp:MarkSpaceDamage(mark.data)
                            elseif mark.type == "animation" then
                                boardTemp:AddAnimation(mark.loc, mark.data, 1)
                            end
                        end
                    end
                end
            end
        end
    end
end

local function ffrg_ClearQueuedMarks(boardTemp)
    boardTemp.ffrg_QueuedData = {}
    ffrg_QueuedDataStorage = {}
    boardTemp.ffrg_QueuedActedIds = {}
    boardTemp.ffrg_QueuedReady = false
end


local function ffrg_onMissionUpdate(mission)
    if Board.ffrg_QueuedData then
        ffrg_QueuedMarkOverview(Board)
    elseif ffrg_QueuedDataStorage then
        Board.ffrg_QueuedData = shallow_copy(ffrg_QueuedDataStorage)
        ffrg_QueuedMarkOverview(Board)
    end
end

local function ffrg_onFrameDrawStart()
    local time_now = os.clock()
    time_delta = time_now - time_past
    time_past = time_now
    if ffrg_TipTracker.GetTipBoard() then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard.ffrg_QueuedData then
            ffrg_QueuedMarkOverview(TipImageBoard)
        end
    end
    if ffrg_TipTracker.IsTip() and ffrg_TipTracker.GetTipBoard() then
        local skill = ffrg_TipTracker.GetTip()
        local boardTemp = ffrg_TipTracker.GetTipBoard()
        if boardTemp:IsBusy() and skill.ffrg_QueuedTipTimer ~= 0 then skill.ffrg_QueuedTipTimer = -1 end
        if not skill.ffrg_QueuedTipTimer or skill.ffrg_QueuedTipTimer ~= -1 then
            skill.ffrg_QueuedTipTimer = ( skill.ffrg_QueuedTipTimer or 0 ) + time_delta
        end
    end
end

local function ffrg_onMissionStart(mission)
    ffrg_ClearQueuedMarks(Board)
end

local function ffrg_onNextTurn(mission)
    Board.ffrg_QueuedActedIds = {}
    Board.ffrg_QueuedReady = false
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function initialize()
    ffrg_QueuedPreview.AddQueuedSet = ffrg_AddQueuedSet
    ffrg_QueuedPreview.Version = VERSION

    modapiext.events.onSkillBuild:subscribe(ffrg_onTargetAreaBuild)
    modapiext.events.onFinalEffectBuild:subscribe(ffrg_onSecondTargetAreaBuild)
    modapiext.events.onQueuedSkillStart:subscribe(ffrg_onQueuedSkillStart)
    modapiext.events.onQueuedFinalEffectStart:subscribe(ffrg_onQueuedFinalEffectStart)

    modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
    modApi.events.onFrameDrawStart:subscribe(ffrg_onFrameDrawStart)
    modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
    modApi.events.onNextTurn:subscribe(ffrg_onNextTurn)
end

if ffrg_QueuedPreview then
    if modApi:isVersion(ffrg_QueuedPreview.Version, VERSION) and ffrg_QueuedPreview.Version ~= VERSION then
        initialize()
    end
else
    ffrg_QueuedPreview = ffrg_QueuedPreview or {}
    initialize()
end

return ffrg_QueuedPreview


--////////////////////////////////--
