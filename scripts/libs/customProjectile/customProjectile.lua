--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--    Custom Projectile Library   --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.2.1"

--## Template


------------------
-- Dependencies --
------------------

--## tipTracker.lua 1.0.2
--## worldConstants.lua


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_CustomProjectile.AddCustomProjectile
-- ( p1 [Point],  p2 [Point],  animation [String],  config [Table] )
-- Adds a custom projectile to the board going from the specified point to the specified point with the specified animation and the specified config options, explained below.
-- ret [SkillEffect] indicates the SkillEffect to add the projectile to. If not specified, the projectile is instead instantly added to the Board.
-- damage [SpaceDamage] indicates the SpaceDamage the custom projectile should deal on impact.
-- path [Boolean] indicates whether or not a path should be previewed on the board for the projectile. The default value is false if damage is not specified and true otherwise.
-- speed [Float] indicates how fast the projectile should move across the board, in tiles per second. The default value is 12.
-- directional [Boolean] indicates whether the animation should be considered as directional and have a "_#" appended that indicates the direction. The default value is true.

--## ffrg_CustomProjectile.AddCustomArtillery
-- ( p1 [Point],  p2 [Point],  animation [String],  config [Table] )
-- Adds a custom artillery to the board going from the specified point to the specified point with the specified animation and the specified config options, explained below.
-- ret [SkillEffect] indicates the SkillEffect to add the projectile to. If not specified, the projectile is instead instantly added to the Board.
-- damage [SpaceDamage] indicates the SpaceDamage the custom projectile should deal on impact.
-- path [Boolean] indicates whether or not a path should be previewed on the board for the projectile. The default value is false if damage is not specified and true otherwise.
-- duration [float] indicates how long the artillery should take to reach the target. Longer durations mean that with the same path, the artillery will move slower.
-- height_map [Function] indicates the function that should be used to add height above 0 to the artillery based on its progress to the target. When not specified, defaults to the standard artillery arc.
-- trail [String] indicates what emitter trail, of the hardcoded vanilla options, should be used for the artillery. Will not function if the height map is specified as anything other than the default.
    -- "missile" creates a trail of white smoke particles that fade mid-air
    -- "fireball" creates a trail of black smoke particles that fade mid-air. A vanilla bug causes the ground shadow of artilleries with this trail to be slightly misaligned.
    -- "shotup_acid" creates a trail of green cloud particles that fall towards the ground
-- directional [Boolean] indicates whether the animation should be considered as directional and have a "_#" appended that indicates the direction. The default value is true.
-- shadow [Boolean] indicates whether the artillery should have a standard shadow.
-- custom_shadow [String] indicates an animation for a custom shadow that should be displayed below the artillery.


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = GetParentPath(...)

modApi:appendAsset("img/effects/ffrg_nil.png", path.."img/effects/ffrg_nil.png")
modApi:appendAsset("img/effects/ffrg_nil_shotup_acid.png", path.."img/effects/ffrg_nil_shotup_acid.png")
modApi:appendAsset("img/effects/ffrg_nil_missile.png", path.."img/effects/ffrg_nil_missile.png")
modApi:appendAsset("img/effects/ffrg_nil_fireball.png", path.."img/effects/ffrg_nil_fireball.png")


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function ffrg_GetFrame(anim, timer)
    if not anim.Lengths then
        local anim_duration
        if anim.Frames then
            anim_duration = anim.Time * #anim.Frames
        else
            anim_duration = anim.Time * anim.NumFrames
        end
        local time_mod = timer % anim_duration
        return math.ceil(time_mod / anim.Time)
    else
        local anim_duration = 0
        for _, length in ipairs(anim.Lengths) do
            anim_duration = anim_duration + length
        end
        local time_mod = timer % anim_duration
        if anim.Frames then
            for i, length in ipairs(anim.Lengths) do
                local frame = anim.Frames[i]
                time_mod = time_mod - length
                if time_mod <= 0 then return frame end
            end
        else
            for frame, length in ipairs(anim.Lengths) do
                time_mod = time_mod - length
                if time_mod <= 0 then return frame end
            end
        end
        return 0 -- should never trigger
    end
end

local function ffrg_GetXDirection(dir)
    if dir == 1 then return 1
    elseif dir == 2 then return -1
    elseif dir == 3 then return -1
    else return 1 end
end

local function ffrg_GetYDirection(dir)
    if dir == 1 then return 1
    elseif dir == 2 then return 1
    elseif dir == 3 then return -1
    else return -1 end
end

--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--

