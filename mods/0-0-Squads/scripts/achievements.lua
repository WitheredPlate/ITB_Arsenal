--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = mod_loader.mods[modApi.currentMod].resourcePath

local files = {
    "ffrg_Squad_Bile_1.png",
    "ffrg_Squad_Bile_2.png",
    "ffrg_Squad_Bile_3.png",
    "ffrg_Squad_Bile_1_Gray.png",
    "ffrg_Squad_Bile_2_Gray.png",
    "ffrg_Squad_Bile_3_Gray.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/achievements/".. file, path .."img/achievements/".. file)
end


--////////////////////////////////--





--////////////////////////////////--
--//        Achievements        //--
--////////////////////////////////--


local achievements = {
    ffrg_Fluoroantimania = modApi.achievements:add{
        id = "ffrg_Fluoroantimania",
        name = "Fluoroantimania",
        tooltip = "Kill 100 enemies afflicted with acid in a single game.",
        image = path.."img/achievements/ffrg_Squad_Bile_1.png",
        objective = 1,
        squad = "ffrg_BileDrinkers",
    },
    ffrg_Headhunter = modApi.achievements:add{
        id = "ffrg_Headhunter",
        name = "Headhunter",
        tooltip = "Score 18 kills with on-kill weapons in a single island.",
        image = path.."img/achievements/ffrg_Squad_Bile_2.png",
        objective = 1,
        squad = "ffrg_BileDrinkers",
    },
    ffrg_CeruleanBarrier = modApi.achievements:add{
        id = "ffrg_CeruleanBarrier",
        name = "Cerulean Barrier",
        tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission.",
        image = path.."img/achievements/ffrg_Squad_Bile_3.png",
        objective = 1,
        squad = "ffrg_BileDrinkers",
    },
    ffrg_PunchingBags = modApi.achievements:add{
        id = "ffrg_PunchingBags",
        name = "Punching Bags",
        tooltip = "Deal 80 bump damage to enemies within the first two islands.",
        image = path.."img/achievements/ffrg_Squad_Ardent_1.png",
        objective = 1,
        squad = "ffrg_ArdentEngines",
    },
    ffrg_HoleInOne = modApi.achievements:add{
        id = "ffrg_HoleInOne",
        name = "Hole In One",
        tooltip = "Shove an enemy onto lethally hazardous terrain from 3 tiles away with the Blasted Wake.",
        image = path.."img/achievements/ffrg_Squad_Ardent_2.png",
        objective = 1,
        squad = "ffrg_ArdentEngines",
    },
    ffrg_HighGear = modApi.achievements:add{
        id = "ffrg_HighGear",
        name = "High Gear",
        tooltip = "Use Mech movement 22 times in a single battle.",
        image = path.."img/achievements/ffrg_Squad_Ardent_3.png",
        objective = 1,
        squad = "ffrg_ArdentEngines",
    }
}


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function isGame()
    return true
        and Game ~= nil
        and GAME ~= nil
end

local function isMission()
    local mission = GetCurrentMission()
    return true
        and isGame()
        and mission ~= nil
        and mission ~= Mission_Test
end

local function isMissionBoard()
    return true
        and isMission()
        and Board ~= nil
        and Board:IsTipImage() == false
end

function ffrg_Ardent_GolfGet()
    if not isMissionBoard() then
        return
    end

    if not GAME.additionalSquadData.squad == "ffrg_ArdentEngines" then
        return
    end

    if achievements.ffrg_HoleInOne:isComplete() then
        return
    end

    achievements.ffrg_HoleInOne:addProgress(1)
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--

local gameStart = false
local function ffrg_onPreStartGame()
    gameStart = true
end

local function ffrg_onPostStartGame()
    gameStart = false
    GAME.ffrg_AcidKillCount = nil
    GAME.ffrg_KOKillCount = nil
    GAME.ffrg_CeruleanTracker = nil
    GAME.ffrg_BumpDamageCount = 0
    GAME.ffrg_MechMovementCount = nil
end

-------------------
-- Bile Drinkers --
-------------------

-- Fluoroantimania --

