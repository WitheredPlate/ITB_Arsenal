--////////////////////////////////--
--//  (Arsenal) Squad Weapons   //--
--////////////////////////////////--

--== Prime ==--
-- Body Slam

--== Prime ==--
-- Cell Cannon

--== Ranged ==--
-- Caustic Shells

--== Support ==--
-- Overclock

--== Passive ==--
-- Ionic Batteries

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "weapons/ffrg_prime_KO_bodyslam.png",
    "weapons/ffrg_brute_splitshot.png",
    "weapons/ffrg_brute_shovecharge.png",
    "weapons/ffrg_ranged_TC_caustic.png",
    "weapons/ffrg_science_accelerate.png",
    "weapons/ffrg_support_overclock.png",
    "weapons/ffrg_passive_acidshield.png",
    "effects/ffrg_shot_split_U.png",
    "effects/ffrg_shot_split_R.png",
    "effects/ffrg_shot_splitacid_U.png",
    "effects/ffrg_shot_splitacid_R.png",
    "effects/ffrg_shot_splitfrag_U.png",
    "effects/ffrg_shot_splitfrag_R.png",
    "effects/ffrg_explo_split_U.png",
    "effects/ffrg_explo_split_R.png",
    "effects/ffrg_explo_split_D.png",
    "effects/ffrg_explo_split_L.png",
    "effects/ffrg_explo_splitacid_U.png",
    "effects/ffrg_explo_splitacid_R.png",
    "effects/ffrg_explo_splitacid_D.png",
    "effects/ffrg_explo_splitacid_L.png",
    "effects/ffrg_explo_pushacid1_U.png",
    "effects/ffrg_explo_pushacid1_R.png",
    "effects/ffrg_explo_pushacid1_D.png",
    "effects/ffrg_explo_pushacid1_L.png",
    "effects/ffrg_explo_pushmelt_U.png",
    "effects/ffrg_explo_pushmelt_R.png",
    "effects/ffrg_explo_pushmelt_D.png",
    "effects/ffrg_explo_pushmelt_L.png",
    "effects/ffrg_shotup_acid.png",
    "effects/ffrg_body_slam_move_down.png",
    "effects/ffrg_body_slam_move_up.png",
    "effects/ffrg_body_slam_move_left.png",
    "effects/ffrg_body_slam_move_right.png",
    "effects/ffrg_body_slam_fail_down.png",
    "effects/ffrg_body_slam_fail_up.png",
    "effects/ffrg_body_slam_fail_left.png",
    "effects/ffrg_body_slam_fail_right.png",
    "effects/ffrg_body_slam_tip.png",
    "combat/icons/ffrg_icon_overboost_glow.png",
    "combat/icons/ffrg_icon_overboost_miss.png",
    "combat/icons/ffrg_icon_overboost_glance.png",
    "combat/icons/ffrg_icon_overboost_fail.png"
}

Location["combat/icons/ffrg_icon_overboost_glow.png"] = Point(-23,9)
Location["combat/icons/ffrg_icon_overboost_miss.png"] = Point(-23,9)
Location["combat/icons/ffrg_icon_overboost_glance.png"] = Point(-23,9)
Location["combat/icons/ffrg_icon_overboost_fail.png"] = Point(-23,9)

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end


-- Body Slam --
ANIMS.ffrg_BodySlam_Move_0 = Animation:new{
    Image = "effects/ffrg_body_slam_move_up.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -5,
    PosY = -6
}
ANIMS.ffrg_BodySlam_Move_1 = Animation:new{
    Image = "effects/ffrg_body_slam_move_right.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -5,
    PosY = 18
}
ANIMS.ffrg_BodySlam_Move_2 = Animation:new{
    Image = "effects/ffrg_body_slam_move_down.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -37,
    PosY = 18
}
ANIMS.ffrg_BodySlam_Move_3 = Animation:new{
    Image = "effects/ffrg_body_slam_move_left.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -37,
    PosY = -6
}
ANIMS.ffrg_BodySlam_Fail_0 = Animation:new{
    Image = "effects/ffrg_body_slam_fail_up.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -5,
    PosY = -6
}
ANIMS.ffrg_BodySlam_Fail_1 = Animation:new{
    Image = "effects/ffrg_body_slam_fail_right.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -5,
    PosY = 18
}
ANIMS.ffrg_BodySlam_Fail_2 = Animation:new{
    Image = "effects/ffrg_body_slam_fail_down.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -37,
    PosY = 18
}
ANIMS.ffrg_BodySlam_Fail_3 = Animation:new{
    Image = "effects/ffrg_body_slam_fail_left.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 1,
    Loop = true,
    Time = 1,
    PosX = -37,
    PosY = -6
}
ANIMS.ffrg_BodySlam_Tip = Animation:new{
    Image = "effects/ffrg_body_slam_tip.png",
    Layer = ANIMS.LAYER_BACK,
    NumFrames = 2,
    Frames = { 1, 0 },
    Lengths = {1, 1.5},
    Time = 0,
    PosX = -5,
    PosY = -6
}

-- Cell Cannon --
ANIMS.ffrg_Explo_Split_0 = Animation:new{
    Image = "effects/ffrg_explo_split_U.png",
    NumFrames = 9,
    Time = 0.05,
    PosX = -17,
    PosY = 6
}
ANIMS.ffrg_Explo_Split_1 = ANIMS.ffrg_Explo_Split_0:new{
    Image = "effects/ffrg_explo_split_R.png",
    PosY = 3
}
ANIMS.ffrg_Explo_Split_2 = ANIMS.ffrg_Explo_Split_1:new{
    Image = "effects/ffrg_explo_split_D.png"
}
ANIMS.ffrg_Explo_Split_3 = ANIMS.ffrg_Explo_Split_0:new{
    Image = "effects/ffrg_explo_split_L.png"
}
ANIMS.ffrg_Explo_SplitAcid_0 = ANIMS.ffrg_Explo_Split_0:new{
    Image = "effects/ffrg_explo_splitacid_U.png"
}
ANIMS.ffrg_Explo_SplitAcid_1 = ANIMS.ffrg_Explo_Split_1:new{
    Image = "effects/ffrg_explo_splitacid_R.png"
}
ANIMS.ffrg_Explo_SplitAcid_2 = ANIMS.ffrg_Explo_Split_2:new{
    Image = "effects/ffrg_explo_splitacid_D.png"
}
ANIMS.ffrg_Explo_SplitAcid_3 = ANIMS.ffrg_Explo_Split_3:new{
    Image = "effects/ffrg_explo_splitacid_L.png"
}
ANIMS.ffrg_Explo_PushAcid1_0 = ANIMS.explopush1_0:new{
    Image = "effects/ffrg_explo_pushacid1_U.png"
}
ANIMS.ffrg_Explo_PushAcid1_1 = ANIMS.explopush1_1:new{
    Image = "effects/ffrg_explo_pushacid1_R.png"
}
ANIMS.ffrg_Explo_PushAcid1_2 = ANIMS.explopush1_2:new{
    Image = "effects/ffrg_explo_pushacid1_D.png"
}
ANIMS.ffrg_Explo_PushAcid1_3 = ANIMS.explopush1_3:new{
    Image = "effects/ffrg_explo_pushacid1_L.png"
}

