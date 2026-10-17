--////////////////////////////////--
--//   (Arsenal) Squad Units    //--
--////////////////////////////////--


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/units/player/"

local files = {
    "ffrg_mech_archon.png",
    "ffrg_mech_archon_a.png",
    "ffrg_mech_archon_broken.png",
    "ffrg_mech_archon_w_broken.png",
    "ffrg_mech_archon_ns.png",
    "ffrg_mech_archon_h.png",
    "ffrg_mech_splitter.png",
    "ffrg_mech_splitter_a.png",
    "ffrg_mech_splitter_w.png",
    "ffrg_mech_splitter_broken.png",
    "ffrg_mech_splitter_w_broken.png",
    "ffrg_mech_splitter_ns.png",
    "ffrg_mech_splitter_h.png",
    "ffrg_mech_vitriol.png",
    "ffrg_mech_vitriol_a.png",
    "ffrg_mech_vitriol_w.png",
    "ffrg_mech_vitriol_broken.png",
    "ffrg_mech_vitriol_w_broken.png",
    "ffrg_mech_vitriol_ns.png",
    "ffrg_mech_vitriol_h.png",
    "ffrg_mech_blast.png",
    "ffrg_mech_blast_a.png",
    "ffrg_mech_blast_w.png",
    "ffrg_mech_blast_broken.png",
    "ffrg_mech_blast_w_broken.png",
    "ffrg_mech_blast_ns.png",
    "ffrg_mech_blast_h.png",
    "ffrg_mech_shackle.png",
    "ffrg_mech_shackle_a.png",
    "ffrg_mech_shackle_w.png",
    "ffrg_mech_shackle_broken.png",
    "ffrg_mech_shackle_w_broken.png",
    "ffrg_mech_shackle_ns.png",
    "ffrg_mech_shackle_h.png",
    "ffrg_mech_gale.png",
    "ffrg_mech_gale_a.png",
    "ffrg_mech_gale_broken.png",
    "ffrg_mech_gale_w_broken.png",
    "ffrg_mech_gale_ns.png",
    "ffrg_mech_gale_h.png",
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/units/player/".. file, imagePath .. file)
end


--== Archon Mech ==--
ANIMS.ffrg_mech_archon = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_archon.png",
    PosX = -18,
    PosY = -13
}
ANIMS.ffrg_mech_archona = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_archon_a.png",
    PosX = -18,
    PosY = -13,
    NumFrames = 6
}
ANIMS.ffrg_mech_archon_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_archon_broken.png",
    PosX = -18,
    PosY = -1
}
ANIMS.ffrg_mech_archonw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_archon_w_broken.png",
    PosX = -16,
    PosY = 14
}
ANIMS.ffrg_mech_archon_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_archon_ns.png"
}

--== Splitter Mech ==--
ANIMS.ffrg_mech_splitter = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_splitter.png",
    PosX = -21,
    PosY = -2
}
ANIMS.ffrg_mech_splittera = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_splitter_a.png",
    PosX = -21,
    PosY = -2,
    NumFrames = 4
}
ANIMS.ffrg_mech_splitterw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_splitter_w.png",
    PosX = -22,
    PosY = 6
}
ANIMS.ffrg_mech_splitter_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_splitter_broken.png",
    PosX = -21,
    PosY = 0
}
ANIMS.ffrg_mech_splitterw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_splitter_w_broken.png",
    PosX = -21,
    PosY = 9
}
ANIMS.ffrg_mech_splitter_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_splitter_ns.png"
}

--== Vitriol Mech ==--
ANIMS.ffrg_mech_vitriol = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_vitriol.png",
    PosX = -19,
    PosY = -1
}
ANIMS.ffrg_mech_vitriola = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_vitriol_a.png",
    PosX = -19,
    PosY = -1,
    NumFrames = 4
}
ANIMS.ffrg_mech_vitriolw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_vitriol_w.png",
    PosX = -19,
    PosY = 12
}
ANIMS.ffrg_mech_vitriol_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_vitriol_broken.png",
    PosX = -19,
    PosY = 1
}
ANIMS.ffrg_mech_vitriolw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_vitriol_w_broken.png",
    PosX = -19,
    PosY = 14
}
ANIMS.ffrg_mech_vitriol_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_vitriol_ns.png"
}

--== Blast Mech ==--
ANIMS.ffrg_mech_blast = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_blast.png",
    PosX = -20,
    PosY = 2
}
ANIMS.ffrg_mech_blasta = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_blast_a.png",
    PosX = -20,
    PosY = 2,
    NumFrames = 6
}
ANIMS.ffrg_mech_blast_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_blast_broken.png",
    PosX = -20,
    PosY = 3
}
ANIMS.ffrg_mech_blastw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_blast_w.png",
    PosX = -18,
    PosY = 13
}
ANIMS.ffrg_mech_blastw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_blast_w_broken.png",
    PosX = -18,
    PosY = 14
}
ANIMS.ffrg_mech_blast_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_blast_ns.png"
}

--== Shackle Mech ==--
ANIMS.ffrg_mech_shackle = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_shackle.png",
    PosX = -19,
    PosY = -5
}
ANIMS.ffrg_mech_shacklea = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_shackle_a.png",
    PosX = -19,
    PosY = -5,
    NumFrames = 6
}
ANIMS.ffrg_mech_shackle_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_shackle_broken.png",
    PosX = -24,
    PosY = -1
}
ANIMS.ffrg_mech_shacklew = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_shackle_w.png",
    PosX = -20,
    PosY = 8
}
ANIMS.ffrg_mech_shacklew_broken = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_shackle_w_broken.png",
    PosX = -17,
    PosY = 15
}
ANIMS.ffrg_mech_shackle_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_shackle_ns.png"
}

