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
    "ffrg_mech_vitriol_h.png"
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


--////////////////////////////////--





--////////////////////////////////--
--//          Palettes          //--
--////////////////////////////////--


--== Bile Drinkers == Green and Dark Purple ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_BileColors",
    Name = "Bile Drinkers",
    PlateHighlight = {250, 182, 208},	--lights
    PlateLight     = {75, 255, 92},	    --main light
    PlateMid       = {5, 139, 60},		--main mid
    PlateDark      = {3, 68, 48},		--main dark
    PlateOutline   = {2, 24, 22},		--main outline
    PlateShadow    = {41, 26, 34},		--metal dark
    BodyColor      = {72, 55, 65},	    --metal mid
    BodyHighlight  = {126, 107, 118},	--metal light
})
local bilePalette = modApi:getPaletteImageOffset("ffrg_BileColors")


--== Ardent Engines == Brown and Cyan ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_ArdentColors",
    Name = "Ardent Engines",
    PlateHighlight = {255, 176, 64},	--lights
    PlateLight     = {124, 88, 54},	    --main light
    PlateMid       = {76, 50, 26},		--main mid
    PlateDark      = {40, 23, 8},		--main dark
    PlateOutline   = {20, 12, 3},		--main outline
    PlateShadow    = {21, 36, 43},		--metal dark
    BodyColor      = {45, 80, 79},	    --metal mid
    BodyHighlight  = {87, 133, 141},	--metal light
})
local ardentPalette = modApi:getPaletteImageOffset("ffrg_ArdentColors")


--== Eminence == Brown and Cyan ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_EminenceColors",
    Name = "Eminence",
    PlateHighlight = {255, 247, 224},	--lights
    PlateLight     = {210, 235, 225},   --main light
    PlateMid       = {103, 124, 115},   --main mid
    PlateDark      = {50, 63, 61},		--main dark
    PlateOutline   = {18, 24, 23},		--main outline
    PlateShadow    = {17, 12, 7},		--metal dark
    BodyColor      = {40, 34, 29},	    --metal mid
    BodyHighlight  = {71, 62, 53},      --metal light
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
    SkillList = { "ffrg_Ranged_Caustic", "ffrg_Passive_AcidShield" },
    SoundLocation = "/mech/prime/inferno_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}


--////////////////////////////////--
