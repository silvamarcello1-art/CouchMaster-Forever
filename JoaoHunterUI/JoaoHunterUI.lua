-- Visual-only additions. Native action tables and native click handlers stay untouched.
local addon = CreateFrame("Frame")
JoaoHunterUIDB = JoaoHunterUIDB or {events = {}}
if JoaoHunterUIDB.showMacroLegends == nil then JoaoHunterUIDB.showMacroLegends = false end
local glyphBars, originalAlpha, petArtwork = {}, {}, {}
local bottomOriginal, pageRef, pending

local function Enabled()
    local _, class = UnitClass("player")
    local layout = EditModeManagerFrame and EditModeManagerFrame:GetActiveLayoutInfo()
    return class == "HUNTER" and layout and string.lower(layout.layoutName or "") == "hihi"
end

local function Alpha(region, value)
    if not region then return end
    if originalAlpha[region] == nil then originalAlpha[region] = region:GetAlpha() end
    region:SetAlpha(value)
end

local function Glyphs(bar)
    if not Enabled() then return end
    for _, button in ipairs(bar.actionButtons or {}) do
        if button.ButtonIcon then button.ButtonIcon:Show() end
        Alpha(button.Name, 0)
    end
end

local function NewPrompt(parent, a, b)
    local prompt = CreateFrame("Frame", nil, parent, "InputPromptTwoIconTemplate")
    prompt:SetPromptInputIconKey(1, a)
    prompt:SetPromptInputIconKey(2, b)
    prompt:RefreshInputPromptSize()
    prompt:SetScale(0.70)
    return prompt
end

