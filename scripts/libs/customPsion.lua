--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--      Custom Psion Library      --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.1"

--## A library with functions for creating modded vek psions.


------------------
-- Dependencies --
------------------

--## trait.lua 3.0.1


------------
-- Psions --
------------

--## What CustomPsion will do for you in the production of a Psion:
    --## Handle all of the application of the visuals for the Psion's effect, including:
        --## The green ping and ascending banner when it is gained.
        --## The red ping and descending banner when it is lost.
        --## The board icon over Vek that have the Mutation.
        --## The trait icon, title, and description in the pawn infobox for Vek that have the Mutation.
    --## Offer utilities in the form of specifiable functions that trigger when:
        --## The Mutation is gained by a Vek.
        --## The Mutation is lost by a Vek.
            --## The function for losing the Mutation also informs when it is the result of the death of a Vek, allowing easy application of death effects.
    --## Offer a global function that checks what units on the Board currently have a given Mutation.
    --## Offer specifiable filter functions that control what pawns trigger the utilities and visuals of this lib.

--## What CustomPsion requires you to do to take advantage of the utilities:
    --## Create several icons:
        --## Create a basic icon for the Mutation.
        --## Create a version of that icon with a background glow for board application.
        --## Create a version of that icon that is desaturated/darkened version for when the Mutation is lost, or alternatively create banner animations for gaining/losing the Mutation.
    --## Create the text for the title and description of the Psion's ability when applied to Vek.
    --## Create a Psion pawn that has the Leader field specified as the Mutation id you have registered.

--## What is up to you to finish the functionality of the Psion:
    --## Create a passive-class weapon for the preview of the Mutation's effect and specify that weapon's id as the Psion pawn's Tooltip field.
    --## Create the pawn sprites and profile image for the Psion, typically just by recoloring existing psions.
    --## Leverage the CustomPsion functions to create the actual coded effect of the Mutation.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_CustomPsion.RegisterMutation
-- ( id [Integer],  icon [String],  sound [String or Table],  functions [Table],  title [String],  description [String],  banner [Boolean] )
-- Registers a new custom mutation with the specified integer ID.
-- (icon) is a string path to the standard mutation icon for the psion.
    -- A darkened version of the icon appended with "_lost" and a version with a background glow and shadow appended with "_glow" should also be made.
-- (sound) is a string path the the sound that should play when the mutation is gained, or a table of multiple said strings if it's desired for multiple sounds to play.
-- (functions) is a table containing several functions that inform the technical behavior of the mutation.
    -- gained [Function] (mission [Mission], point [Point], pawn [Pawn])  indicates the function that will be called whenever the mutation is gained by a pawn.
    -- lost [Function] (mission [Mission], point [Point], pawn [Pawn])  indicates the function that will be called whenever the mutation is lost by a pawn.
    -- filter [Function] (pawn [Pawn]) -> Boolean  indicates an optional function that will filter what pawns have the mutation applied.
-- (title) is the string title of the mutation's ability.
-- (description) is the string description of the mutation's ability.
-- (banner) is an optional boolean that indicates whether a custom banner animation should be used for the lost/gained visuals instead of automatically generated bursts.
    -- Banners allow for very close recreation of vanilla visuals, but are significantly more work.
    -- Define banner animations to be used as ANIMS.ffrg_CustomPsion_Gained_ appended with the id of the registered mutation.

--## ffrg_CustomPsion.GetMutated
-- ( id [Integer] ) -> Table
-- Returns a table that contains every unit on the board with the specified mutation, filtered by, if it exists, that mutation's filter.


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local MutationTracking = {}
local MutationFilters = {}
local Registered = false
local RegisteredMutations = {}
local MutationVisSupression = 0
local MutationSupression = 0
local time_past = 0

local function CheckMutation(id, pawn, force)
    local registry = RegisteredMutations[id]
    if registry ~= nil then
        if not pawn:IsMutation(id) and not force then return false end
        if type(registry) ~= "boolean" then
            if _G[registry](pawn) ~= true then return false end
        end
        local pawnType = _G[pawn:GetType()]
        if not pawnType or not pawnType.Leader or pawnType.Leader == LEADER_NONE then return true end
    end
    return false