local function ffrg_onPawnKilled(mission, pawn)
    if isMissionBoard() then
        if not achievements.ffrg_Fluoroantimania:isComplete() and pawn:GetTeam() == TEAM_ENEMY and pawn:IsAcid() then
            GAME.ffrg_AcidKillCount = ( GAME.ffrg_AcidKillCount or 0 ) + 1
            if GAME.ffrg_AcidKillCount >= 100 then
                achievements.ffrg_Fluoroantimania.tooltip = "Kill 100 enemies afflicted with acid in a single game."
                achievements.ffrg_Fluoroantimania:addProgress(1)
                GAME.ffrg_AcidKillCount = nil
            else
                achievements.ffrg_Fluoroantimania.tooltip = "Kill 100 enemies afflicted with acid in a single game.\n\nProgress: "..GAME.ffrg_AcidKillCount.."/100"
            end
        end
    end
end


-- Headhunter --

local function ffrg_KOTest(mission, pawn, weaponId, skillEffect)
    if skillEffect.effect ~= nil and isMissionBoard() and not achievements.ffrg_Headhunter:isComplete() and pawn then
        if pawn:IsMech() and pawn:IsWeaponPowered(weaponId) and _G[weaponId] and _G[weaponId].OnKill ~= "" then
            local effect = skillEffect.effect
            for i = 1, effect:size() do
                local eff = effect:index(i)
                if eff.loc and eff.bKO_Effect == true then
                    skillEffect:AddScript([[
                        local ach = modApi.achievements:get("ffrg_arsenal_squads","ffrg_Headhunter")
                        if ach and not ach:isComplete() then
                            GAME.ffrg_KOKillCount = ( GAME.ffrg_KOKillCount or 0 ) + 1
                            if GAME.ffrg_KOKillCount >= 18 then
                                ach.tooltip = "Score 18 kills with on-kill weapons in a single island."
                                ach:addProgress(1)
                                GAME.ffrg_KOKillCount = nil
                            else
                                ach.tooltip = "Score 18 kills with on-kill weapons in a single island.\n\nProgress: "..GAME.ffrg_KOKillCount.."/18"
                            end
                        end
                    ]])
                end
            end
        end
    end
end

local function ffrg_onPostIslandSelection()
    if not achievements.ffrg_Headhunter:isComplete() then
        GAME.ffrg_KOKillCount = 0
        achievements.ffrg_Headhunter.tooltip = "Score 18 kills with on-kill weapons in a single island.\n\nProgress: 0/18"
    end
end

local ffrg_onSkillBuild = function(mission, pawn, weaponId, p1, p2, skillEffect)
    ffrg_KOTest(mission, pawn, weaponId, skillEffect)
end

local ffrg_onFinalEffectBuild = function(mission, pawn, weaponId, p1, p2, p3, skillEffect)
    ffrg_KOTest(mission, pawn, weaponId, skillEffect)
end


-- Cerulean Barrier --

local function ffrg_onMissionEnd(mission)
    if not achievements.ffrg_CeruleanBarrier:isComplete() then
        if GAME.ffrg_CeruleanTracker == true then
            achievements.ffrg_CeruleanBarrier:addProgress(1)
        end
        achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission."
        GAME.ffrg_CeruleanTracker = nil
    end
end

local function ffrg_onMissionStart(mission)
    if not achievements.ffrg_CeruleanBarrier:isComplete() then
        GAME.ffrg_CeruleanTracker = true
        achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission.\n\nStatus: POSSIBLE"
    end
    if mission.MapTags and #mission.MapTags > 0 and mission.MapTags[1] == "final_island" and not achievements.ffrg_Headhunter:isComplete() then
        GAME.ffrg_KOKillCount = 0
        achievements.ffrg_Headhunter.tooltip = "Score 18 kills with on-kill weapons in a single island.\n\nProgress: 0/18"
    end
end

local function ffrg_onResetTurn(mission)
    if not achievements.ffrg_CeruleanBarrier:isComplete() then
        if GAME.ffrg_CeruleanTracker and GAME.ffrg_CeruleanTracker == true then
            achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission.\n\nStatus: POSSIBLE"
        else
            achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission.\n\nStatus: FAILED"
        end
    end
