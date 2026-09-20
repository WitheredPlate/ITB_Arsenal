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
    "accelerate_halo",
    "overclock_banner",
    "accelerate_banner"
}

for i, file in ipairs(files) do
    modApi:appendAsset(iconPath..file..".png", path..iconPath..file..".png")
end


Location["combat/icons/icon_accelerate_glow.png"] = Point(-10,9)
Location["combat/icons/icon_accelerate_miss.png"] = Point(-10,9)
Location["combat/icons/icon_overclock_glow.png"] = Point(-10,9)
Location["combat/icons/icon_overclock_miss.png"] = Point(-10,9)

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
    NumFrames = 12,
    Time = 0,
    Frames = {0},
    Lengths = nil,
    Loop = false,
    PosX = -17,
    PosY = -11
}
for i = 1, 11 do
    ANIMS["ffrg_ActionsPlus_overclock_halo_"..i] = ANIMS.ffrg_ActionsPlus_overclock_halo_0:new{ Frames = {i} }
end

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
ANIMS.ffrg_ActionsPlus_accelerate_halo_0_I = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{
    PosY = -20
}

for i = 1, 5 do
    ANIMS["ffrg_ActionsPlus_accelerate_halo_"..i] = ANIMS.ffrg_ActionsPlus_accelerate_halo_0:new{ Frames = {i} }
    ANIMS["ffrg_ActionsPlus_accelerate_halo_"..i.."_I"] = ANIMS.ffrg_ActionsPlus_accelerate_halo_0_I:new{ Frames = {i} }
end

ANIMS.ffrg_ActionsPlus_overclock_banner = Animation:new{
    Image = "combat/overclock_banner.png",
    Layer = 0,
    NumFrames = 20,
    Time = 0.05,
    Loop = false,
    PosX = -8,
    PosY = -1
}
ANIMS.ffrg_ActionsPlus_accelerate_banner = Animation:new{
    Image = "combat/accelerate_banner.png",
    Layer = 0,
    NumFrames = 20,
    Time = 0.05,
    Loop = false,
    PosX = -8,
    PosY = -1
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
            data.bonus_pings = data.stage
        end
    end
    if Board and GAME.ffrg_AcceleratedData then
        for id, data in pairs(GAME.ffrg_AcceleratedData) do
            data.bonus_pings = 1
        end
    end
    if Board and Game:GetTeamTurn() == TEAM_PLAYER then isPlayerActionable = true end
    GAME.ffrg_AcceleratedData = GAME.ffrg_AcceleratedData or {}
    GAME.ffrg_OverclockedData = GAME.ffrg_OverclockedData or {}
end
modApi.events.onGameEntered:subscribe(ffrg_onGameEntered)

local function ffrg_ClearAllActionData()
    GAME.ffrg_AcceleratedData = {}
    GAME.ffrg_OverclockedData = {}
end

local function ffrg_onMissionStart(mission)
    isPlayerActionable = false
    tToggle = false
    aToggle = false
end
local function ffrg_onMissionEnd(mission)
    ffrg_ClearAllActionData()
end
local function ffrg_onTestMechEntered(mission)
    ffrg_ClearAllActionData()
end
local function ffrg_onTestMechExited(mission)
    ffrg_ClearAllActionData()
end
modApi.events.onMissionStart:subscribe(ffrg_onMissionEnd)
modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)
modApi.events.onTestMechEntered:subscribe(ffrg_onTestMechEntered)
modApi.events.onTestMechExited:subscribe(ffrg_onTestMechExited)

local function ttrg_TableToString(table)
    if table == nil then return "{}" end
    if type(table) ~= "table" then return tostring(table) end
    local result = "{"
    for k, v in pairs(table) do
        local key = type(k) == "string" and string.format("[%q]", k) or "["..k.."]"
        local value
        if type(v) == "table" then
            value = table_to_string(v)
        elseif type(v) == "string" then
            value = string.format("%q", v)
        else
            value = tostring(v)
        end
        result = result .. key .. "=" .. value .. ","
    end
    return result .. "}"
