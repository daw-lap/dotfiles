local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Apprentice (Gogh)'

config.window_background_opacity = 0.95

config.keys = {
  {key = '1', mods = 'ALT', action = wezterm.action.ActivateTab(0)},
  {key = '2', mods = 'ALT', action = wezterm.action.ActivateTab(1)},
  {key = '3', mods = 'ALT', action = wezterm.action.ActivateTab(2)},
  {key = '4', mods = 'ALT', action = wezterm.action.ActivateTab(3)},
  {key = '5', mods = 'ALT', action = wezterm.action.ActivateTab(4)},
  {key = '6', mods = 'ALT', action = wezterm.action.ActivateTab(5)},
  {key = '7', mods = 'ALT', action = wezterm.action.ActivateTab(6)},
  {key = '8', mods = 'ALT', action = wezterm.action.ActivateTab(7)},
  {key = '9', mods = 'ALT', action = wezterm.action.ActivateTab(8)},
  {key = '0', mods = 'ALT', action = wezterm.action.ActivateTab(9)},

  {key = 'Enter', mods = 'ALT', action = wezterm.action.SpawnTab "DefaultDomain"},
  {key = 'q', mods = 'ALT|SHIFT', action = wezterm.action.CloseCurrentTab{confirm=true}},
  {key = 'z', mods = 'ALT', action = wezterm.action.TogglePaneZoomState},

  {key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection('Up')},
  {key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection('Down')},
  {key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection('Left')},
  {key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection('Right')},
  {key = 'q', mods = 'ALT|SHIFT', action = wezterm.action.CloseCurrentPane{confirm=false}},

  {key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize{'Up', 3}},
  {key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize{'Down', 3}},
  {key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize{'Left', 3}},
  {key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize{'Right', 3}},

  {key = 'v', mods = 'ALT', action = wezterm.action.SplitVertical{domain="CurrentPaneDomain"}},
  {key = 's', mods = 'ALT', action = wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"}},

  --{key = 'n', mods = 'ALT', action = wezterm.}

  {key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom "Clipboard"},
  {key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom "PrimarySelection"},

  {
    key = 'n',
    mods = 'ALT',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

return config
