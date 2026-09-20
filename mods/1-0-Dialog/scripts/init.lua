local mod = {
	id = "ffrg_arsenal_dialog",
	name = "",
	description = "-- Dialog --\n\nAdds new Dialog Events to both Vanilla and Arsenal Pilots to highlight new features.\nDialog Setting may require a game restart to function properly.\n\nEvents:\n - Push\n - Shove\n - Flip\n - Accelerate\n - Overclock\n",
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
		values = { "impact", "limited", "full"},
		strings = { "Impact Only", "Limited", "Full" },
		tooltips = { "Only dialog specific to gameplay explored in Arsenal", "Excludes dialogs with moderate to high frequency.", "Implements all dialog events." },
		value = "full"
	}
}

function mod:metadata()
	modApi:addGenerationOption(unpack(option_dialog_setting))
end

function mod:init()
end

function mod:load(options, version)
	ffrg_impact_dialog_setting = options.dialog_setting.value
	--require(self.scriptPath .."dialogEvents")
end

return mod
