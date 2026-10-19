--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--          Shove Library         --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## A library of functions for applying a modded weapon effect, Shove. ##--


------------------
-- Dependencies --
------------------

--## seriousDamage.lua 1.1.4
--## weaponPreview.lua 3.1.3
--## worldConstants.lua (Modified, just grab the one from this or Impact)


---------------------------
-- Optional Dependencies --
---------------------------

--## queuedPreview.lua 1.0.0
    -- Required for Queued Shoves


------------
-- Shove --
------------

--## Shove is essentially a stronger version of push, that can push multiple tiles and deal more than one bump damage.
--## Each instance of Shove has an accompanying force value, which defines how far the Shove attempts to displace the target.
--## If a Shove cannot displace a unit the maximum distance, it deals bump damage to the Shoved unit and the obstacle equal to the number of tiles that the unit was prevented from being displaced.
    --## For example, if you Shove a unit with 3 force and there are 3 open tiles behind it for it to travel, it will travel all 3 of those tiles and end the displacement nonlethally.
    --## If there's an obstacle on the third tile, the unit will travel only two tiles and both will take 1 bump damage.
    --## If there's an obstacle on the second, the unit will travel only a single tile and both will take 2 bump damage.
    --## An obstacle on the first means the unit is not displaced at all, but the unit and the obstacle both take 3 bump damage.
--## Like push, you cannot Shove stable units.
--## You cannot Shove a unit past a terrain tile that is ordinarily instantly lethal for it.
    --## For example, you may not Shove a Firefly past a water tile. It is Shoved into the water tile no matter how much force the Shove has and instantly dies.
    --## A Hornet in the same situation could be Shoved past the water, because a hornet flies and thus cannot fall into the water.
    --## A Mech, even without Flying, could also be Shoved past water, because the Massive trait makes Water nonlethal.
--## A shove of force 1 is identical to a push.

--## Shove is fairly unstable, finicky, and still in progress. Many features are uncompleted or do not always work, and minor visual glitches with Shoves will very occasionally appear for 1 frame due to imperfect math.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_Shove.Shove
-- ( point [Point], dir [Integer], force [Integer], config [Table] )
-- Instantly shoves a target or adds a Shove to a SkillEffect, with the specified point, direction, force, and config options, listed below.
    -- queued [Boolean] indicates whether or not the attack should be queued. Unused in "instant" mode. NOTICE queued shoves have not been finished yet and will not function.
    -- mode [String] indicates how the Shove should be implemented.
        -- "instant" immediately applies the Shove to the Board.
        -- "simple" adds the Shove to the SkillEffect specified by the ret config option.
    -- ret [SkillEffect] indicates the SkillEffect that the Shove should be added to. Unused in "instant" mode.
    -- standard_anim [String] indicates an animation from the base options in the Shove library that should be used for the shove.
        -- "air" is analagous to the vanilla airpush animation, and appears as a translucent gust. Recommended for nondamaging shoves.
        -- "explo" is analagous to the vanilla explopush animations, and appears as a bright explosion that fades into smoke. Recommended for damaging shoves. NOTICE exploshove animations are not made yet and will not function.
    -- delay [Float] indicates a delay in seconds that the instance of Shove should independently count down before it is applied.
        -- It is HIGHLY RECOMMENDED that you use this in lieu of or in conjunction with a SkillEffect's AddDelay, as each Shove is technically an independent effect and need a period where the board is not busy to jump in.
        -- If you do not make use of this, the effects of Shove will likely be very strangely timed unless the Shove is the very last thing your weapon does that occupies the board.
    -- bounce_data [Table] indicates a number of bounce profiles that will add bounce to the effects of your Shove.
        -- Bounce added to the board by some means after a Shove begins can interfere with the very precise timing of Shoves, so it's recommended to make use of this instead wherever possible.
        -- Even with this method, however, applying multiple shoves in a row with large delays can still cause issues with bounce timing.
        -- A bounce profile [Table] has the following fields.
            -- bounce [Integer] indicates the magnitude of the bounce that should be applied.
                -- Both negative and positive values are accepted, zero values will be discarded.
            -- bounce_type [String] indicates how the bounce should be applies.
                -- "simple" applies the bounce to the tile that is shoved and nothing else. This will apply even if the Shove does not hit a valid target.
                -- "trail_1" applies the bounce to every tile the shoved unit passes over, including the initial shoved tile. This will only apply if the Shove hits a valid target.
                -- "trail_2" is identical to "trail_1", except it does not shove the first tile. Largely this is meant to be combined with "simple"


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = GetParentPath(...)
local shovePath = path.."img/combat/shove/"
local shoveAnimPath = path.."img/effects/"