local function PetArtwork(page, native, popup, key, x, shoulder, trigger)
    -- Passive artwork only. Controller input continues to target the native pet buttons.
    local art = CreateFrame("Frame", "JoaoHunterUI" .. key .. "Pet", UIParent)
    art:SetSize(38, 38)
    art:SetFrameStrata("MEDIUM")
    art:SetPoint("CENTER", page.BottomCenteredAnchor, "CENTER", x, 7)
    local icon = art:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", 3, -3)
    icon:SetPoint("BOTTOMRIGHT", -3, 3)
    local mask = art:CreateMaskTexture(nil, "ARTWORK")
    mask:SetAtlas("CircleMask")
    mask:SetAllPoints(icon)
    icon:AddMaskTexture(mask)
    local border = art:CreateTexture(nil, "OVERLAY")
    border:SetAllPoints()
    local atlas = native.NormalTexture:GetAtlas()
    if atlas then border:SetAtlas(atlas) else border:SetTexture(native.NormalTexture:GetTexture()) end
    local prompt = NewPrompt(UIParent, shoulder, trigger)
    prompt:SetFrameStrata("MEDIUM")
    prompt:SetPoint("CENTER", page.BottomCenteredAnchor, "CENTER", x / 0.70, -16 / 0.70)
    local item = {frame = art, icon = icon, prompt = prompt, native = native, popup = popup}
    local function PopupVisibility()
        if not Enabled() then return end
        -- Only opacity is changed on native buttons. Their positions and anchorInfo remain native.
        native:SetAlpha(popup:IsShown() and 1 or 0)
        art:SetAlpha(popup:IsShown() and 0 or 1)
    end
    popup:HookScript("OnShow", PopupVisibility)
    popup:HookScript("OnHide", PopupVisibility)
    petArtwork[#petArtwork + 1] = item
    return item
end

local function Public(value)
    return not issecretvalue or not issecretvalue(value)
end

-- Fixed, passive legends for the four RT face buttons only.
-- They describe the saved macro; no cooldown, range, target or power is inspected.
local macroLegends, pendingLegends = {}, false
local legendProfiles = {
    ["HX Lento"] = {primary = "Tiro de Concussão", spells = {"Investida", "Tiro de Concussão", "Cortar Asas", "Tiro Automático"}, pet = true},
    ["HX Picada"] = {primary = "Picada de Serpente", spells = {"Picada de Serpente", "Tiro Automático"}, pet = true},
    ["HX Arcano"] = {primary = "Tiro Arcano", spells = {"Tiro Arcano", "Golpe do Raptor", "Tiro Automático"}, pet = true},
    ["HX Corpo"] = {primary = "Golpe do Raptor", spells = {"Cortar Asas", "Golpe do Raptor", "Tiro Automático"}, pet = true},
}
local function HideMacroLegends()
    for _, legend in ipairs(macroLegends) do
        for _, item in ipairs(legend.items) do item.icon:SetAlpha(0); item.border:SetAlpha(0) end
    end
end
local function LegendMatches(body, profile)
    if type(body) ~= "string" then return false end
    local found, pet = {}, false
    for line in body:gmatch("[^\r\n]+") do
        local command, argument = line:match("^%s*(/%S+)%s*(.-)%s*$")
        if command == "/petattack" then pet = true end
        if command == "/castsequence" or command == "/castrandom" or command == "/use" or command == "/click" then return false end
        if command == "/cast" then
            -- Support only these existing, single-target macro lines. More complex macros get no legend.
            argument = argument:gsub("^%[harm,nodead%]%s*", ""):gsub("^!", "")
            if argument:find("[%[%;]") then return false end
            found[#found + 1] = argument
        end
    end
    if pet ~= profile.pet or #found ~= #profile.spells then return false end
    for i, spell in ipairs(found) do if spell ~= profile.spells[i] then return false end end
    return true
end
local function RefreshMacroLegends()
    if not JoaoHunterUIDB.showMacroLegends then HideMacroLegends(); return end
    if InCombatLockdown() then pendingLegends = true; return end
    pendingLegends = false
    HideMacroLegends()
    if not Enabled() then return end
    local snapshot = {}
    for _, legend in ipairs(macroLegends) do
        local action = legend.button.action
        local name = action and Public(action) and GetActionText(action)
        local profile = Public(name) and legendProfiles[name]
        local index = profile and GetMacroIndexByName(name)
        local body = index and index > 0 and GetMacroBody(index)
        if profile and LegendMatches(body, profile) then
            local pictures = {{texture = 132152, label = "Enviar ajudante"}}
            for _, spell in ipairs(profile.spells) do
                if spell ~= profile.primary then
                    pictures[#pictures + 1] = {texture = C_Spell.GetSpellTexture(spell), label = spell}
                end
            end
            local labels = {}
            for i, picture in ipairs(pictures) do
                local item = legend.items[i]
                if item and picture.texture then
                    local x = (i - (#pictures + 1) / 2) * 14
                    item.border:ClearAllPoints()
                    item.border:SetPoint("TOP", legend.button, "BOTTOM", x, 2)
                    item.icon:SetTexture(picture.texture)
                    item.border:SetAlpha(0.95)
                    item.icon:SetAlpha(0.95)
                    labels[#labels + 1] = picture.label
                end
            end
            snapshot[legend.key] = {macro = name, labels = labels}
        end
    end
    JoaoHunterUIDB.macroLegends = snapshot
end
local function PrepareMacroLegends(page)
    if #macroLegends == 0 then
        local group = page.actionBars.rightBar and page.actionBars.rightBar.Right
        if not group then return end
        for i, key in ipairs({"RT+X", "RT+Y", "RT+B", "RT+A"}) do
            local button = group["ActionButton" .. i]
            if button then
                local legend = {button = button, key = key, items = {}}
                for j = 1, (key == "RT+X" and 4 or 3) do
                    local border = button:CreateTexture(nil, "OVERLAY", nil, 3)
                    border:SetSize(13, 13)
                    border:SetColorTexture(0.08, 0.08, 0.08, 1)
                    border:SetAlpha(0)
                    local icon = button:CreateTexture(nil, "OVERLAY", nil, 4)
                    icon:SetSize(11, 11)
                    icon:SetPoint("CENTER", border, "CENTER")
                    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
                    icon:SetAlpha(0)
                    legend.items[j] = {border = border, icon = icon}
                end
                macroLegends[#macroLegends + 1] = legend
            end
        end
    end
    RefreshMacroLegends()
end

-- A small options panel and a short command; changing this setting only affects artwork.
local optionsPanel, legendsCheck
local function SetLegendsEnabled(value)
    JoaoHunterUIDB.showMacroLegends = value == true
    RefreshMacroLegends()
    if legendsCheck then legendsCheck:SetChecked(JoaoHunterUIDB.showMacroLegends) end
end
local function CreateOptionsPanel()
    if optionsPanel then return optionsPanel end
    optionsPanel = CreateFrame("Frame", "JoaoHunterUIOptions", UIParent, "BasicFrameTemplateWithInset")
    optionsPanel:SetSize(360, 170)
    optionsPanel:SetPoint("CENTER")
    optionsPanel:SetFrameStrata("DIALOG")
    optionsPanel:SetClampedToScreen(true)
    optionsPanel:EnableMouse(true)
    optionsPanel:SetMovable(true)
    optionsPanel:RegisterForDrag("LeftButton")
    optionsPanel:SetScript("OnDragStart", optionsPanel.StartMoving)
    optionsPanel:SetScript("OnDragStop", optionsPanel.StopMovingOrSizing)
    optionsPanel.TitleText:SetText("CouchMaster Forever")
    legendsCheck = CreateFrame("CheckButton", nil, optionsPanel, "UICheckButtonTemplate")
    legendsCheck:SetPoint("TOPLEFT", 18, -40)
    local label = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", legendsCheck, "RIGHT", 3, 0)
    label:SetText("Mostrar ícones secundários dos macros")
    local description = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    description:SetPoint("TOPLEFT", 24, -82)
    description:SetWidth(310)
    description:SetJustifyH("LEFT")
    description:SetText("Legendas fixas para RT + X, Y, B e A.\nA escolha fica salva para as próximas sessões.\n\nAtalho: /cmf ligar ou /cmf desligar")
    legendsCheck:SetScript("OnClick", function(self) SetLegendsEnabled(self:GetChecked()) end)
    optionsPanel:SetScript("OnShow", function() legendsCheck:SetChecked(JoaoHunterUIDB.showMacroLegends) end)
    optionsPanel:Hide()
    UISpecialFrames[#UISpecialFrames + 1] = "JoaoHunterUIOptions"
    return optionsPanel
end
SLASH_JOAOHUNTERUI1 = "/jhui"
SLASH_JOAOHUNTERUI2 = "/cmf"
SlashCmdList.JOAOHUNTERUI = function(message)
    local command = strtrim(message or ""):lower()
    if command == "ligar" or command == "on" then
        SetLegendsEnabled(true)
    elseif command == "desligar" or command == "off" then
        SetLegendsEnabled(false)
    else
        local panel = CreateOptionsPanel()
        panel:SetShown(not panel:IsShown())
        return
    end
    print("CouchMaster Forever: ícones secundários " .. (JoaoHunterUIDB.showMacroLegends and "ligados." or "desligados."))
end
local function Configure(page)
    if InCombatLockdown() then pending = true; return end
    pending = false
    if not Enabled() then
        HideMacroLegends()
        for region, alpha in pairs(originalAlpha) do region:SetAlpha(alpha) end
        for _, item in ipairs(petArtwork) do item.frame:Hide(); item.prompt:Hide() end
        if bottomOriginal and pageRef then
            pageRef.actionBars.bottomBar:ClearAllPoints()
            pageRef.actionBars.bottomBar:SetPoint(unpack(bottomOriginal))
        end
        return
    end
    local bar = page.actionBars.bottomBar
    if not bottomOriginal then bottomOriginal = {bar:GetPoint(1)} end
    -- Move the two center groups together, without changing any action or native Lua anchor table.
    bar:ClearAllPoints()
    bar:SetPoint("CENTER", page.BottomCenteredAnchor, "CENTER", 0, 22)
    for _, side in ipairs({"Left", "Right"}) do
        for _, part in ipairs({"ShoulderIcon", "ShoulderBackground", "ShoulderHighlight"}) do
            Alpha(page[side .. part], 0)
        end
    end
    for _, actionBar in pairs(page.actionBars) do
        if not glyphBars[actionBar] then
            glyphBars[actionBar] = true
            hooksecurefunc(actionBar, "HideButtonIcons", function(self) Glyphs(self) end)
            hooksecurefunc(actionBar, "ShowHighlight", function(self) Glyphs(self) end)
        end
        Glyphs(actionBar)
    end
    for _, input in pairs(page.ModifierIcons or {}) do input:Show() end
    if #petArtwork == 0 then
        PetArtwork(page, page.LeftClassAction, GamepadPetActionFlyout, "Left", -252, GAMEPAD_SHOULDER_LEFT, GAMEPAD_TRIGGER_LEFT)
        PetArtwork(page, page.RightClassAction, GamepadPetSpellFlyout, "Right", 136, GAMEPAD_SHOULDER_RIGHT, GAMEPAD_TRIGGER_RIGHT)
    end
    Alpha(page.LeftInputPrompt, 0)
    Alpha(page.RightInputPrompt, 0)
    for _, item in ipairs(petArtwork) do
        SetPortraitTexture(item.icon, "pet")
        Alpha(item.native, item.popup:IsShown() and 1 or 0)
        item.popup:SetClampedToScreen(true)
        item.frame:Show()
        item.prompt:Show()
        item.frame:SetAlpha(item.popup:IsShown() and 0 or 1)
    end
end

local function Apply()
    local page = GamepadMainActionBarFrame and GamepadMainActionBarFrame.PageUnit
    if not page or not page.actionBars then return end
    pageRef = page
    Configure(page)
    if not InCombatLockdown() then PrepareMacroLegends(page) end
end

addon:RegisterEvent("ADDON_ACTION_BLOCKED")
addon:RegisterEvent("ADDON_ACTION_FORBIDDEN")
addon:RegisterEvent("PLAYER_ENTERING_WORLD")
addon:RegisterEvent("EDIT_MODE_LAYOUTS_UPDATED")
addon:RegisterEvent("PLAYER_REGEN_ENABLED")

addon:RegisterEvent("UPDATE_MACROS")
addon:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
addon:RegisterEvent("UNIT_PET")
addon:RegisterEvent("UNIT_PORTRAIT_UPDATE")
addon:SetScript("OnEvent", function(_, event, unit, action)

    if event == "UPDATE_MACROS" or event == "ACTIONBAR_SLOT_CHANGED" then RefreshMacroLegends(); return end
    if event == "PLAYER_REGEN_ENABLED" and pendingLegends then RefreshMacroLegends() end
    if event == "ADDON_ACTION_BLOCKED" or event == "ADDON_ACTION_FORBIDDEN" then
        local events = JoaoHunterUIDB.events
        events[#events + 1] = {event = event, addon = unit, action = action, time = time()}
        if #events > 20 then table.remove(events, 1) end
        return
    end
    if event == "PLAYER_REGEN_ENABLED" and not pending then return end
    if event == "UNIT_PET" and unit ~= "player" then return end
    if event == "UNIT_PORTRAIT_UPDATE" and unit ~= "pet" then return end
    C_Timer.After(0, Apply)
end)
C_Timer.After(0, Apply)
_G.JoaoHunterUI = {Apply = Apply, version = "2.1.6"}
