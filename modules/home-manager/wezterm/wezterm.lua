local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.enable_tab_bar = false
config.font_size = 20
config.bidi_enabled = true

return config
