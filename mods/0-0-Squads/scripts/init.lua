local mod = {
	id = "ffrg_arsenal_squads",
	name = "",
	description = "-- Squads --\n\nIntroduces new playable Squads, in addition to their accompanying pieces of Equipment.\n\nSquads:\n - Bile Drinkers\n - Ardent Engines\n\nEquipment:\n [Prime]\n  - Body Slam\n [Brute]\n  - Cell Cannon\n  - Blasted Wake\n [Ranged]\n  - Caustic Shells\n  - Chain Shot\n [Science]\n  - Boundary Vortex\n [Support]\n  - Overclock\n [Passive]\n  - Ionic Batteries\n",
	modApiVersion = "2.8.3",
	version = ffrg_arsenal_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png"
}

function mod:init()
	require(self.scriptPath .."achievements")
	require(self.scriptPath .."weapons")
	require(self.scriptPath .."pawns")
	modApi:addWeaponDrop{id = "ffrg_Prime_KO_BodySlam", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Brute_SplitShot", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Brute_ShoveCharge", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Ranged_TC_Caustic", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_Accelerate", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_Overclock", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Passive_AcidShield", pod = false, shop = "advanced"}
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
	modApi:addSquad(
		{
			id = "ffrg_ArdentEngines",
			"Ardent Engines",			-- title
			"ffrg_BlastMech",			-- mech #1
			"ffrg_ShackleMech",			-- mech #2
			"ffrg_GaleMech"				-- mech #3
		},
		"Ardent Engines",
		"Hastened locomotion enables these mechs to position themselves perfectly on the battlefield.",
		self.resourcePath .."img/icons/ardent_engines.png"
	)
end

return mod