-- Caustic Shells --
ANIMS.ffrg_ExploPushMelt_0 = Animation:new{
    Image = "effects/ffrg_explo_pushmelt_U.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -11,
    PosY = -21
}
ANIMS.ffrg_ExploPushMelt_1 = ANIMS.ffrg_ExploPushMelt_0:new{
    Image = "effects/ffrg_explo_pushmelt_R.png",
    PosY = 1
}
ANIMS.ffrg_ExploPushMelt_2 = ANIMS.ffrg_ExploPushMelt_0:new{
    Image = "effects/ffrg_explo_pushmelt_D.png",
    PosX = -45,
    PosY = 1
}
ANIMS.ffrg_ExploPushMelt_3 = ANIMS.ffrg_ExploPushMelt_0:new{
    Image = "effects/ffrg_explo_pushmelt_L.png",
    PosX = -45
}
ANIMS.ffrg_ExploMelt_0 = ANIMS.ffrg_ExploPushMelt_0:new{
    PosX = -19,
    PosY = -11
}
ANIMS.ffrg_ExploMelt_1 = ANIMS.ffrg_ExploMelt_0:new{
    Image = "effects/ffrg_explo_pushmelt_R.png",
    PosY = -5
}
ANIMS.ffrg_ExploMelt_2 = ANIMS.ffrg_ExploMelt_0:new{
    Image = "effects/ffrg_explo_pushmelt_D.png",
    PosX = -37,
    PosY = -5
}
ANIMS.ffrg_ExploMelt_3 = ANIMS.ffrg_ExploMelt_0:new{
    Image = "effects/ffrg_explo_pushmelt_L.png",
    PosX = -37
}


--////////////////////////////////--





--////////////////////////////////--
--//           Weapons          //--
--////////////////////////////////--


---------------
-- Body Slam --
---------------

ffrg_Prime_KO_BodySlam = Skill:new{
    Name = "Body Slam",
    Description = "Attempt to slam self onto an adjacent tile. If the tile is occupied, damage self and target. On kill, shove adjacent tiles.",
    Class = "Prime",
    Icon = "weapons/ffrg_prime_KO_bodyslam.png",
    OnKill = "Shove adjacent",
    LaunchSound = "weapons/shift",
    SlamSound = "impact/generic/mech",
    KOSound = "impact/generic/arachnoid",
    FailAnim = "",
    SelfAnim = "",
    OuterAnim = "",
    Damage = 2,
    PathSize = 1,
    SelfDamage = 1,
    Force = 2,
    Upgrades = 2,
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,2),
        Enemy2 = Point(3,2),
        Enemy3 = Point(2,1),
        Target = Point(2,2),
        CustomEnemy = "Digger1",
        Length = 5
    }
}

ffrg_Prime_KO_BodySlam_A = ffrg_Prime_KO_BodySlam:new{
    UpgradeDescription = "Increases damage to self and target by 1.",
    Damage = 3,
    SelfDamage = 2,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,2),
        Enemy2 = Point(3,2),
        Enemy3 = Point(2,1),
        Target = Point(2,2),
        CustomEnemy = "Scorpion1",
        Length = 5
    }
}
ffrg_Prime_KO_BodySlam_B = ffrg_Prime_KO_BodySlam:new{
    UpgradeDescription = "Increases force of shove by 1.",
    Force = 3,
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,2),
        Enemy2 = Point(2,2),
        Enemy3 = Point(1,1),
        Target = Point(1,2),
        CustomEnemy = "Digger1",
        Length = 5
    }
}
ffrg_Prime_KO_BodySlam_AB = ffrg_Prime_KO_BodySlam:new{
    Damage = 3,
    SelfDamage = 2,
    Force = 3,
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,2),
        Enemy2 = Point(2,2),
        Enemy3 = Point(1,1),
        Target = Point(1,2),
        CustomEnemy = "Scorpion1",
        Length = 5
    }
}

Weapon_Texts.ffrg_Prime_KO_BodySlam_Upgrade1 = "+1 Damage Each"
Weapon_Texts.ffrg_Prime_KO_BodySlam_Upgrade2 = "+1 Force"

local wake_variance = 60
local wake_verticality = 0.6

ffrg_Emitter_Wake_0 = Emitter_Burst:new{
    image = "combat/tiles_grass/dust.png",
    angle_variance = wake_variance,
    max_alpha = 0.15,
    speed = 2,
    lifespan = 0.75,
    gravity = true,
    angle = -36.25 - (wake_verticality*53.75) + (wake_variance/2),
}
ffrg_Emitter_Wake_1 = ffrg_Emitter_Wake_0:new{
    angle = 36.25 - (wake_verticality*126.25) + (wake_variance/2)
}
ffrg_Emitter_Wake_2 = ffrg_Emitter_Wake_0:new{
    angle = 143.75 + (wake_verticality*126.25) + (wake_variance/2)
}
ffrg_Emitter_Wake_3 = ffrg_Emitter_Wake_0:new{
    angle = -143.75 + (wake_verticality*53.75) + (wake_variance/2)
}