end


local isPlayerActionable = false
local tToggle = false
local aToggle = false

local function ffrg_onMissionUpdate2(mission)
    if not tToggle and Game:GetTeamTurn() == TEAM_PLAYER then
        tToggle = true
    end
    if tToggle and not aToggle and Board:GetPawn(0) and Board:GetPawn(0):IsActive() then
        aToggle = true
        isPlayerActionable = true
    end
end
modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate2)

EXCL = {"GetAmbience", "GetBonusStatus", "BaseUpdate", "UpdateMission", "GetCustomTile", "GetDamage", "GetTurnLimit", "BaseObjectives", "UpdateObjectives",}
for i,v in pairs(Mission) do
    if type(v) == 'function' then
        local oldfn = v
        Mission[i] = function(...)
			if not list_contains(_G["EXCL"], i) then
                if i == "IsEnvironmentEffect" then
                    isPlayerActionable = false
                    tToggle = false
                    aToggle = false
                    if GAME.ffrg_OverclockedData then
                        for id, data in pairs(GAME.ffrg_OverclockedData) do
                            if data.stage == 2 then data.stage = 1 end
                        end
                    end
                    if GAME.ffrg_AcceleratedData then
                        for id, data in pairs(GAME.ffrg_AcceleratedData) do
                            if data.stage == 2 then data.stage = 1 end
                        end
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


local function ffrg_OverclockDamage(point, config)
    config = config or {}
    config.stage = config.stage or 1
    config.timer = config.timer or 1.2
    config.self_force = config.self_force or false
    if config.fx == nil then config.fx = true end
    local damage = SpaceDamage(point,0)
    local miss = true
    local pawn
    local id
    if Board:IsPawnSpace(point) then
        local pawn = Board:GetPawn(point)
        id = pawn:GetId()
        local team = pawn:GetTeam()
        if team == TEAM_PLAYER and ( not GAME.ffrg_OverclockedData[id] or GAME.ffrg_OverclockedData[id].stage == 3 ) then miss = false end
    end
    if miss then
        damage.sImageMark = "combat/icons/icon_overclock_miss.png"
    else
        damage.sImageMark = "combat/icons/icon_overclock_glow.png"
        damage.sScript = "ffrg_ActionsPlus.Overclock(Board:GetPawn("..id.."),true,"..ttrg_TableToString(config)..")"
    end
    return damage
end
local function ffrg_AccelerateDamage(point, config)
    config = config or {}
    config.stage = config.stage or 1
    config.timer = config.timer or 1.2
    if config.fx == nil then config.fx = true end
    local damage = SpaceDamage(point,0)
    local miss = true
    local pawn
    local id
    if Board:IsPawnSpace(point) then
        local pawn = Board:GetPawn(point)
        id = pawn:GetId()
        local team = pawn:GetTeam()
        if team == TEAM_PLAYER and ( not GAME.ffrg_AcceleratedData[id] or GAME.ffrg_AcceleratedData[id].stage == 3 ) then miss = false end
    end
    if miss then
        damage.sImageMark = "combat/icons/icon_accelerate_miss.png"
    else
        damage.sImageMark = "combat/icons/icon_accelerate_glow.png"
        damage.sScript = "ffrg_ActionsPlus.Accelerate(Board:GetPawn("..id.."),true,"..ttrg_TableToString(config)..")"
    end
    return damage
end

