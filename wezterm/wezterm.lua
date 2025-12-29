local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Add this line to force XWayland compatibility
config.enable_wayland = false

-- This is where you actually apply your config choices
config.color_scheme = 'MaterialDesignColors'

config.font_size = 18

config.font = wezterm.font("CodeNewRoman Nerd Font")
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("AurulentSansM Nerd Font")
-- config.font = wezterm.font("ComicShannsMono Nerd Font Mono")
-- config.font = wezterm.font("RecMonoCasual Nerd Font")
config.window_decorations ="RESIZE"
config.default_cursor_style = "BlinkingBar"
config.hide_tab_bar_if_only_one_tab = true 
config.scrollback_lines = 30000 
config.window_padding = {top = 1 , bottom = 0}
config.tab_bar_at_bottom = true
config.window_close_confirmation ="NeverPrompt"
config.key_tables = {
    resize_pane = {
        {key = "h", action = act.AdjustPaneSize({"Left",1})},
        {key = "l", action = act.AdjustPaneSize({"Right",1})},
        {key = "k", action = act.AdjustPaneSize({"Up",1})},
        {key = "j", action = act.AdjustPaneSize({"Down",1})},
        {key = "Escape", action = "PopKeyTable"}
    }
}
local home = os.getenv("USERPROFILE")

local dimmer = { brightness = 0.25 }


config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1500}
config.keys = {
    {key = "L", mods = "CTRL", action = act.DisableDefaultAssignment},
    {key = "H", mods = "CTRL", action = act.DisableDefaultAssignment},
    {key = "D", mods = "CTRL", action = "ShowDebugOverlay" },
    {key = " ", mods = "LEADER", action = act.TogglePaneZoomState }, -- Max size current panel
    {key = "v", mods = "LEADER", action = act.SplitHorizontal({domain = "CurrentPaneDomain"}) },
    {key = "s", mods = "LEADER", action = act.SplitVertical({domain = "CurrentPaneDomain"}) },
    {key = "x", mods = "LEADER", action = act.CloseCurrentPane({confirm = true}) },
    {key = "m", mods = "LEADER", action = act.Hide },
    {key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    {key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    {key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    {key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    {key = "r", mods = "LEADER", action = act.ActivateKeyTable({name = "resize_pane", one_shot = false}) },
}
config.window_background_opacity = 0.7
return config
