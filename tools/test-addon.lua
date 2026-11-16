-- Isolated UI contract checks. This mock does not emulate protected WoW code.
local state = {class = "HUNTER", layout = "hihi", combat = false, after = {}}
local function Region()
    local r = {alpha = 1, shown = true, hooks = {}, points = {"BOTTOM", {}, "BOTTOM", 0, 0}}
    function r:GetAlpha() return self.alpha end
    function r:SetAlpha(v) self.alpha = v end
    function r:Show() self.shown = true end
    function r:Hide() self.shown = false end
    function r:IsShown() return self.shown end
    function r:SetShown(v) self.shown = v end
    function r:SetPoint(...) self.points = {...} end
    function r:GetPoint() return table.unpack(self.points) end
    function r:ClearAllPoints() self.points = {} end
    function r:HookScript(k, fn) self.hooks[k] = fn end
    function r:SetScript(k, fn) self[k] = fn end
    function r:RegisterEvent() end
    function r:GetAtlas() return "mock-pet-border" end
    function r:GetTexture() return 1 end
    function r:CreateTexture() return Region() end
    function r:CreateMaskTexture() return Region() end
    function r:CreateFontString() return Region() end
    local noop = function() end
    for _, key in ipairs({"SetSize", "SetFrameStrata", "SetAllPoints", "SetAtlas", "AddMaskTexture",
        "SetTexture", "SetPromptInputIconKey", "RefreshInputPromptSize", "SetScale", "SetClampedToScreen",
        "EnableMouse", "SetMovable", "RegisterForDrag", "SetText", "SetWidth", "SetJustifyH",
        "SetChecked", "SetTexCoord", "SetColorTexture"}) do r[key] = noop end
    r.TitleText = {SetText = noop}
    return r
end
UIParent = Region()
UISpecialFrames = {}
SlashCmdList = {}
GAMEPAD_SHOULDER_LEFT, GAMEPAD_TRIGGER_LEFT = "LB", "LT"
GAMEPAD_SHOULDER_RIGHT, GAMEPAD_TRIGGER_RIGHT = "RB", "RT"
function CreateFrame() return Region() end
function UnitClass() return "Hunter", state.class end
function UnitName() error("Public addon must not depend on a character name") end
function InCombatLockdown() return state.combat end
function hooksecurefunc() end
function SetPortraitTexture() end
function strtrim(s) return s:match("^%s*(.-)%s*$") end
C_Timer = {After = function(_, fn) state.after[#state.after + 1] = fn end}
EditModeManagerFrame = {GetActiveLayoutInfo = function()
    return state.layout and {layoutName = state.layout} or nil
end}
GamepadPetActionFlyout, GamepadPetSpellFlyout = Region(), Region()
GamepadPetActionFlyout:Hide()
GamepadPetSpellFlyout:Hide()
local function ActionBar()
    local bar = Region()
    bar.actionButtons, bar.Left, bar.Right = {}, {}, {}
    for i = 1, 8 do
        local b = Region()
        b.ButtonIcon, b.Name = Region(), Region()
        bar.actionButtons[i] = b
        local group = i <= 4 and bar.Left or bar.Right
        group["ActionButton" .. ((i - 1) % 4 + 1)] = b
    end
    return bar
end
local page = {actionBars = {bottomBar = ActionBar(), rightBar = ActionBar(), leftBar = ActionBar()},
    BottomCenteredAnchor = Region(), LeftInputPrompt = Region(), RightInputPrompt = Region(),
    LeftClassAction = Region(), RightClassAction = Region(), ModifierIcons = {Region()}}
page.LeftClassAction.NormalTexture = Region()
page.RightClassAction.NormalTexture = Region()
for _, side in ipairs({"Left", "Right"}) do
    for _, part in ipairs({"ShoulderIcon", "ShoulderBackground", "ShoulderHighlight"}) do
        page[side .. part] = Region()
    end
end
GamepadMainActionBarFrame = {PageUnit = page}

-- The runner loads the unmodified release file here, then calls these checks.
function RunCouchMasterTests()
    assert(JoaoHunterUIDB.showMacroLegends == false, "New installs must default to hidden legends")
    JoaoHunterUI.Apply()
    assert(page.LeftShoulderIcon.alpha == 0, "A different hunter must activate the hihi visuals")
    assert(page.actionBars.rightBar.actionButtons[5].Name.alpha == 0, "Macro labels must be hidden")
    assert(page.actionBars.rightBar.actionButtons[5].ButtonIcon.shown, "Controller glyphs must stay visible")
    assert(page.actionBars.bottomBar.points[5] == 22, "Center offset must match the shared design")
    state.layout = "Other layout"
    JoaoHunterUI.Apply()
    assert(page.LeftShoulderIcon.alpha == 1, "Switching layout must restore original opacity")
    assert(page.actionBars.rightBar.actionButtons[5].Name.alpha == 1, "Macro label alpha must restore")
    state.layout, state.class = "hihi", "MAGE"
    JoaoHunterUI.Apply()
    assert(page.LeftShoulderIcon.alpha == 1, "Other classes must not activate hunter visuals")
    state.class, state.layout = "HUNTER", nil
    JoaoHunterUI.Apply()
    assert(page.LeftShoulderIcon.alpha == 1, "An absent layout must be safe")
    state.layout, state.combat = "hihi", true
    JoaoHunterUI.Apply()
    assert(page.LeftShoulderIcon.alpha == 1, "Layout mutation must defer in combat")
    state.combat = false
    JoaoHunterUI.Apply()
    assert(page.LeftShoulderIcon.alpha == 0, "Visuals must apply out of combat")
    assert(SLASH_JOAOHUNTERUI1 == "/jhui" and SLASH_JOAOHUNTERUI2 == "/cmf", "Both commands must remain registered")
    SlashCmdList.JOAOHUNTERUI("off")
    assert(JoaoHunterUIDB.showMacroLegends == false, "The off command must preserve the chosen preference")
    assert(JoaoHunterUI.version == "2.1.5", "Release version mismatch")
    return "UI contract checks passed"
end
