--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--        Template Library        --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## A library of functions for applying a modded weapon effect, Rotate. ##--


------------------
-- Dependencies --
------------------

--## weaponPreview.lua 3.1.3


------------
-- Rotate --
------------

--## Rotate functions similarly to flip, but instead of displacing an enemy's target by 180 degrees, it does so by 90 degrees.
--## Rotate can be clockwise or counterclockwise. Most weapons that use it allow the user to choose which direction.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_Rotate.Rotate
-- ( point [Point],  rot [Integer] )
-- Rotates the specified point by the specified orientation.
-- A rot of 0 indicates clockwise Rotation, a rot of 1 indicates counterclockwise Rotation.

--## ffrg_Rotate.RotateDamage
-- ( point [Point],  rot [Integer],  config [Table] ) -> SpaceDamage
-- Returns a SpaceDamage instance than will apply Rotation and has all the associated visuals.
-- Additionally has config options, listed below.
    -- icon [Boolean] indicates whether or not the SpaceDamage should have the rotation icon. Defaults to true.
    -- base [Boolean] indicates whether or not the SpaceDamage should have the rotation base outline. Defaults to true.
    -- damage [Integer] indicates an amount of damage that the SpaceDamage should deal. Using this option instead of setting iDamage is important, as using this option will visually offset the rotation icons from the damage icon.


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = GetParentPath(...)
local iconPath = "img/combat/"
local files = {
    "icons/ffrg_rotate_clockwise",
    "icons/ffrg_rotate_clockwise_glow",
    "icons/ffrg_rotate_clockwise_off_glow",
    "icons/ffrg_rotate_clockwise_outer_glow",
    "icons/ffrg_rotate_clockwise_outer_off_glow",
    "icons/ffrg_rotate_counterclockwise",
    "icons/ffrg_rotate_counterclockwise_glow",
    "icons/ffrg_rotate_counterclockwise_off_glow",
    "icons/ffrg_rotate_counterclockwise_outer_glow",
    "icons/ffrg_rotate_counterclockwise_outer_off_glow",
    "ffrg_rotate_cancel_alert",
    "ffrg_rotate_base",
    "ffrg_rotate_base_off"
}

for i, file in ipairs(files) do
    modApi:appendAsset(iconPath..file..".png", path..iconPath..file..".png")
end

Location["combat/icons/ffrg_rotate_clockwise_glow.png"] = Point(-6,9)
Location["combat/icons/ffrg_rotate_clockwise_off_glow.png"] = Point(-6,9)
Location["combat/icons/ffrg_rotate_counterclockwise_glow.png"] = Point(-6,9)
Location["combat/icons/ffrg_rotate_counterclockwise_off_glow.png"] = Point(-6,9)
Location["combat/icons/ffrg_rotate_clockwise_outer_glow.png"] = Point(-21,7)
Location["combat/icons/ffrg_rotate_clockwise_outer_off_glow.png"] = Point(-21,7)
Location["combat/icons/ffrg_rotate_counterclockwise_outer_glow.png"] = Point(-21,7)
Location["combat/icons/ffrg_rotate_counterclockwise_outer_off_glow.png"] = Point(-21,7)

ANIMS.ffrg_Rotate_cancel_alert = Animation:new{
    Image = "combat/ffrg_rotate_cancel_alert.png",
    NumFrames = 5,
    Frames = {4,3,2,1,0,1,2,3,4},
    Lengths = {0.01,0.01,0.01,0.01,0.86,0.025,0.025,0.025,0.025},
    Loop = false,
    PosX = 3,
    PosY = -39
}
ANIMS.ffrg_Rotate_base = Animation:new{
    Image = "combat/ffrg_rotate_base.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Time = 0,
    Loop = true,
    PosX = -28,
    PosY = 1
}
ANIMS.ffrg_Rotate_base_x = ANIMS.ffrg_Rotate_base:new{
    PosY = 5
}
ANIMS.ffrg_Rotate_base_xx = ANIMS.ffrg_Rotate_base:new{
    PosY = 8
}
ANIMS.ffrg_Rotate_base_off = ANIMS.ffrg_Rotate_base:new{
    Image = "combat/ffrg_rotate_base_off.png"
}
ANIMS.ffrg_Rotate_base_off_x = ANIMS.ffrg_Rotate_base_off:new{
    PosY = 5
}
ANIMS.ffrg_Rotate_base_off_xx = ANIMS.ffrg_Rotate_base_off:new{
    PosY = 8
}


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function ttrg_DirRotate(dir, rot)
    if rot == 0 then
        return (dir + 1)%4
    elseif dir == 0 then
        return 3
    else
        return dir - 1
    end
