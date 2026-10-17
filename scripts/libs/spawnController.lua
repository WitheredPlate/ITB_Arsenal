--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--    Spawning Control Library    --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.6"

--## A library of functions to control the vanilla data the game uses to control how, when, and how many different enemies appear.
--## Mostly dedicated towards controlling exclusions, which prevent enemies and other elements from appearing with other enemies and elements.


------------------
-- Spawner Data --
------------------

--## Spawner data is defined for each enemy and controls a wide variety of functions around what circumstances that enemy can be and is spawned.
--## Flying should indicate whether or not the enemy is flying. Only one flying enemy can be encountered on each island.
--## Weak should indicate whether or not the enemy is a chaff unit and should spawn more often. In practice, this means this is true for common vek and false for rare vek. This is also set to true for Psions and used to make Missile-Bots rarer than their two companions.
--## Max Pawns should indicate how many of the pawn is allowed to spawn in one mission. If all enemies in a mission meet their limit for max pawns, this limit is ignored for weak pawns only.
--## Max Level should indicate the maximum tier this unit is allowed to be upgraded to, where normal vek are 1 and alphas are 2. In practice, only values of 1 have an effect and prevent the unit from becoming an alpha variant. This is, by default, only used for psions, which have no alpha variants.


----------------------
-- Basic Exclusions --
----------------------

--## Basic exclusions are defined by a list of elements (with a minimum size of 2) that are all exclusive with each other.
--## In practice, this means that at maximum, only a single one of the elements in a basic exclusion can appear at once.
--## For example, due to the vanilla Summoners Exclusion, you can never find Spiders and Blobbers together on one island, or Spiders and Plasmodias. At worst, you will only see one of the 3.


-----------------------
-- Myriad Exclusions --
-----------------------

--## Myriad exclusions are defined by 2 lists of elements (with minimum sizes of 1) under which every element of one list is exclusive with every element of the other, but elements in the 2 lists are not made exclusive with other elements in the same list.
--## In practice, this is most often used to create exclusions to prevent a number of elements from appearing with a certain problematic element without otherwise interfering with the former elements.
--## For example (though technically it is a basic exclusion with exclusion tails), due to the vanilla Burrowers Exclusion, Burrowers can never be found with Blast Psions or A.C.I.D. Emergence missions, but the latter two can still be found with each other.
--## Technically, myriad exclusions can always be represented by multiple basic exclusions. However, doing so doesn't allow for cross-mod flexibility and can easily reach absurd numbers of exclusions.


---------------------
-- Exclusion Tails --
---------------------

--## Exclusion tails are an optional list of elements that can accompany exclusions. All elements in the list are exclusive with all elements of the parent exclusion
-- For basic exclusions, in practice, exclusion tails have an effect that's extremely similar to a myriad exclusion, except the elements of the basic exclusion are still exclusive with each other.
-- For example, were we to add a tail to the vanilla Webber exclusion, every element in the tail would never appear with any webbers, including those added later by other mods
-- For myriad exclusions, in practice, exclusion tails function as a tertiary category in addition to the two of the myriad exclusion, allowing for more precise exclusion manipulation.


--------------------------
-- Other Exclusion Info --
--------------------------

--## Please use a custom prefix for the identifier when adding your own sets to avoid accidental overlap. For example, mine is "ffrg_"
--## The exception to the above rule is if multiple individuals decide they wish to coordinate to create a new category that contains entities from across multiple mods.

--## Basic exclusions are stored as indentifier = index, where the index is that exclusion's index in the global exclusiveElements array.
--## Myriad exclusions are stored as indentifier = exclusion, where the exclusion is the entirety of that exclusion's data.
--## Because myriad exclusions are stored as data rather than a reference and are represented as multiple arrays in exclusiveElements rather than one, they cannot easily be altered through methods outside of this lib and can never cleanly have elements removed.

