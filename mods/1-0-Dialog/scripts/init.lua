local mod = {
	id = "ffrg_arsenal_dialog",
	name = "",
	description = "-- Dialog --\n\nAdds new Dialog Events to both Vanilla and Arsenal Pilots to highlight new features.\nDialog Setting may require a game restart to function properly.\n\nEvents:\n [Mech]\n  - Accelerate\n  - Overclock\n [Vek]\n  - Flip\n",
	modApiVersion = "2.8.3",
	version = ffrg_arsenal_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png"
}

local option_dialog_setting = {
	"dialog_setting",
	"Dialog Setting",
	"Determines which dialog events can and cannot play",
	{
		values = { "arsenal", "full"},
		strings = { "Arsenal Only", "Full" },
		tooltips = { "Only dialog specific to gameplay explored in Arsenal.", "Implements all dialog events." },
		value = "full"
	}
}

function mod:metadata()
	modApi:addGenerationOption(unpack(option_dialog_setting))
end

function mod:init()
end

function mod:load(options, version)
	ffrg_arsenal_dialog_setting = options.dialog_setting.value
	require(self.scriptPath .."dialogEvents")
end

return mod