end

local function ttrg_PointRotate(subject, origin, rot)
    local distance = origin:Manhattan(subject)
    local direction = GetDirection(subject-origin)
    local rotated = ttrg_DirRotate(direction, rot)
    return origin+(DIR_VECTORS[rotated]*distance)
end

local function ffrg_GetXs(point)
    if Board then
        local terrain = Board:GetTerrain(point)
        if terrain == TERRAIN_ICE then return "_x" end
        if terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA or terrain == TERRAIN_HOLE then return "_xx" end
        return ""
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_RotateDamage(point, rot, config)
    config = config or {}
    if config.icon == nil then config.icon = true end
    if config.base == nil then config.base = true end
    config.damage = config.damage or 0
    local damage = SpaceDamage(point, config.damage)
    local off = true
    local rotString = rot == 1 and "counterclockwise" or "clockwise"
    if config.damage > 0 then rotString = rotString.."_outer" end
    if Board and Board:IsPawnTeam(point, TEAM_ENEMY) then off = false end
    if config.base then
        if off then
            if not Board:IsPawnSpace(point) then
                damage.iPush = 5
            else
                WeaponPreview:AddAnimation(point, "ffrg_Rotate_base_off"..ffrg_GetXs(point), 0)
            end
        else
            if Board:GetPawn(point):IsPushable() then
                damage.iPush = 5
            else
                WeaponPreview:AddAnimation(point, "ffrg_Rotate_base"..ffrg_GetXs(point), 0)
            end
        end
    end
    if config.icon then
        if off then
            damage.sImageMark = "combat/icons/ffrg_rotate_"..rotString.."_off_glow.png"
        else
            damage.sImageMark = "combat/icons/ffrg_rotate_"..rotString.."_glow.png"
        end
    end
    if Board:IsPawnSpace(point) then
        damage.sScript = "ffrg_Rotate.Rotate("..point:GetString()..","..rot..")"
    end
    return damage
end

local function ffrg_RotateI(point, rot)
    if Board and Board:IsPawnSpace(point) then
        local pawn = Board:GetPawn(point)
        local webFlip = false
        for i = DIR_START, DIR_END do
            local curr = point+DIR_VECTORS[i]
            if Board:IsValid(curr) and Board:IsPawnSpace(curr) and Board:GetPawn(curr):IsGrappled() then webFlip = true end
        end
        if webFlip then
            Board:DamageSpace(SpaceDamage(point,0,DIR_FLIP))
            Board:DamageSpace(SpaceDamage(point,0,DIR_FLIP))
        end
        if pawn:IsQueued() then
            local space = pawn:GetSpace()
            local target = pawn:GetQueuedTarget()
            local new = ttrg_PointRotate(target, space, rot)
            pawn:SetQueuedTarget(new)
            if not Board:IsValid(new) then
                local ret = SkillEffect()
                local anim1 = SpaceDamage(point,0)
                anim1.sAnimation = "ffrg_Rotate_cancel_alert"
                ret:AddDamage(anim1)
                local anim2 = SpaceDamage(point,0)
                anim2.sAnimation = "ffrg_Rotate_cancel_outline"
                ret:AddDamage(anim2)
                Board:AddEffect(ret)
            end
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_Rotate or ( modApi:isVersion(ffrg_Rotate.Version, VERSION) and ffrg_Rotate.version ~= VERSION ) then

 --[[     Library    ]] ffrg_Rotate = ffrg_Rotate or {}
 --[[     Version    ]] ffrg_Rotate.version = VERSION
 --[[ Initialization ]] ffrg_Rotate.initialized = false

 --[[    Overseer    ]] ffrg_Rotate.events = {}
 --[[      Event     ]] ffrg_Rotate.events.onTemplateEvent = Event()

end
local function ffrg_onModsInitialized()
if ffrg_Rotate.version == VERSION and not ffrg_Rotate.initialized then

 --[[     Library    ]] ttrg_Rotate = ttrg_Rotate or {}
 --[[ Initialization ]] ffrg_Rotate.initialized = true

 --[[     Global     ]] ffrg_Rotate.RotateDamage = ffrg_RotateDamage
 --[[     Global     ]] ffrg_Rotate.Rotate = ffrg_RotateI

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_Rotate


--////////////////////////////////--