end

local function ffrg_TallyShields()
    if Board and Board:GetTurn() > 0 and GAME.ffrg_CeruleanTracker == true then
        local shieldCount = 0
        for id = 0, 2 do
            local pawn = Board:GetPawn(id)
            if pawn and pawn:IsShield() then
                shieldCount = shieldCount + 1
            end
        end
        if shieldCount < 2 then
            GAME.ffrg_CeruleanTracker = false
            achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission.\n\nStatus: FAILED"
        end
    end
end

EXCL = {"GetAmbience", "GetBonusStatus", "BaseUpdate", "UpdateMission", "GetCustomTile", "GetDamage", "GetTurnLimit", "BaseObjectives", "UpdateObjectives",}

for i,v in pairs(Mission) do
    if type(v) == 'function' then
        local oldfn = v
        Mission[i] = function(...)
			if not list_contains(_G["EXCL"], i) then
                if i == "IsEnvironmentEffect" then
                    if Game and Game:GetSquad() == "Bile Drinkers" then
                        ffrg_TallyShields()
                    end
				end
            end
            return oldfn(...)
        end
    end
end


--------------------
-- Ardent Engines --
--------------------

-- Punching Bags --

local function ffrg_onPostIslandSelection()
    if not achievements.ffrg_PunchingBags:isComplete() and Game:GetSector() > 2 then
        GAME.ffrg_BumpDamageCount = nil
        achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands.\n\nStatus: FAILED"
    end
end

local function ffrg_onShoveBumpDamage(mission, point, damage)
    if isMissionBoard() and not achievements.ffrg_PunchingBags:isComplete() and Game:GetSector() < 3 and Board:IsPawnSpace(point) and Board:IsPawnTeam(point,TEAM_ENEMY) then
        local pawn = Board:GetPawn(point)
        if not pawn:IsShield() and not pawn:IsFrozen() then
            local health = pawn:GetHealth()
            shoveBlocker = true
            --LOG("Shove Bump Damage: "..math.min(health,damage))
            GAME.ffrg_BumpDamageCount = (GAME.ffrg_BumpDamageCount or 0) + math.min(health,damage)
            if GAME.ffrg_BumpDamageCount >= 80 then
                achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands."
                achievements.ffrg_PunchingBags:addProgress(1)
                GAME.ffrg_BumpDamageCount = nil
            else
                achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands.\n\nProgress: "..GAME.ffrg_BumpDamageCount.."/80"
            end
        end
    end
end

local pawnTracking = {}
local shoveBlocker = false

local function ffrg_onMissionUpdate(mission)
    if isMissionBoard() and not achievements.ffrg_PunchingBags:isComplete() and Game:GetSector() < 3 then
        shoveBlocker = false
        local nextPawnTracking = {}
        local ids = Board:GetPawns(TEAM_ANY)
        local bumps = 0
        local damages = {}
        if ids:size() > 0 then
            for i = 1, ids:size() do
                local id = ids:index(i)
                local pawn = Board:GetPawn(id)
                if pawn then
                    nextPawnTracking[id] = {}
                    local nextTable = nextPawnTracking[id]
                    nextTable.health = pawn:GetHealth()
                    nextTable.team = pawn:GetTeam()
                    nextTable.space = pawn:GetSpace()
                    nextTable.busy = pawn:IsBusy()
                    if pawnTracking[id] then
                        local lastTable = pawnTracking[id]
                        if nextTable.team == TEAM_ENEMY and nextTable.health < lastTable.health then
                            table.insert(damages, lastTable.health-nextTable.health)
                        end
                        if lastTable.viable == 1 and nextTable.busy == false then lastTable.viable = 2 end
                        if nextTable.space == lastTable.space and nextTable.busy == false and lastTable.busy == true and lastTable.viable == 2 then
                            bumps = bumps + 1
                            nextTable.viable = 0
                        elseif nextTable.busy == false or nextTable.space ~= lastTable.space then
                            nextTable.viable = 0
                        elseif nextTable.busy == true and lastTable.busy == false then
                            nextTable.viable = 1
                        else
                            nextTable.viable = lastTable.viable
                        end
                    end
                end
                pawnTracking[id] = nil
            end
        end
        for id, lastTable in pairs(pawnTracking) do -- pawns that just died
            if lastTable.viable ~= 0 and not shoveBlocker then
                bumps = bumps + 1
            end
            if lastTable.team == TEAM_ENEMY then
                table.insert(damages, lastTable.health)
            end
        end
        if bumps > 0 then
            for i = 1, bumps do
                for j = 1, 2 do
                    if #damages == 0 then break end
                    damage = table.remove(damages)
                    --LOG("Standard Bump Damage: "..damage)
                    GAME.ffrg_BumpDamageCount = (GAME.ffrg_BumpDamageCount or 0) + damage
                    if GAME.ffrg_BumpDamageCount >= 80 then
                        achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands."
                        achievements.ffrg_PunchingBags:addProgress(1)
                        GAME.ffrg_BumpDamageCount = nil
                    else
                        achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands.\n\nProgress: "..GAME.ffrg_BumpDamageCount.."/80"
                    end
                end
            end
        end
        pawnTracking = nextPawnTracking
    end
