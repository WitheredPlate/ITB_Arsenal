local path = GetParentPath(...)
local dialog_arsenal = require(path.."dialog_arsenal")

local VE_Info = {
	Vek_Flip = { Odds = 10 },
    Mech_Accelerate = { Odds = 30 },
    Mech_Overclock = { Odds = 40 }
}

for personality_id, dialog in pairs(dialog_arsenal) do
	if not Personality[personality_id] then
		local personality = CreatePilotPersonality(personality_id)
		Personality[personality_id] = personality
	end
	Personality[personality_id]:AddDialogTable(dialog)
end

local function ffrg_TunnelVoiceEvent(event, custom_odds)
	local eventInfo = VE_Info[event.id]
	local odds = eventInfo.Odds or 100
	if custom_odds then
		odds = custom_odds
	end
	local random = random_int(100)
	if odds >= random and not Board:IsTipImage() and ( not Game:IsVoicePopup() or odds == 100 ) then
		TriggerVoiceEvent(event)
	end
end


----------
-- Flip --
----------

local targetingRegistry = {}

if ffrg_arsenal_dialog_setting == "full" then

	local function ffrg_onMissionUpdate(mission)
		if not Board:IsTipImage() then
			local ids = Board:GetPawns(TEAM_ENEMY)
			if ids and ids:size() > 0 then
				for i = 1, ids:size() do
					local id = ids:index(i)
					local pawn = Board:GetPawn(id)
					if pawn and pawn:IsQueued() and not pawn:IsBusy() then
						local type = _G[pawn:GetType()]
						if type.DefaultFaction == FACTION_DEFAULT then
							local space = pawn:GetSpace()
							local target = pawn:GetQueuedTarget()
							local offset = target-space
							if Board:IsValid(space) and target and target ~= Point(-1,-1) then
								if targetingRegistry[id] and targetingRegistry[id] ~= offset then
									local id2 = math.random(0,2)
									local event = VoiceEvent("Vek_Flip",id2,id2)
									ffrg_TunnelVoiceEvent(event)
									targetingRegistry[id] = offset
								elseif not targetingRegistry.id then
									targetingRegistry[id] = offset
								end
							end
						end
					end
				end
			end
		end
	end

	local function ffrg_onMissionEnd(mission)
		targetingRegistry = {}
	end

	local function ffrg_onMissionStart(mission)
		targetingRegistry = {}
	end

	local function ffrg_onResetTurn(mission)
		targetingRegistry = {}
	end

	modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
	modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
	modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)
	modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn)
end

----------------
-- Accelerate --
----------------

local function ffrg_onPawnIsAccelerated(mission, pawn, isAccelerate)
	if pawn and pawn:IsMech() and isAccelerate then
	local id = pawn:GetId()
	local event = VoiceEvent("Mech_Accelerate",id,id)
	ffrg_TunnelVoiceEvent(event)
	end
end

ffrg_ActionsPlus.events.onPawnIsAccelerated:subscribe(ffrg_onPawnIsAccelerated)


---------------
-- Overclock --
---------------

local function ffrg_onPawnIsOverclocked(mission, pawn, isOverclock)
	if pawn and pawn:IsMech() and isOverclock then
	local id = pawn:GetId()
	local event = VoiceEvent("Mech_Overclock",id,id)
	ffrg_TunnelVoiceEvent(event)
	end
end

ffrg_ActionsPlus.events.onPawnIsOverclocked:subscribe(ffrg_onPawnIsOverclocked)
