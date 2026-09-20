--////////////////////////////////--
--//   (Arsenal) Drop Weapons   //--
--////////////////////////////////--

--== Prime ==--
-- Palm of Saturn

--== Science ==--
-- Force Rake

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "weapons/ffrg_prime_heavyshove.png",
    "weapons/ffrg_prime_overdriveleap.png",
    "weapons/ffrg_brute_overdrivecharge.png",
    "weapons/ffrg_science_TC_multishove.png",
    "weapons/ffrg_support_overdrivemove.png",
    "weapons/ffrg_support_overdrivebash.png",
    "effects/ffrg_explo_palmswipe_U.png",
    "effects/ffrg_explo_palmswipe_D.png",
    "effects/ffrg_explo_palmswipe_L.png",
    "effects/ffrg_explo_palmswipe_R.png",
    "effects/ffrg_explo_saturn_U.png",
    "effects/ffrg_explo_saturn_D.png",
    "effects/ffrg_explo_saturn_L.png",
    "effects/ffrg_explo_saturn_R.png",
    "effects/ffrg_explo_rake_U_1.png",
    "effects/ffrg_explo_rake_U_2.png",
    "effects/ffrg_explo_rake_D_1.png",
    "effects/ffrg_explo_rake_D_2.png",
    "effects/ffrg_explo_rake_L_1.png",
    "effects/ffrg_explo_rake_L_2.png",
    "effects/ffrg_explo_rake_R_1.png",
    "effects/ffrg_explo_rake_R_2.png"
}

-- Unused (Probably for Pneumatic Pincers?) --
ANIMS.ffrg_Explo_PalmSwipe_0 = Animation:new{
    Image = "effects/ffrg_explo_palmswipe_U.png",
    NumFrames = 9,
    Time = 0.04,
    PosX = -13,
    PosY = -17
}
ANIMS.ffrg_Explo_PalmSwipe_1 = ANIMS.ffrg_Explo_PalmSwipe_0:new{
    Image = "effects/ffrg_explo_palmswipe_R.png",
    PosY = 3
}
ANIMS.ffrg_Explo_PalmSwipe_2 = ANIMS.ffrg_Explo_PalmSwipe_0:new{
    Image = "effects/ffrg_explo_palmswipe_D.png",
    PosX = -40,
    PosY = 3
}
ANIMS.ffrg_Explo_PalmSwipe_3 = ANIMS.ffrg_Explo_PalmSwipe_0:new{
    Image = "effects/ffrg_explo_palmswipe_L.png",
    PosX = -40
}

-- Palm of Saturn --
ANIMS.ffrg_Explo_Saturn_0 = Animation:new{
    Image = "effects/ffrg_explo_saturn_U.png",
    NumFrames = 16,
    Lengths = {0.04,0.04,0.04,0.04,0.04,0.04,0.04,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05},
    PosX = -24,
    PosY = -19
}
ANIMS.ffrg_Explo_Saturn_1 = ANIMS.ffrg_Explo_Saturn_0:new{
    Image = "effects/ffrg_explo_saturn_R.png",
    PosY = -4
}
ANIMS.ffrg_Explo_Saturn_2 = ANIMS.ffrg_Explo_Saturn_0:new{
    Image = "effects/ffrg_explo_saturn_D.png",
    PosX = -48,
    PosY = -4
}
ANIMS.ffrg_Explo_Saturn_3 = ANIMS.ffrg_Explo_Saturn_0:new{
    Image = "effects/ffrg_explo_saturn_L.png",
    PosX = -48
}

