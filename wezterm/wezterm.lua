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
  -- enable_tab_bar = false,
  use_fancy_tab_bar = true,
  show_tabs_in_tab_bar = true,
  show_new_tab_button_in_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = true,
  native_macos_fullscreen_mode = false,
  window_decorations = "RESIZE",
}

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Inter', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 18.0,
}

config.font =  wezterm.font('JetBrains Mono')

config.color_scheme = 'Monokai (base16)'

-- Make the background match nvim
config.colors = {
  background = '#191919'
}

config.keys = {
  -- Splits
  { key = '\\', mods = 'CMD', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '\\', mods = 'CMD|SHIFT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

  -- Focus Next Pane
  { key = ']', mods = 'CMD|SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },

  -- Focus Previous Pane
  { key = '[', mods = 'CMD|SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },

  -- Add a Tab
    -- You get this by default with CMD+T

  -- Close Tab
    -- You get this by default with CMD+W

  -- Focus Next Tab
    -- You get this by default with SuperDuper+O

  -- Focus Previous Tab
    -- You get this by default with SuperDuper+I

  -- Clear Scrollback and Viewport
  { key = 'k', mods = 'CMD', action = act.ClearScrollback 'ScrollbackAndViewport' },
}


return config