--== Gale Mech ==--
ANIMS.ffrg_mech_gale = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_gale.png",
    PosX = -16,
    PosY = -8
}
ANIMS.ffrg_mech_galea = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_gale_a.png",
    PosX = -16,
    PosY = -8,
    NumFrames = 4
}
ANIMS.ffrg_mech_gale_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_gale_broken.png",
    PosX = -15,
    PosY = -2
}
ANIMS.ffrg_mech_galew_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_gale_w_broken.png",
    PosX = -14,
    PosY = 15
}
ANIMS.ffrg_mech_gale_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_gale_ns.png"
}


--////////////////////////////////--





--////////////////////////////////--
--//          Palettes          //--
--////////////////////////////////--


--== Bile Drinkers == Green and Purple ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_BileColors",
    Name = "Bile Drinkers",
    PlateHighlight = {255, 128, 235},	--lights
    PlateLight     = {75, 255, 92},	    --main light
    PlateMid       = {5, 139, 60},		--main mid
    PlateDark      = {32, 62, 53},		--main dark
    PlateOutline   = {12, 22, 21},		--main outline
    PlateShadow    = {37, 30, 33},		--metal dark
    BodyColor      = {79, 50, 67},	    --metal mid
    BodyHighlight  = {126, 107, 118},	--metal light
})
local bilePalette = modApi:getPaletteImageOffset("ffrg_BileColors")


--== Ardent Engines == Bronze and Gray ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_ArdentColors",
    Name = "Ardent Engines",
    PlateHighlight = {71, 154, 255},	--lights
    PlateLight     = {195, 106, 78},	    --main light
    PlateMid       = {112, 44, 33},		--main mid
    PlateDark      = {50, 29, 27},		--main dark
    PlateOutline   = {19, 13, 13},		--main outline
    PlateShadow    = {25, 31, 36},		--metal dark
    BodyColor      = {51, 65, 69},	    --metal mid
    BodyHighlight  = {99, 121, 129},	--metal light
})
local ardentPalette = modApi:getPaletteImageOffset("ffrg_ArdentColors")


--== Eminence == White and Dark Brown ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_EminenceColors",
    Name = "Eminence",
    PlateHighlight = {255, 153, 91},	--lights
    PlateLight     = {210, 235, 225},   --main light
    PlateMid       = {103, 124, 115},   --main mid
    PlateDark      = {50, 63, 61},		--main dark
    PlateOutline   = {18, 24, 23},		--main outline
    PlateShadow    = {17, 12, 7},		--metal dark
    BodyColor      = {40, 34, 29},	    --metal mid
    BodyHighlight  = {83, 72, 61},      --metal light
})
local eminencePalette = modApi:getPaletteImageOffset("ffrg_EminenceColors")


--////////////////////////////////--





--////////////////////////////////--
--//            Units           //--
--////////////////////////////////--


-----------------
-- Archon Mech --
-----------------

ffrg_ArchonMech = Pawn:new{
    Name = "Archon Mech",
    Class = "Prime",
    Health = 3,
    MoveSpeed = 3,
    Image = "ffrg_mech_archon",
    ImageOffset = bilePalette,
    SkillList = { "ffrg_Prime_KO_BodySlam" },
    SoundLocation = "/mech/science/superman_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Flying = true,
    Massive = true,
    LargeShield = true,
}

-------------------
-- Splitter Mech --
-------------------

ffrg_SplitterMech = Pawn:new{
    Name = "Splitter Mech",
    Class = "Brute",
    Health = 3,
    MoveSpeed = 3,
    Image = "ffrg_mech_splitter",
    ImageOffset = bilePalette,
    SkillList = { "ffrg_Brute_SplitShot" },
    SoundLocation = "/mech/brute/tank/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}

------------------
-- Vitriol Mech --
------------------

ffrg_VitriolMech = Pawn:new{
    Name = "Vitriol Mech",
    Class = "Ranged",
    Health = 2,
    MoveSpeed = 4,
    Image = "ffrg_mech_vitriol",
    ImageOffset = bilePalette,
    SkillList = { "ffrg_Ranged_TC_Caustic", "ffrg_Passive_AcidShield" },
    SoundLocation = "/mech/prime/inferno_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}

----------------
-- Blast Mech --
----------------

ffrg_BlastMech = Pawn:new{
    Name = "Blast Mech",
    Class = "Brute",
    Health = 3,
    MoveSpeed = 4,
    Image = "ffrg_mech_blast",
    ImageOffset = ardentPalette,
    SkillList = { "ffrg_Brute_ShoveCharge" },
    SoundLocation = "/support/train_armored/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}

------------------
-- Shackle Mech --
------------------

ffrg_ShackleMech = Pawn:new{
    Name = "Shackle Mech",
    Class = "Ranged",
    Health = 3,
    MoveSpeed = 3,
    Image = "ffrg_mech_shackle",
    ImageOffset = ardentPalette,
    SkillList = { "ffrg_Ranged_TC_ChainShot" },
    SoundLocation = "/mech/distance/trimissile_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}

---------------
-- Gale Mech --
---------------

ffrg_GaleMech = Pawn:new{
    Name = "Gale Mech",
    Class = "Science",
    Health = 2,
    MoveSpeed = 4,
    Image = "ffrg_mech_gale",
    ImageOffset = ardentPalette,
    SkillList = { "ffrg_Science_Accelerate" },
    SoundLocation = "/mech/science/hydrant_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Flying = true,
    Massive = true,
}


--////////////////////////////////--
