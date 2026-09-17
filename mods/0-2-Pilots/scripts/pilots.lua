--////////////////////////////////--
--//      (Arsenal) Pilots      //--
--////////////////////////////////--

--== Unique ==--
-- Finn Smith

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "portraits/pilots/ffrg_Pilot_Stable.png",
    "portraits/pilots/ffrg_Pilot_Stable_2.png",
    "portraits/pilots/ffrg_Pilot_Stable_blink.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

--////////////////////////////////--





--////////////////////////////////--
--//           Pilots           //--
--////////////////////////////////--


local tooltips = require(path .."scripts/libs/tooltip")


----------------
-- Finn Smith --
----------------

local dialog_stable = require(path .."scripts/dialogs/dialog_stable")

local pilot_stable = {
    Id = "ffrg_Pilot_Stable",
    Personality = "ffrg_Stable",
    Name = "Finn Smith",
    Voice = "/voice/abe",
    Skill = "ffrg_Stable",
    Blacklist = {"Pain","Move","Adrenaline"},
}

tooltips.Add(
    "ffrg_Stable",
    PilotSkill(
        "Unyielding",
        "Mech gains Stable and +1 Move."
    )
)

if Personality["ffrg_Stable"] then
    Personality["ffrg_Stable"]:AddDialogTable(dialog_stable)
else
    local personality_stable = CreatePilotPersonality("ffrg_Stable")
    personality_stable:AddDialogTable(dialog_stable)
    Personality["ffrg_Stable"] = personality_stable
end

CreatePilot(pilot_stable)

local function ffrg_onMissionStart(mission)
    for id = 0, 2 do
        if Game:GetPawn(id) and Game:GetPawn(id):GetAbility() == pilot_stable.Skill then
            Game:GetPawn(id):SetPushable(false)
            mission.ffrg_FinnApplied = true
        end
    end
end

local function ffrg_onMissionEnd(mission)
    if mission.ffrg_FinnApplied then
        for id = 0, 2 do
            if Game:GetPawn(id) and Game:GetPawn(id):GetAbility() == pilot_stable.Skill then
                Game:GetPawn(id):SetPushable(true)
            end
        end
    end
end

modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)