function ffrg_Prime_KO_BodySlam:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local damage = SpaceDamage(p2,self.Damage)
    local direction = GetDirection(p1 - p2)
    damage.bHidePath = true
    local self_damage = SpaceDamage(p1,self.SelfDamage)
    self_damage.sAnimation = self.SelfAnim
    local leap = PointList()
    leap:push_back(p1)
    leap:push_back(p2)
    local rev_leap = PointList()
    rev_leap:push_back(p2)
    rev_leap:push_back(p1)
    local miss = false
    local fail = false
    local ko = false
    local id
    local damage_temp = self.Damage
    local p2T = p2
    if Pawn then
        id = Pawn:GetId()
        if Pawn:IsBoosted() then damage_temp = damage_temp + 1 end
    end

    if Board:IsPawnSpace(p2) then
        local pawn = Board:GetPawn(p2)
        if pawn:GetSpace() ~= p2 then p2T = pawn:GetSpace() end
        if Board:IsDeadly(damage,Pawn) and not pawn:IsCorpse() then
            ko = true
            damage.bKO_Effect = true
        else
            fail = true
        end
    elseif Board:GetTerrain(p2) == TERRAIN_MOUNTAIN then
        if Board:GetHealth(p2) == 2 or Board:IsShield(p2) or Board:IsFrozen(p2) then
            fail = true
        end
    elseif Board:IsBuilding(p2) then
        if Board:GetHealth(p2) > damage_temp or Board:IsShield(p2) or Board:IsFrozen(p2) then
            fail = true
        end
    else
        miss = true
    end

    ret:AddScript("Board:AddBurst("..p1:GetString()..",\"ffrg_Emitter_Wake_"..direction.."\",DIR_NONE)")

    if ko then
        for i = 0, 3 do
            local curr = p2 + DIR_VECTORS[i]
            if curr ~= p1 then
                local direction = GetDirection(curr - p2)
                ffrg_Shove.Shove(curr, direction, self.Force, {ret = ret, mode = "simple", delay = 0.6})
            end
        end
    end

    ret:AddDelay(0.1)

    ret:AddScript("ffrg_Prime_KO_BodySlam:Slam("..id..","..p1:GetString()..","..p2:GetString()..",12,3.25,0)")

    ret:AddDelay(0.45)

    if not fail and not miss then
        ret:AddDamage(SoundEffect(Point(-1,-1),self.KOSound))
        ret:AddDamage(SoundEffect(Point(-1,-1),self.KOSound))
    end
    ret:AddDamage(SoundEffect(Point(-1,-1),self.SlamSound))

    if miss then
        ret:AddBoardShake(0.1)
    elseif fail then
        ret:AddBoardShake(0.15)
    elseif ko then
        ret:AddBoardShake(0.3)
    else
        ret:AddBoardShake(0.2)
    end

    if ko then
        for i = 0, 3 do
            local curr = p2 + DIR_VECTORS[i]
            if curr ~= p1 then
                ret:AddBounce(curr,-1)
            end
        end
    end

    if not miss and id then
        ret:AddScript("Board:GetPawn("..id.."):SetSpace("..p1:GetString()..")")
        ret:AddDamage(self_damage)
        ret:AddDamage(damage)
        ret:AddScript("Board:GetPawn("..id.."):SetSpace("..p2:GetString()..")")
    elseif not miss then
        ret:AddDamage(damage)
    end

    if fail or Board:IsBuilding(p2) then
        if id and Board:GetPawn(id) then
            if Board:IsBuilding(p2) then
                ret:AddScript("ffrg_Prime_KO_BodySlam:Slam("..id..","..p2:GetString()..","..p1:GetString()..",6,4.5,3,true)")
            else
                ret:AddScript("ffrg_Prime_KO_BodySlam:Slam("..id..","..p2:GetString()..","..p1:GetString()..",6,4.5,3)")
            end
        end
    else
        ret:AddBounce(p2,5)
    end
    ret:AddBurst(p2,"Emitter_Crack_Start",DIR_NONE)

    if Board:IsTipImage() then
        Board:AddAnimation(p1,"ffrg_BodySlam_Tip",1)
    elseif miss then
        ret:AddMove(leap,NO_DELAY)
    elseif not fail then
        WeaponPreview:AddAnimation(p1, "ffrg_BodySlam_Move_"..GetDirection(p2 - p1))
    else
        WeaponPreview:AddAnimation(p1, "ffrg_BodySlam_Fail_"..GetDirection(p2 - p1))
    end

    ret:AddDelay(0.2)
    if not miss and p2T == p2 and fail and not Pawn:IsFire() and not Board:IsBuilding(p2) and ( Board:GetTerrain(p2) == TERRAIN_FOREST or Board:IsFire(p2) ) then
        ret:AddScript("Board:GetPawn("..id.."):SetFire(false)")
    end

    return ret
end

function ffrg_Prime_KO_BodySlam:Slam(id,p1,p2,height,gravity,bounce,resistTest)
    local ret = SkillEffect()
    if resistTest and not ( Board:IsBuilding(p1) and Board:GetHealth(p1) > 0 ) then
        if bounce > 0 then
            ret:AddBounce(p1,bounce+2)
        end
        Board:AddEffect(ret)
        return
    end
    if bounce > 0 then
        ret:AddBounce(p1,bounce)
    end
    local leap = PointList()
    leap:push_back(p1)
    leap:push_back(p2)
    --ret:AddScript("LOG(Board:GetPawn("..id.."):GetSpace())")
    if Board:GetPawn(id) then
        ret:AddScript("Board:GetPawn("..id.."):SetSpace("..p1:GetString()..")")
        ret:AddScript("Board:GetPawn("..id.."):MoveToBottom()")
    end
    ffrg_WorldConstants:setHeight(ret,height)
    ffrg_WorldConstants:setGravity(ret,gravity)
    ret:AddLeap(leap,NO_DELAY)
    --ret:AddScript("LOG(Board:GetPawn("..id.."):GetSpace())")
    ffrg_WorldConstants:resetHeight(ret)
    ffrg_WorldConstants:resetGravity(ret)
    Board:AddEffect(ret)
end


-----------------
-- Cell Cannon --
-----------------

