--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--     Constant Damage Library    --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.1.5"

--## A library for applying damage and healing that ignores all damage modifiers and does not trigger damage-reliant effects


------------------
-- Dependencies --
------------------

--## weaponPreview.lua 3.1.3


--------------------
-- Serious Damage --
--------------------

--## Serious damage deals damage that ignores Armor, A.C.I.D, and Boost, in addition to not igniting Forests, scattering Deserts, or collapsing Cracked Tiles.
--## Serious damage largely mimics the damage from push impacts exactly. However, by default Serious Damage is not altered by Force Amp.
--## Serious damage can be instantly applied through ffrg_SeriousDamage.InflictSeriousDamage() or added to a SkillEffect with a preview with ffrg_SeriousDamage.AppendSeriousDamage().


---------------------
-- Serious Healing --
---------------------

--## Serious healing Restores health but does not remove status effects or create a Board alert message.
--## Serious healing largely mimics the healing from passives like Viscera Nanobots.
--## Serious healing can be instantly applied through ffrg_SeriousDamage.InflictSeriousHealing(). Serious healing, like normal healing, cannot be properly added to a SkillEffect preview.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_SeriousDamage.InflictSeriousDamage
-- ( damage [Integer],  point [Point],  config [Table] )
-- Instantly deals the specified amount of Serious Damage to the specified point with the specified config options, explained below.
-- sfx [String] adds the specified sound effect to the instance of Serious Damage.
-- anim [String] adds the specified animation to the instance of Serious Damage.
-- shake [Integer] adds the specified duration of board shake to the instance of Serious Damage.
-- force [Boolean], when true, increases the amount of Serious Damage dealt by 1 when the Force Amp passive is powered and the damage is being dealt to enemies.
-- type [String] indicates what type of vanilla damage the Serious Damage should mimic.
    -- "simple" deals damage to pawns only, and can be blocked by shields and ice. This mimics the behavior of Electric Smoke damage.
    -- "bump" also damages buildings and mountains. This mimics the behavior of damage from pushed entities colliding.
    -- "blast" also damages buildings, mountains, and all terrain. This mimics the behavior of the explosion damage from Volatile Decay.
    -- "true" completely ignores shields and ice. This mimics the behavior of Fire damage.
    -- "stupid" does not account for shields and ice in any way in previews. This is useful for effects that will break the blocking status of the target before they get hit with Serious Damage.

--## ffrg_SeriousDamage.AppendSeriousDamage
-- ( ret [SkillEffect], damage [Integer],  point [Point],  config [Table] )
-- Adds the specified amount of Serious Damage to the specified SkillEffect at the specified point with the specified config options.
-- The config options are the same as ffrg_InflictSeriousDamage, in addition to one explained below.
-- preview [Boolean], when true, only adds the Serious Damage to the weapon preview, without adding it to the actual final effect.
-- queued [Boolean], when true, adds the serious damage as a queued effect.
-- stupidBuilding [Boolean], when true, prevents the preview from considering shields or freeze for the purposes of previews of damage to buildings.
-- uprootData [Table] temporarily destabilizes stable units in the preview, allowing Serious Damage previews to be shown on them but possibly causing visual issues with effects that also push. All three subentries must be defined to function properly
    -- pawnId [Integer] is the ID of the pawn currently arming the weapon that is uprooting units.
    -- weaponId [String] is the ID of the currently armed weapon that is uprooting units.
    -- weaponIndex [Integer] is the index on the arming pawn that the arming weapon is located at.

--## ffrg_SeriousDamage.InflictSeriousHealing
-- ( healing [Integer],  point [Point],  config [Table] )
-- Instantly heals the specified amount via Serious Healing at the specified point with the specified config options, explained below.
-- sfx [String] adds the specified sound effect to the instance of Serious Healing. This will overwrite the default sound (see simple)
-- anim [String] adds the specified animation to the instance of Serious Healing.
-- simple [Boolean] removes the normal green ping and healing sound effect while keeping the health increase.


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = GetParentPath(...)
local buildingPreviewPath = "combat/buildingPreview/"
local files = {
    "damage_1_1_1",
    "damage_2_2_2",
    "damage_2_2_1",
    "damage_2_1_1",
    "damage_3_3_3",
    "damage_3_3_2",
    "damage_3_3_1",
    "damage_3_2_2",
    "damage_3_2_1",
    "damage_3_1_1",
    "damage_4_4_4",
    "damage_4_4_3",
    "damage_4_4_2",
    "damage_4_4_1",
    "damage_4_3_3",
    "damage_4_3_2",
    "damage_4_3_1",
    "damage_4_2_2",
    "damage_4_2_1",
    "damage_4_1_1",
}