--## When creating myriad exclusions, the convention is to make the first list the one that contains the problematic elements or the elements that have something in common.
--## For example, were a myriad exclusion designed to prevent units with a certain trait from appearing with certain elements, the units with the trait would be in list 1.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_SpawnController.AppendSpawner
-- ( identifier [String],  weak [Boolean], max_pawns [Integer], flying [Boolean], max_level [Integer] )
-- Sets the spawning data on the enemy specified by string to the specified data.
-- Data elements may be identified as nil to indicate no value. Default values of false for the two booleans or 0 for the two integers will have the same effect.

--## ffrg_SpawnController.AppendBoomBots
-- ( Data [Array or String] )
-- Adds the specified Boom Bot(s) to the list drawn from for the Boom Bot mission.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present.

--## ffrg_SpawnController.AppendBasicExclusion
-- ( identifier [String],  exclusion [Array or String] )
-- Merges the specified exclusion data into the existing basic exclusion that has the specified identifier.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present.

--## ffrg_SpawnController.AddBasicExclusion
-- ( identifier [String],  exclusion [Array or String] )
-- Creates a new basic exclusion with the specified identifier that can be referenced or appended to later.
-- If a basic exclusion with the specified identifier already exists, defaults to the behavior of AppendBasicExclusion.
-- If a myriad exclusion with the specified identifier already exists, does nothing.
-- Optionally also appends the specified exclusion data immediately upon creation.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present in the event of a behavior defaulting.

--## ffrg_SpawnController.AppendMyriadExclusion
-- ( identifier [String],  exclusion1 [Array or String],  exclusion2 [Array or String] )
-- Merges the specified exclusion data into the existing myriad exclusion that has the specified identifier.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present.

--## ffrg_SpawnController.AddMyriadExclusion
-- ( identifier [String],  exclusion1 [Array or String],  exclusion2 [Array or String] )
-- Creates a new myriad exclusion with the specified identifier that can be referenced or appended to later.
-- If a myriad exclusion with the specified identifier already exists, defaults to the behavior of AppendMyriadExclusion.
-- If a basic exclusion with the specified identifier already exists, does nothing.
-- Optionally also appends the specified exclusion data immediately upon creation.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present in the event of a behavior defaulting.

--## ffrg_SpawnController.AddExclusionTail
-- ( identifier [String],  exclusion [Array or String],  myriad [Boolean] )
-- Creates a new exclusion tail or adds to an existing one for the specified identifier that can be referenced or appended to later.
-- If no exclusion with the specified identifier exists, creates an empty exclusion with the specified identifier.
-- The created exclusion is of myriad type if myriad is true, and of basic type otherwise.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present if the tail already exists.

--## ffrg_SpawnController.ListExclusions
-- ( log [Boolean] )
-- Lists all exclusions manipulated by SpawnController, in addition to their tails, in a human-readable manner.
-- When log is set to false, the message is returned in array rather than logged in the console.


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


------------------------
-- Vanilla Exclusions --
------------------------

--## Use these names to reference the 5 vanilla exclusions, which are all basic exclusions.

ffrg_ExclusionData = ffrg_ExclusionData or {

  --        Identifier        = Index --                                  Description                                  --              Contents             --
  ------------------------------------------------------------------------------------------------------------------------------------------------------------
              webbers         =   1,  --  Vek that cast immobilizing webs. (Does not include Spiders. Honestly should) --       Scorpions and Leapers       --
             summoners        =   2,  --                       Non-Psion Vek that spawn more Vek.                      -- Spiders, Blobbers, and Plasmodias --
             arachnids        =   3,  --                          Vek that spawn spiderlings.                          --    Spiders and Arachnid Psions    --
             artillery        =   5,  --               Vek that fire arcing, damaging artillery attacks.               --     Scarabs, Crabs, and Moths     --
             burrowers        =   4   --     Vek that have the Stable trait and burrow through the ground to travel    --             Burrowers             --
}

ffrg_ExclusionTails = ffrg_ExclusionTails or {}

ffrg_BoomBotsBank = ffrg_BoomBotsBank or {}

local function ttrg_ListRummage(list, element)
    for _, entity in ipairs(list) do
        if entity == element then
            return true
        end
    end
    return false