ffrg_Brute_SplitShot = Skill:new{
    Name = "Cell Cannon",
    Description = "Fire a damaging and pushing projectile that can split in two.",
    Class = "Brute",
    Icon = "weapons/ffrg_brute_splitshot.png",
    LaunchSound = "weapons/shrapnel",
    SplitSound = "weapons/mirror_shot",
    HitSound = "impact/generic/explosion",
    InitialHitSound = "",
    SplitAnim = "ffrg_Explo_Split_",
    HitAnim = "explopush1_",
    FragAnim = "explopush1_",
    PowerCost = 1,
    ProjectileArt = "effects/ffrg_shot_split",
    SplitProjectileArt = "effects/ffrg_shot_splitfrag",
    Damage = 1,
    Upgrades = 2,
    Acid = false,
    UpgradeCost = {2,3},
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(1,1),
        Enemy2 = Point(4,1),
        Target = Point(2,1)
    }
}

ffrg_Brute_SplitShot_A = ffrg_Brute_SplitShot:new{
    UpgradeDescription = "Adds A.C.I.D. to the initial projectile and the tile it splits on.",
    Acid = true,
    ProjectileArt = "effects/ffrg_shot_splitacid",
    InitialHitSound = "props/acid_splash",
    SplitAnim = "ffrg_Explo_SplitAcid_",
    HitAnim = "ffrg_Explo_PushAcid1_"
}
ffrg_Brute_SplitShot_B = ffrg_Brute_SplitShot:new{
    UpgradeDescription = "Increases damage by 1.",
    Damage = 2
}
ffrg_Brute_SplitShot_AB = ffrg_Brute_SplitShot:new{
    Acid = true,
    Damage = 2,
    ProjectileArt = "effects/ffrg_shot_splitacid",
    InitialHitSound = "props/acid_splash",
    SplitAnim = "ffrg_Explo_SplitAcid_",
    HitAnim = "ffrg_Explo_PushAcid1_"
}

Weapon_Texts.ffrg_Brute_SplitShot_Upgrade1 = "Add Acid"
Weapon_Texts.ffrg_Brute_SplitShot_Upgrade2 = "+1 Damage"

function ffrg_Brute_SplitShot:GetTargetArea(point)
    local ret = PointList()
    for i = 0, 3 do
        local buffer = false
        for j = 1, 7 do
            local curr = point+(DIR_VECTORS[i]*j)
            if not Board:IsValid(curr) then break end
            ret:push_back(curr)
            if buffer then break end
            if not buffer and Board:IsBlocked(curr,PATH_FLYER) then
                buffer = true
            end
        end
    end
    return ret
end

function ffrg_Brute_SplitShot:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2-p1)
    local distance = p1:Manhattan(p2)
    local backspace = p2-DIR_VECTORS[direction]
    local term
    if backspace ~= p1 and Board:IsBlocked(backspace,PATH_FLYER) then
        term = backspace
    elseif Board:IsBlocked(p2,PATH_FLYER) then
        term = p2
    end

    if term then
        distance = p1:Manhattan(term)
        local projectile = SpaceDamage(term,self.Damage,direction)
        if self.Acid then projectile.iAcid = 1 end
        projectile.sAnimation = self.HitAnim..direction
        projectile.sSound = self.HitSound
        ret:AddProjectile(projectile,self.ProjectileArt,NO_DELAY)
        if self.InitialHitSound ~= "" then
            ret:AddDelay((distance*0.09)-0.09)
            ret:AddDamage(SoundEffect(Point(-1,-1),self.InitialHitSound))
        end
    else
        local projectile = SpaceDamage(p2,0)
        if self.Acid then projectile.iAcid = 1 end
        projectile.sAnimation = self.SplitAnim..direction
        projectile.sSound = self.SplitSound
        ret:AddProjectile(projectile,self.ProjectileArt,NO_DELAY)
        ret:AddDelay((distance*0.09)-0.09)
        if self.InitialHitSound ~= "" then
            ret:AddDamage(SoundEffect(Point(-1,-1),self.InitialHitSound))
        end
        ret:AddDelay(0.17)
        for _, i in ipairs({-1,1}) do
            local dir = direction+i
            if dir == 4 then dir = 0 end
            if dir == -1 then dir = 3 end
            local curr = p2+DIR_VECTORS[dir]
            local hit = GetProjectileEnd(p2,curr)
            if hit ~= p2 then
                local split = SpaceDamage(hit,self.Damage,dir)
                split.sAnimation = self.FragAnim..dir
                split.sSound = self.HitSound
                ffrg_WorldConstants:setSpeed(ret,1)
                ret:AddProjectile(p2,split,self.SplitProjectileArt,NO_DELAY)
                ffrg_WorldConstants:resetSpeed(ret)
            end
        end
    end
    return ret
end


------------------
-- Blasted Wake --
------------------

ffrg_Brute_ShoveCharge = Skill:new{
    Name = "Blasted Wake",
    Description = "Charge forwards and stop, shoving the next tile forwards with the force of the charge.",
    Class = "Brute",
    Icon = "weapons/ffrg_brute_shovecharge.png",
    LaunchSound = "/support/train/move",
    WakeSound = "mech/science/exchange_mech/death",
    WakeSound2 = "",
    Anim1 = "airpush_",
    Fire = false,
    Upgrades = 2,
    Range = 3,
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,1),
        Target = Point(2,2)
    }
}

ffrg_Brute_ShoveCharge_A = ffrg_Brute_ShoveCharge:new{
    UpgradeDescription = "Increases the max distance and force by 2.",
    Range = 5
}
ffrg_Brute_ShoveCharge_B = ffrg_Brute_ShoveCharge:new{
    UpgradeDescription = "Adds fire to the targeted tile.",
    Fire = true,
    WakeSound2 = "props/forest_fire"
}
ffrg_Brute_ShoveCharge_AB = ffrg_Brute_ShoveCharge:new{
    Range = 5,
    Fire = true,
    WakeSound2 = "props/forest_fire"
}

Weapon_Texts.ffrg_Brute_ShoveCharge_Upgrade1 = "+2 Range"
Weapon_Texts.ffrg_Brute_ShoveCharge_Upgrade2 = "Add Fire"

function ffrg_Brute_ShoveCharge:GetTargetArea(point)
	local ret = PointList()

	for i = DIR_START, DIR_END do
		for k = 1, self.Range do
			local curr = DIR_VECTORS[i]*k + point
			if Board:IsValid(curr) and not Board:IsBlocked(curr, Pawn:GetPathProf()) then
				ret:push_back(DIR_VECTORS[i]*k + point)
			else
				break
			end
		end
	end

	return ret
