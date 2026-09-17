local mod = {
	id = "ffrg_arsenal_pilots",
	name = "",
	description = "-- Pilots --\n\nIntroduces new Pilots that can be encountered during runs.\n\nPilots:\n [Unique]\n  - Finn Smith\n",
	modApiVersion = "2.8.3",
	version = ffrg_arsenal_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."pilots")
	modApi:addPilotDrop{id = "ffrg_Pilot_Stable", pod = "advanced" }
end

return mod
