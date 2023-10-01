local wezterm = require("wezterm")
local wez_dir = os.getenv("HOME") .. "/.config/wezterm"
local act = wezterm.action

local function multiple_actions(keys)
	local actions = {}
	for key in keys:gmatch(".") do
		table.insert(actions, act.SendKey({ key = key }))
	end
	table.insert(actions, act.SendKey({ key = "\n" }))
	return act.Multiple(actions)
end

local function multiple_keys(keys)
	local actions = {}
	for key in keys:gmatch(".") do
		table.insert(actions, act.SendKey({ key = key }))
	end
	-- table.insert(actions, act.SendKey({ key = "\n" }))
	return act.Multiple(actions)
end

local function key_table(mods, key, action)
	return {
		mods = mods,
		key = key,
		action = action,
	}
end

local function cmd_key(key, action)
	return key_table("CMD", key, action)
end

local function cmd_tmux_key(key, tmux_key)
	return cmd_key(
		key,
		act.Multiple({
			act.SendKey({ mods = "CTRL", key = "Space" }),
			act.SendKey({ key = tmux_key }),
		})
	)
end

local config = {
	font_size = 16,

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

-- config.window_background_opacity = 0.87

config.color_scheme = 'Monokai (base16)'

-- Make the background match nvim
config.colors = {
  background = '#222222'
}

-- Keys
-- Without this the TMUX Split Controls can't kick in
config.disable_default_key_bindings = true
--
config.keys = {
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
  { key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
  { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
  { key = '\"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '#', mods = 'CTRL', action = act.ActivateTab(2) },
  { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
  { key = '$', mods = 'CTRL', action = act.ActivateTab(3) },
  { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
  { key = '%', mods = 'CTRL', action = act.ActivateTab(4) },
  { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
  { key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '%', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '&', mods = 'CTRL', action = act.ActivateTab(6) },
  { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
  { key = '\'', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '(', mods = 'CTRL', action = act.ActivateTab(-1) },
  { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
  { key = ')', mods = 'CTRL', action = act.ResetFontSize },
  { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
  { key = '*', mods = 'CTRL', action = act.ActivateTab(7) },
  { key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
  { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
  { key = '0', mods = 'SUPER', action = act.ResetFontSize },
  { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
  { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
  { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
  { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
  { key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
  { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
  { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
  { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
  { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
  { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
  { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
  { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
  { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
  { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
  { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
  { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
  { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
  { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
  { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
  { key = '@', mods = 'CTRL', action = act.ActivateTab(1) },
  { key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
  { key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'H', mods = 'CTRL', action = act.HideApplication },
  { key = 'H', mods = 'SHIFT|CTRL', action = act.HideApplication },
  { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
  { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
  { key = 'M', mods = 'CTRL', action = act.Hide },
  { key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },
  { key = 'N', mods = 'CTRL', action = act.SpawnWindow },
  { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
  { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
  { key = 'Q', mods = 'CTRL', action = act.QuitApplication },
  { key = 'Q', mods = 'SHIFT|CTRL', action = act.QuitApplication },
  { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
  { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = 'T', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'W', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
  { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
  { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  -- { key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  -- { key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  { key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
  { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
  { key = '_', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
  { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
  { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'h', mods = 'SHIFT|CTRL', action = act.HideApplication },
  { key = 'h', mods = 'SUPER', action = act.HideApplication },
  { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
  { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
  { key = 'm', mods = 'SUPER', action = act.Hide },
  { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  -- { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
  { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
  { key = 'q', mods = 'SHIFT|CTRL', action = act.QuitApplication },
  { key = 'q', mods = 'SUPER', action = act.QuitApplication },
  { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration },
  { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
  { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  -- { key = '{', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
  -- { key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  -- { key = '}', mods = 'SUPER', action = act.ActivateTabRelative(1) },
  -- { key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
  { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
  { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
  { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
  { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
  { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
  { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
  { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
  { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },

  -- Custom Keybinds
  {
    key = '{',
    mods = 'CMD|SHIFT',
    action = act.Multiple({
      act.SendKey({ mods = "CTRL", key = "H" }),
    })
  },
  {
    key = '}',
    mods = 'CMD|SHIFT',
    action = act.Multiple({
      act.SendKey({ mods = "CTRL", key = "L" }),
    })
  },

  {
    mods = "CTRL|SHIFT",
    key = "Tab",
    action = act.Multiple({
      act.SendKey({ mods = "CTRL", key = "Space" }),
      act.SendKey({ key = "p" }),
    }),
  },

  {
    mods = "CTRL",
    key = "Tab",
    action = act.Multiple({
      act.SendKey({ mods = "CTRL", key = "Space" }),
      act.SendKey({ key = "n" }),
    }),
  },

  {
    mods = "CMD",
    key = "`",
    action = act.Multiple({
      act.SendKey({ mods = "CTRL", key = "Space" }),
      act.SendKey({ key = "n" }),
    }),
  },

  {
    mods = "CMD",
    key = "~",
    action = act.Multiple({
      act.SendKey({ mods = "CTRL", key = "Space" }),
      act.SendKey({ key = "p" }),
    }),
  },

  {
    mods = "CTRL",
    key = "+",
    action = act.Multiple({
      act.SendKey({ key = "\x1b" }), -- escape
      multiple_actions(":vs"),
    })
  },

  {
    mods = "CTRL",
    key = "=",
    action = act.Multiple({
      act.SendKey({ key = "\x1b" }), -- escape
      multiple_actions(":vs"),
    })
  },

  {
    mods = "CTRL|SHIFT",
    key = "=",
    action = act.Multiple({
      act.SendKey({ key = "\x1b" }), -- escape
      multiple_actions(":vs"),
    })
  },

  cmd_key(
    "s",
    act.Multiple({
      act.SendKey({ key = "\x1b" }), -- escape
      multiple_actions(":w"),
    })
  ),

  cmd_key(
    "a",
    act.Multiple({
      -- act.SendKey({ key = "\x1b" }), -- escape
      multiple_keys("ggVG"),
    })
  ),

  cmd_key(
    "w",
    act.Multiple({
      act.SendKey({ key = "\x1b" }), -- escape
      multiple_actions(":bd"),
    })
  ),


  cmd_key(
    "n",
    act.Multiple({
      act.SendKey({ key = "\x1b" }), -- escape
      multiple_actions(":ene"),
    })
  ),

  cmd_key(".", multiple_actions(":ZenMode")),
  cmd_key("f", multiple_actions(":Grep")),
  cmd_key("P", multiple_actions(":GoToCommand")),
  cmd_key("p", multiple_actions(":GoToFile")),

  cmd_tmux_key("1", "1"),
  cmd_tmux_key("2", "2"),
  cmd_tmux_key("3", "3"),
  cmd_tmux_key("4", "4"),
  cmd_tmux_key("5", "5"),
  cmd_tmux_key("6", "6"),
  cmd_tmux_key("7", "7"),
  cmd_tmux_key("8", "8"),
  cmd_tmux_key("9", "9"),
  cmd_tmux_key("e", '"'),
  cmd_tmux_key("E", "%"),
  cmd_tmux_key("d", "%"),
  cmd_tmux_key("D", '"'),
  cmd_tmux_key("N", '"'),
  cmd_tmux_key("G", "G"),
  cmd_tmux_key("g", "g"),
  cmd_tmux_key("k", "T"),
  cmd_tmux_key("l", "L"),
  cmd_tmux_key("o", "u"),
  cmd_tmux_key("t", "c"),
  cmd_tmux_key("W", "x"),
  cmd_tmux_key("z", "z"),
}


return config
