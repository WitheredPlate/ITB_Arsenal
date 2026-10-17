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

ANIMS.ffrg_Rotate_base = Animation:new{
    Image = "combat/ffrg_rotate_base.png",
    Layer = ANIMS.LAYER_FLOOR,
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
    if rot == 1 then
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
        if pawn:IsQueued() then
            Board:DamageSpace(SpaceDamage(point,0,DIR_FLIP))
            local space = pawn:GetSpace()
            local target = pawn:GetQueuedTarget()
            pawn:SetQueuedTarget(ttrg_PointRotate(target, space, rot))
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function initialize()
    ffrg_Rotate.RotateDamage = ffrg_RotateDamage
    ffrg_Rotate.Rotate = ffrg_RotateI
    ffrg_Rotate.Version = VERSION
end

if ffrg_Rotate then
    if modApi:isVersion(ffrg_Rotate.Version, VERSION) and ffrg_Rotate.Version ~= VERSION then
        initialize()
    end
else
    ffrg_Rotate = ffrg_Rotate or {}
    initialize()
end

return ffrg_Rotate


--////////////////////////////////--
