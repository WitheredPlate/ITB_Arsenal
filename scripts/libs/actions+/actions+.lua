--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--     Action Status Library      --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## Template


-----------------------
-- Table of Contents --
-----------------------

--## Function
-- ( perameter [Type] )
--


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = GetParentPath(...)
local iconPath = "img/combat/"
local files = {
    "icons/icon_accelerate_glow",
    "icons/icon_accelerate_miss",
    "icons/icon_accelerated_glow",
    "icons/icon_accelerated",
    "icons/icon_accelerate_engaged",
    "icons/icon_overclock_glow",
    "icons/icon_overclock_miss",
    "icons/icon_overclocked_glow",
    "icons/icon_overclocked_glow",
    "icons/icon_overclocked",
    "icons/icon_overclock_engaged",
    "overclock_halo",
    "accelerate_halo"
}

for i, file in ipairs(files) do
    modApi:appendAsset(iconPath..file..".png", path..iconPath..file..".png")
end

ANIMS.ffrg_ActionsPlus_accelerated = Animation:new{
    Image = "combat/icons/icon_accelerated_glow.png",
    Layer = 0,
    NumFrames = 1,
    Time = 0,
    Loop = false,
    PosX = 0,
    PosY = 3
}
ANIMS.ffrg_ActionsPlus_accelerated_I = ANIMS.ffrg_ActionsPlus_accelerated:new{
    PosX = 0,
    PosY = -15
}
ANIMS.ffrg_ActionsPlus_accelerated_II = ANIMS.ffrg_ActionsPlus_accelerated:new{
    PosX = 15,
    PosY = -6
}
ANIMS.ffrg_ActionsPlus_accelerated_F = ANIMS.ffrg_ActionsPlus_accelerated:new{
    PosX = 0,
    PosY = 8
}
ANIMS.ffrg_ActionsPlus_accelerated_FI = ANIMS.ffrg_ActionsPlus_accelerated:new{
    PosX = 0,
    PosY = -10
}
ANIMS.ffrg_ActionsPlus_accelerated_FII = ANIMS.ffrg_ActionsPlus_accelerated:new{
    PosX = 15,
    PosY = -1
}
ANIMS.ffrg_ActionsPlus_overclocked = Animation:new{
    Image = "combat/icons/icon_overclocked_glow.png",
    Layer = 0,
    NumFrames = 1,
    Time = 0,
    Loop = false,
    PosX = 0,
    PosY = 3
}
ANIMS.ffrg_ActionsPlus_overclocked_I = ANIMS.ffrg_ActionsPlus_overclocked:new{
    PosX = 0,
    PosY = -15
}
ANIMS.ffrg_ActionsPlus_overclocked_F = ANIMS.ffrg_ActionsPlus_overclocked:new{
    PosX = 0,
    PosY = 8
}
ANIMS.ffrg_ActionsPlus_overclocked_FI = ANIMS.ffrg_ActionsPlus_overclocked:new{
    PosX = 0,
    PosY = -10
}
ANIMS.ffrg_ActionsPlus_overclock_halo_0 = Animation:new{
    Image = "combat/overclock_halo.png",
    Layer = 0,
    NumFrames = 4,
    Time = 0,
    Frames = {0},
    Lengths = nil,
    Loop = false,
    PosX = -17,
    PosY = -11
}
ANIMS.ffrg_ActionsPlus_overclock_halo_1 = ANIMS.ffrg_ActionsPlus_overclock_halo_0:new{
    Frames = {1}
}
ANIMS.ffrg_ActionsPlus_overclock_halo_2 = ANIMS.ffrg_ActionsPlus_overclock_halo_0:new{
    Frames = {2}
}
ANIMS.ffrg_ActionsPlus_overclock_halo_3 = ANIMS.ffrg_ActionsPlus_overclock_halo_0:new{
    Frames = {3}
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_0 = Animation:new{
    Image = "combat/accelerate_halo.png",
    Layer = 0,
    NumFrames = 6,
    Time = 0,
    Frames = {0},
    Lengths = nil,
    Loop = false,
    PosX = -19,
    PosY = -12
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_1 = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{
    Frames = {1}
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_2 = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{
    Frames = {2}
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_3 = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{
    Frames = {3}
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_4 = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{
    Frames = {4}
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_5 = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{
    Frames = {5}
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_0_I = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{
    PosY = -20
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_1_I = ANIMS.ffrg_ActionsPlus_accelerate_halo_1:new{
    PosY = -20
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_2_I = ANIMS.ffrg_ActionsPlus_accelerate_halo_2:new{
    PosY = -20
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_3_I = ANIMS.ffrg_ActionsPlus_accelerate_halo_3:new{
    PosY = -20
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_4_I = ANIMS.ffrg_ActionsPlus_accelerate_halo_4:new{
    PosY = -20
}
ANIMS.ffrg_ActionsPlus_accelerate_halo_5_I = ANIMS.ffrg_ActionsPlus_accelerate_halo_5:new{
    PosY = -20
}

Location["combat/icons/icon_accelerated_glow.png"] = Point(0,-17)
Location["combat/icons/icon_overclocked_glow.png"] = Point(0,-17)

local AccColor = GL_Color(40,60,255)
local OvcColor = GL_Color(255,120,0)
local MixColor = GL_Color(190,150,190)


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local moveUndoStorage = {}
local time_past

local ffrg_onGameEntered = function()
    if Board and GAME.ffrg_OverclockedData then
        for id, data in pairs(GAME.ffrg_OverclockedData) do
            data.bonus_pings = 2
        end
    end
    GAME.ffrg_AcceleratedData = GAME.ffrg_AcceleratedData or {}
    GAME.ffrg_OverclockedData = GAME.ffrg_OverclockedData or {}
    -- Each entry is formatted as:
    -- [ id (Integer),  pulse_timer (Float),  stagger (Boolean),  bonus_pings (Integer) ]
end
modApi.events.onGameEntered:subscribe(ffrg_onGameEntered)


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_Overclock(pawn, isOverclock, config)
    config = config or {}
    config.stage = config.stage or 1
    config.timer = config.timer or 1.2
    if config.fx == nil then config.fx = true end
    GAME.ffrg_OverclockedData = GAME.ffrg_OverclockedData or {}
    if isOverclock == nil then isOverclock = true end
    if isOverclock then
        GAME.ffrg_OverclockedData[pawn:GetId()] = {stage = config.stage, timer = config.timer, stagger = false, bonus_pings = 0, halo_timer = 0}
        if config.fx then
            Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/battle/buff_extra_hp"))
            Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/battle/withdraw"))
        end
    else
        GAME.ffrg_OverclockedData[pawn:GetId()] = nil
    end
end
local function ffrg_Accelerate(pawn, isAccelerate, config)
    config = config or {}
    config.stage = config.stage or 1
    config.timer = config.timer or 1.2
    if config.fx == nil then config.fx = true end
    GAME.ffrg_AcceleratedData = GAME.ffrg_AcceleratedData or {}
    if isAccelerate == nil then isAccelerate = true end
    if isAccelerate then
        GAME.ffrg_AcceleratedData[pawn:GetId()] = {stage = config.stage, timer = config.timer, bonus_pings = 0, halo_timer = 0, bonused = false}
        if config.fx then
            Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/battle/buff_extra_hp"))
            Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/battle/end_turn"))
        end
    else
        GAME.ffrg_AcceleratedData[pawn:GetId()] = nil
    end
end

local function ffrg_onMissionChanged(mission, missionOld)
    time_past = os.clock()
end
local function ffrg_onMissionUpdate(mission)
    local time_now = os.clock()
    local time_delta = time_now - time_past
    time_past = time_now
    for id, data in pairs(moveUndoStorage) do
        if id and data and Board:GetPawn(id) then
            local pawn = Board:GetPawn(id)
            if not pawn or not pawn:IsUndoPossible() then
                moveUndoStorage[id] = nil
            end
        end
    end
    if GAME.ffrg_OverclockedData then
        for id, data in pairs(GAME.ffrg_OverclockedData) do
            if id and data and data.stage ~= 3 and Board:GetPawn(id) then
                data.timer = data.timer + time_delta
                local pawn = Board:GetPawn(id)
                local space = pawn:GetSpace()
                local highlight = Board:GetHighlighted()
                if not modApi.deployment:isDeploymentPhase() or modApi.deployment:isLandingPhase() then
                    local target = pawn:GetTarget()
                    if pawn:GetArmedWeapon() ~= "Move" then target = Point(-1,-1) end
                    local append = 0
                    local anim = ""
                    if pawn:IsArmor() or pawn:IsBoosted() or pawn:IsInfected() then append = append + 1 end
                    if pawn:IsFlying() then
                        if append == 0 then anim = "ffrg_ActionsPlus_overclocked_F"
                        else anim = "ffrg_ActionsPlus_overclocked_FI" end
                    else
                        if append == 0 then anim = "ffrg_ActionsPlus_overclocked"
                        else anim = "ffrg_ActionsPlus_overclocked_I" end
                    end
                    if target ~= Point(-1,-1) then
                        if not GAME.ffrg_AcceleratedData[id] then
                            Board:MarkSpaceColor(target,OvcColor)
                        end
                        if data.stage == 2 then
                            data.halo_timer = data.halo_timer + time_delta
                            if data.halo_timer >= 1.6 then data.halo_timer = data.halo_timer - 1.6 end
                            local frame = 0
                            for i = 1, 3 do
                                if data.halo_timer - (0.4*i) > 0 then frame = i
                                else break end
                            end
                            Board:AddAnimation(target,"ffrg_ActionsPlus_overclock_halo_"..frame,1)
                        else
                            Board:AddAnimation(target,anim,1)
                        end
                    elseif data.stage ~= 2 and ( pawn:IsSelected() or space == highlight ) then
                        Board:AddAnimation(space,anim,1)
                    end
                    if target == Point(-1,-1) then
                        if data.stage == 2 then
                            data.halo_timer = data.halo_timer + time_delta
                            if data.halo_timer >= 1.6 then data.halo_timer = data.halo_timer - 1.6 end
                            local frame = 0
                            for i = 1, 3 do
                                if data.halo_timer - (0.4*i) > 0 then frame = i
                                else break end
                            end
                            Board:AddAnimation(space,"ffrg_ActionsPlus_overclock_halo_"..frame,1)
                        end
                    end
                    if not GAME.ffrg_AcceleratedData[id] then
                        if pawn:IsBusy() then
                            data.timer = 1.2
                            data.stagger = true
                        elseif data.timer >= 1.2 or (data.stage == 2 and (data.timer >= 0.9 or ( data.stagger and data.timer >= 0.3 ))) then
                            data.timer = data.timer % 0.3
                            if data.stagger then data.stagger = false else data.stagger = true end
                            Board:Ping(space,OvcColor)
                        end
                    end
                elseif data.bonus_pings > 0 then
                    if data.timer >= 1.2 then
                        data.timer = data.timer % 0.3
                        if data.stagger then data.stagger = false else data.stagger = true end
                        Board:Ping(space,OvcColor)
                        bonus_pings = bonus_pings - 1
                    end
                else
                    if pawn:IsSelected() or space == highlight then
                        local icon = SpaceDamage(highlight,0)
                        icon.sImageMark = "combat/icons/icon_overclocked_glow.png"
                        if modApi.deployment:getSelected() and modApi.deployment:getSelected() ~= id then
                            icon.loc = Board:GetPawn(modApi.deployment:getSelected()):GetSpace()
                        end
                        Board:MarkSpaceDamage(icon)
                    end
                end
                if not pawn:IsActive() then
                    if data.stage == 1 then
                        pawn:SetActive(true)
                        data.stage = 2
                    else
                        ffrg_Overclock(pawn, false)
                        Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/map/map_ping_big"))
                    end
                end
            end
        end
    end
    if GAME.ffrg_AcceleratedData then
        for id, data in pairs(GAME.ffrg_AcceleratedData) do
            if id and data and data.stage ~= 3 and Board:GetPawn(id) then
                data.timer = data.timer + time_delta
                local pawn = Board:GetPawn(id)
                local space = pawn:GetSpace()
                local highlight = Board:GetHighlighted()
                if not modApi.deployment:isDeploymentPhase() or modApi.deployment:isLandingPhase() then
                    local target = pawn:GetTarget()
                    if pawn:GetArmedWeapon() ~= "Move" then target = Point(-1,-1) end
                    local append = 0
                    local anim = ""
                    if pawn:IsArmor() or pawn:IsBoosted() or pawn:IsInfected() then append = append + 1 end
                    if GAME.ffrg_OverclockedData[id] and GAME.ffrg_OverclockedData[id].stage ~= 2 then append = append + 1 end
                    if pawn:IsFlying() then
                        if append == 0 then anim = "ffrg_ActionsPlus_accelerated_F"
                        elseif append == 1 then anim = "ffrg_ActionsPlus_accelerated_FI"
                        else anim = "ffrg_ActionsPlus_accelerated_FII" end
                    else
                        if append == 0 then anim = "ffrg_ActionsPlus_accelerated"
                        elseif append == 1 then anim = "ffrg_ActionsPlus_accelerated_I"
                        else anim = "ffrg_ActionsPlus_accelerated_II" end
                    end
                    if target ~= Point(-1,-1) then
                        if GAME.ffrg_OverclockedData[id] then
                            Board:MarkSpaceColor(target,MixColor)
                        else
                            Board:MarkSpaceColor(target,AccColor)
                        end
                        if data.stage == 2 then
                            data.halo_timer = data.halo_timer + time_delta
                            if data.halo_timer >= 2.4 then data.halo_timer = data.halo_timer - 2.4 end
                            local frame = 0
                            for i = 1, 5 do
                                if data.halo_timer - (0.4*i) > 0 then frame = i
                                else break end
                            end
                            if GAME.ffrg_OverclockedData[id] and GAME.ffrg_OverclockedData[id].stage == 2 then
                                Board:AddAnimation(target,"ffrg_ActionsPlus_accelerate_halo_"..frame.."_I",1)
                            else
                                Board:AddAnimation(target,"ffrg_ActionsPlus_accelerate_halo_"..frame,1)
                            end
                        else
                            Board:AddAnimation(target,anim,1)
                        end
                    elseif data.stage ~= 2 and ( pawn:IsSelected() or space == highlight ) then
                        Board:AddAnimation(space,anim,1)
                    end
                    if target == Point(-1,-1) then
                        if data.stage == 2 then
                            data.halo_timer = data.halo_timer + time_delta
                            if data.halo_timer >= 2.4 then data.halo_timer = data.halo_timer - 2.4 end
                            local frame = 0
                            for i = 1, 5 do
                                if data.halo_timer - (0.4*i) > 0 then frame = i
                                else break end
                            end
                            if GAME.ffrg_OverclockedData[id] and GAME.ffrg_OverclockedData[id].stage == 2 then
                                Board:AddAnimation(space,"ffrg_ActionsPlus_accelerate_halo_"..frame.."_I",1)
                            else
                                Board:AddAnimation(space,"ffrg_ActionsPlus_accelerate_halo_"..frame,1)
                            end
                        end
                    end
                    if not GAME.ffrg_OverclockedData[id] then
                        if pawn:IsBusy() then
                            data.timer = 1.2
                        elseif data.timer >= 1.2 or ( data.stage == 2 and data.timer >= 0.75 ) then
                            data.timer = data.timer % 0.15
                            Board:Ping(space,AccColor)
                        end
                    else
                        if pawn:IsBusy() then
                            data.timer = 0.6
                        elseif data.timer >= 0.6 then
                            data.timer = data.timer % 0.6
                            if target ~= Point(-1,-1) then
                                Board:Ping(target,MixColor)
                            end
                            Board:Ping(space,MixColor)
                        end
                    end
                elseif data.bonus_pings > 0 then
                    if data.timer >= 1.2 then
                        data.timer = data.timer % 0.3
                        Board:Ping(space,AccColor)
                        bonus_pings = bonus_pings - 1
                    end
                else
                    if pawn:IsSelected() or space == highlight then
                        local icon = SpaceDamage(highlight,0)
                        icon.sImageMark = "combat/icons/icon_accelerated_glow.png"
                        if modApi.deployment:getSelected() and modApi.deployment:getSelected() ~= id then
                            icon.loc = Board:GetPawn(modApi.deployment:getSelected()):GetSpace()
                        end
                        Board:MarkSpaceDamage(icon)
                    end
                end
                if pawn:IsMovementSpent() then
                    if data.stage == 1 then
                        pawn:SetMovementSpent(false)
                        data.stage = 2
                        moveUndoStorage[id] = moveUndoStorage[id] or {}
                        table.insert(moveUndoStorage[id],pawn:GetUndoLoc())
                    else
                        ffrg_Accelerate(pawn, false)
                        moveUndoStorage[id] = moveUndoStorage[id] or {}
                        table.insert(moveUndoStorage[id],pawn:GetUndoLoc())
                        if moveUndoStorage[id] and #moveUndoStorage[id] > 1 then
                            pawn:SetUndoLoc(moveUndoStorage[id][1])
                        end
                        pawn:SetBonusMove(0)
                        Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/map/map_ping_big"))
                    end
                end
                if not data.bonused and not pawn:IsActive() then
                    if data.stage == 1 then
                        data.stage = 2
                    end
                    pawn:SetBonusMove(pawn:GetMoveSpeed())
                    pawn:SetActive(true)
                    data.bonused = true
                end
            end
        end
    end
end
modApi.events.onMissionChanged:subscribe(ffrg_onMissionChanged)
modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)

local function ffrg_onPawnUndoMove(mission, pawn, undonePosition)
    local id = pawn:GetId()
    local space = pawn:GetSpace()
    if moveUndoStorage[id] then
        local storage = moveUndoStorage[id]
        if storage[#storage] == space then
            if GAME.ffrg_OverclockedData and GAME.ffrg_OverclockedData[id] then
                GAME.ffrg_OverclockedData[id].stage = 1
            end
            if GAME.ffrg_AcceleratedData and GAME.ffrg_AcceleratedData[id] then
                GAME.ffrg_AcceleratedData[id].stage = 1
                GAME.ffrg_AcceleratedData[id].timer = 1.2
            else
                ffrg_Accelerate(pawn, true, {stage = 2, timer = 1.2, fx = false})
                pawn:SetBonusMove(0)
                pawn:SetActive(false)
                GAME.ffrg_AcceleratedData[id].bonused = false
            end
            storage[#storage] = nil
            if #storage == 0 then
                moveUndoStorage[id] = nil
            end
        else
            ffrg_Accelerate(pawn, true, {timer = 1.2, fx = false})
            moveUndoStorage[id] = nil
        end
    end
end
modapiext.events.onPawnUndoMove:subscribe(ffrg_onPawnUndoMove)

Traits:add({
    func = function(trait,pawn,loc)
        if GAME and GAME.ffrg_AcceleratedData and GAME.ffrg_AcceleratedData[pawn:GetId()] then
            local data = GAME.ffrg_AcceleratedData[pawn:GetId()]
            if data.stage and data.stage == 1 then return true end
        end
        return false
    end,
    icon = "img/combat/icons/icon_accelerated.png",
    desc_title = "Accelerated",
    desc_text = "This unit may Move 1 additional time. Moving this unit now will not rely on Acceleration."
})
Traits:add({
    func = function(trait,pawn,loc)
        if GAME and GAME.ffrg_AcceleratedData and GAME.ffrg_AcceleratedData[pawn:GetId()] then
            local data = GAME.ffrg_AcceleratedData[pawn:GetId()]
            if data.stage and data.stage == 2 then return true end
        end
        return false
    end,
    icon = "img/combat/icons/icon_accelerate_engaged.png",
    desc_title = "Accelerated",
    desc_text = "This unit may Move 1 additional time. Moving this unit now will use and consume the Acceleration."
})
Traits:add({
    func = function(trait,pawn,loc)
        if GAME and GAME.ffrg_OverclockedData and GAME.ffrg_OverclockedData[pawn:GetId()] then
            local data = GAME.ffrg_OverclockedData[pawn:GetId()]
            if data.stage and data.stage == 1 then return true end
        end
        return false
    end,
    icon = "img/combat/icons/icon_overclocked.png",
    desc_title = "Overclocked",
    desc_text = "This unit may Act 1 additional time. Acting with this unit now will not rely on Overclocking."
})
Traits:add({
    func = function(trait,pawn,loc)
        if GAME and GAME.ffrg_OverclockedData and GAME.ffrg_OverclockedData[pawn:GetId()] then
            local data = GAME.ffrg_OverclockedData[pawn:GetId()]
            if data.stage and data.stage == 2 then return true end
        end
        return false
    end,
    icon = "img/combat/icons/icon_overclock_engaged.png",
    desc_title = "Overclocked",
    desc_text = "This unit may Act 1 additional time. Acting with this unit now will use and consume the Overclocking."
})


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--

local function initialize()
    ffrg_ActionsPlus.Overclock = ffrg_Overclock
    ffrg_ActionsPlus.Accelerate = ffrg_Accelerate
end

if ffrg_ActionsPlus then
    if modApi:isVersion(ffrg_ActionsPlus.Version, VERSION) and ffrg_ActionsPlus.Version ~= VERSION then
        initialize()
    end
else
    ffrg_ActionsPlus = ffrg_ActionsPlus or {}
    initialize()
end

return ffrg_ActionsPlus

--////////////////////////////////--