for i, file in ipairs(files) do
    modApi:appendAsset("img/"..buildingPreviewPath..file..".png", path.."img/"..buildingPreviewPath..file..".png")
    local coord = {-22,-13}
    if i > 10 then
        coord = {-23,-22}
    elseif i > 4 then
        coord = {-24,-23}
    elseif i > 1 then
        coord = {-22,-16}
    end
    ANIMS["ffrg_buildingPreview_"..file] = Animation:new{
        Image = buildingPreviewPath..file..".png",
        Layer = 0,
        NumFrames = 21,
        Frames = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1},
        Loop = true,
        Time = 0.02523,
        PosX = coord[1],
        PosY = coord[2]
    }
end

ANIMS["ffrg_buildingPreview_damage_special"] = Animation:new{
    Image = buildingPreviewPath.."damage_1_1_1.png",
    Layer = 0,
    NumFrames = 21,
    Frames = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1},
    Loop = true,
    Time = 0.02523,
    PosX = -12,
    PosY = -13
}

--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


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


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_InflictSeriousDamage(damage, point, config)
    if damage == 0 then return end
    config = config or {}
    config.sfx = config.sfx or ""
    config.anim = config.anim or ""
    config.shake = config.shake or 0
    config.force = config.force or false
    config.type = config.type or "simple"
    if Board then
        local block = 0
        local ret = SkillEffect()
        if Board:IsPawnSpace(point) then
            local pawn = Board:GetPawn(point)
            if config.type ~= "true" and damage ~= DAMAGE_DEATH then
                if pawn:IsShield() then
                    block = 1
                elseif pawn:IsFrozen() then
                    block = 2
                end
            end
            if config.force and ( IsPassiveSkill("Passive_ForceAmp") or IsPassiveSkill("Passive_ForceAlt") ) and pawn:GetTeam() == TEAM_ENEMY then
                damage = damage + 1
            end
            local pawnType = _G[pawn:GetType()]
            if config.type == "blast" and block == 0 then
                pawn:SetSpace(Point(-7,-7))
                Board:DamageSpace(point,damage)
                pawn:SetSpace(point)
            end
            if block == 1 then
                pawn:SetShield(false)
                Board:AddEffect(SoundEffect(point,"props/shield_destroyed"))
            elseif block == 2 then
                pawn:SetFrozen(false)
                Board:AddEffect(SoundEffect(point,"props/ice_destroyed"))
            else
                if pawnType.SoundLocation then
                    if pawn:GetHealth() > damage and damage ~= DAMAGE_DEATH then
                        local sound = SpaceDamage(point,0)
                        sound.sSound = pawnType.SoundLocation.."hurt"
                        Board:DamageSpace(sound)
                    end
                end
                if damage ~= DAMAGE_DEATH and pawn:GetHealth() > damage then
                    pawn:ModifyHealth(damage*-1,true,0)
                else
                    pawn:Kill(false)
                end
            end
        elseif config.type == "bump" then
            if Board:GetTerrain(point) == TERRAIN_MOUNTAIN then
                if Board:IsShield(point) or Board:IsFrozen(point) then
                    block = 1
                end
                if Board:GetHealth(point) == 2 and damage ~= DAMAGE_DEATH then
                    if block ~= 0 then
                        Board:DamageSpace(point,damage)
                    else
                        Board:SetHealth(point,1,2)
                    end
                else
                    Board:DamageSpace(point,damage)
                end
            elseif Board:IsBuilding(point) then
                Board:DamageSpace(point,damage)
            end
        elseif config.type == "blast" then
            Board:DamageSpace(point,damage)
        end
        if config.sfx ~= "" then
            local sound = SpaceDamage(point,0)
            sound.sSound = config.sfx
            Board:DamageSpace(sound)
        end
        if config.anim ~= "" then
            Board:AddAnimation(point, config.anim, 1)
        end
        if config.shake > 0 then
            Board:StartShake(config.shake)
        end
    end
end