end


local function ttrg_ExclusionDistribute(exclusion, element)
    for _, entity in ipairs(exclusion) do
        table.insert(exclusiveElements, {element, entity})
        -- I could add optimization to prevent duplicate sets. Could cause hangs on launch in extreme cases tho.
    end
end


local function ttrg_SearchExclusion(identifier)
    for id, exclusion in pairs(ffrg_ExclusionData) do
        if id == identifier then
            if type(exclusion) == "table" then
                return exclusion
            else
                return exclusiveElements[exclusion]
            end
        end
    end
end


local function ttrg_SearchExclusionTail(identifier)
    for id, tail in pairs(ffrg_ExclusionTails) do
        if id == identifier then
            return tail
        end
    end
end


local function ttrg_AddElement(exclusion, element, tail)
    table.insert(exclusion, element)
    if tail and tail ~= {} then
        ttrg_ExclusionDistribute(tail,element)
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_AppendSpawner(identifier, weak, max_pawns, flying, max_level)
    if flying and flying == true then
        FlyingEnemies[identifier] = true
    end
    if weak and weak == true then
        WeakPawns[identifier] = true
    end
    if max_pawns and max_pawns > 0 then
        Spawner.max_pawns[identifier] = max_pawns
    end
    if max_level and max_level > 0 then
        Spawner.max_level[identifier] = max_level
    end
end


function ffrg_AppendBoomBots(data)
    if type(data) == "string" then
        if not ttrg_ListRummage(ffrg_BoomBotsBank,data) and data ~= "Snowtank1_Boom" and data ~= "Snowlaser1_Boom" and data ~= "Snowart1_Boom" then
            table.insert(ffrg_BoomBotsBank,data)
        end
    else
        for _, element in ipairs(data) do
            if not ttrg_ListRummage(ffrg_BoomBotsBank,element) and element ~= "Snowtank1_Boom" and element ~= "Snowlaser1_Boom" and element ~= "Snowart1_Boom" then
                table.insert(ffrg_BoomBotsBank,element)
            end
        end
    end
end


local function ffrg_AppendBasicExclusion(identifier, exclusion)
    local set = ttrg_SearchExclusion(identifier)
    local tail = ttrg_SearchExclusionTail(identifier)
    if set and ( set == {} or type(set[1]) == "string" ) then -- Checking that the target exclusion is of basic type
        if type(exclusion) == "string" then
            if not ttrg_ListRummage(set, exclusion) then
                ttrg_AddElement(set, exclusion, tail)
            end
        elseif type(exclusion) == "table" and exclusion ~= {} then
            for _, entity in ipairs(exclusion) do
                if not ttrg_ListRummage(set, entity) then
                    ttrg_AddElement(set, entity, tail)
                end
            end
        else
            return
        end
    end
end


local function ffrg_AddBasicExclusion(identifier, exclusion)
    exclusion = exclusion or {}
    if ttrg_SearchExclusion(identifier) then -- Defaulting behavior
        ffrg_AppendBasicExclusion(identifier,exclusion)
        return
    end
    if type(exclusion) == "table" then
        table.insert(exclusiveElements, exclusion)
    else
        table.insert(exclusiveElements, {exclusion})
    end
    ffrg_ExclusionData[identifier] = #exclusiveElements
end