local function ffrg_AddCustomProjectile(p1, p2, animation, config)
    config = config or {}
    config.speed = config.speed or 12
    if config.directional == nil then
        config.directional = true
    end
    if config.damage then
        if config.path == nil then
            config.path = true
        end
    else
        if config.path == nil then
            config.path = false
        end
    end
    local dir = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local tip = false
    if Board and Board:IsTipImage() then tip = true end
    if config.directional then
        animation = animation..dir
    end
    if ANIMS[animation] then
        anim = ANIMS[animation]
        if config.ret then
            if config.damage then
                if config.path then
                    config.damage.bHidePath = false
                else
                    config.damage.bHidePath = true
                end
                ffrg_WorldConstants:setSpeed(config.ret, (config.speed/15))
                config.ret:AddProjectile(p1, config.damage, "", NO_DELAY)
                ffrg_WorldConstants:resetSpeed(config.ret)
            elseif config.path then
                local path = SpaceDamage(p2, 0)
                path.sAnimation = "nil"
                config.ret:AddProjectile(p1, path, "", NO_DELAY)
            end
            config.ret:AddScript("ttrg_CustomProjectile.InsertCustomProjectile({duration = ("..distance.."*(1 / "..config.speed..")), distance = "..config.speed..", point = "..p1:GetString()..", x = "..anim.PosX..", y = "..anim.PosY..", dir = "..dir..", animation = \""..animation.."\", speed = "..config.speed..", finished = false, instance = 0},"..tostring(tip)..")")
        else
            ffrg_InsertCustomProjectile({duration = (distance*(1 / config.speed)), distance = config.speed, point = p1, x = anim.PosX, y = anim.PosY, dir = dir, animation = animation, speed = config.speed, finished = false, instance = 0},tip)
            if config.damage then
                local ret = SkillEffect()
                ffrg_WorldConstants:setSpeed(ret, (config.speed/15))
                ret:AddProjectile(p1, config.damage,"",NO_DELAY)
                ffrg_WorldConstants:resetSpeed(ret)
                Board:AddEffect(ret)
            end
        end
    end
end

local function StandardHeightMap(portion)
    return (1-(((2*portion)-1)^2))*54
end

local function ffrg_AddCustomArtillery(p1, p2, animation, config)
    config = config or {}
    config.duration = config.duration or 0.75
    config.height_map = config.height_map or "ffrg_CustomProjectile_StandardHeightMap"
    config.custom_shadow = config.custom_shadow or ""
    if config.directional == nil then
        config.directional = true
    end
    if config.shadow == nil then
        config.shadow = true
    end
    if config.damage then
        if config.path == nil then
            config.path = true
        end
    else
        if config.path == nil then
            config.path = false
        end
    end
    local dir = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local tip = false
    if Board and Board:IsTipImage() then tip = true end
    if config.directional then
        animation = animation..dir
    end
    if ANIMS[animation] then
        anim = ANIMS[animation]
        local s_x = ANIMS[config.custom_shadow] and ANIMS[config.custom_shadow].PosX or 0
        local s_y = ANIMS[config.custom_shadow] and ANIMS[config.custom_shadow].PosY or 0
        if config.ret then
            if config.damage then
                if config.path then
                    config.damage.bHidePath = false
                else
                    config.damage.bHidePath = true
                end
                if config.trail and config.height_map == "ffrg_CustomProjectile_StandardHeightMap" and config.duration == 0.75 then
                    config.ret:AddArtillery(p1, config.damage, "effects/ffrg_nil_"..config.trail..".png", NO_DELAY)
                else
                    if config.shadow then
                        config.ret:AddArtillery(p1, config.damage, "effects/ffrg_nil.png", NO_DELAY)
                    else
                        config.ret:AddArtillery(p1, config.damage, "", NO_DELAY)
                    end
                end
            elseif config.path then
                local path = SpaceDamage(p2, 0)
                path.sAnimation = "nil"
                if config.trail and config.height_map == "ffrg_CustomProjectile_StandardHeightMap" and config.duration == 0.75 then
                    config.ret:AddArtillery(p1, path, "effects/ffrg_nil_"..config.trail..".png", NO_DELAY)
                else
                    if config.shadow then
                        config.ret:AddArtillery(p1, path, "effects/ffrg_nil.png", NO_DELAY)
                    else
                        config.ret:AddArtillery(p1, path, "", NO_DELAY)
                    end
                end
            elseif config.trail and config.height_map == "ffrg_CustomProjectile_StandardHeightMap" and config.duration == 0.75 then
                local trail = SpaceDamage(p2, 0)
                trail.sAnimation = "nil"
                trail.bHidePath = true
                config.ret:AddArtillery(p1, trail, "effects/ffrg_nil_"..config.trail..".png", NO_DELAY)
            end
            config.ret:AddScript("ttrg_CustomProjectile.InsertCustomArtillery({duration = "..config.duration..", point = "..p1:GetString()..", target = "..p2:GetString()..", x = "..anim.PosX..", o_x = "..anim.PosX..", s_x = "..s_x..", so_x = "..s_x..", y = "..anim.PosY..", o_y = "..anim.PosY..", s_y = "..s_y..", so_y = "..s_y..", dir = "..dir..", animation = \""..animation.."\", shadow = \""..config.custom_shadow.."\", distance = "..distance..", finished = false, instance = 0, height_map = \""..config.height_map.."\"},"..tostring(tip)..")")
        else
            ffrg_InsertCustomArtillery({duration = config.duration, point = p1, target = p2, x = anim.PosX, o_x = anim.PosX, s_x = s_x, so_x = s_x, y = anim.PosY, o_y = anim.PosY, s_y = s_y, so_y = s_y, dir = dir, animation = animation, shadow = config.custom_shadow, distance = distance, finished = false, instance = 0, height_map = config.height_map},tip)
            if config.damage then
                local ret = SkillEffect()
                if config.trail and config.height_map == "ffrg_CustomProjectile_StandardHeightMap" and config.duration == 0.75 then
                    ret:AddArtillery(p1, config.damage, "effects/ffrg_nil_"..config.trail..".png", NO_DELAY)
                else
                    if config.shadow then
                        config.ret:AddArtillery(p1, config.damage, "effects/ffrg_nil.png", NO_DELAY)
                    else
                        config.ret:AddArtillery(p1, config.damage, "", NO_DELAY)
                    end
                end
                Board:AddEffect(ret)
            elseif config.trail then
                local ret = SkillEffect()
                local trail = SpaceDamage(p2, 0)
                trail.sAnimation = "nil"
                ret:AddArtillery(p1, trail, "effects/ffrg_nil_"..config.trail..".png", NO_DELAY)
                Board:AddEffect(ret)
            end
        end
    end