local function ffrg_AppendSeriousDamage(ret, damage, point, config)

    if damage == 0 then return end
    config = config or {}
    config.sfx = config.sfx or ""
    config.anim = config.anim or ""
    config.shake = config.shake or 0
    config.force = config.force or false
    config.type = config.type or "simple"
    config.queued = config.queued or false
    local tempDamage = damage
    local pawn
    if Board:IsPawnSpace(point) then
        pawn = Board:GetPawn(point)
    end
    if tempDamage == DAMAGE_DEATH then
        if pawn then
            tempDamage = pawn:GetHealth()
        else
            tempDamage = math.max(Board:GetHealth(point), 1)
        end
    elseif config.force and ( IsPassiveSkill("Passive_ForceAmp") or IsPassiveSkill("Passive_ForceAlt") ) and pawn and pawn:GetTeam() == TEAM_ENEMY then
        tempDamage = tempDamage + 1
    end
    local damage1 = SpaceDamage(point,0)
    local damage2 = SpaceDamage(point,0)
    damage1.iPush = 20
    local block = 0
    if pawn then
        if config.type ~= "stupid" then
            if pawn:IsShield() then block = block + 1 end
            if pawn:IsFrozen() then block = block + 1 end
        end
    else
        if config.type ~= "stupid" then
            if Board:IsShield(point) then block = block + 1 end
            if Board:IsFrozen(point) then block = block + 1 end
        end
    end

    if pawn and pawn:IsGuarding() and config.uprootData and #config.uprootData == 3 and ( config.type == "true" or damage == DAMAGE_DEATH or block == 0 ) then
        if not config.queued then
            pawn:SetPushable(true)
            modApi:conditionalHook(
                function()
                    local marker = ({WeaponPreview:GetSkillEffectMarker()})
                    if marker[1] ~= -1 then
                        if marker[1] == config.uprootData[1] and marker[2] == config.uprootData[2] and marker[3] == config.uprootData[3] then
                            return false
                        else
                            return true
                        end
                    end
                    local finalMarker = ({WeaponPreview:GetFinalEffectMarker()})
                    if finalMarker[1] ~= -1 then
                        if finalMarker[1] == config.uprootData[1] and finalMarker[2] == config.uprootData[2] and finalMarker[3] == config.uprootData[3] then
                            return false
                        end
                    end
                    return true
                end,
                function()
                    if Board:GetPawn(pawn:GetId()) then
                        Board:GetPawn(pawn:GetId()):SetPushable(false)
                    end
                end
            )
        end -- For right now I'm just not going to do stable damage previews on queued skills. It's possible but is a pain in the ass.
    end

    if IsPassiveSkill("Passive_ForceAmp") and pawn and pawn:GetTeam() == TEAM_ENEMY then -- Force Amp REALLY fucks with this. This is the best solution I have atm. This won't come into play for standard bump previews tho
        -- My weapons temporarily switch it to Passive_ForceAlt. This has its own issues, but with enough elbow grease it can all be accounted for.
        tempDamage = math.ceil(tempDamage / 2)
    end

    if not Board:IsBuilding(point) then
        if config.type == "true" or damage == DAMAGE_DEATH or block == 0 then
            for i = 1, tempDamage + block do
                WeaponPreview:AddDamage(damage1)
            end
        end
        WeaponPreview:AddDamage(damage2)
    elseif config.type == "bump" or config.type == "blast" then
        local max = Board:GetMaxHealth(point)
        local current = Board:GetHealth(point)
        local builDamage = math.min(tempDamage,current)
        if config.stupidBuilding or block == 0 or (block > 0 and damage == DAMAGE_DEATH) then
            if Board:GetUniqueBuilding(point) and Board:GetUniqueBuilding(point) ~= "" then
                WeaponPreview:AddAnimation(point, "ffrg_buildingPreview_damage_special")
            else
                WeaponPreview:AddAnimation(point, "ffrg_buildingPreview_damage_"..max.."_"..current.."_"..builDamage)
            end
        end
    end
    if not config.preview then
        if config.queued then
            ret:AddQueuedScript(string.format("ffrg_SeriousDamage.InflictSeriousDamage(%s,%s,%s)", damage, point:GetString(), ttrg_TableToString(config)))
        else
            ret:AddScript(string.format("ffrg_SeriousDamage.InflictSeriousDamage(%s,%s,%s)", damage, point:GetString(), ttrg_TableToString(config)))
        end
    end
end


local function ffrg_InflictSeriousHealing(healing, point, config)
    if healing == 0 then return end
    config = config or {}
    config.sfx = config.sfx or ""
    config.anim = config.anim or ""
    config.simple = config.simple or false
    if Board then
        local ret = SkillEffect()
        if Board:IsPawnSpace(point) then
            local pawn = Board:GetPawn(point)
            local pawnTeam = pawn:GetTeam()
            local pawnType = _G[pawn:GetType()]
            if not config.simple then
                if config.sfx == "" then
                    if pawnTeam == TEAM_PLAYER or pawnType.DefaultFaction and pawnType.DefaultFaction == FACTION_BOTS then
                        Board:AddEffect(SoundEffect(point,"ui/map/repair_mech"))
                    elseif pawnTeam == TEAM_ENEMY then
                        Board:AddEffect(SoundEffect(point,"ui/battle/psion_regeneration"))
                    end
                end
                Board:Ping(point, GL_Color(0,255,0))
            end
            pawn:ModifyHealth(healing,true,0)
        end
        if config.sfx ~= "" then
            Board:AddEffect(SoundEffect(point, config.sfx))
        end
        if config.anim ~= "" then
            Board:AddAnimation(point, config.anim, 1)
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function initialize()
    ffrg_SeriousDamage.InflictSeriousDamage = ffrg_InflictSeriousDamage
    ffrg_SeriousDamage.AppendSeriousDamage = ffrg_AppendSeriousDamage
    ffrg_SeriousDamage.InflictSeriousHealing = ffrg_InflictSeriousHealing
    ffrg_SeriousDamage.Version = VERSION
end

if ffrg_SeriousDamage then
    if modApi:isVersion(ffrg_SeriousDamage.Version, VERSION) and ffrg_SeriousDamage.Version ~= VERSION then
        initialize()
    end
else
    ffrg_SeriousDamage = ffrg_SeriousDamage or {}
    initialize()
end

return ffrg_SeriousDamage


--////////////////////////////////--