end

local function ffrg_onMissionChanged(mission, missionOld)
    time_past = os.clock()
end
local function ffrg_onMissionUpdate(mission)
    local time_now = os.clock()
    local time_delta = time_now - time_past
    time_past = time_now
    if MutationVisSupression > 0 then
        MutationVisSupression = math.max(0,MutationVisSupression-time_delta)
    end
    if MutationSupression > 0 then
        MutationSupression = math.max(0,MutationSupression-time_delta)
    end
    if Registered and MutationSupression == 0 then
        local covered = {}
        local ids = Board:GetPawns(TEAM_ANY)
        if ids:size() > 0 then
            for i = 1, ids:size() do
                id = ids:index(i)
                covered[id] = true
                local pawn = Board:GetPawn(id)
                if Board:GetBusyState() ~= 6 then
                    local mutation = pawn:GetMutation()
                    local point = pawn:GetSpace()
                    if MutationTracking[id] then
                        MutationTracking[id].pawn = pawn
                        if mutation ~= 0 then
                            local tracking = MutationTracking[id]
                            if tracking.point ~= point then
                                tracking.point = point
                            end
                            if tracking.mutation ~= mutation then
                                ffrg_CustomPsion.events.onMutationLost:dispatch(GetCurrentMission(), point, pawn, tracking.mutation, false)
                                ffrg_CustomPsion.events.onMutationGained:dispatch(GetCurrentMission(), point, pawn, mutation)
                                tracking.mutation = mutation
                            end
                        else
                            ffrg_CustomPsion.events.onMutationLost:dispatch(GetCurrentMission(), point, pawn, MutationTracking[id].mutation, false)
                            MutationTracking[id] = nil
                        end
                    elseif mutation ~= 0 then
                        MutationTracking[id] = {mutation = mutation, point = point, pawn = pawn}
                        ffrg_CustomPsion.events.onMutationGained:dispatch(GetCurrentMission(), point, pawn, mutation)
                    end
                end
            end
        end
        for id, data in pairs(MutationTracking) do
            if not covered[id] then
                ffrg_CustomPsion.events.onMutationLost:dispatch(GetCurrentMission(), data.point, data.pawn, data.mutation, true)
                MutationTracking[id] = nil
            end
        end
        local selectedPawn = Board:GetSelectedPawn()
        if selectedPawn then
            local selectedId = selectedPawn:GetId()
            local selectedTable = _G[selectedPawn:GetType()]
            if MutationTracking[selectedId] and ( selectedPawn:IsBusy() == false or ( Board:GetBusyState() == 1 and ( not selectedTable.Jumper or selectedTable.Jumper == false ))) then
                local mutation = MutationTracking[selectedId].mutation
                if CheckMutation(mutation,selectedPawn) then
                    if selectedTable.Tier and selectedTable.Tier == TIER_BOSS then
                        if selectedPawn:IsFlying() then
                            Board:AddAnimation(selectedPawn:GetSpace(),"ffrg_CustomPsion_Icon_"..mutation.."_FI",1)
                        else
                            Board:AddAnimation(selectedPawn:GetSpace(),"ffrg_CustomPsion_Icon_"..mutation.."_I",1)
                        end
                    else
                        if selectedPawn:IsFlying() then
                            Board:AddAnimation(selectedPawn:GetSpace(),"ffrg_CustomPsion_Icon_"..mutation.."_F",1)
                        else
                            Board:AddAnimation(selectedPawn:GetSpace(),"ffrg_CustomPsion_Icon_"..mutation,1)
                        end
                    end
                end
            end
        end
        local highlight = Board:GetHighlighted()
        if Board:IsPawnSpace(highlight) then
            local pawn = Board:GetPawn(highlight)
            local id = pawn:GetId()
            local table = _G[pawn:GetType()]
            if ( not selectedPawn or id ~= selectedPawn:GetId() ) and MutationTracking[id] and ( pawn:IsBusy() == false or ( Board:GetBusyState() == 1 and ( not table.Jumper or table.Jumper == false ))) then
                local mutation = MutationTracking[id].mutation
                if CheckMutation(mutation, pawn) then
                    if table.Tier and table.Tier == TIER_BOSS then
                        if pawn:IsFlying() then
                            Board:AddAnimation(highlight,"ffrg_CustomPsion_Icon_"..mutation.."_FI",1)
                        else
                            Board:AddAnimation(highlight,"ffrg_CustomPsion_Icon_"..mutation.."_I",1)
                        end
                    else
                        if pawn:IsFlying() then
                            Board:AddAnimation(highlight,"ffrg_CustomPsion_Icon_"..mutation.."_F",1)
                        else
                            Board:AddAnimation(highlight,"ffrg_CustomPsion_Icon_"..mutation,1)
                        end
                    end
                end
            end
        end
    end