-- Force Rake --
ANIMS.ffrg_Explo_Rake_0_1 = Animation:new{
    Image = "effects/ffrg_explo_rake_U_1.png",
    NumFrames = 15,
    Time = 0.025,
    PosX = -27,
    PosY = -17
}
ANIMS.ffrg_Explo_Rake_0_3 = ANIMS.ffrg_Explo_Rake_0_1:new{
    Image = "effects/ffrg_explo_rake_U_2.png",
    PosY = -16
}
ANIMS.ffrg_Explo_Rake_1_0 = ANIMS.ffrg_Explo_Rake_0_1:new{
    Image = "effects/ffrg_explo_rake_R_2.png",
    PosY = -16
}
ANIMS.ffrg_Explo_Rake_1_2 = ANIMS.ffrg_Explo_Rake_0_1:new{
    Image = "effects/ffrg_explo_rake_R_1.png"
}
ANIMS.ffrg_Explo_Rake_2_1 = ANIMS.ffrg_Explo_Rake_0_1:new{
    Image = "effects/ffrg_explo_rake_D_2.png"
}
ANIMS.ffrg_Explo_Rake_2_3 = ANIMS.ffrg_Explo_Rake_0_1:new{
    Image = "effects/ffrg_explo_rake_D_1.png",
    PosY = -16
}
ANIMS.ffrg_Explo_Rake_3_0 = ANIMS.ffrg_Explo_Rake_0_1:new{
    Image = "effects/ffrg_explo_rake_L_1.png",
    PosY = -16
}
ANIMS.ffrg_Explo_Rake_3_2 = ANIMS.ffrg_Explo_Rake_0_1:new{
    Image = "effects/ffrg_explo_rake_L_2.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end


--////////////////////////////////--





--////////////////////////////////--
--//           Weapons          //--
--////////////////////////////////--


--------------------
-- Palm of Saturn --
--------------------

ffrg_Prime_HeavyShove = Skill:new{
    Name = "Palm of Saturn",
    Description = "Shove an adjacent tile away with incredible force.",
    Class = "Prime",
    Icon = "weapons/ffrg_prime_heavyshove.png",
    HitSound = "impact/generic/general",
    HitSound2 = "mech/brute/needle_mech/death",
    Animation = "ffrg_Explo_Saturn_",
    LaunchSound = "props/smoke_flood",
    PathSize = 1,
    Force = 4,
    PowerCost = 1,
    Upgrades = 1,
    UpgradeCost = {4},
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,3),
        Target = Point(2,3),
        Mountain = Point(2,0),
        Length = 5
    }
}

ffrg_Prime_HeavyShove_A = ffrg_Prime_HeavyShove:new{
    UpgradeDescription = "Increase force to infinite.\nKill on impact.",
    Force = ffrg_Shove.FORCE_DEATH
}

Weapon_Texts.ffrg_Prime_HeavyShove_Upgrade1 = "Singularity"

function ffrg_Prime_HeavyShove:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2 - p1)
    local melee = SpaceDamage(p2,0)
    melee.bHide = true
    ffrg_Shove.Shove(p2, direction, self.Force, {standard_anim = false, ret = ret, mode = "simple", delay = 0.27})
    ret:AddScript("Board:AddAnimation("..p2:GetString()..",\""..self.Animation..direction.."\",1)")
    ret:AddDelay(0.2)
    ret:AddDamage(SoundEffect(Point(-1,-1),self.HitSound))
    ret:AddDamage(SoundEffect(Point(-1,-1),self.HitSound2))
    ret:AddDelay(0.05)
    ret:AddMelee(p1, melee, NO_DELAY)
    ret:AddDelay(0.39)
    return ret
end


----------------
-- Force Comb --
----------------

ffrg_Science_TC_MultiShove = Skill:new{
    Name = "Force Rake",
    Description = "Target multiple tiles, shoving them to either side.",
    Class = "Science",
    Icon = "weapons/ffrg_science_TC_multishove.png",
    LaunchSound = "weapons/mass_shift",
    RakeSound = "impact/generic/arachnoid",
    Animation = "ffrg_Explo_Rake_",
    TwoClick = true,
    Range = 2,
    Force = 2,
    PowerCost = 1,
    Upgrades = 2,
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,2),
        Enemy2 = Point(1,1),
        Mountain = Point(3,2),
        Target = Point(1,1),
        Second_Click = Point(2,1),
        Length = 5
    }
}