local function ffrg_Overclock(pawn, isOverclock, config)
    if pawn then
        local id = pawn:GetId()
        config = config or {}
        config.stage = config.stage or 1
        config.timer = config.timer or 1.2
        config.self_force = config.self_force or false
        if config.fx == nil then config.fx = true end
        if isOverclock == nil then isOverclock = true end
        GAME.ffrg_OverclockedData = GAME.ffrg_OverclockedData or {}
        if isOverclock then
            if not GAME.ffrg_OverclockedData[id] or GAME.ffrg_OverclockedData[id].stage == 3 or ( config.self_force and GAME.ffrg_OverclockedData[id].stage == 2 ) then
                if not Board:IsTipImage() then
                    GAME.ffrg_OverclockedData[id] = {stage = config.stage, timer = config.timer, stagger = false, bonus_pings = 0, halo_timer = 0, buffer = 0}
                end
                if config.fx then
                    local space = pawn:GetSpace()
                    Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/battle/withdraw"))
                    if space then
                        Board:AddAnimation(space,"ffrg_ActionsPlus_overclock_banner",1)
                        Board:Ping(space,OvcColor)
                    end
                end
            end
        else
            if config.fx and GAME.ffrg_OverclockedData[id] then
                Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/map/map_ping_big"))
                GAME.ffrg_OverclockedData[id] = nil
            end
        end
    end
end
local function ffrg_Accelerate(pawn, isAccelerate, config)
    if pawn then
        local id = pawn:GetId()
        config = config or {}
        config.stage = config.stage or 1
        config.timer = config.timer or 1.2
        if config.fx == nil then config.fx = true end
        if isAccelerate == nil then isAccelerate = true end
        GAME.ffrg_AcceleratedData = GAME.ffrg_AcceleratedData or {}
        if isAccelerate then
            if not GAME.ffrg_AcceleratedData[id] or GAME.ffrg_AcceleratedData[id].stage == 3 then
                if not Board:IsTipImage() then
                    GAME.ffrg_AcceleratedData[id] = {stage = config.stage, timer = config.timer, bonus_pings = 0, halo_timer = 0, bonused = false, buffer = 0}
                end
                if config.fx then
                    local space = pawn:GetSpace()
                    Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/battle/end_turn"))
                    if space then
                        Board:AddAnimation(space,"ffrg_ActionsPlus_accelerate_banner",1)
                        Board:Ping(space,AccColor)
                    end
                end
            end
        else
            if config.fx and GAME.ffrg_AcceleratedData[id] then
                Board:DamageSpace(SoundEffect(Point(-1,-1),"/ui/map/map_ping_big"))
                GAME.ffrg_AcceleratedData[id] = nil
            end
        end
    end
end