end


-- High Gear --

local function ffrg_onMissionEnd2(mission)
    if not achievements.ffrg_HighGear:isComplete() then
        achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle."
        GAME.ffrg_MechMovementCount = nil
    end
end

local function ffrg_onMissionStart2(mission)
    if not achievements.ffrg_HighGear:isComplete() then
        achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle.\n\nProgress: 0/22"
        GAME.ffrg_MechMovementCount = nil
    end
    if mission.MapTags and #mission.MapTags > 0 and mission.MapTags[1] == "final_island" and not achievements.ffrg_PunchingBags:isComplete() then
        GAME.ffrg_BumpDamageCount = nil
        achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands.\n\nStatus: FAILED"
    end
end

local ffrg_onPawnMoveEnd = function(mission, pawn)
    if isMissionBoard() and not achievements.ffrg_HighGear:isComplete() and pawn:IsMech() then
        GAME.ffrg_MechMovementCount = ( GAME.ffrg_MechMovementCount or 0 ) + 1
        if GAME.ffrg_MechMovementCount >= 22 then
            achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle."
            achievements.ffrg_HighGear:addProgress(1)
            GAME.ffrg_MechMovementCount = nil
        else
            achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle.\n\nProgress: "..GAME.ffrg_MechMovementCount.."/22"
        end
    end
end

local ffrg_onPawnUndoMove = function(mission, pawn, undonePosition)
    if isMissionBoard() and not achievements.ffrg_HighGear:isComplete() then
        GAME.ffrg_MechMovementCount = math.max((GAME.ffrg_MechMovementCount or 0 ) - 1, 0)
        achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle.\n\nProgress: "..GAME.ffrg_MechMovementCount.."/22"
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function ffrg_onSquadEnteredGame(squadId)
    if squadId == "ffrg_BileDrinkers" then
        modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)
        modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
        modApi.events.onPostIslandSelection:subscribe(ffrg_onPostIslandSelection)
        modapiext.events.onPawnKilled:subscribe(ffrg_onPawnKilled)
        modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn)
        modapiext.events.onSkillBuild:subscribe(ffrg_onSkillBuild)
        modapiext.events.onFinalEffectBuild:subscribe(ffrg_onFinalEffectBuild)
        if GAME.ffrg_AcidKillCount then
            achievements.ffrg_Fluoroantimania.tooltip = "Kill 100 enemies afflicted with acid in a single game.\n\nProgress: "..GAME.ffrg_AcidKillCount.."/100"
        else
            if achievements.ffrg_Fluoroantimania:isComplete() then
                achievements.ffrg_Fluoroantimania.tooltip = "Kill 100 enemies afflicted with acid in a single game."
            else
                achievements.ffrg_Fluoroantimania.tooltip = "Kill 100 enemies afflicted with acid in a single game.\n\nProgress: 0/100"
                GAME.ffrg_AcidKillCount = 0
            end
        end
        if GAME.ffrg_KOKillCount then
            achievements.ffrg_Headhunter.tooltip = "Score 18 kills with on-kill weapons in a single island.\n\nProgress: "..GAME.ffrg_KOKillCount.."/18"
        else
            achievements.ffrg_Headhunter.tooltip = "Score 18 kills with on-kill weapons in a single island."
        end
        if GAME.ffrg_CeruleanTracker ~= nil then
            if GAME.ffrg_CeruleanTracker then
                achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission.\n\nStatus: POSSIBLE"
            else
                achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission.\n\nStatus: FAILED"
            end
        else
            achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission."
        end
    elseif squadId == "ffrg_ArdentEngines" then
        modApi.events.onPostIslandSelection:subscribe(ffrg_onPostIslandSelection)
        modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd2)
        modApi.events.onMissionStart:subscribe(ffrg_onMissionStart2)
        modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
        modapiext.events.onPawnKilled:subscribe(ffrg_onPawnKilled)
        modapiext.events.onPawnMoveEnd:subscribe(ffrg_onPawnMoveEnd)
        modapiext.events.onPawnUndoMove:subscribe(ffrg_onPawnUndoMove)
        ffrg_Shove.events.onShoveBumpDamage:subscribe(ffrg_onShoveBumpDamage)
        if GAME.ffrg_BumpDamageCount then
            achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands.\n\nProgress: "..GAME.ffrg_BumpDamageCount.."/80"
        elseif achievements.ffrg_HighGear:isComplete() then
            achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands."
        elseif gameStart then
            achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands.\n\nProgress: 0/80"
        else
            achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands.\n\nStatus: FAILED"
        end
        if GAME.ffrg_MechMovementCount then
            achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle.\n\nProgress: "..GAME.ffrg_MechMovementCount.."/22"
        else
            achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle."
        end
    end
