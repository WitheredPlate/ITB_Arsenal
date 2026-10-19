--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--      Hybrid Trait Library      --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## A library with a collection of functions for applying the visuals for modded traits to pawns.


-----------------------
-- Table of Contents --
-----------------------

--## Function
-- ( perameter [Type] )
--


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


-- Widget size constants
local SMALL_ICON_W, SMALL_ICON_H = 25, 21
local LARGE_ICON_W, LARGE_ICON_H = 50, 42

-- Inline clip functionality
local clipRect = {
    l = sdl.rect(0,0,0,0),
    t = sdl.rect(0,0,0,0),
    r = sdl.rect(0,0,0,0),
    b = sdl.rect(0,0,0,0)
}

local function clip(base, widget, screen)
	local menu = sdlext.CurrentWindowRect
	clipRect.l.w = math.max(0, menu.x)
	clipRect.l.h = screen:h()
	clipRect.t.w = screen:w()
	clipRect.t.h = math.max(0, menu.y)
	clipRect.r.x = math.min(menu.x + menu.w, screen:w())
	clipRect.r.w = screen:w() - clipRect.r.x
	clipRect.r.h = screen:h()
	clipRect.b.y = math.min(menu.y + menu.h, screen:h())
	clipRect.b.w = screen:w()
	clipRect.b.h = screen:h() - clipRect.r.y

	local tmp = modApi.msDeltaTime
	local updated

	for _, r in pairs(clipRect) do
		screen:clip(r)
		if updated then
			modApi.msDeltaTime = 0
		end
		updated = true
		base.draw(widget, screen)
		screen:unclip()
	end

	modApi.msDeltaTime = tmp
end

local function smallIcon(surface, trait)
	if trait.smallWidgetIcon then
		trait.smallWidgetIcon:detach()
	end

	trait.smallWidgetIcon = Ui()
		:widthpx(SMALL_ICON_W):heightpx(SMALL_ICON_H)
		:decorate({ DecoSurfaceOutlined(surface, 1, deco.colors.buttonborder, deco.colors.focus, 1) })
		:addTo(trait.smallWidget)
	trait.smallWidgetIcon.translucent = true

	-- Override decoration draw to show highlighted surface when tooltip is open
	local decoration = trait.smallWidgetIcon.decorations[1]
	if decoration then
		decoration.draw = function(self, screen, widget)
			-- Check if tooltip is visible
			local tooltipVisible = sdlext:isStatusTooltipWindowVisible()

			-- Use highlighted surface when tooltip is visible, normal otherwise
			local surfaceToUse = tooltipVisible and self.surfacehl or self.surfacenormal
			if surfaceToUse then
				screen:blit(surfaceToUse, nil, widget.rect.x, widget.rect.y)
			end
		end
	end
end

local function largeIcon(surface, trait)
	if trait.largeWidgetIcon then
		trait.largeWidgetIcon:detach()
	end

	trait.largeWidgetIcon = Ui()
		:widthpx(LARGE_ICON_W):heightpx(LARGE_ICON_H)
		:decorate({ DecoSurfaceOutlined(surface, 1, deco.colors.buttonborder, deco.colors.buttonborder, 2) })
		:addTo(trait.largeWidget)
	trait.largeWidgetIcon.translucent = true
end

local function CreateWidgets(uiRoot, trait)

	trait.largeWidget = Ui()
		:widthpx(LARGE_ICON_W):heightpx(LARGE_ICON_H)
		:addTo(uiRoot)
	trait.largeWidget.translucent = true
	trait.largeWidget.visible = false
    recreateLargeIcon(initialSurface, trait)

	trait.smallWidget = Ui()
    :widthpx(SMALL_ICON_W):heightpx(SMALL_ICON_H)
    :addTo(uiRoot)
    trait.smallWidget.translucent = true
    trait.smallWidget.visible = false
    recreateSmallIcon(initialSurface, trait)
end


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local Traits = ( ffrg_Traitor and ffrg_Traitor.Traits ) or {}
local Replaced = {}

local function GetReplacement(pawn)
    local pawnType = _G[pawn:GetType()]
    if pawnType then

        if not pawnType.SelfHeal then return "SelfHeal" end
            -- A dummy trait used by one unit in vanilla. No practical effect, consequence-free.

        if not pawnType.TempUnit then return "TempUnit" end
            -- Has to be handled carefully by removing it before the end of the enemy turn. Might be edge cases where it is tested for for some reason.

    end
    return ""
end