ffrg_Science_TC_MultiShove_A = ffrg_Science_TC_MultiShove:new{
    UpgradeDescription = "Extend the reach of the attack by 1 tile.",
    Range = 3,
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,2),
        Enemy2 = Point(1,1),
        Enemy3 = Point(1,0),
        Mountain = Point(3,1),
        Target = Point(1,0),
        Second_Click = Point(2,0),
        Length = 5
    }
}
ffrg_Science_TC_MultiShove_B = ffrg_Science_TC_MultiShove:new{
    UpgradeDescription = "Increases force of shove by 1.",
    Force = 3
}
ffrg_Science_TC_MultiShove_AB = ffrg_Science_TC_MultiShove:new{
    Force = 3,
    Range = 3,
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,2),
        Enemy2 = Point(1,1),
        Enemy3 = Point(1,0),
        Mountain = Point(3,1),
        Target = Point(1,0),
        Second_Click = Point(2,0),
        Length = 5
    }
}

Weapon_Texts.ffrg_Science_TC_MultiShove_Upgrade1 = "+1 Range"
Weapon_Texts.ffrg_Science_TC_MultiShove_Upgrade2 = "+1 Force"

local function DirSplit(dir)
    if dir == 0 or dir == 2 then return { 1, 3 }
    else return { 0, 2 } end
    return ""
end

local function direction_rotate(dir, rev)
    if rev then
        if dir ~= 3 then return dir + 1
        else return 0
        end
    else
        if dir ~= 0 then return dir - 1
        else return 3
        end
    end
end

function ffrg_Science_TC_MultiShove:GetTargetArea(point)
	local ret = PointList()
	for i = DIR_START, DIR_END do
		for k = 1, self.Range do
			local curr = DIR_VECTORS[i]*k + point
			ret:push_back(curr)
			if not Board:IsValid(curr) then
				break
			end
		end
	end

	return ret
end

function ffrg_Science_TC_MultiShove:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
    local distance = p1:Manhattan(p2)
    local direction = GetDirection(p2-p1)

    for i = 1, distance do
        local curr = p1+DIR_VECTORS[direction]*i
        local prevdam = SpaceDamage(curr,0,5)
        ret:AddDamage(prevdam)
    end

	return ret
end

function ffrg_Science_TC_MultiShove:GetSecondTargetArea(p1, p2)
	local ret = PointList()
    local distance = p1:Manhattan(p2)
    local direction = GetDirection(p2-p1)
    local split = DirSplit(direction)

    for i = 1, distance do
        local curr = DIR_VECTORS[direction]*i + p1
        for _, j in ipairs(split) do
            curr2 = curr + DIR_VECTORS[j]
            if Board:IsValid(curr2) then
                ret:push_back(curr2)
            end
        end
    end

	return ret
end

local ffrg_Science_TC_MultiShove_delays = {
    0.15,
    0.41,
    0.68
}

function ffrg_Science_TC_MultiShove:GetFinalEffect(p1, p2, p3)
	local ret = SkillEffect()
    local distance = p1:Manhattan(p2)
    local direction = GetDirection(p2-p1)
    local rotated

    local sidevec = DIR_VECTORS[direction_rotate(direction)]
    for i = 1, distance do
        local curr = DIR_VECTORS[direction]*i + p1
        if curr + sidevec == p3 or curr - sidevec == p3 then
            rotated = GetDirection(p3 - curr)
            break
        end
    end
    for i = 1, distance do
        local curr = p1+DIR_VECTORS[direction]*i
        ffrg_Shove.Shove(curr, rotated, self.Force, {ret = ret, mode = "simple", delay = ffrg_Science_TC_MultiShove_delays[i]})
    end
    ret:AddDelay(0.1)
    for i = 1, distance do
        local curr = p1+DIR_VECTORS[direction]*i
        if i ~= 1 then
            ret:AddDelay(0.26)
        end
        local anim = SpaceDamage(curr,0)
        anim.bHide = true
        anim.sSound = self.RakeSound
        anim.sAnimation = self.Animation..direction.."_"..rotated
        ret:AddDamage(anim)
    end

	return ret
