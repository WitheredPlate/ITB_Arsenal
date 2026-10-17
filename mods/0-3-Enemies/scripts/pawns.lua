--////////////////////////////////--
--//    (Impact) Enemy Units    //--
--////////////////////////////////--

--== Vek ==--
-- Snail
-- Haste Psion

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "units/aliens/ffrg_snail.png",
    "units/aliens/ffrg_snaila.png",
    "units/aliens/ffrg_snail_emerge.png",
    "units/aliens/ffrg_snail_death.png",
    "units/aliens/ffrg_snail_Bw.png",
    "units/aliens/ffrg_snail_revive.png",
    "units/aliens/ffrg_shell.png",
    "units/aliens/ffrg_shell_death.png",
    "units/aliens/ffrg_shell_Bw.png",
    "portraits/enemy/ffrg_Snail1.png",
    "portraits/enemy/ffrg_Snail2.png",
    "portraits/enemy/ffrg_SnailB.png",
    "units/aliens/ffrg_jelly_speed.png",
    "units/aliens/ffrg_jelly_speeda.png",
    "units/aliens/ffrg_jelly_speed_ns.png",
    "units/aliens/ffrg_jelly_speed_emerge.png",
    "units/aliens/ffrg_jelly_speed_death.png",
    "units/aliens/ffrg_jelly_speed_icon.png",
    "portraits/enemy/ffrg_Jelly_Speed1.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

--== Snail ==--
ANIMS.ffrg_snail = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_snail.png",
    PosX = -19,
    PosY = -1
}
ANIMS.ffrg_snaila = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_snaila.png",
    NumFrames = 4,
    PosX = -19,
    PosY = -1
}
ANIMS.ffrg_snaile = ANIMS.BaseEmerge:new{
    Image = "units/aliens/ffrg_snail_emerge.png",
    PosX = -23,
    PosY = -9
}
ANIMS.ffrg_snaild = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_snail_death.png",
    NumFrames = 8,
    PosX = -19,
    PosY = -1,
    Time = 0.14,
    Loop = false,
}
ANIMS.ffrg_snailw = ANIMS.BaseUnit:new{
    Image = "units/aliens/ffrg_snail_Bw.png",
    PosX = -19,
    PosY = 10
}
ANIMS.ffrg_snailr = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_snail_revive.png",
    NumFrames = 8,
    PosX = -19,
    PosY = -1,
    Time = 0.14,
    Loop = false,
}

--== Shell ==--
ANIMS.ffrg_shell = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_shell.png",
    PosX = -15,
    PosY = 3
}
ANIMS.ffrg_shelld = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_shell_death.png",
    NumFrames = 8,
    Time = 0.14,
    Loop = false,
    PosX = -23,
    PosY = 1
}
ANIMS.ffrg_shellw = ANIMS.BaseUnit:new{
    Image = "units/aliens/ffrg_shell_Bw.png",
    PosX = -16,
    PosY = 13
}

--== Haste Psion ==--
ANIMS.ffrg_jelly_speed = ANIMS.BaseUnit:new{
    Image = "units/aliens/ffrg_jelly_speed.png",
    PosX = -16,
    PosY = -14
}
ANIMS.ffrg_jelly_speeda = ANIMS.BaseUnit:new{
    Image = "units/aliens/ffrg_jelly_speeda.png",
    PosX = -17,
    PosY = -14,
    NumFrames = 4
}
ANIMS.ffrg_jelly_speede = ANIMS.BaseEmerge:new{
    Image = "units/aliens/ffrg_jelly_speed_emerge.png",
    PosX = -23,
    PosY = -21,
    Height = 1
}
ANIMS.ffrg_jelly_speedd = ANIMS.BaseUnit:new{
    Image = "units/aliens/ffrg_jelly_speed_death.png",
    PosX = -18,
    PosY = -14,
    NumFrames = 8,
    Time = 0.14,
    Loop = false
}
ANIMS.ffrg_jelly_speed_ns = ANIMS.MechIcon:new{
    Image = "units/aliens/ffrg_jelly_speed_ns.png",
    Height = 1
}
ANIMS.ffrg_jelly_speed_icon = ANIMS.ffrg_jelly_speed:new{
    Image = "units/aliens/ffrg_jelly_speed_icon.png"
}
ANIMS.ffrg_jelly_speed_icona = ANIMS.ffrg_jelly_speeda:new{
}
ANIMS.ffrg_jelly_speed_icone = ANIMS.ffrg_jelly_speede:new{
}
ANIMS.ffrg_jelly_speed_icond = ANIMS.ffrg_jelly_speedd:new{
}
ANIMS.ffrg_jelly_speed_icon_ns = ANIMS.ffrg_jelly_speed_ns:new{
}