local function ffrg_Shove_Coordinates(i, dir, modifier)
    local coords = {0,0}
    if dir == "up" or dir == "right" then
        if modifier == "null" or modifier == "guard" then
            coords[1] = -31
        else
            coords[1] = -11
        end
    else
        coords[1] = -15 - (28*i)
    end
    if dir == "down" or dir == "right" then
        if modifier == "null" or modifier == "guard" then
            coords[2] = -1
        else
            coords[2] = 14
        end
    else
        coords[2] = 11 - (21*i)
    end
    return coords
end

local function ffrg_ShoveAnimGen(i, dir, modifier)
    local coords = ffrg_Shove_Coordinates(i, dir, modifier)
    local x = coords[1]
    local y = coords[2]
    local indicator = "shove_"..i.."_"..dir
    if modifier and modifier ~= "" then
        indicator = indicator.."_"..modifier
    end
    modApi:appendAsset("img/combat/shove/"..indicator..".png", shovePath..indicator..".png")
    ANIMS[indicator] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = true,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y
    }
    ANIMS[indicator.."_focused"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y
    }
    ANIMS[indicator.."_unfocused"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 1 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y
    }
    -- Ice Level
    ANIMS[indicator.."_x"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = true,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 4
    }
    ANIMS[indicator.."_x_focused"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 4
    }
    ANIMS[indicator.."_x_unfocused"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 1 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 4
    }
    -- Liquid / Chasm Level
    ANIMS[indicator.."_xx"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = true,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 7
    }
    ANIMS[indicator.."_xx_focused"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 7
    }
    ANIMS[indicator.."_xx_unfocused"] = Animation:new{
        Image = "combat/shove/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 1 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 7
    }
end

local function ttrg_CharToX(ch)
    if ch == "U" or ch == "R" then return -12
    else return -51 end
end
local function ttrg_CharToY(ch)
    if ch == "U" or ch == "L" then return -20
    else return 11 end
end

for i = 1, 8 do
    for _, dir in ipairs({"down","right","left","up"}) do
        if i == 8 then
            ffrg_ShoveAnimGen(i, dir, "miss")
        else
            if i == 1 then
                ffrg_ShoveAnimGen(i, dir, "null")
                ffrg_ShoveAnimGen(i, dir, "guard")
            end
            ffrg_ShoveAnimGen(i, dir, "")
            ffrg_ShoveAnimGen(i, dir, "impact_1")
            ffrg_ShoveAnimGen(i, dir, "impact_2")
            ffrg_ShoveAnimGen(i, dir, "impact_3")
            ffrg_ShoveAnimGen(i, dir, "impact_4")
            ffrg_ShoveAnimGen(i, dir, "kill")
            ffrg_ShoveAnimGen(i, dir, "miss")
        end
    end
end
for i, dir in ipairs({"U","R","D","L"}) do
    modApi:appendAsset("img/effects/ffrg_airshove_"..dir..".png", shoveAnimPath.."ffrg_airshove_"..dir..".png")
    for j = 2, 5 do
        ANIMS["ffrg_airshove"..j.."_"..(i-1)] = Animation:new{
            Image = "effects/ffrg_airshove_"..dir..".png",
            Layer = 0,
            NumFrames = 9,
            Time = 0.112/((j+8)/5),
            PosX = ttrg_CharToX(dir),
            PosY = ttrg_CharToY(dir)
        }
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local FORCE_DEATH = 20

