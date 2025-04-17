--[[
MacOS installation only
First install Wezterm:

brew install ripgrep lua fzf fd lazygit
brew tap homebrew/cask-fonts
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
brew install --cask wezterm
--]]
local wezterm = require("wezterm")
local action = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- (here will be added actual configuration)

config = {
	font = wezterm.font({
		family = "JetBrains Mono",
		weight = "Medium",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
	}),
	automatically_reload_config = true,
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	enable_tab_bar = false,
	font_size = 14.0,
	line_height = 1.0,
	window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" },
	default_cursor_style = "SteadyBlock",
	window_background_opacity = 0.90,
	macos_window_background_blur = 20,
	initial_rows = 48,
	initial_cols = 120,
	keys = {
		{ key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "k", mods = "CMD", action = action.ClearScrollback("ScrollbackAndViewport") },
		{ key = "w", mods = "CMD", action = action.CloseCurrentPane({ confirm = false }) },
		{ key = "w", mods = "CMD|SHIFT", action = action.CloseCurrentTab({ confirm = false }) },
		{ key = "LeftArrow", mods = "CMD", action = action.SendKey({ key = "Home" }) },
		{ key = "RightArrow", mods = "CMD", action = action.SendKey({ key = "End" }) },
		{ key = "p", mods = "CMD|SHIFT", action = action.ActivateCommandPalette },
	},
}
-- No edits after this line --
return config
