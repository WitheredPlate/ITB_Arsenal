local mod = {
	id = "ffrg_arsenal_squads",
	name = "",
	description = "-- Squads --\n\nIntroduces new playable Squads, in addition to their accompanying pieces of Equipment.\n\nSquads:\n - Bile Drinkers\n\nEquipment:\n [Prime]\n  - Body Slam\n [Brute]\n  - Cell Cannon\n [Ranged]\n  - Caustic Shells\n [Passive]\n  - Ionic Batteries\n",
	modApiVersion = "2.8.3",
	version = ffrg_arsenal_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png"
}

function mod:init()
	require(self.scriptPath .."achievements")
	require(self.scriptPath .."weapons")
	require(self.scriptPath .."pawns")
	modApi:addWeaponDrop("ffrg_Prime_KO_BodySlam")
	modApi:addWeaponDrop("ffrg_Brute_SplitShot")
	modApi:addWeaponDrop("ffrg_Ranged_Caustic")
	modApi:addWeaponDrop("ffrg_Passive_AcidShield")
end

function mod:load(options, version)
	modApi:addSquad(
		{
			id = "ffrg_BileDrinkers",
			"Bile Drinkers",			-- title
			"ffrg_ArchonMech",			-- mech #1
			"ffrg_SplitterMech",			-- mech #2
			"ffrg_VitriolMech"			-- mech #3
		},
		"Bile Drinkers",
		"Uniquely fabricated batteries allow these Mechs to power particle shields via highly acidic chemicals.",
		self.resourcePath .."img/icons/bile_drinkers.png"
	)
end

return mod