local TraitTextStorage = {
    SelfHeal = {
        titleId = "Status_shield_heal_Title",
        title = "Self-Repairing",
        descriptionId = "Status_shield_heal_Text",
        description = "If damaged, this unit will Shield itself and prepare to heal.",
        iconPath = "img/combat/icons/icon_shield_heal.png"
    },
    TempUnit = {
        titleId = "Status_tempunit_Title",
        title = "Temporary Unit",
        descriptionId = "Status_tempunit_Text",
        description = "This unit will die at the end of the Enemy Turn.",
        iconPath = "img/advanced/combat/icons/icon_tempunit.png"
    }
}

local function GetTraits(pawn)
    local indexes = {}
    for index, Trait in ipairs(Traits) do
        if Trait.condition(pawn) then
            table.insert(indexes,index)
        end
    end
    return indexes
end

local function ReplaceTrait(pawn, pawnType, trait, title, description, icon)
    pawnType[trait] = true
    local storage = TraitTextStorage[trait]
    modApi:setText(storage.titleId, title)
    modApi:setText(storage.descriptionId, description)
end

local function ReplaceAllTraits(pawn)
    local replaced = {}
    local pawnType = _G[pawn:GetType()]
    if pawnType then
        local indexes = GetTraits(pawn)
        for _, index in ipairs(indexes) do
            local Trait = Traits[index]
            local base = GetReplacement(pawn)
            if base ~= "" then
                ReplaceTrait(pawn, pawnType, base, Trait.title, Trait.description, Trait.icon)
                table.insert(replaced,base)
            end
        end
        if #replaced > 0 then
            Replaced[pawn:GetId()] = replaced
        end
    end
end

local function ResetTrait(pawn, pawnType, trait)
    pawnType[trait] = false
    local storage = TraitTextStorage[trait]
    modApi:setText(storage.titleId, storage.title)
    modApi:setText(storage.descriptionId, storage.description)
end

local function ResetAllTraits(pawn, pawnType)
    local id
    if type(pawn) == "number" then
        id = pawn
    else
        id = pawn:GetId()
    end
    if Replaced[id] then
        if not pawnType and pawn.GetType then pawnType = _G[pawn:GetType()] end
        if pawnType then
            for _, trait in ipairs(Replaced[id]) do
                ResetTrait(pawn, pawnType, trait)
            end
            Replaced[id] = nil
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function AddTrait(conditionType, condition, title, description, icon)
    local conditionTemp
    if conditionType == "function" and type(condition) == "function" then conditionTemp = condition
    elseif conditionType == "pawn_type" and _G[condition] then conditionTemp = function(pawn) return pawn:GetType() == condition end
    elseif conditionType == "pilot_ability" and _G[condition] then conditionTemp = function(pawn) return pawn:IsAbility(condition) end
    end
    if conditionTemp then
        table.insert(Traits, {
            condition = conditionTemp,
            title = title,
            description = description,
            icon = icon
        })
    end
end

local FocusedId = -1
local LastFocusedId = -1
local LastFocusedType = nil

local function ffrg_onMissionUpdate(mission)
    local pawn = Board:GetSelectedPawn()
    if not pawn and Board:IsPawnSpace(Board:GetHighlighted()) and not Board:IsBusy() then pawn = Board:GetPawn(Board:GetHighlighted()) end
    if pawn and pawn.GetId then -- Infobox of the given pawn is showing.
        FocusedId = pawn:GetId()
    else
        FocusedId = -1
    end
    if LastFocusedId ~= FocusedId then
        if FocusedId ~= -1 and Board:GetPawn(FocusedId) then
            ReplaceAllTraits(Board:GetPawn(FocusedId))
        end
        if LastFocusedId ~= -1 then
            local pawn = Board:GetPawn(LastFocusedId)
            if pawn then
                ResetAllTraits(pawn)
            elseif LastFocusedType then
                ResetAllTraits(LastFocusedId, LastFocusedType) -- Allowing units to be reset even after being removed from the board.
            end
        end
        LastFocusedId = FocusedId
        if pawn then
            LastFocusedType = _G[pawn:GetType()]
        else
            LastFocusedType = nil
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_Traitor or ( modApi:isVersion(ffrg_Traitor.version, VERSION) and ffrg_Traitor.version ~= VERSION ) then

 --[[     Library    ]] ffrg_Traitor = ffrg_Traitor or {}
 --[[     Version    ]] ffrg_Traitor.version = VERSION
 --[[ Initialization ]] ffrg_Traitor.initialized = false

 --[[     Global     ]] ffrg_Traitor.Traits = Traits
 --[[     Global     ]] ffrg_Traitor.AddTrait = AddTrait

end
local function ffrg_onModsInitialized()
if ffrg_Traitor.version == VERSION and not ffrg_Traitor.initialized then

 --[[     Library    ]] ttrg_Traitor = ttrg_Traitor or {}
 --[[ Initialization ]] ffrg_Traitor.initialized = true

 --[[  Subscription  ]] modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_Traitor


--////////////////////////////////--
