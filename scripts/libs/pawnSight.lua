--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--     Pawn Oversight Library     --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## Template


-----------------------
-- Table of Contents --
-----------------------

--## Function
-- ( perameter [Type] )
--


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--

local ffrg_SightedPawns = {}

-- local function ffrg_onPawnClassInitialized(pawnClass, pawnInstance)
--     if pawnInstance.SetId then LOG("???") end
-- --     pawnClass.ffrg_IsFlyingOld = pawnInstance.IsFlying
-- --     pawnClass.IsFlying = function(self)
-- --         LOG("IsFlying")
-- --         return self:ffrg_IsFlyingOld()
-- --     end
-- end
-- modApi.events.onPawnClassInitialized:subscribe(ffrg_onPawnClassInitialized)


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--

local function initialize()
    ffrg_PawnSight.Pawns = ffrg_SightedPawns
end

if ffrg_PawnSight then
    if modApi:isVersion(ffrg_PawnSight.Version, VERSION) and ffrg_PawnSight.Version ~= VERSION then
        initialize()
    end
else
    ffrg_PawnSight = ffrg_PawnSight or {}
    initialize()
end

return ffrg_PawnSight

--////////////////////////////////--
