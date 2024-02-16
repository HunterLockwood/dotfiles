-- 2024-02-13: Time to learn lua I guess
--                    ~PRELUDE~                   -- 

local wezterm = require 'wezterm'

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Macchiato"
  else
    return "Catppuccin Latte"
  end
end

local config = wezterm.config_builder()

--                     ~BEGIN~                    -- 

--config.color_scheme = 'Catppuccin Macchiato'
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.font = wezterm.font('FantasqueSansM Nerd Font')
config.font_size = 20

config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 64

config.window_background_opacity = 0.87
config.macos_window_background_blur = 24
config.use_resize_increments = true
config.scrollback_lines = 10000

--                     ~FINAL~                    -- 
return config

