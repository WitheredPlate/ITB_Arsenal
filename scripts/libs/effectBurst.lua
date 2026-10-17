
--------------------------------------
-- Effect Burst v2.1 - helper library - MODIFIED
--
-- by Lemonymous
--------------------------------------
-- provides function allowing you to
-- add burst to water and ice tiles.
--------------------------------------

local path = GetParentPath(...)
local globals = require(path.."globals")

local index_terrain
local index_hp

-- adds an emitter to a tile,
-- even if it is ice or water.
local function add(effect, loc, emitter, dir)
	index_terrain = index_terrain or globals:new()
	index_hp = index_hp or globals:new()
	index_max = index_maxhp or globals:new()

	local iTerrain = Board:GetTerrain(loc)
	local setRoadTemporarily = iTerrain == TERRAIN_WATER or iTerrain == TERRAIN_ICE

	if setRoadTemporarily then
		effect:AddScript(string.format("globals[%s] = Board:GetTerrain(%s)", index_terrain, loc:GetString()))
		effect:AddScript(string.format("globals[%s] = Board:GetHealth(%s)", index_hp, loc:GetString()))
		effect:AddScript(string.format("globals[%s] = Board:GetMaxHealth(%s)", index_maxhp, loc:GetString()))
		effect:AddScript(string.format("Board:SetTerrain(%s, TERRAIN_ROAD)", loc:GetString()))
	end

	effect:AddBurst(loc, emitter, dir)

	if setRoadTemporarily then
		effect:AddScript(string.format("Board:SetTerrain(%s, globals[%s])", loc:GetString(), index_terrain))
		effect:AddScript(string.format("Board:SetHealth(%s, globals[%s], globals[%s])", loc:GetString(), index_hp, index_maxhp))
	end
end

local function add_instant(loc, emitter, dir)
	if Board then
		terrain = Board:GetTerrain(loc)
		hp = Board:GetHealth(loc)
		maxhp = Board:GetMaxHealth(loc)

		local iTerrain = Board:GetTerrain(loc)
		local setRoadTemporarily = iTerrain == TERRAIN_WATER or iTerrain == TERRAIN_ICE

		if setRoadTemporarily then
			Board:SetTerrain(loc, TERRAIN_ROAD)
		end

		Board:AddBurst(loc, emitter, dir)

		if setRoadTemporarily then
			Board:SetTerrain(loc, terrain)
			Board:SetHealth(loc, hp, maxhp)
		end
	end
end

ffrg_EffectBurst = {}
ffrg_EffectBurst.Add = add
ffrg_EffectBurst.AddInstant = add_instant