local function DirString(dir)
    if dir == 0 then return "up" end
    if dir == 1 then return "right" end
    if dir == 2 then return "down" end
    if dir == 3 then return "left" end
    return ""
end

local ffrg_TipWeaponId = ""

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

local function ffrg_onTargetAreaBuild(mission, pawn, weaponId, point, pointList)
    if Board and Board:IsTipImage() then
        ffrg_TipWeaponId = weaponId
    end
end

local function ffrg_onSecondTargetAreaBuild(mission, pawn, weaponId, p1, p2, pointList)
    if Board and Board:IsTipImage() then
        ffrg_TipWeaponId = weaponId
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_ShoveBounce(p1, p2, speed, delay, bounce, bounce_type)
    local bouncer = SkillEffect()
    if delay and delay > 0 then
        bouncer:AddDelay(delay)
    end
    if bounce_type == "trail_1" or bounce_type == "trail_2" then
        if p2 then
            local dir = GetDirection(p2-p1)
            local distance = p1:Manhattan(p2)
            start = ( bounce_type == "trail_1" and 0 ) or ( bounce_type == "trail_2" and 1 )
            if distance > start then
                for i = start, distance-1 do
                    local curr = p1+DIR_VECTORS[dir]*i
                    bouncer:AddDelay(1.5/(speed+6))
                    bouncer:AddBounce(curr,bounce)
                end
            end
        end
    else
        bouncer:AddBounce(p1, bounce)
    end
    Board:AddEffect(bouncer)
end


local function ffrg_ShoveAnim(point, dir, speed, delay, anim_type)
    local anim = SkillEffect()
    local fx = SpaceDamage(point,0)
    if delay and delay > 0 then
        anim:AddDelay(delay)
    end
    fx.sAnimation = "ffrg_"..anim_type.."shove"..speed.."_"..dir
    anim:AddDamage(fx)
    Board:AddEffect(anim)
end


