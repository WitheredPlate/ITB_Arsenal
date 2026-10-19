ffrg_arsenal_version = "0.2.1 Beta"

local mod = {
    id = "ffrg_arsenal",
    name = "",
    description = "-- Arsenal --\n\nA content pack that implements multi-tile Shoving, Rotating, and action-altering Statuses.\n\nBy WitheredPlate\n",
    version = ffrg_arsenal_version,
    modApiVersion = "2.8.3",
    gameVersion = "1.2.83",
    icon = "img/icons/mod_version.png",
    dependencies = {
        memedit = "1.2.0",
        modApiExt = "1.23",
    },
    submodFolders = {"mods/"},
    load = function() end
}
local libs = {
    "globals",
    "tipTracker",
    "trait",
    --"pawnSight",
    "effectBurst",
    "seriousDamage/seriousDamage",
    "actions+/actions+",
    "spawnController",
    "customProjectile/customProjectile",
    "weaponPreview",
    "queuedPreview",
    "worldConstants",
    "customPsion",
    "shove/shove",
    "rotate/rotate",
}
-- local templates = {
--     "",
-- }

function mod:init(options)
	local path = self.scriptPath
	self.libs = {}
-- 	self.templates = {}
	for _, libId in ipairs(libs) do
		self.libs[libId] = require(path.."libs/"..libId)
	end
-- 	for _, templateId in ipairs(templates) do
-- 		self.templates[templateId] = require(path.."templates/"..templateId)
-- 	end
-- 	require(self.scriptPath .."weapons")
    require(self.scriptPath .."pawns")
end

return mod