end

local function ffrg_onResetTurn(mission)
    MutationVisSupression = 0.5
end

local function ffrg_onMissionStart(mission)
    MutationVisSupression = 0
    MutationSupression = 1.5
end

local function ffrg_onGameEntered()
    MutationVisSupression = 0.5
end

ffrg_CustomPsion_Gained = Emitter:new{
    image = "nil.png",
    x = -8,
    y = 6,
    max_alpha = 1.0,
    min_alpha = 0.0,
    angle = -90,
    rot_speed = 0,
    angle_variance = 0,
    random_rot = false,
    lifespan = 1.25,
    burst_count = 1,
    speed = 0.6,
    birth_rate = 0,
    gravity = false,
    layer = LAYER_FRONT
}

ffrg_CustomPsion_Lost = ffrg_CustomPsion_Gained:new{
    y = -2,
    min_alpha = 1.0,
    angle = 90,
    lifespan = 1,
}

ANIMS.ffrg_CustomPsion_Icon = Animation:new{
    Image = "nil.png",
    Layer = 0,
    NumFrames = 1,
    Time = 0,
    Loop = false,
    PosX = 0,
    PosY = 3
}
ANIMS.ffrg_CustomPsion_Icon_I = ANIMS.ffrg_CustomPsion_Icon:new{
    PosX = 7,
    PosY = 10
}
ANIMS.ffrg_CustomPsion_Icon_F = ANIMS.ffrg_CustomPsion_Icon:new{
    PosY = 8
}
ANIMS.ffrg_CustomPsion_Icon_FI = ANIMS.ffrg_CustomPsion_Icon:new{
    PosX = 7,
    PosY = 15
}

--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function MutationVisGained(id, point, icon, sound, banner)
    if MutationVisSupression == 0 then
        Board:Ping(point,COLOR_GREEN)

        if banner then
            Board:AddAnimation(point, "ffrg_CustomPsion_Gained_"..id, 1)
        else
            ffrg_EffectBurst.AddInstant(point,"ffrg_CustomPsion_Gained_"..id,DIR_NONE)
        end
        if type(sound) == "table" then
            for _, sfx in ipairs(sound) do
                Game:TriggerSound(sfx)
            end
        else
            Game:TriggerSound(sound)
        end
    end

    Traits:update(point)
end

local function MutationVisLost(id, point, icon, banner)
    if MutationVisSupression == 0 then
        Board:Ping(point,COLOR_RED)
        if banner then
            Board:AddAnimation(point, "ffrg_CustomPsion_Lost_"..id, 1)
        else
            ffrg_EffectBurst.AddInstant(point,"ffrg_CustomPsion_Lost_"..id,DIR_NONE)
        end
        Game:TriggerSound("/ui/battle/buff_removed")
    end

    Traits:update(point)
end