end

function ffrg_Brute_ShoveCharge:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local distance = p1:Manhattan(p2)
    local direction = GetDirection(p2 - p1)
    local charge = PointList()
    local blastTile = p2+DIR_VECTORS[direction]
    local blast
    if Board:IsValid(blastTile) then
        blast = SpaceDamage(blastTile,0)
        if distance == 1 then
            blast.iPush = direction
            blast.sAnimation = self.Anim1..direction
        else
            blast.iPush = 5
            local sDelay = 0.06*(distance+2)
            if distance < 3 then sDelay = sDelay + (0.03*(2-distance)) end
            ffrg_Shove.Shove(blastTile, direction, distance, {ret = ret, mode = "simple", delay = sDelay})
        end
        if self.Fire then blast.iFire = 1 end
        blast.sSound = self.WakeSound
    end
    ret:AddDelay(0.06)
    for i = 0, distance do
        local curr = p1+DIR_VECTORS[direction]*i
        charge:push_back(curr)
    end
    ret:AddCharge(charge,NO_DELAY)
    for i = 1, distance+1 do
        local curr = p1 + (DIR_VECTORS[direction]*(i-1))
        ret:AddBounce(curr,-1)
        ret:AddDelay(0.06)
    end
    if distance < 3 then ret:AddDelay(0.03*(2-distance)) end
    if blast then
        ret:AddDamage(blast)
        ret:AddBounce(blastTile,math.max(-3,(distance)*-1))
        if self.WakeSound2 ~= "" then
            ret:AddDamage(SoundEffect(Point(-1,-1),self.WakeSound2))
        end
    end
    return ret
end


--------------------
-- Caustic Shells --
--------------------

ffrg_Ranged_TC_Caustic = Skill:new{
    Name = "Caustic Shells",
    Description = "Launch two acidic artilleries in different directions.",
    Class = "Ranged",
    Icon = "weapons/ffrg_ranged_TC_caustic.png",
    ArtilleryArt = "effects/ffrg_shotup_acid.png",
    FireSound = "/weapons/acid_shot",
    MeltSound = "props/acid_splash",
    HitSound = "props/acid_splash",
    AfterSound = "support/acid/death",
    HitAnim = "ffrg_ExploPushMelt_",
    MeltAnim = "ffrg_ExploMelt_",
    SelfAnim = "",
    Backmelt = false,
    TwoClick = true,
    Damage = 0,
    Upgrades = 2,
    UpgradeCost = {1,3},
    TipImage = {
        Unit = Point(1,3),
        Enemy1 = Point(1,1),
        Enemy2 = Point(3,3),
        Target = Point(1,1),
        Second_Click = Point(3,3),
        Length = 5
    }
}

ffrg_Ranged_TC_Caustic_A = ffrg_Ranged_TC_Caustic:new{
    UpgradeDescription = "Apply A.C.I.D. to both tiles behind the user.",
    Backmelt = true,
    TipImage = {
        Unit = Point(1,2),
        Enemy1 = Point(3,2),
        Enemy2 = Point(1,3),
        Target = Point(1,0),
        Second_Click = Point(3,2),
        Length = 5
    }
}
ffrg_Ranged_TC_Caustic_B = ffrg_Ranged_TC_Caustic:new{
    UpgradeDescription = "Increases damage to 1.",
    Damage = 1
}
ffrg_Ranged_TC_Caustic_AB = ffrg_Ranged_TC_Caustic:new{
    Backmelt = true,
    Damage = 1,
    TipImage = {
        Unit = Point(1,2),
        Enemy1 = Point(3,2),
        Enemy2 = Point(1,3),
        Target = Point(1,0),
        Second_Click = Point(3,2),
        Length = 5
    }
}

Weapon_Texts.ffrg_Ranged_TC_Caustic_Upgrade1 = "Backmelt"
Weapon_Texts.ffrg_Ranged_TC_Caustic_Upgrade2 = "+1 Damage"

local function DirReverse(dir)
    if dir == 0 then return 2 end
    if dir == 1 then return 3 end
    if dir == 2 then return 0 end
    return 1
end

function ffrg_Ranged_TC_Caustic:GetTargetArea(point)
    local ret = PointList()
    for i = 0, 3 do
        for j = 2, 7 do
            local curr = point+(DIR_VECTORS[i]*j)
            if not Board:IsValid(curr) then break end
            ret:push_back(curr)
        end
    end
    return ret
end

function ffrg_Ranged_TC_Caustic:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2-p1)
    local artillery = SpaceDamage(p2,self.Damage,direction)
    artillery.iAcid = 1
    if self.Backmelt then
        local back = p1 - DIR_VECTORS[direction]
        local melt = SpaceDamage(back,0)
        melt.iAcid = 1
        ret:AddDamage(melt)
    end
    ret:AddArtillery(artillery,"nil",NO_DELAY)
    return ret
end

function ffrg_Ranged_TC_Caustic:GetSecondTargetArea(p1, p2)
    local direction = GetDirection(p2-p1)
    local ret = PointList()
    for i = 0, 3 do
        if i ~= direction then
            for j = 2, 7 do
                local curr = p1+(DIR_VECTORS[i]*j)
                if not Board:IsValid(curr) then break end
                ret:push_back(curr)
            end
        end
    end
    return ret
end

