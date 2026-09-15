--////////////////////////////////--
--//   (Arsenal) General Units  //--
--////////////////////////////////--

--== Inanimate ==--
-- Slab
-- Explosive Slab

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/units/"

local files = {
    "inanimate/ffrg_barrier_1.png",
    "inanimate/ffrg_barrier_1_emerge.png",
    "inanimate/ffrg_barrier_1_death.png",
    "inanimate/ffrg_barrier_2.png",
    "inanimate/ffrg_barrier_2_emerge.png",
    "inanimate/ffrg_barrier_2_death.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/units/".. file, imagePath .. file)
end

--== Slab ==--
ANIMS.ffrg_barrier1 = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_1.png",
    PosX = -19,
    PosY = -14
}
ANIMS.ffrg_barrier1d = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_1_death.png",
    PosX = -36,
    PosY = -30,
    NumFrames = 13,
    Time = 0.09,
    Loop = false
}
ANIMS.ffrg_barrier1e = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_1_emerge.png",
    PosX = -24,
    PosY = -14,
    NumFrames = 10,
    Time = 0.06,
    Loop = false
}
ANIMS.ffrg_barrier1_thrown = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_1.png",
    PosX = -19,
    PosY = -14
}
ANIMS.ffrg_barrier1_thrownd = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_1_death.png",
    PosX = -36,
    PosY = -30,
    NumFrames = 13,
    Time = 0.09,
    Loop = false
}
ANIMS.ffrg_barrier2 = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_2.png",
    PosX = -19,
    PosY = -14
}
ANIMS.ffrg_barrier2d = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_2_death.png",
    PosX = -36,
    PosY = -30,
    NumFrames = 13,
    Time = 0.09,
    Loop = false
}
ANIMS.ffrg_barrier2e = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_2_emerge.png",
    PosX = -24,
    PosY = -14,
    NumFrames = 10,
    Time = 0.06,
    Loop = false
}
ANIMS.ffrg_barrier2_thrown = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_2.png",
    PosX = -19,
    PosY = -14
}
ANIMS.ffrg_barrier2_thrownd = ANIMS.BaseUnit:new{
    Image = "units/inanimate/ffrg_barrier_2_death.png",
    PosX = -36,
    PosY = -30,
    NumFrames = 13,
    Time = 0.09,
    Loop = false
}

--////////////////////////////////--





--////////////////////////////////--
--//            Units           //--
--////////////////////////////////--

----------
-- Slab --
----------

ffrg_Slab1 = Pawn:new{
    Name = "Slab",
    Health = 2,
    Armor = true,
    Neutral = true,
    MoveSpeed = 0,
    IsPortrait = false,
    Image = "ffrg_barrier1",
    SoundLocation = "/support/rock/",
    DefaultTeam = TEAM_NONE,
    ImpactMaterial = IMPACT_SHIELD
}

ffrg_Slab1_Thrown = ffrg_Slab1:new{
    Image = "ffrg_barrier1_thrown",
}

--------------------
-- Explosive Slab --
--------------------

ffrg_BombSlab = ffrg_Slab1:new{
    Name = "Explosive Slab",
    Explodes = true,
    Image = "ffrg_barrier2",
    SoundLocation = "/support/bombrock/",
}

ffrg_BombSlab_Thrown = ffrg_BombSlab:new{
    Image = "ffrg_barrier2_thrown",
}

--////////////////////////////////--
