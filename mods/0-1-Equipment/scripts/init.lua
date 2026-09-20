local mod = {
	id = "ffrg_arsenal_equipment",
	name = "",
	description = "-- Equipment --\n\nIntroduces new Equipment that can be encountered during runs.\n\nEquipment:\n [Prime]\n  - Palm of Saturn\n  - Overdrive Leap\n [Brute]\n  - Overdrive Charge\n [Science]\n  - Force Rake\n [Support]\n  - Overdrive Scuttle\n  - Overdrive Bash\n",
	modApiVersion = "2.8.3",
	version = ffrg_arsenal_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."weapons")
	modApi:addWeaponDrop("ffrg_Prime_HeavyShove")
	modApi:addWeaponDrop("ffrg_Prime_OverdriveLeap")
	modApi:addWeaponDrop("ffrg_Brute_OverdriveCharge")
	modApi:addWeaponDrop("ffrg_Science_TC_MultiShove")
	modApi:addWeaponDrop("ffrg_Support_OverdriveMove")
	modApi:addWeaponDrop("ffrg_Support_OverdriveBash")
end

return mod