function ffrg_Ranged_TC_Caustic:GetFinalEffect(p1, p2, p3)
    local ret = SkillEffect()
    local direction = GetDirection(p2-p1)
    local direction2 = GetDirection(p3-p1)
    local artillery = SpaceDamage(p2,self.Damage,direction)
    artillery.iAcid = 1
    artillery.sAnimation = self.HitAnim..direction
    artillery.sSound = self.HitSound
    ret:AddArtillery(artillery,self.ArtilleryArt,NO_DELAY)
    ret:AddDamage(SoundEffect(Point(-1,-1),self.FireSound))
    if self.Backmelt then
        local back = p1 - DIR_VECTORS[direction]
        local back2 = p1 - DIR_VECTORS[direction2]
        local melt = SpaceDamage(back,0)
        melt.iAcid = 1
        melt.sSound = self.MeltSound
        if Board:IsValid(back) then
            melt.sAnimation = self.MeltAnim..DirReverse(direction)
            ret:AddDamage(melt)
        end
        ret:AddDelay(0.15)
        if Board:IsValid(back2) then
            melt.loc = back2
            melt.sAnimation = self.MeltAnim..DirReverse(direction2)
            ret:AddDamage(melt)
        end
    else
        ret:AddDelay(0.15)
    end
    artillery.loc = p3
    artillery.iPush = direction2
    artillery.sAnimation = self.HitAnim..direction2
    ret:AddArtillery(artillery,self.ArtilleryArt,NO_DELAY)
    ret:AddDamage(SoundEffect(Point(-1,-1),self.FireSound))
    ret:AddDelay(0.55)
    ret:AddDamage(SoundEffect(Point(-1,-1),self.AfterSound))
    return ret
end


---------------------
-- Boundary Vortex --
---------------------

ffrg_Science_Accelerate = Skill:new{
    Name = "Boundary Vortex",
    Description = "Push adjacent tiles in a spiral and Accelerate allies.",
    Class = "Science",
    Icon = "weapons/ffrg_science_accelerate.png",
    LaunchSound = "mech/flying/jet_mech/death",
    Animation = "airpush_",
    SelfAccelerate = false,
    Force = 1,
    Upgrades = 2,
    UpgradeCost = {2,3},
    TipImage = {
        Unit = Point(2,2),
        Enemy1 = Point(2,1),
        Enemy2 = Point(3,2),
        Friendly = Point(2,3),
        Target = Point(1,0),
        Length = 4.5
    }
}

ffrg_Science_Accelerate_A = ffrg_Science_Accelerate:new{
    UpgradeDescription = "Increases force of push by 1.",
    Animation = "ffrg_airshove2_",
    Force = 2
}
ffrg_Science_Accelerate_B = ffrg_Science_Accelerate:new{
    UpgradeDescription = "Accelerates self when used.",
    SelfAccelerate = true
}
ffrg_Science_Accelerate_AB = ffrg_Science_Accelerate:new{
    Force = 2,
    Animation = "ffrg_airshove2_",
    SelfAccelerate = true
}

Weapon_Texts.ffrg_Science_Accelerate_Upgrade1 = "+1 Force"
Weapon_Texts.ffrg_Science_Accelerate_Upgrade2 = "Accelerate Self"

local FFRG_PUSHERS = {
    Point(2,1),
    Point(-2,-1),
    Point(-1,2),
    Point(1,-2),
    Point(-2,1),
    Point(2,-1),
    Point(1,2),
    Point(-1,-2)
}

local function dir_rotate(dir, rev)
    if rev then
        dir = dir - 1
        if dir == -1 then dir = 3 end
    else
        dir = dir + 1
        if dir == 4 then dir = 0 end
    end
    return dir
end

function ffrg_Science_Accelerate:GetTargetArea(point)
    local ret = PointList()
    for _, mod in ipairs(FFRG_PUSHERS) do
        local curr = point+mod
        if Board:IsValid(curr) then ret:push_back(curr) end
    end
    return ret
end

function ffrg_Science_Accelerate:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local damages = {}
    for i = DIR_START, DIR_END do
        local curr = p1 + DIR_VECTORS[i]
        local damage
        if Board:IsPawnTeam(curr,TEAM_PLAYER) then
            damage = ffrg_ActionsPlus.AccelerateDamage(curr)
        else
            damage = SpaceDamage(curr,0)
        end
        local rev = false
        local change = p2 - p1
        for i, mod in ipairs(FFRG_PUSHERS) do
            if mod == change then
                if i > 4 then
                    rev = true
                else
                    rev = false
                end
            end
        end
        dir = dir_rotate(GetDirection(curr-p1),rev)
        if self.Force == 1 then
            damage.iPush = dir
        else
            damage.iPush = 5
            ffrg_Shove.Shove(curr, dir, self.Force, {ret = ret, mode = "simple", standard_anim = false, delay = 0.1})
        end
        damage.sAnimation = self.Animation..dir
        table.insert(damages,damage)
    end
    ret:AddDelay(0.1)
    if self.SelfAccelerate then
        accelerate = ffrg_ActionsPlus.AccelerateDamage(p1)
        ret:AddDamage(accelerate)
    end
    for _, damage in ipairs(damages) do
        ret:AddDamage(damage)
    end
    return ret
end


---------------
-- Overclock --
---------------

ffrg_Support_Overclock = Skill:new{
    Name = "Overclock",
    Description = "Overclock self or an adjacent ally.",
    Class = "",
    Icon = "weapons/ffrg_support_overclock.png",
    Boost = false,
    Limited = 2,
    PowerCost = 1,
    TwoClick = true,
    Upgrades = 1,
    UpgradeCost = {2},
    TipImage = {
        Unit = Point(2,3),
        Friendly = Point(2,2),
        Target = Point(2,2),
        Second_Click = Point(2,2),
        Length = 3.5
    }
}

ffrg_Support_Overclock_A = ffrg_Support_Overclock:new{
    UpgradeDescription = "Boosts the targeted unit.",
    Boost = true
}

Weapon_Texts.ffrg_Support_Overclock_Upgrade1 = "Add Boost"

function ffrg_Support_Overclock:GetTargetArea(point)
    local ret = PointList()
    ret:push_back(point)
    for i = 0, 3 do
        local curr = point+DIR_VECTORS[i]
        if Board:IsValid(curr) and Board:IsPawnSpace(curr) and Board:GetPawn(curr):GetTeam() == TEAM_PLAYER then
            ret:push_back(curr)
        end
    end
    return ret
end