end

local function ffrg_InsertCustomProjectile(projectile,tip)
    projectile.type = "projectile"
    if Board and not tip then
        if not Board.ffrg_CustomProjectiles then
            Board.ffrg_CustomProjectiles = {}
        end
        table.insert(Board.ffrg_CustomProjectiles, projectile)
    elseif tip then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard then
            if not TipImageBoard.ffrg_CustomProjectiles then
                TipImageBoard.ffrg_CustomProjectiles = {}
            end
            table.insert(TipImageBoard.ffrg_CustomProjectiles, projectile)
        end
    end
end

local function ffrg_InsertCustomArtillery(artillery,tip)
    artillery.type = "artillery"
    if Board and not tip then
        if not Board.ffrg_CustomProjectiles then
            Board.ffrg_CustomProjectiles = {}
        end
        table.insert(Board.ffrg_CustomProjectiles, artillery)
    elseif tip then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard then
            if not TipImageBoard.ffrg_CustomProjectiles then
                TipImageBoard.ffrg_CustomProjectiles = {}
            end
            table.insert(TipImageBoard.ffrg_CustomProjectiles, artillery)
        end
    end
end

local time_past = 0
local time_delta = 0

local function ProjectileProgress(boardTemp, animString)
    for _, projectile in ipairs(boardTemp.ffrg_CustomProjectiles) do
        if projectile.timer and projectile.timer >= projectile.duration then
            projectile.finished = true
        else
            projectile.instance = projectile.instance + 1
            projectile.timer = ( projectile.timer or 0 ) + time_delta
            local anim_old = ANIMS[projectile.animation]
            if anim_old then
                local anim_new_id = animString..projectile.animation.."_"..projectile.instance.."_"..projectile.point:GetString().."_"..projectile.dir.."_"..projectile.distance
                ANIMS[anim_new_id] = {}
                ANIMS[anim_new_id].Layer = 0
                ANIMS[anim_new_id].Image = anim_old.Image
                ANIMS[anim_new_id].NumFrames = anim_old.NumFrames
                ANIMS[anim_new_id].Frames = { ffrg_GetFrame(anim_old, projectile.timer) }
                ANIMS[anim_new_id].Lengths = nil
                ANIMS[anim_new_id].Loop = false
                ANIMS[anim_new_id].Time = 0
                ANIMS[anim_new_id].PosX = math.ceil(projectile.x)
                ANIMS[anim_new_id].PosY = math.ceil(projectile.y)
                boardTemp:AddAnimation(projectile.point, anim_new_id, 1)
                if projectile.shadow and projectile.shadow ~= "" then
                    local anim_sold = ANIMS[projectile.shadow]
                    local anim_snew_id = animString..projectile.shadow.."_"..projectile.instance.."_"..projectile.point:GetString().."_"..projectile.dir.."_"..projectile.distance
                    ANIMS[anim_snew_id] = {}
                    ANIMS[anim_snew_id].Layer = 0
                    ANIMS[anim_snew_id].Image = anim_sold.Image
                    ANIMS[anim_snew_id].NumFrames = anim_sold.NumFrames
                    ANIMS[anim_snew_id].Frames = { ffrg_GetFrame(anim_sold, projectile.timer) }
                    ANIMS[anim_snew_id].Lengths = nil
                    ANIMS[anim_snew_id].Loop = false
                    ANIMS[anim_snew_id].Time = 0
                    ANIMS[anim_snew_id].PosX = math.ceil(projectile.s_x)
                    ANIMS[anim_snew_id].PosY = math.ceil(projectile.s_y)
                    boardTemp:AddAnimation(projectile.point, anim_snew_id, 1)
                end
            end
            if projectile.type == "artillery" then
                local portion = projectile.timer/projectile.duration
                projectile.x = projectile.o_x + (28*portion*projectile.distance*ffrg_GetXDirection(projectile.dir))
                projectile.y = ( projectile.o_y + (21*portion*projectile.distance*ffrg_GetYDirection(projectile.dir)) ) - _G[projectile.height_map](portion)
                if projectile.shadow ~= "" then
                    projectile.s_x = projectile.so_x + (28*portion*projectile.distance*ffrg_GetXDirection(projectile.dir))
                    projectile.s_y = projectile.so_y + (21*portion*projectile.distance*ffrg_GetYDirection(projectile.dir))
                end
            else
                projectile.x = projectile.x + ((projectile.speed*28)*time_delta*ffrg_GetXDirection(projectile.dir))
                projectile.y = projectile.y + ((projectile.speed*28)*time_delta*0.75*ffrg_GetYDirection(projectile.dir))
            end
        end
    end
    if #boardTemp.ffrg_CustomProjectiles > 0 then
        for i = 1, #boardTemp.ffrg_CustomProjectiles do
            local j = #boardTemp.ffrg_CustomProjectiles + 1 - i
            local projectile = boardTemp.ffrg_CustomProjectiles[j]
            if projectile and projectile.finished then
                for i = 1, projectile.instance do
                    local anim_new_id = animString..projectile.animation.."_"..projectile.instance.."_"..projectile.point:GetString().."_"..projectile.dir.."_"..projectile.distance
                    if ANIMS[anim_new_id] then
                        --ANIMS[anim_new_id] = nil -- Clearing finished ANIMS to reduce memory usage
                    end
                end
                table.remove(boardTemp.ffrg_CustomProjectiles, j)
            end
        end
    end