local function ffrg_AppendMyriadExclusion(identifier, exclusion1, exclusion2)
    local set = ttrg_SearchExclusion(identifier)
    local tail = ttrg_SearchExclusionTail(identifier)
    if set and type(set[1]) == "table" then -- Checking that the target exclusion is of myriad type
        if exclusion1 then
            if type(exclusion1) == "string" then
                if not ttrg_ListRummage(set[1],exclusion1) then
                    ttrg_ExclusionDistribute(set[2],exclusion1)
                    ttrg_AddElement(set[1], exclusion1, tail)
                end
            elseif type(exclusion1) == "table" and exclusion1 ~= {} then
                for _, entity in ipairs(exclusion1) do
                    if not ttrg_ListRummage(set[1],entity) then
                        ttrg_ExclusionDistribute(set[2],entity)
                        ttrg_AddElement(set[1], entity, tail)
                    end
                end
            end
        end
        if exclusion2 then
            if type(exclusion2) == "string" then
                if not ttrg_ListRummage(set[2],exclusion2) then
                    ttrg_ExclusionDistribute(set[1],exclusion2)
                    ttrg_AddElement(set[2], exclusion2, tail)
                end
            elseif type(exclusion2) == "table" and exclusion2 ~= {} then
                for _, entity in ipairs(exclusion2) do
                    if not ttrg_ListRummage(set[2],entity) then
                        ttrg_ExclusionDistribute(set[1],entity)
                        ttrg_AddElement(set[2], entity, tail)
                    end
                end
            end
        end
    end
end


local function ffrg_AddMyriadExclusion(identifier, exclusion1, exclusion2)
    exclusion1 = exclusion1 or {}
    exclusion2 = exclusion2 or {}
    if ttrg_SearchExclusion(identifier) then -- Defaulting behavior
        ffrg_AppendMyriadExclusion(identifier,exclusion1, exclusion2)
        return
    end
    local exclusion = {}
    if type(exclusion1) == "table" then
        table.insert(exclusion, exclusion1)
    else
        table.insert(exclusion, {exclusion1})
    end
    if type(exclusion2) == "table" then
        table.insert(exclusion, exclusion2)
    else
        table.insert(exclusion, {exclusion2})
    end
    if exclusion ~= {{},{}} then
        for _, entity in ipairs(exclusion[1]) do
            ttrg_ExclusionDistribute(exclusion[2],entity)
        end
    end
    ffrg_ExclusionData[identifier] = exclusion
end


local function ffrg_ExclusionTail(identifier, exclusion, myriad)
    exclusion = exclusion or {}
    myriad = myriad or false
    local set = ttrg_SearchExclusion(identifier)
    local tail = ttrg_SearchExclusionTail(identifier)
    local content
    if type(exclusion) == "string" then
        content = {exclusion}
    else
        content = exclusion
    end
    if not set then -- Creating a new empty exclusion if none exists
        if myriad then
            ffrg_AddMyriadExclusion(identifier, nil, nil)
        else
            ffrg_AddBasicExclusion(identifier, nil)
        end
        set = ttrg_SearchExclusion(identifier)
    elseif type(set[1]) == "table" then -- Checking if the target exclusion is of myriad type
        myriad = true
    end
    local clear = false
    if set ~= {} and set ~= {{},{}} then clear = false end
    if tail then
        for _, entity in ipairs(content) do
            table.insert(tail, entity)
            if not clear then
                if myriad then
                    ttrg_ExclusionDistribute(set[1],entity)
                    ttrg_ExclusionDistribute(set[2],entity)
                else
                    ttrg_ExclusionDistribute(set,entity)
                end
            end
        end
    else
        ffrg_ExclusionTails[identifier] = content
        for _, entity in ipairs(content) do
            if not clear then
                if myriad then
                    ttrg_ExclusionDistribute(set[1],entity)
                    ttrg_ExclusionDistribute(set[2],entity)
                else
                    ttrg_ExclusionDistribute(set,entity)
                end
            end
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//      Boom Bot Control      //--
--////////////////////////////////--


--## Altering the "Destroy all Boom Bots" mission to allow custom boom bots to appear within it.