local function ffrg_ShoveCharge(p1, p2, speed, impact_damage, anim, delay, lethal_terrain)
    local charger = SkillEffect()
    local charge = PointList()
    local dir = GetDirection(p2-p1)
    local distance = p1:Manhattan(p2)
    local backspace = p2-DIR_VECTORS[dir]
    local id
    local queued
    if Board:IsPawnSpace(p1) then
        local pawn = Board:GetPawn(p1)
        id = pawn:GetId()
        queued = pawn:GetQueuedTarget()
    end
    charge:push_back(p1)
    for i = 1, distance do
        charge:push_back(p1+DIR_VECTORS[dir]*i)
    end
    if delay and delay > 0 then
        charger:AddDelay(delay)
    end
    local fx = SpaceDamage(p1,0)
    fx.sSound = "/enemy/shared/moved"
    if anim then
        fx.sAnimation = "ffrg_airshove"..speed.."_"..dir
    end
    charger:AddDamage(fx)
    ffrg_WorldConstants:setSpeed(charger,(speed+6)*0.04)
    charger:AddCharge(charge,NO_DELAY)
    ffrg_WorldConstants:resetSpeed(charger)
    if queued and queued ~= Point(-1,-1) and id then
        charger:AddScript("Board:GetPawn("..id.."):SetSpace("..p1:GetString()..")")
        charger:AddScript("Board:GetPawn("..id.."):SetQueuedTarget("..queued:GetString()..")")
    end
    -- FORCE 5: charger:AddDelay((1.36*(distance-1)+1.458)/(speed+6))
    -- FORCE 3: charger:AddDelay((1.532*(distance-1)+1.458)/(speed+6))
    -- ADAPTIVE? charger:AddDelay(((1.547-(speed*0.005))*(distance-1)+1.458)/(speed+6))
    if Board:IsTipImage() then
        charger:AddDelay(((1.547-(speed*0.005))*(distance-1)+1.438)/(speed+6))
    else
        charger:AddDelay(((1.547-(speed*0.005))*(distance-1)+1.458)/(speed+6))
    end
    if impact_damage > 0 then
        if id then
            charger:AddScript("Board:GetPawn("..id.."):SetSpace("..backspace:GetString()..")")
        end
        charger:AddScript("if Board and not Board:IsTipImage() then ffrg_Shove.events.onShoveBumpDamage:dispatch(GetCurrentMission(),"..p2:GetString()..","..impact_damage..") end")
        charger:AddScript("if Board and not Board:IsTipImage() then ffrg_Shove.events.onShoveBumpDamage:dispatch(GetCurrentMission(),"..backspace:GetString()..","..impact_damage..") end")
        charger:AddScript("ffrg_SeriousDamage.InflictSeriousDamage("..impact_damage..","..p2:GetString()..",{force = true, type = \"bump\"})")
        charger:AddScript("ffrg_SeriousDamage.InflictSeriousDamage("..impact_damage..","..backspace:GetString()..",{force = true, type = \"bump\"})")
    end
    if queued and queued ~= Point(-1,-1) and id then
        if impact_damage > 0 then
            charger:AddScript("Board:GetPawn("..id.."):SetQueuedTarget("..(queued+(DIR_VECTORS[dir]*(distance-1))):GetString()..")")
        else
            charger:AddScript("Board:GetPawn("..id.."):SetSpace("..p2:GetString()..")")
            charger:AddScript("Board:GetPawn("..id.."):SetQueuedTarget("..(queued+(DIR_VECTORS[dir]*distance)):GetString()..")")
        end
    end

    Board:AddEffect(charger)
end