end

local function ffrg_onMissionUpdate(mission)
    if Board.ffrg_CustomProjectiles then
        ProjectileProgress(Board,"ffrg_CustomProjectile_")
    else
        Board.ffrg_CustomProjectiles = {}
    end
end

local function ffrg_onFrameDrawStart()
    local time_now = os.clock()
    time_delta = time_now - time_past
    time_past = time_now
    if ffrg_TipTracker.GetTipBoard() then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard.ffrg_CustomProjectiles then
            ProjectileProgress(TipImageBoard,"ffrg_CustomProjectileTip_")
        else
            TipImageBoard.ffrg_CustomProjectiles = {}
        end
    end
end

--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_CustomProjectile or ( modApi:isVersion(ffrg_CustomProjectile.version, VERSION) and ffrg_CustomProjectile.version ~= VERSION ) then

 --[[     Library    ]] ffrg_CustomProjectile = ffrg_CustomProjectile or {}
 --[[     Version    ]] ffrg_CustomProjectile.version = VERSION
 --[[ Initialization ]] ffrg_CustomProjectile.initialized = false

end
local function ffrg_onModsInitialized()
if ffrg_CustomProjectile.version == VERSION and not ffrg_CustomProjectile.initialized then

 --[[     Library    ]] ttrg_CustomProjectile = ttrg_CustomProjectile or {}
 --[[ Initialization ]] ffrg_CustomProjectile.initialized = true

 --[[     Global     ]] ffrg_CustomProjectile.AddCustomProjectile = ffrg_AddCustomProjectile
 --[[     Global     ]] ffrg_CustomProjectile.AddCustomArtillery = ffrg_AddCustomArtillery
 --[[     Global     ]] ttrg_CustomProjectile_StandardHeightMap = StandardHeightMap
 --[[    Technical   ]] ttrg_CustomProjectile.InsertCustomProjectile = ffrg_InsertCustomProjectile
 --[[    Technical   ]] ttrg_CustomProjectile.InsertCustomArtillery = ffrg_InsertCustomArtillery

 --[[  Subscription  ]] modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
 --[[  Subscription  ]] modApi.events.onFrameDrawStart:subscribe(ffrg_onFrameDrawStart)

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_CustomProjectile


--////////////////////////////////--