end


--------------------
-- Overdrive Line --
--------------------

ffrg_Prime_OverdriveLeap = Skill:new{
    Name = "Overdrive Leap",
    Description = "Leap to a tile within range. Overclock self.",
    Class = "Prime",
    Icon = "weapons/ffrg_prime_overdriveleap.png",
    LaunchSound = "weapons/leap",
    LandSound = "impact/generic/mech",
    Range = 3,
    Limited = 1,
    Upgrades = 2,
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(2,3),
        Target = Point(2,1),
        Length = 5
    }
}
ffrg_Prime_OverdriveLeap_A = ffrg_Prime_OverdriveLeap:new{
    UpgradeDescription = "Remove the restriction on range.",
    Range = 7,
    TipImage = {
        Unit = Point(2,4),
        Target = Point(2,0),
        Length = 5
    }
}
ffrg_Prime_OverdriveLeap_B = ffrg_Prime_OverdriveLeap:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Limited = 2
}
ffrg_Prime_OverdriveLeap_AB = ffrg_Prime_OverdriveLeap:new{
    Range = 7,
    Limited = 2,
    TipImage = {
        Unit = Point(2,4),
        Target = Point(2,0),
        Length = 5
    }
}
Weapon_Texts.ffrg_Prime_OverdriveLeap_Upgrade1 = "Unlimited Range"
Weapon_Texts.ffrg_Prime_OverdriveLeap_Upgrade2 = "+1 Use"
function ffrg_Prime_OverdriveLeap:GetTargetArea(point)
	local ret = PointList()
	for i = DIR_START, DIR_END do
		for k = 1, self.Range do
			local curr = DIR_VECTORS[i]*k + point
			if not Board:IsValid(curr) then
				break
			end
			if not Board:IsBlocked(curr,Pawn:GetPathProf()) then
                ret:push_back(curr)
            end
		end
	end

	return ret
end
function ffrg_Prime_OverdriveLeap:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	local leap = PointList()
    leap:push_back(p1)
    leap:push_back(p2)
    local overclock = ffrg_ActionsPlus.OverclockDamage(p1,{self_force = true})
    overclock.loc = p2
    ret:AddBounce(p1,-2)
    ret:AddBurst(p1,"Emitter_Burst_$tile",DIR_NONE)
    ret:AddLeap(leap,FULL_DELAY)
    ret:AddBounce(p2,2)
    ret:AddDamage(SoundEffect(Point(-1,-1),self.LandSound))
    ret:AddDelay(0.1)
    ret:AddDamage(overclock)
	return ret
end

ffrg_Brute_OverdriveCharge = Skill:new{
    Name = "Overdrive Charge",
    Description = "Charge to a tile. Overclock self.",
    Class = "Brute",
    Icon = "weapons/ffrg_brute_overdrivecharge.png",
    LaunchSound = "/weapons/charge",
    Limited = 1,
    Upgrades = 1,
    UpgradeCost = {2},
    TipImage = {
        Unit = Point(2,3),
        Target = Point(2,1)
    }
}
ffrg_Brute_OverdriveCharge_A = ffrg_Brute_OverdriveCharge:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Limited = 2
}
Weapon_Texts.ffrg_Brute_OverdriveCharge_Upgrade1 = "+1 Use"
function ffrg_Brute_OverdriveCharge:GetTargetArea(point)
	local ret = PointList()
	for i = DIR_START, DIR_END do
		for k = 1, 7 do
			local curr = DIR_VECTORS[i]*k + point
			if not Board:IsValid(curr) then
				break
			end
			if not Board:IsBlocked(curr,Pawn:GetPathProf()) then
                ret:push_back(curr)
            else
                break
            end
		end
	end

	return ret