function ffrg_Support_Overclock:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local pawn
    if p1 == p2 then pawn = Pawn
    else pawn = Board:GetPawn(p2)
    end
    local id = pawn:GetId()
    local damage = ffrg_ActionsPlus.OverclockDamage(p2,{self_force = true})
    if self.Boost then
        local boost = ( true and not pawn:IsBoosted() ) or false
        if p1 == p2 then boost = true end
        local overclock = ( true and ( not GAME.ffrg_OverclockedData[id] or GAME.ffrg_OverclockedData[id].stage == 3 ) ) or false
        if p1 == p2 and GAME.ffrg_OverclockedData[id] and GAME.ffrg_OverclockedData[id].stage == 2 then overclock = true end
        if boost and overclock then
            damage.sImageMark = "combat/icons/ffrg_icon_overboost_glow.png"
        elseif boost then
            damage.sImageMark = "combat/icons/ffrg_icon_overboost_miss.png"
        elseif overclock then
            damage.sImageMark = "combat/icons/ffrg_icon_overboost_glance.png"
        else
            damage.sImageMark = "combat/icons/ffrg_icon_overboost_fail.png"
        end
        ret:AddDamage(damage)
        ret:AddDelay(0.3)
        if boost then
            ret:AddScript("Board:GetPawn("..id.."):SetBoosted(true)")
        end
    else
        ret:AddDamage(damage)
    end
    return ret
end

function ffrg_Support_Overclock:IsTwoClickException(p1,p2)
    local pawn
    if p1 == p2 then pawn = Pawn
    else pawn = Board:GetPawn(p2)
    end
    local id = pawn:GetId()
    if self.Boost and not pawn:IsBoosted() then return true end
    if not GAME.ffrg_OverclockedData[id] or GAME.ffrg_OverclockedData[id].stage == 3 then return true end
    if p1 == p2 and GAME.ffrg_OverclockedData[id].stage == 2 then return true end
    return false
end

function ffrg_Support_Overclock:GetSecondTargetArea(p1,p2) -- Auto-fail to prevent usages that do nothing
    local ret = PointList()
    return ret
end

function ffrg_Support_Overclock:GetFinalEffect(p1,p2,p3) -- Shouldn't trigger but here for redundancy
    local ret = SkillEffect()
    return ret
end

---------------------
-- Ionic Batteries --
---------------------

ffrg_Passive_AcidShield = PassiveSkill:new{
    Name = "Ionic Batteries",
    Description = "Being acidified consumes the A.C.I.D. and Shields the Mech.",
    Class = "",
    Icon = "weapons/ffrg_passive_acidshield.png",
    Passive = "ffrg_Passive_AcidShield",
    PathSize = INT_MAX,
    TipImage = {
        Unit = Point(2,3),
        Target = Point(2,1),
        Length = 5
    }
}

function ffrg_Passive_AcidShield:AcidClear(point)
    if Board:IsPawnSpace(point) then
        Board:GetPawn(point):SetAcid(false)
    end
    Board:SetAcid(point,false)
end

function ffrg_Passive_AcidShield:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    Board:SetAcid(Point(2,1), true)
    ret:AddDelay(0.2)
    ret:AddMove(Board:GetPath(p1, p2, PATH_GROUND), FULL_DELAY)
    ret.effect:back().bHide = true
    local shield = SpaceDamage(p2, 0)
    shield.bHide = true
    shield.iShield = 1
    shield.sScript = "ffrg_Passive_AcidShield:AcidClear("..p2:GetString()..")"
    ret:AddDamage(shield)
    return ret
end

local function ffrg_GenerateAcidShield(pawn)
    if not pawn:IsShield() then
        pawn:SetShield(true)
        Board:DamageSpace(SoundEffect(Point(-1,-1),"props/shield_activated"))
    end
    if pawn:IsAcid() then
        pawn:SetAcid(false)
    end
    if pawn:IsInfected() then
        pawn:SetInfected(false)
    end
end

local function ffrg_onPawnClassInitialized(pawnClass, pawnInstance) -- For instances of SetAcid()
    pawnClass.ffrg_SetAcidOld = pawnInstance.SetAcid
    pawnClass.SetAcid = function(self, acid)
        if acid and self:IsMech() and IsPassiveSkill("ffrg_Passive_AcidShield") then
            ffrg_GenerateAcidShield(self)
        else
            return self:ffrg_SetAcidOld(acid)
        end
    end
end
modApi.events.onPawnClassInitialized:subscribe(ffrg_onPawnClassInitialized)

local ffrg_AcidTracking = {}
for i = 1, 8 do
    table.insert(ffrg_AcidTracking,{0,0,0,0,0,0,0,0})
end
local ffrg_AcidThresholds = {}

local function ffrg_AcidTrackingClear()
    if IsPassiveSkill("ffrg_Passive_AcidShield") then
        for i = 1, 8 do
            for j = 1, 8 do
                ffrg_AcidTracking[i][j] = 0
            end
        end
    end
end

local function ffrg_onResetTurn()
    ffrg_AcidTrackingClear()
end
local function ffrg_onMissionStart(mission)
    ffrg_AcidTrackingClear()
end
local function ffrg_onMissionEnd(mission)
    ffrg_AcidTrackingClear()
end
local function ffrg_onTestMechEntered(mission)
    ffrg_AcidTrackingClear()
end
local function ffrg_onTestMechExited(mission)
    ffrg_AcidTrackingClear()
end
modApi.events.onMissionStart:subscribe(ffrg_onMissionEnd)
modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)
modApi.events.onTestMechEntered:subscribe(ffrg_onTestMechEntered)
modApi.events.onTestMechExited:subscribe(ffrg_onTestMechExited)
modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn)

