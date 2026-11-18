-- Personal, reversible display presets. No spells, targeting or bindings change.
local driver = CreateFrame("Frame")
local db = JoaoHunterUIDB
db.displayMode = db.displayMode or "notebook"
local fields = {"actorname_text_size", "big_actorname_text_size", "big_actortitle_text_size", "percent_text_size", "level_text_size", "spellname_text_size", "health", "health_incombat", "cast", "cast_incombat"}
local pending
local function Sync()
    db = JoaoHunterUIDB
    db.displayMode = db.displayMode or "notebook"
end
local function Personal()
    local layout = EditModeManagerFrame and EditModeManagerFrame:GetActiveLayoutInfo()
    return layout and string.lower(layout.layoutName or "") == "hihi"
end
local function Apply()
    Sync()
    if not Personal() then return end
    if InCombatLockdown() then pending = true; return end
    pending = nil
    -- Move the existing route arrow once and let Shortest Path save its own position.
    if not db.guideRaised and ShortestPathForeverDB then
        for _, frame in ipairs({UIParent:GetChildren()}) do
            if frame.Icon and frame.Arrow and frame.Distance and frame.Progress and frame.GetCenter then
                local x, y = frame:GetCenter()
                if x and y then
                    local scale = frame:GetEffectiveScale() / UIParent:GetEffectiveScale()
                    db.guidePrevious = {x = ShortestPathForeverDB.arrowX, y = ShortestPathForeverDB.arrowY}
                    ShortestPathForeverDB.arrowX = x * scale
                    ShortestPathForeverDB.arrowY = y * scale + 40
                    frame:ClearAllPoints()
                    frame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y + 40 / scale)
                    db.guideRaised = true
                    break
                end
            end
        end
    end
    local tv = db.displayMode == "tv"
    db.tvDisplayCVars = db.tvDisplayCVars or {
        WorldTextMinSize = "20", -- previously approved TV size
        nameplateMinScale = "1",
    }
    for key, value in pairs(db.tvDisplayCVars) do
        SetCVar(key, tv and value or (key == "WorldTextMinSize" and "8" or "0.8"))
    end
    if Plater and Plater.db and Plater.db.profile then
        local profile = Plater.db.profile
        local name = Plater.db:GetCurrentProfile()
        db.tvPlateSizes = db.tvPlateSizes or {}
        if not db.tvPlateSizes[name] then
            local snapshot = {}
            for actor, config in pairs(profile.plate_config) do
              if type(config) == "table" then
                snapshot[actor] = {}
                for _, key in ipairs(fields) do
                    if config[key] ~= nil then
                        snapshot[actor][key] = type(config[key]) == "table" and CopyTable(config[key]) or config[key]
                    end
                end
              end
            end
            db.tvPlateSizes[name] = snapshot
        end
        for actor, saved in pairs(db.tvPlateSizes[name]) do
            local config = profile.plate_config[actor]
            if type(config) == "table" then
                for key, original in pairs(saved) do
                    local value = original
                    if not tv then
                        if key == "health" then value = {140, 10}
                        elseif key == "health_incombat" then value = {150, 12}
                        elseif key == "cast" then value = {140, 9}
                        elseif key == "cast_incombat" then value = {150, 10}
                        elseif key == "actorname_text_size" or key == "big_actorname_text_size" then value = 12
                        else value = 9 end
                    end
                    config[key] = type(value) == "table" and CopyTable(value) or value
                end
            end
        end
        Plater:RefreshConfig()
    end
end
local function SetMode(mode)
    Sync()
    if mode ~= "tv" and mode ~= "notebook" then return end
    db.displayMode = mode
    Apply()
    print("CouchMaster: modo " .. (mode == "tv" and "TV" or "Notebook") .. (pending and " será aplicado ao sair de combate." or " aplicado."))
end
local function Toggle()
    Sync()
    SetMode(db.displayMode == "tv" and "notebook" or "tv")
end
JoaoHunterUI.DisplayModes = {Apply = Apply, SetMode = SetMode, Toggle = Toggle}
local originalSlash = SlashCmdList.JOAOHUNTERUI
SlashCmdList.JOAOHUNTERUI = function(message)
    local cmd = strtrim(message or ""):lower()
    if cmd == "tv" then SetMode("tv")
    elseif cmd == "notebook" or cmd == "nb" then SetMode("notebook")
    elseif cmd == "alternar" or cmd == "modo" then Toggle()
    else
        originalSlash(message)
        local panel = JoaoHunterUIOptions
        if panel and not panel.displayButtons then
            panel:SetSize(390, 235)
            panel.displayButtons = {}
            for index, entry in ipairs({{"TV", "tv"}, {"Notebook", "notebook"}}) do
                local button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
                button:SetSize(155, 32)
                button:SetPoint("BOTTOMLEFT", 28 + (index - 1) * 174, 20)
                button:SetText(entry[1])
                local mode = entry[2]
                button:SetScript("OnClick", function() SetMode(mode) end)
                panel.displayButtons[index] = button
            end
        end
    end
end
local function RegisterSettings()
    Sync()
    if not Settings or not Settings.RegisterProxySetting then return end
    local category = Settings.RegisterVerticalLayoutCategory("CouchMaster Forever")
    local setting = Settings.RegisterProxySetting(category, "JOAO_DISPLAY_MODE", Settings.VarType.String,
        "Modo de tela", "notebook", function() Sync(); return db.displayMode end, SetMode)
    Settings.CreateDropdown(category, setting, function()
        local values = Settings.CreateControlTextContainer()
        values:Add("tv", "TV — nomes e barras grandes")
        values:Add("notebook", "Notebook — nomes e barras compactos")
        return values:GetData()
    end, "Alterna os tamanhos sem recarregar. Mantém vida, porcentagem e os controles.")
    Settings.RegisterAddOnCategory(category)
end
driver:RegisterEvent("PLAYER_ENTERING_WORLD")
driver:RegisterEvent("PLAYER_REGEN_ENABLED")
driver:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_ENTERING_WORLD" or pending then C_Timer.After(2, Apply) end
end)
C_Timer.After(0, RegisterSettings)
C_Timer.After(3, Apply)
C_Timer.After(8, Apply)
