--////////////////////////////////--
--//   (Arsenal) Enemy Weapons  //--
--////////////////////////////////--

--== Vek ==--
-- Mercurial Spores

--////////////////////////////////--





--////////////////////////////////--
--//        Declarations        //--
--////////////////////////////////--


FFRG_LEADER_HASTE = 483


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
	"combat/icons/ffrg_icon_speed_leader.png",
	"combat/icons/ffrg_icon_speed_leader_lost.png",
	"combat/icons/ffrg_icon_speed_leader_glow.png",
	"combat/ffrg_speed_leader_banner.png",
	"combat/ffrg_speed_leader_lost_banner.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

Location["combat/icons/ffrg_icon_speed_leader_glow.png"] = Point(0,8)

ANIMS["ffrg_CustomPsion_Gained_"..FFRG_LEADER_HASTE] = Animation:new{
	Image = "combat/ffrg_speed_leader_banner.png",
	Layer = 0,
	NumFrames = 20,
	Time = 0.05,
	Loop = false,
	PosX = -4,
	PosY = -2
}
ANIMS["ffrg_CustomPsion_Lost_"..FFRG_LEADER_HASTE] = Animation:new{
	Image = "combat/ffrg_speed_leader_lost_banner.png",
	Layer = 0,
	NumFrames = 20,
	Time = 0.05,
	Loop = false,
	PosX = -4,
	PosY = -2
}


--////////////////////////////////--





--////////////////////////////////--
--//           Weapons          //--
--////////////////////////////////--


----------------------
-- Mercurial Spores --
----------------------

ffrg_Jelly_Speed_Tooltip = Skill:new{
    Name = "Mercurial Spores",
    Description = "All other Vek recieve +1 Move and can leap between tiles.",
	Class = "Passive",
	PathSize = 5,
	TipImage = {
		Unit = Point(2,3),
		Target = Point(2,2),
		Friendly = Point(1,2),
		Mountain = Point(2,2),
		Mountain2 = Point(2,1),
		CustomPawn = "ffrg_Jelly_Speed1",
		Length = 4
	}
}

function ffrg_Jelly_Speed_Tooltip:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
    local leap = PointList()
    leap:push_back(Point(1,2))
    leap:push_back(Point(3,1))
    ret:AddLeap(leap,FULL_DELAY)
	return ret
end

function ffrg_LeaderSpeedGained(mission, point, pawn)
	pawn:SetMoveSpeed(pawn:GetMoveSpeed()+1)
	local pawnType = _G[pawn:GetType()]
	if ( not pawnType.Jumper or pawnType.Jumper == false ) and not pawn:IsFlying() and not pawn:IsBurrower() and not pawn:IsTeleporter() then
		pawnType.ffrg_JumperStorage = true
		pawnType.Jumper = true
	end
end

function ffrg_LeaderSpeedLost(mission, point, pawn, death)
	local pType
	if type(pawn) == "string" then
		pType = pawn
	else
		pawn:SetMoveSpeed(pawn:GetMoveSpeed()-1)
		pType = pawn:GetType()
	end
	local pawnType = _G[pType]
	if pawnType.ffrg_JumperStorage then
		local clear = true
		for _, data in ipairs(ffrg_CustomPsion.GetMutated(FFRG_LEADER_HASTE)) do
			if data and ((data:GetType() and data:GetType() == pType) or (data == pType)) then
			clear = false
			break
			end
		end
		if clear then
			pawnType.ffrg_JumperStorage = nil
			pawnType.Jumper = false
		end
	end
end

ffrg_CustomPsion.RegisterMutation(
	FFRG_LEADER_HASTE,
	"combat/icons/ffrg_icon_speed_leader.png",
	{"/ui/battle/population_points","/ui/battle/mission_complete"},
	{gained = "ffrg_LeaderSpeedGained", lost = "ffrg_LeaderSpeedLost"},
	"Mercurial Spores",
	"The Haste Psion is providing +1 Move and leaping abilties to all Vek.",
	true
)