local time_past
local function ffrg_onMissionUpdate(mission) -- For instances of being moved onto acidifying tiles. Also consumes acid pools through shields.
    if IsPassiveSkill("ffrg_Passive_AcidShield") then
        local time_now = os.clock()
        local time_delta = time_now - time_past
        time_past = time_now
        for id = 0, 2 do
            local pawn = Board:GetPawn(id)
            if pawn and not pawn:IsBusy() then
                local space = pawn:GetSpace()
                if space and Board:IsValid(space) then
                    local data = ffrg_AcidTracking[space.x+1][space.y+1]
                    if data == 1 then
                        Board:SetAcid(space,false)
                        ffrg_GenerateAcidShield(pawn)
                    elseif ( data == 2 and not pawn:IsFlying() ) or pawn:IsAcid() then
                        ffrg_GenerateAcidShield(pawn)
                    end
                end
            elseif pawn and pawn:IsAcid() then -- Ideally this shouldn't trigger but it's still useful to catch edge cases
                ffrg_GenerateAcidShield(pawn)
            end
        end
        for i = 0, 7 do
            for j = 0, 7 do
                local point = Point(i,j)
                if ffrg_AcidTracking[i+1][j+1] > 2 then
                    ffrg_AcidTracking[i+1][j+1] = ffrg_AcidTracking[i+1][j+1] - 1
                elseif Board:IsAcid(point) then
                    if Board:GetTerrain(point) == TERRAIN_WATER then
                        ffrg_AcidTracking[i+1][j+1] = 2
                    else
                        ffrg_AcidTracking[i+1][j+1] = 1
                    end
                else
                    ffrg_AcidTracking[i+1][j+1] = 0
                end
            end
        end
        local units = Board:GetPawns(TEAM_ANY)
        local edited = {}
        for _, id in ipairs(extract_table(units)) do
            if id > 2 and Board:GetPawn(id) then
                local unit = Board:GetPawn(id)
                if unit:IsAcid() and unit:GetSpace() and not unit:IsBusy() then
                    local point = unit:GetSpace()
                    local id = unit:GetId()
                    if not ffrg_AcidThresholds[id] then ffrg_AcidThresholds[id] = {x = 0, y = 0, threshold = 0} end
                    ffrg_AcidThresholds[id].x = point.x
                    ffrg_AcidThresholds[id].y = point.y
                    ffrg_AcidThresholds[id].threshold = math.min(1,ffrg_AcidThresholds[id].threshold + time_delta) -- This is tracking to let acidified units shield mechs that end up on their tile (like body slam) when they die, even with Thick Skin.
                    edited[id] = true
                end
            end
        end
        for id, data in pairs(ffrg_AcidThresholds) do
            if data and not edited[id] then
                if Board:GetPawn(id) and not Board:GetPawn(id):IsDead() then ffrg_AcidThresholds[id] = nil
                else
                    ffrg_AcidThresholds[id].threshold = ffrg_AcidThresholds[id].threshold - time_delta
                    local threshold = ffrg_AcidThresholds[id].threshold
                    if threshold > 0.4 and threshold < 0.8 then
                        for id2 = 0, 2 do
                            local pawn = Board:GetPawn(id2)
                            if pawn then
                                local space = pawn:GetSpace()
                                if space and space.x == ffrg_AcidThresholds[id].x and space.y == ffrg_AcidThresholds[id].y then
                                    ffrg_GenerateAcidShield(pawn) -- Generates an acid shield if the threshold reaches between 0.4 and 0.8s going downwards only
                                end
                            end
                        end
                    elseif threshold <= 0 then
                        ffrg_AcidThresholds[id] = nil
                    end
                end
            end
        end
    end
end
local function ffrg_onMissionChanged(mission, missionOld)
    if IsPassiveSkill("ffrg_Passive_AcidShield") then
        time_past = os.clock()
    end
end
modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
modApi.events.onMissionChanged:subscribe(ffrg_onMissionChanged)

local function ffrg_AcidTag(skillEffect, queued)
    local effect = queued and skillEffect.q_effect or skillEffect.effect
    if effect == nil then return end
    for i = 1, effect:size() do
        local eff = effect:index(i)
        if eff.loc and eff.iAcid and eff.iAcid == 1 and ( not eff.sScript or eff.sScript == "" ) then
            eff.sScript = [[
                local pawn = Board:GetPawn(]]..eff.loc:GetString()..[[)
                if pawn and pawn:IsMech() then
                    if not pawn:IsShield() then
                        pawn:SetShield(true)
                        Board:DamageSpace(SoundEffect(Point(-1,-1),"props/shield_activated"))
                    end
                    if pawn:IsInfected() then
                        pawn:SetInfected(false)
                    end
                    pawn:SetAcid(false)
                    local space = pawn:GetSpace()
                    modApi:runLater(function()
                        if Board then
                            Board:SetAcid(space,false)
                        end
                    end)
                end
            ]]
        end
    end
end

local function ffrg_onSkillBuild(mission, pawn, weaponId, p1, p2, skillEffect)
    if IsPassiveSkill("ffrg_Passive_AcidShield") then
        ffrg_AcidTag(skillEffect, true)
        ffrg_AcidTag(skillEffect, false)
    end
end

local function ffrg_onSkillStart(mission, pawn, weaponId, p1, p2)
    if IsPassiveSkill("ffrg_Passive_AcidShield") then
        if weaponId == "Move" and pawn and pawn:IsMech() and Board:IsAcid(p2) and Board:GetTerrain(p2) ~= TERRAIN_WATER then -- Exception for moving 1 space onto acid, which the game does instantly, so we remove the acid so the delayed controls can kick in. There are other exceptions like this but this is by far the most common and it's not catastrophic at all if the visuals are slightly altered otherwise.
            local diff = p1-p2
            if diff == Point(-1,0) or diff == Point(1,0) or diff == Point(0,-1) or diff == Point(0,1) then
                Board:SetAcid(p2,false)
            end
        end
    end
end

local function ffrg_onFinalEffectBuild(mission, pawn, weaponId, p1, p2, p3, skillEffect)
    if IsPassiveSkill("ffrg_Passive_AcidShield") then
        ffrg_AcidTag(skillEffect, true)
        ffrg_AcidTag(skillEffect, false)
    end
end

modapiext.events.onSkillBuild:subscribe(ffrg_onSkillBuild)
modapiext.events.onSkillStart:subscribe(ffrg_onSkillStart)
modapiext.events.onFinalEffectBuild:subscribe(ffrg_onFinalEffectBuild)

-- local function ffrg_onBoardClassInitialized(boardClass, boardInstance) -- I'd like to make this allow deployment on acid but it might not be possible
--     boardClass.ffrg_GetDeployLocScoreOld = boardInstance.GetDeployLocScore
--     boardClass.GetDeployLocScore = function(self, point)
--         if IsPassiveSkill("ffrg_Passive_AcidShield") then
--             if Board:IsAcid(point) then return ( self:ffrg_GetDeployLocScoreOld(point) + 5) end
--         end
--         return self:ffrg_GetDeployLocScoreOld(point)
--     end
-- end
-- modApi.events.onBoardClassInitialized:subscribe(ffrg_onBoardClassInitialized)


--////////////////////////////////--





--////////////////////////////////--
--//        Modifications       //--
--////////////////////////////////--


--////////////////////////////////--