end

local function ffrg_onSquadExitedGame(squadId)
    if squadId == "ffrg_BileDrinkers" then
        modApi.events.onMissionEnd:unsubscribe(ffrg_onMissionEnd)
        modApi.events.onMissionStart:unsubscribe(ffrg_onMissionStart)
        modApi.events.onPostIslandSelection:unsubscribe(ffrg_onPostIslandSelection)
        modapiext.events.onResetTurn:unsubscribe(ffrg_onResetTurn)
        modapiext.events.onSkillBuild:unsubscribe(ffrg_onSkillBuild)
        modapiext.events.onFinalEffectBuild:unsubscribe(ffrg_onFinalEffectBuild)
        achievements.ffrg_Fluoroantimania.tooltip = "Kill 100 enemies afflicted with acid in a single game."
        achievements.ffrg_Headhunter.tooltip = "Score 18 kills with on-kill weapons in a single island."
        achievements.ffrg_CeruleanBarrier.tooltip = "Maintain shields for at least two mechs by the end of every turn of a mission."
    elseif squadId == "ffrg_ArdentEngines" then
        modApi.events.onPostIslandSelection:unsubscribe(ffrg_onPostIslandSelection)
        modApi.events.onMissionEnd:unsubscribe(ffrg_onMissionEnd2)
        modApi.events.onMissionStart:unsubscribe(ffrg_onMissionStart2)
        modApi.events.onMissionUpdate:unsubscribe(ffrg_onMissionUpdate)
        modapiext.events.onPawnMoveEnd:unsubscribe(ffrg_onPawnMoveEnd)
        modapiext.events.onPawnUndoMove:unsubscribe(ffrg_onPawnUndoMove)
        ffrg_Shove.events.onShoveBumpDamage:unsubscribe(ffrg_onShoveBumpDamage)
        achievements.ffrg_PunchingBags.tooltip = "Deal 80 bump damage to enemies within the first two islands."
        achievements.ffrg_HighGear.tooltip = "Use Mech movement 22 times in a single battle."
    end
end

modApi.events.onPreStartGame:subscribe(ffrg_onPreStartGame)
modApi.events.onPostStartGame:subscribe(ffrg_onPostStartGame)
modApi.events.onSquadEnteredGame:subscribe(ffrg_onSquadEnteredGame)
modApi.events.onSquadExitedGame:subscribe(ffrg_onSquadExitedGame)


--////////////////////////////////--