function ffrg_AccProf(id)
    local pawn = Board:GetPawn(id)
    if pawn then
        local bonused = false
        local stage = 0
        if GAME and GAME.ffrg_AcceleratedData and GAME.ffrg_AcceleratedData[id] then
            bonused = GAME.ffrg_AcceleratedData[id].bonused
            stage = GAME.ffrg_AcceleratedData[id].stage
        end
        LOG("Pawn "..id..":\nHas Moved: "..tostring(pawn:IsMovementSpent()).."\nBonus Move: "..pawn:GetBonusMove().."\nIs Active: "..tostring(pawn:IsActive()).."\nHas Bonus Acceleration Move: "..tostring(bonused).."\nAcceleration Stage: "..stage)
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
                            if data.halo_timer >= 4.8 then data.halo_timer = data.halo_timer - 4.8 end
                            local frame = 0
                            for i = 1, 11 do
                                if data.halo_timer - (0.4*i) > 0 then frame = i
                                else break end
                            end
                            Board:AddAnimation(target,"ffrg_ActionsPlus_overclock_halo_"..frame,1)
                        else
                            Board:AddAnimation(target,anim,1)
                        end
                    elseif data.stage ~= 2 and ( pawn:IsSelected() or space == highlight ) and ( pawn:IsBusy() == false or Board:GetBusyState() == 1 ) then
                        Board:AddAnimation(space,anim,1)
                    end
                    if target == Point(-1,-1) then
                        if data.stage == 2 then
                            data.halo_timer = data.halo_timer + time_delta
                            if data.halo_timer >= 4.8 then data.halo_timer = data.halo_timer - 4.8 end
                            local frame = 0
                            for i = 1, 11 do
                                if data.halo_timer - (0.4*i) > 0 then frame = i
                                else break end
                            end
                            if not pawn:IsBusy() or Board:GetBusyState() == 1 then
                                Board:AddAnimation(space,"ffrg_ActionsPlus_overclock_halo_"..frame,1)
                            end
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
                if isPlayerActionable then
                    if not pawn:IsActive() then
                        if data.stage == 1 then
                            pawn:SetActive(true)
                            data.stage = 2
                        else
                            ffrg_Overclock(pawn, false)
                        end
                    elseif pawn:GetBonusMove() > 0 then
                        if data.stage == 1 then
                            data.stage = 2
                            local bonus = pawn:GetBonusMove()
                            pawn:SetBonusMove(0)
                            pawn:SetMovementSpent(false)
                            if bonus ~= pawn:GetMoveSpeed() then
                                pawn:AddMoveBonus(bonus-pawn:GetMoveSpeed())
                            end
                        else
                            ffrg_Overclock(pawn, false)
                        end
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
                    elseif data.stage ~= 2 and ( pawn:IsSelected() or space == highlight ) and ( pawn:IsBusy() == false or Board:GetBusyState() == 1 ) then
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
                            if not pawn:IsBusy() or Board:GetBusyState() == 1 then
                                if GAME.ffrg_OverclockedData[id] and GAME.ffrg_OverclockedData[id].stage == 2 then
                                    Board:AddAnimation(space,"ffrg_ActionsPlus_accelerate_halo_"..frame.."_I",1)
                                else
                                    Board:AddAnimation(space,"ffrg_ActionsPlus_accelerate_halo_"..frame,1)
                                end
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
                if isPlayerActionable then
                    if not data.bonused and not pawn:IsActive() then
                        if data.stage == 1 then
                            data.stage = 2
                            moveUndoStorage[id] = moveUndoStorage[id] or {}
                            table.insert(moveUndoStorage[id],true)
                        end
                        pawn:SetBonusMove(pawn:GetMoveSpeed())
                        pawn:SetActive(true)
                        data.bonused = true
                    end
                    if data.stage == 2 and pawn:GetBonusMove() > 0 and data.bonused == false then
                        data.stage = 1
                    end
                    if pawn:IsMovementSpent() and pawn:GetBonusMove() == 0 then
                        if data.stage == 1 then
                            pawn:SetMovementSpent(false)
                            data.stage = 2
                            moveUndoStorage[id] = moveUndoStorage[id] or {}
                            table.insert(moveUndoStorage[id],data.bonused)
                        else
                            ffrg_Accelerate(pawn, false)
                            moveUndoStorage[id] = moveUndoStorage[id] or {}
                            table.insert(moveUndoStorage[id],data.bonused)
                        end
                    end
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
        if GAME.ffrg_AcceleratedData and GAME.ffrg_AcceleratedData[id] then
            GAME.ffrg_AcceleratedData[id].stage = 1
            GAME.ffrg_AcceleratedData[id].timer = 1.2
            GAME.ffrg_AcceleratedData[id].bonused = false
        else
            ffrg_Accelerate(pawn, true, {stage = 2, timer = 1.2, fx = false})
            if storage[#storage] == true then
                GAME.ffrg_AcceleratedData[id].bonused = false
                pawn:SetBonusMove(0)
                pawn:SetActive(false)
            end
        end
        storage[#storage] = nil
        if #storage == 0 then
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
    ffrg_ActionsPlus.OverclockDamage = ffrg_OverclockDamage
    ffrg_ActionsPlus.Accelerate = ffrg_Accelerate
    ffrg_ActionsPlus.AccelerateDamage = ffrg_AccelerateDamage
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
