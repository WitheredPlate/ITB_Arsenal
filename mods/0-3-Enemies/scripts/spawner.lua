local archiveList = easyEdit.enemyList:get("archive")
local rstList = easyEdit.enemyList:get("rst")
local pinnacleList = easyEdit.enemyList:get("pinnacle")
local detritusList = easyEdit.enemyList:get("detritus")
local archiveBossList = easyEdit.bossList:get("archive")
local rstBossList = easyEdit.bossList:get("rst")
local pinnacleBossList = easyEdit.bossList:get("pinnacle")
local detritusBossList = easyEdit.bossList:get("detritus")

local function myriadAddEnemy(enemy, category, config)
    config = config or {}
    config.leader = config.leader or false
    archiveList:addEnemy(enemy, category)
    rstList:addEnemy(enemy, category)
    pinnacleList:addEnemy(enemy, category)
    detritusList:addEnemy(enemy, category)
    if config.lock then
        IslandLocks[enemy] = config.lock
    end
    if config.leader then
        archiveBossList:addBoss("Mission_"..enemy.."Boss")
        rstBossList:addBoss("Mission_"..enemy.."Boss")
        pinnacleBossList:addBoss("Mission_"..enemy.."Boss")
        detritusBossList:addBoss("Mission_"..enemy.."Boss")
        BossesList[enemy.."Boss"] = true
        if config.leaderLock then
            IslandLocks["Mission_"..enemy.."Boss"] = config.leaderLock
        end
    end
end

myriadAddEnemy("ffrg_Jelly_Speed", "Leaders", {leader = false, lock = 4})
--myriadAddEnemy("ffrg_Slug", "Unique", {leader = true, lock = 3, leaderLock = 3})
--myriadAddEnemy("ffrg_Snail", "Unique", {leader = true, lock = 4, leaderLock = 4})
--myriadAddEnemy("ffrg_Lobster", "Unique", {leader = true, lock = 4, leaderLock = 3})

--ffrg_SpawnController.AppendSpawner("ffrg_Slug",false,3)
--ffrg_SpawnController.AppendSpawner("ffrg_Snail",false,2)
--ffrg_SpawnController.AppendSpawner("ffrg_Lobster",false,2)
ffrg_SpawnController.AppendSpawner("ffrg_Jelly_Speed",true,1,false,1)

--ffrg_SpawnController.AppendBasicExclusion("artillery", "ffrg_Snail")
--ffrg_SpawnController.AddBasicExclusion("postmortal", { "ffrg_Slug", "ffrg_Snail", "Jelly_Spider", "Jelly_Fire", "Jelly_Explode", "Mission_JellyBoss" })