--////////////////////////////////--





--////////////////////////////////--
--//            Units           //--
--////////////////////////////////--


-----------
-- Snail --
-----------

ffrg_Snail1 = Pawn:new{
    Name = "Snail",
    Health = 2,
    MoveSpeed = 2,
    Image = "ffrg_snail",
    SkillList = {  },
    Ranged = 1,
    SoundLocation = "/enemy/burnbug_1/",
    Portrait = "enemy/ffrg_Snail1",
    DefaultTeam = TEAM_ENEMY,
    ImpactMaterial = IMPACT_INSECT,
}
AddPawnName("ffrg_Snail1")


-----------------
-- Alpha Snail --
-----------------

ffrg_Snail2 = ffrg_Snail1:new{
    Name = "Alpha Snail",
    Health = 3,
    ImageOffset = 1,
    SkillList = {  },
    SoundLocation = "/enemy/burnbug_2/",
    Portrait = "enemy/ffrg_Snail2",
    Tier = TIER_ALPHA
}
AddPawnName("ffrg_Snail2")


------------------
-- Snail Leader --
------------------

ffrg_SnailBoss = ffrg_Snail1:new{
    Name = "Snail Leader",
    Health = 4,
    Massive = true,
    ImageOffset = 2,
    SkillList = {  },
    Portrait = "enemy/ffrg_SnailB",
    Tier = TIER_BOSS
}
AddPawnName("ffrg_SnailBoss")


-----------
-- Shell --
-----------

ffrg_Shell1 = Pawn:new{
    Name = "Shell",
    Minor = true,
    IgnoreSmoke = true,
    IsPortrait = false,
    Health = 1,
    Armor = true,
    MoveSpeed = 0,
    Image = "ffrg_shell",
    SkillList = {  },
    SoundLocation = "/support/vek_egg/",
    DefaultTeam = TEAM_ENEMY,
    ImpactMaterial = IMPACT_INSECT,
}
AddPawnName("ffrg_Shell1")


-----------------
-- Alpha Shell --
-----------------

ffrg_Shell2 = ffrg_Shell1:new{
    Name = "Alpha Shell",
    Health = 2,
    ImageOffset = 1,
    SkillList = {  },
    Tier = TIER_ALPHA
}
AddPawnName("ffrg_Shell2")


------------------
-- Shell Leader --
------------------

ffrg_ShellBoss = ffrg_Shell1:new{
    Name = "Shell Leader",
    Health = 3,
    Massive = true,
    ImageOffset = 2,
    SkillList = {  },
    Tier = TIER_BOSS
}
AddPawnName("ffrg_ShellBoss")


-----------------
-- Haste Psion --
-----------------

ffrg_Jelly_Speed1 = Pawn:new{
    Name = "Haste Psion",
    Health = 2,
    LargeShield = true,
    Image = "ffrg_jelly_speed",
    VoidShockImmune = true,
    MoveSpeed = 2,
    DefaultTeam = TEAM_ENEMY,
    ImpactMaterial = IMPACT_BLOB,
    SoundLocation = "/enemy/jelly/",
    Flying = true,
    Leader = FFRG_LEADER_HASTE,
    Tooltip = "ffrg_Jelly_Speed_Tooltip"
}
AddPawnName("ffrg_Jelly_Speed1")

local ffrg_onGameStateChanged = function(newGameState, oldGameState)
	if newGameState == "Map" then
		ffrg_Jelly_Speed1.Image = "ffrg_jelly_speed_icon"
	else
		ffrg_Jelly_Speed1.Image = "ffrg_jelly_speed"
	end
end
modApi.events.onGameStateChanged:subscribe(ffrg_onGameStateChanged)
