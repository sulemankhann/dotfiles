-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.automatically_reload_config = true
config.default_cursor_style = "BlinkingBar"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = "Catppuccin Mocha (Gogh)"
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font", -- Primary font
})
config.font_size = 14

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "../wallpapers/thunderstorm-sea.png",
-- 		},
-- 		hsb = {
-- 			hue = 1.0,
-- 			saturation = 1.02,
-- 			brightness = 0.25,
-- 		},
-- 		width = "100%",
-- 		height = "100%",
-- 	},
-- 	{
-- 		source = {
-- 			Color = "#282c35",
-- 		},
-- 		width = "100%",
-- 		height = "100%",
-- 		opacity = 0.55,
-- 	},
-- }

-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 10

return config