function Mission_BoomBots:StartMission()
	self.BoomBots = {}
	local potential_bots = {"Snowtank1_Boom", "Snowlaser1_Boom", "Snowart1_Boom"}

	for i,v in ipairs(ffrg_BoomBotsBank) do
        table.insert(potential_bots,v)
    end

	for i = 1, self.RobotStart do
		local loc = Board:AddPawn(random_element(potential_bots))
		self.BoomBots[#self.BoomBots + 1] = Board:GetPawn(loc):GetId()
	end

	local loc = Board:AddPawn(random_element(potential_bots))
	Board:GetPawn(loc):SetFrozen(true)
	self.BoomBots[#self.BoomBots + 1] = Board:GetPawn(loc):GetId()
	loc = Board:AddPawn(random_element(potential_bots))
	Board:GetPawn(loc):SetFrozen(true)
	self.BoomBots[#self.BoomBots + 1] = Board:GetPawn(loc):GetId()
end


--////////////////////////////////--





--////////////////////////////////--
--//        Debug Listing       //--
--////////////////////////////////--


local function ffrg_ListExclusions(log)
    log = log or true
    local array
    for identifier, i in pairs(ffrg_ExclusionData) do
        local form
        local data
        if type(i) == "table" then
            form = "myriad"
            data = i[1]
        else
            form = "basic"
            data = exclusiveElements[i]
        end
        local output = identifier.." - "..form.." :  ( "
        for j, element in ipairs(data) do
            if _G[element.."1"] then
                output = output.._G[element.."1"].Name
            else
                output = output.."Mission ("..element:gsub("Mission_","")..")"
            end
            if j ~= #data then
                output = output..", "
            end
        end
        output = output.." )"
        if form == "myriad" then
            output = output.."  vs  ( "
            for j, element in ipairs(i[2]) do
                if _G[element.."1"] then
                    output = output.._G[element.."1"].Name
                else
                    output = output.."Mission ("..element:gsub("Mission_","")..")"
                end
                if j ~= #i[2] then
                    output = output..", "
                end
            end
            output = output.." )"
        end
        if log then
            LOG(output)
        else
            table.insert(array, output)
        end
        tail = ttrg_SearchExclusionTail(identifier)
        if tail then
            local output2 = "       "..identifier.." - tail :  ( "
            for j, element in ipairs(tail) do
                if _G[element.."1"] then
                    output2 = output2.._G[element.."1"].Name
                else
                    output2 = output2.."Mission ("..element:gsub("Mission_","")..")"
                end
                if j ~= #tail then
                    output2 = output2..", "
                end
            end
            output2 = output2.." )"
            if log then
                LOG(output2)
            else
                table.insert(array, output2)
            end
        end
    end
    if not log then
        return array
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function initialize()
    ffrg_SpawnController.AppendSpawner = ffrg_AppendSpawner

    ffrg_SpawnController.AppendBoomBots = ffrg_AppendBoomBots

    ffrg_SpawnController.AppendBasicExclusion = ffrg_AppendBasicExclusion
    ffrg_SpawnController.AddBasicExclusion = ffrg_AddBasicExclusion

    ffrg_SpawnController.AppendMyriadExclusion = ffrg_AppendMyriadExclusion
    ffrg_SpawnController.AddMyriadExclusion = ffrg_AddMyriadExclusion

    ffrg_SpawnController.ExclusionTail = ffrg_ExclusionTail

    ffrg_SpawnController.ListExclusions = ffrg_ListExclusions

    ffrg_SpawnController.Version = VERSION

    --## Making the vanilla burrower exclusion into a basic exclusion with 1 element but an exclusion tail with 2 elements, rather than a basic exclusion with 3 elements.
    --## Fixes a bug that prevented Blast Psions from appearing on A.C.I.D. Emergence missions and prevents said bug from expanding to any added modded units.

    local temp_burrowers = {}

    for _, element in ipairs(exclusiveElements[4]) do
        if element ~= "Jelly_Explode" and element ~= "Mission_Acid" then
            table.insert(temp_burrowers, element)
        end
    end

    exclusiveElements[4] = temp_burrowers

    ffrg_ExclusionTail("burrowers", {"Jelly_Explode", "Mission_Acid"}, false)
end

if ffrg_SpawnController then
    if modApi:isVersion(ffrg_SpawnController.Version, VERSION) and ffrg_SpawnController.Version ~= VERSION then
        initialize()
    end
else
    ffrg_SpawnController = ffrg_SpawnController or {}
    initialize()
end

return ffrg_SpawnController


--////////////////////////////////--
