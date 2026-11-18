-- Passive health labels for the existing native frames in the personal HIHI layout.
-- Native health APIs supply the values; FontString performs the formatting, including
-- restricted health values. No action selection, bindings or unit clicks are changed.
local driver = CreateFrame("Frame")
local labels = {}

local function Enabled()

    local layout = EditModeManagerFrame and EditModeManagerFrame:GetActiveLayoutInfo()
    return layout and string.lower(layout.layoutName or "") == "hihi"
end

local function Restore(item)
    if not item then return end
    item.label:Hide()
    for region, alpha in pairs(item.originalAlpha) do region:SetAlpha(alpha) end
end

local function Prepare(unit, frame)
    local bar = frame and frame.healthbar
    if not bar then return end
    local item = labels[unit]
    if item and item.bar == bar then return item end
    Restore(item)
    local label = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    label:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
    label:SetPoint("CENTER", bar, "CENTER", 0, 0)
    label:SetTextColor(1, 1, 1, 1)
    label:SetShadowColor(0, 0, 0, 1)
    label:SetShadowOffset(1, -1)
    label:Hide()
    item = {bar = bar, label = label, originalAlpha = {}}
    for _, key in ipairs({"TextString", "LeftText", "RightText"}) do
        local region = bar[key]
        if region then item.originalAlpha[region] = region:GetAlpha() end
    end
    labels[unit] = item
    return item
end

local function Refresh()
    local enabled = Enabled() and UnitHealthPercent and CurveConstants and CurveConstants.ScaleTo100
    if not enabled then
        for _, item in pairs(labels) do Restore(item) end
        return
    end
    for _, entry in ipairs({{"player", PlayerFrame}, {"target", TargetFrame}}) do
        local unit, frame = entry[1], entry[2]
        local item = Prepare(unit, frame)
        if item then
            for region in pairs(item.originalAlpha) do region:SetAlpha(0) end
            if UnitExists(unit) then
                item.label:SetFormattedText("%s (%.0f%%)",
                    UnitHealth(unit), UnitHealthPercent(unit, true, CurveConstants.ScaleTo100))
                item.label:Show()
            else
                item.label:Hide()
            end
        end
    end
end

driver:RegisterUnitEvent("UNIT_HEALTH", "player", "target")
driver:RegisterUnitEvent("UNIT_MAXHEALTH", "player", "target")
driver:RegisterEvent("PLAYER_TARGET_CHANGED")
driver:RegisterEvent("PLAYER_ENTERING_WORLD")
driver:RegisterEvent("EDIT_MODE_LAYOUTS_UPDATED")
driver:SetScript("OnEvent", function(_, event)
    if event == "UNIT_HEALTH" or event == "UNIT_MAXHEALTH" then
        Refresh()
    else
        C_Timer.After(0, Refresh)
    end
end)
JoaoHunterUI.TVReadability = {Apply = Refresh}
C_Timer.After(0, Refresh)