local function ffrg_RegisterMutation(id, icon, sound, functions, title, description, banner)
    Registered = true
    RegisteredMutations[id] = functions.filter or true
    _G["ffrg_CustomPsion_Gained_"..id] = ffrg_CustomPsion_Gained:new{ image = icon }
    _G["ffrg_CustomPsion_Lost_"..id] = ffrg_CustomPsion_Lost:new{ image = icon:sub(1, -5).."_lost.png" }

    ANIMS["ffrg_CustomPsion_Icon_"..id] = ANIMS.ffrg_CustomPsion_Icon:new{ Image = icon:sub(1, -5).."_glow.png" }
    ANIMS["ffrg_CustomPsion_Icon_"..id.."_F"] = ANIMS.ffrg_CustomPsion_Icon_F:new{ Image = icon:sub(1, -5).."_glow.png" }
    ANIMS["ffrg_CustomPsion_Icon_"..id.."_I"] = ANIMS.ffrg_CustomPsion_Icon_I:new{ Image = icon:sub(1, -5).."_glow.png" }
    ANIMS["ffrg_CustomPsion_Icon_"..id.."_FI"] = ANIMS.ffrg_CustomPsion_Icon_FI:new{ Image = icon:sub(1, -5).."_glow.png" }

    Traits:add({
        func = function(trait, pawn, loc)
            return CheckMutation(id, pawn)
        end,
        icon = "img/"..icon,
        desc_title = title,
        desc_text = description
    })

    functions = functions or {}
    functions.gained = functions.gained or {}
    functions.lost = functions.lost or {}
    banner = banner or false -- If banner is true make sure to define anims for ffrg_CustomPsion_Gained_[id] and ffrg_CustomPsion_Lost_[id]
    ffrg_CustomPsion.events.onMutationGained:subscribe(function(mission, point, pawn, mutation)
        if mutation == id and CheckMutation(id, pawn, true) then
            MutationVisGained(id, point, icon, sound, banner)
            _G[functions.gained](mission, point, pawn)
        end
    end)
    ffrg_CustomPsion.events.onMutationLost:subscribe(function(mission, point, pawn, mutation, death)
        if mutation == id and CheckMutation(id, pawn, true) then
            if not death then
                MutationVisLost(id, point, icon, banner)
            end
            _G[functions.lost](mission, point, pawn, death)
        end
    end)
end

local function ffrg_GetMutated(id)
    local mutated = {}
    for data in ipairs(MutationTracking) do
        if data.mutation == id then
            if CheckMutation(id, data.pawn, true) then
                table.insert(mutated, data.pawn)
            end
        end
    end
    return mutated
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_CustomPsion or ( modApi:isVersion(ffrg_CustomPsion.version, VERSION) and ffrg_CustomPsion.version ~= VERSION ) then

 --[[     Library    ]] ffrg_CustomPsion = ffrg_CustomPsion or {}
 --[[     Version    ]] ffrg_CustomPsion.version = VERSION
 --[[ Initialization ]] ffrg_CustomPsion.initialized = false

 --[[    Overseer    ]] ffrg_CustomPsion.events = {}
 --[[      Event     ]] ffrg_CustomPsion.events.onMutationLost = Event()
 --[[      Event     ]] ffrg_CustomPsion.events.onMutationGained = Event()

 --[[     Global     ]] ffrg_CustomPsion.RegisterMutation = ffrg_RegisterMutation

end
local function ffrg_onModsInitialized()
if ffrg_CustomPsion.version == VERSION and not ffrg_CustomPsion.initialized then

 --[[     Library    ]] ttrg_CustomPsion = ttrg_CustomPsion or {}
 --[[ Initialization ]] ffrg_CustomPsion.initialized = true

 --[[     Global     ]] ffrg_CustomPsion.GetMutated = ffrg_GetMutated

 --[[  Subscription  ]] modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
 --[[  Subscription  ]] modApi.events.onMissionChanged:subscribe(ffrg_onMissionChanged)
 --[[  Subscription  ]] modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn)
 --[[  Subscription  ]] modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
 --[[  Subscription  ]] modApi.events.onGameEntered:subscribe(ffrg_onGameEntered)

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_CustomPsion


--////////////////////////////////--
