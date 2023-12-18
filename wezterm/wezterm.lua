local wezterm = require("wezterm")
local config = require('keybinds')
local act = wezterm.action

config = {
  font_size = 20,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },

  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = false,
  adjust_window_size_when_changing_font_size = false,
  enable_tab_bar = false,
  native_macos_fullscreen_mode = false,
  window_decorations = "RESIZE",
}

config.font =  wezterm.font('JetBrains Mono')

config.color_scheme = 'Monokai (base16)'

-- Make the background match nvim
config.colors = {
  background = '#191919'
}

config.keys = {
  { key = '\\', mods = 'CMD', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  -- Focus Next Pane
  -- Focus Previous Pane
  -- Split Down
  -- Split Left with D
  -- Add a Tab
  -- Close Tab
  -- Focus Next Tab
  -- Focus Previous Tab
}


return config