end
function ffrg_Brute_OverdriveCharge:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
    local direction = GetDirection(p2-p1)
    local distance = p1:Manhattan(p2)
	local charge = PointList()
    for i = 0, distance do
        local curr = p1 + (DIR_VECTORS[direction]*i)
        charge:push_back(curr)
    end
    local overclock = ffrg_ActionsPlus.OverclockDamage(p1,{self_force = true})
    overclock.loc = p2
    ret:AddCharge(charge,NO_DELAY)
    for i = 1, distance do
        local curr = p1 + (DIR_VECTORS[direction]*(i-1))
        ret:AddBounce(curr,-1)
        ret:AddDelay(0.06)
    end
    ret:AddDelay(0.1)
    ret:AddDamage(overclock)
	return ret
end

ffrg_Support_OverdriveMove = Skill:new{
    Name = "Overdrive Scuttle",
    Description = "Move to a tile within distance. Overclock self.",
    Class = "",
    Icon = "weapons/ffrg_support_overdrivemove.png",
    Limited = 1,
    Movement = 2,
    Upgrades = 2,
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(2,3),
        Target = Point(2,1)
    }
}
ffrg_Support_OverdriveMove_A = ffrg_Support_OverdriveMove:new{
    UpgradeDescription = "Increases movement range by 2.",
    Movement = 4,
    TipImage = {
        Unit = Point(3,3),
        Target = Point(1,1)
    }
}
ffrg_Support_OverdriveMove_B = ffrg_Support_OverdriveMove:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Limited = 2
}
ffrg_Support_OverdriveMove_AB = ffrg_Support_OverdriveMove:new{
    Limited = 2,
    Movement = 4,
    TipImage = {
        Unit = Point(3,3),
        Target = Point(1,1)
    }
}
Weapon_Texts.ffrg_Support_OverdriveMove_Upgrade1 = "+2 Move"
Weapon_Texts.ffrg_Support_OverdriveMove_Upgrade2 = "+1 Use"
function ffrg_Support_OverdriveMove:GetTargetArea(point)
	return Board:GetReachable(point, self.Movement, Pawn:GetPathProf())
end
function ffrg_Support_OverdriveMove:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
    local overclock = ffrg_ActionsPlus.OverclockDamage(p1,{self_force = true})
    overclock.loc = p2
    ret:AddMove(Board:GetPath(p1, p2, Pawn:GetPathProf()), FULL_DELAY)
    ret:AddDelay(0.1)
    ret:AddDamage(overclock)
	return ret
end

ffrg_Support_OverdriveBash = Skill:new{
    Name = "Overdrive Bash",
    Description = "Flip an adjacent tile. Overclock self.",
    Class = "",
    Icon = "weapons/ffrg_support_overdrivebash.png",
    LaunchSound = "/weapons/shield_bash",
    Animation = "SwipeClaw1",
    Limited = 1,
    Upgrades = 1,
    UpgradeCost = {2},
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,2),
        Target = Point(2,2)
    }
}
ffrg_Support_OverdriveBash_A = ffrg_Support_OverdriveBash:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Limited = 2
}
Weapon_Texts.ffrg_Support_OverdriveBash_Upgrade1 = "+1 Use"
function ffrg_Support_OverdriveBash:GetTargetArea(point)
	local ret = PointList()
	for i = DIR_START, DIR_END do
        local curr = DIR_VECTORS[i] + point
        if Board:IsValid(curr) then
            ret:push_back(curr)
        end
	end

	return ret
end
function ffrg_Support_OverdriveBash:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
    local damage = SpaceDamage(p2,0,DIR_FLIP)
    damage.sAnimation = self.Animation
    local overclock = ffrg_ActionsPlus.OverclockDamage(p1,{self_force = true})
    ret:AddMelee(p1,damage,NO_DELAY)
    ret:AddDelay(0.2)
    ret:AddDamage(overclock)
	return ret
end


--////////////////////////////////--





--////////////////////////////////--
--//        Modifications       //--
--////////////////////////////////--


--////////////////////////////////--
