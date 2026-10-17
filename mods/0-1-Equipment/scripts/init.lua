local mod = {
	id = "ffrg_arsenal_equipment",
	name = "",
	description = "-- Equipment --\n\nIntroduces new Equipment that can be encountered during runs.\n\nEquipment:\n [Prime]\n  - Palm of Saturn\n  - Overdrive Leap\n [Brute]\n  - Overdrive Charge\n [Ranged]\n  - Net Caster\n [Science]\n  - Force Rake\n [Support]\n  - Overdrive Scuttle\n  - Overdrive Bash\n",
	modApiVersion = "2.8.3",
	version = ffrg_arsenal_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."weapons")
	modApi:addWeaponDrop{id = "ffrg_Prime_HeavyShove", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Prime_OverdriveLeap", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Ranged_TC_Net", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Brute_OverdriveCharge", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_TC_MultiShove", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_OverdriveMove", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_OverdriveBash", pod = "advanced", shop = "advanced"}
end

return mod
