-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.default_prog = {'bash'}
config.color_scheme = 'Catppuccin Flappe'

config.font = wezterm.font_with_fallback {
	'JetBrainsMono Nerd Font',
	{ family = 'LXGW WenKai GB', scale = 1.1 },
	-- 'Noto Sans Mono CJK SC',
}
config.font_size = 24
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.enable_tab_bar = false
config.default_cursor_style = "SteadyUnderline"
config.audible_bell = "Disabled"

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }

config.leader = { mods = "CTRL", key = "x", timeout_milliseconds = 2000 }
config.keys = {
  { 
    mods = 'CTRL|ALT', key = 't', 
    action = wezterm.action.SpawnCommandInNewTab { args = { 'mosh', 'cs6' }, }, },
  { 
    mods = 'CTRL', key = 'Backspace', 
    action = wezterm.action.SendKey {key = 'Backspace', mods = 'ALT'} }, 
  {
    mods = "LEADER", key = "\\",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  {
    mods = "LEADER", key = "-",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  {
    mods = "LEADER", key = "h",
    action = wezterm.action.ActivatePaneDirection "Left" },
  {
    mods = "LEADER", key = "j",
    action = wezterm.action.ActivatePaneDirection "Down" },
  {
    mods = "LEADER", key = "k",
    action = wezterm.action.ActivatePaneDirection "Up" },
  {
    mods = "LEADER", key = "l",
    action = wezterm.action.ActivatePaneDirection "Right" },
  {
    mods = "LEADER|CTRL", key = "h",
    action = wezterm.action.AdjustPaneSize { "Left", 5 } },
  {
    mods = "LEADER|CTRL", key = "l",
    action = wezterm.action.AdjustPaneSize { "Right", 5 } },
  {
    mods = "LEADER|CTRL", key = "j",
    action = wezterm.action.AdjustPaneSize { "Down", 5 } },
  {
    mods = "LEADER|CTRL", key = "k",
    action = wezterm.action.AdjustPaneSize { "Up", 5 } },
  -- {
  --   mods = "LEADER", key = "Enter",
  --   action = wezterm.action.SpawnTab "CurrentPaneDomain",},
  {
    mods = "LEADER", key = "0",
    action = wezterm.action.CloseCurrentPane { confirm = true } },
}

-- and finally, return the configuration to wezterm
return config