local function ffrg_ApplyShove(point, dir, force, config)
    if Board then
        config = config or {}
        config.queued = config.queued or false
        config.delay = config.delay or 0
        config.mode = config.mode or "instant"
        config.bounce_data = config.bounce_data or {}
        if config.standard_anim == nil then
            config.standard_anim = ""
        end
        local type = ""
        local impact_damage = 0
        local travelled = 0
        local lethal_terrain = false
        if Board:IsPawnSpace(point) then
            local pawn = Board:GetPawn(point)
            if pawn:IsGuarding() then
                type = "guard"
            else
                local flying = pawn:IsFlying()
                local massive = pawn:IsMassive()
                for i = 1, force do
                    travelled = travelled + 1
                    local curr = point + DIR_VECTORS[dir]*i
                    if not Board:IsValid(curr) then
                        type = "miss"
                        travelled = travelled - 1
                        break
                    elseif Board:IsBlocked(curr,PATH_FLYER) then
                        if force == FORCE_DEATH then
                            type = "kill"
                            impact_damage = DAMAGE_DEATH
                            break
                        else
                            type = "impact"
                            impact_damage = force-i+1
                            break
                        end
                    elseif not flying then
                        local terrain = Board:GetTerrain(curr)
                        if terrain == TERRAIN_HOLE then lethal_terrain = true break
                        elseif ( terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA ) and not massive then lethal_terrain = true break end
                    end
                end
            end
        else
            type = "null"
        end
        local damage = SpaceDamage(point,0,5)
        local speed = math.min(force,5)
        if config.speed_override then
            speed = math.min(config.speed_override,5)
        end
        if type == "" or type == "kill" or type == "impact" or ( type == "miss" and travelled > 0 ) then
            local final = point + DIR_VECTORS[dir]*travelled
            if config.ret and config.mode ~= "instant" then
                config.ret:AddScript("ttrg_Shove.ShoveCharge("..point:GetString()..","..final:GetString()..","..speed..","..impact_damage..",\""..config.standard_anim.."\","..config.delay..","..tostring(lethal_terrain)..")")
                for _, bouncer in ipairs(config.bounce_data) do
                    if bouncer.bounce and bouncer.bounce_type and bouncer.bounce ~= 0 then
                        config.ret:AddScript("ttrg_Shove.ShoveBounce("..point:GetString()..","..final:GetString()..","..speed..","..config.delay..","..bouncer.bounce..",\""..bouncer.bounce_type.."\")")
                    end
                end
                if impact_damage > 0 then
                    if config.origin and Board:IsPawnSpace(config.origin) then
                        local pawn2 = Board:GetPawn(config.origin)
                        ffrg_SeriousDamage.AppendSeriousDamage(config.ret,impact_damage,final,{type = "bump", force = true, preview = true, uprootData = {pawn2:GetId(),pawn2:GetArmedWeapon(),pawn2:GetArmedWeaponId()}})
                        ffrg_SeriousDamage.AppendSeriousDamage(config.ret,impact_damage,point,{type = "bump", force = true, preview = true, uprootData = {pawn2:GetId(),pawn2:GetArmedWeapon(),pawn2:GetArmedWeaponId()}})
                    else
                        ffrg_SeriousDamage.AppendSeriousDamage(config.ret,impact_damage,final,{type = "bump", force = true, preview = true})
                        ffrg_SeriousDamage.AppendSeriousDamage(config.ret,impact_damage,point,{type = "bump", force = true, preview = true})
                    end
                end
            elseif config.mode == "instant" then
                ffrg_ShoveCharge(point, final, speed, impact_damage, config.standard_anim, config.delay)
                for _, bouncer in ipairs(config.bounce_data) do
                    if bouncer.bounce and bouncer.bounce_type and bouncer.bounce > 0 then
                        ffrg_ShoveBounce(point, final, speed, config.delay, bouncer.bounce, bouncer.bounce_type)
                    end
                end
            end
        else
            if config.ret and config.mode ~= "instant" then
                if config.standard_anim ~= "" then config.ret:AddScript("ttrg_Shove.ShoveAnim("..point:GetString()..","..dir..","..speed..","..config.delay..","..config.standard_anim..")") end
                for _, bouncer in ipairs(config.bounce_data) do
                    if bouncer.bounce and bouncer.bounce_type and bouncer.bounce_type == "single" and bouncer.bounce ~= 0 then
                        config.ret:AddScript("ttrg_Shove.ShoveBounce("..point:GetString()..",nil,"..speed..","..config.delay..","..bouncer.bounce..",\""..bouncer.bounce_type.."\")")
                    end
                end
            elseif config.mode == "instant" then
                if config.standard_anim ~= "" then ffrg_ShoveAnim(point, dir, speed, config.delay, config.standard_anim) end
                for _, bouncer in ipairs(config.bounce_data) do
                    if bouncer.bounce and bouncer.bounce_type and bouncer.bounce_type == "single" and bouncer.bounce ~= 0 then
                        ffrg_ShoveBounce(point, nil, speed, config.delay, bouncer.bounce, bouncer.bounce_type)
                    end
                end
            end
        end
        if config.ret and config.mode ~= "instant" then
            local indicator = "shove_"
            if type == "guard" or type == "null" or type == "miss" then
                travelled = travelled + 1
            end
            indicator = indicator..travelled.."_"
            indicator = indicator..DirString(dir)
            if type ~= "" then
                indicator = indicator.."_"..type
                if type == "impact" then
                    indicator = indicator.."_"..(math.min(impact_damage,4))
                end
            end

            local append = 2
            for i = 0, travelled - 1 do
                local curr = point + DIR_VECTORS[dir]*i
                local terrain = Board:GetTerrain(curr)
                if terrain ~= TERRAIN_HOLE and terrain ~= TERRAIN_WATER and terrain ~= TERRAIN_ACID and terrain ~= TERRAIN_LAVA then
                    if terrain == TERRAIN_ICE then
                        append = 1
                    else
                        append = 0
                        break
                    end
                end
            end
            if append == 1 then indicator = indicator.."_x"
            elseif append == 2 then indicator = indicator.."_xx" end

            if not Board:IsTipImage() then
                if config.queued then
                    if ANIMS[indicator.."_focused"] then
                        table.insert( queued_anims, { focused = true, type = "animation", data = indicator.."_focused", loc = point } )
                    end
                    if ANIMS[indicator.."_unfocused"] then
                        table.insert( queued_anims, { focused = false, type = "animation", data = indicator.."_unfocused", loc = point } )
                    end
                elseif ANIMS[indicator] then
                    WeaponPreview:AddAnimation(point, indicator, 0)
                end
            elseif ANIMS[indicator] then
                if not config.queued or (config.origin and Board:IsPawnSpace(config.origin) and (Board:GetPawn(config.origin):GetUndoLoc() == nil or Board:GetPawn(config.origin):GetUndoLoc() ~= Point(6,9))) then
                    local tipDuration = 3
                    if _G[ffrg_TipWeaponId] and _G[ffrg_TipWeaponId].TipImage then
                        tipDuration = _G[ffrg_TipWeaponId].TipImage.Length or 3
                    end
                    if config.queued then
                        ANIMS["ffrg_TemporaryTipShoveAnim_"..ffrg_TipWeaponId.."_"..point:GetString()] = ANIMS[indicator]:new{
                            Frames = {1, 0},
                            Lengths = {tipDuration*0.2, tipDuration*0.3},
                            Loop = false
                        }
                    else
                        ANIMS["ffrg_TemporaryTipShoveAnim_"..ffrg_TipWeaponId.."_"..point:GetString()] = ANIMS[indicator]:new{
                            Frames = {2, 0},
                            Lengths = {tipDuration*0.2, tipDuration*0.3},
                            Loop = false
                        }
                    end
                    Board:AddAnimation(point, "ffrg_TemporaryTipShoveAnim_"..ffrg_TipWeaponId.."_"..point:GetString(), 1)
                end
            end
            config.ret:AddDamage(damage)
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_Shove or ( modApi:isVersion(ffrg_Shove.Version, VERSION) and ffrg_Shove.version ~= VERSION ) then

 --[[     Library    ]] ffrg_Shove = ffrg_Shove or {}
 --[[     Version    ]] ffrg_Shove.version = VERSION
 --[[ Initialization ]] ffrg_Shove.initialized = false

 --[[    Overseer    ]] ffrg_Shove.events = {}
 --[[      Event     ]] ffrg_Shove.events.onShoveBumpDamage = Event()

end
local function ffrg_onModsInitialized()
if ffrg_Shove.version == VERSION and not ffrg_Shove.initialized then

 --[[     Library    ]] ttrg_Shove = ttrg_Shove or {}
 --[[ Initialization ]] ffrg_Shove.initialized = true

 --[[     Global     ]] ffrg_Shove.Shove = ffrg_ApplyShove
 --[[     Global     ]] ffrg_Shove.FORCE_DEATH = FORCE_DEATH
 --[[    Technical   ]] ttrg_Shove.ShoveCharge = ffrg_ShoveCharge
 --[[    Technical   ]] ttrg_Shove.ShoveAnim = ffrg_ShoveAnim
 --[[    Technical   ]] ttrg_Shove.ShoveBounce = ffrg_ShoveBounce

 --[[  Subscription  ]] modapiext.events.onTargetAreaBuild:subscribe(ffrg_onTargetAreaBuild)
 --[[  Subscription  ]] modapiext.events.onSecondTargetAreaBuild:subscribe(ffrg_onSecondTargetAreaBuild)

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_Shove


--////////////////////////////////--
