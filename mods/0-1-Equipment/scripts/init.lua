local mod = {
	id = "ffrg_arsenal_equipment",
	name = "",
	description = "-- Equipment --\n\nIntroduces new Equipment that can be encountered during runs.\n\nEquipment:\n [Prime]\n  - Palm of Saturn\n [Science]\n  - Force Rake\n",
	modApiVersion = "2.8.3",
	version = ffrg_arsenal_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."weapons")
	modApi:addWeaponDrop("ffrg_Prime_HeavyShove")
	modApi:addWeaponDrop("ffrg_Science_TC_MultiShove")
end

return mod
