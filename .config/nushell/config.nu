# Nushell Config File              #
# Instantiated from version 0.88.1 #
# My customizations mostly up here.#
####################################
# Adjusted defaults for catppuccin #
####################################

# muscle memory aliases, inherited from other distros
alias l = ls
alias la = ls --all

# my custom scripts live in $env.NU_LIB_DIR/scripts
use ~/.config/nushell/scripts/fetch-wttr.nu weather
use ~/.config/nushell/scripts/opd_searcher.nu *

# official & semi-official additions

# A simple function that allows keeping macOS `open` by redefining nushell's open as `nuopen`
def nuopen [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
alias open = ^open

# a few completions from nushell/nu-scripts are in $env.NU_LIB_DIR/completions
use ~/.config/nushell/completions *

####################################
# following yanked from https://raw.githubusercontent.com/nullishamy/derivation-station/master/users/amy/apps/tools/nu/config.nu
let catppuccin = {
  latte: {
    rosewater: "#dc8a78"
    flamingo: "#dd7878"
    pink: "#ea76cb"
    mauve: "#8839ef"
    red: "#d20f39"
    maroon: "#e64553"
    peach: "#fe640b"
    yellow: "#df8e1d"
    green: "#40a02b"
    teal: "#179299"
    sky: "#04a5e5"
    sapphire: "#209fb5"
    blue: "#1e66f5"
    lavender: "#7287fd"
    text: "#4c4f69"
    subtext1: "#5c5f77"
    subtext0: "#6c6f85"
    overlay2: "#7c7f93"
    overlay1: "#8c8fa1"
    overlay0: "#9ca0b0"
    surface2: "#acb0be"
    surface1: "#bcc0cc"
    surface0: "#ccd0da"
    crust: "#dce0e8"
    mantle: "#e6e9ef"
    base: "#eff1f5"
  }
  frappe: {
    rosewater: "#f2d5cf"
    flamingo: "#eebebe"
    pink: "#f4b8e4"
    mauve: "#ca9ee6"
    red: "#e78284"
    maroon: "#ea999c"
    peach: "#ef9f76"
    yellow: "#e5c890"
    green: "#a6d189"
    teal: "#81c8be"
    sky: "#99d1db"
    sapphire: "#85c1dc"
    blue: "#8caaee"
    lavender: "#babbf1"
    text: "#c6d0f5"
    subtext1: "#b5bfe2"
    subtext0: "#a5adce"
    overlay2: "#949cbb"
    overlay1: "#838ba7"
    overlay0: "#737994"
    surface2: "#626880"
    surface1: "#51576d"
    surface0: "#414559"
    base: "#303446"
    mantle: "#292c3c"
    crust: "#232634"
  }
  macchiato: {
    rosewater: "#f4dbd6"
    flamingo: "#f0c6c6"
    pink: "#f5bde6"
    mauve: "#c6a0f6"
    red: "#ed8796"
    maroon: "#ee99a0"
    peach: "#f5a97f"
    yellow: "#eed49f"
    green: "#a6da95"
    teal: "#8bd5ca"
    sky: "#91d7e3"
    sapphire: "#7dc4e4"
    blue: "#8aadf4"
    lavender: "#b7bdf8"
    text: "#cad3f5"
    subtext1: "#b8c0e0"
    subtext0: "#a5adcb"
    overlay2: "#939ab7"
    overlay1: "#8087a2"
    overlay0: "#6e738d"
    surface2: "#5b6078"
    surface1: "#494d64"
    surface0: "#363a4f"
    base: "#24273a"
    mantle: "#1e2030"
    crust: "#181926"
  }
  mocha: {
    rosewater: "#f5e0dc"
    flamingo: "#f2cdcd"
    pink: "#f5c2e7"
    mauve: "#cba6f7"
    red: "#f38ba8"
    maroon: "#eba0ac"
    peach: "#fab387"
    yellow: "#f9e2af"
    green: "#a6e3a1"
    teal: "#94e2d5"
    sky: "#89dceb"
    sapphire: "#74c7ec"
    blue: "#89b4fa"
    lavender: "#b4befe"
    text: "#cdd6f4"
    subtext1: "#bac2de"
    subtext0: "#a6adc8"
    overlay2: "#9399b2"
    overlay1: "#7f849c"
    overlay0: "#6c7086"
    surface2: "#585b70"
    surface1: "#45475a"
    surface0: "#313244"
    base: "#1e1e2e"
    mantle: "#181825"
    crust: "#11111b"
  }
}

let stheme = $catppuccin.latte
let theme = {
  separator: $stheme.overlay0
  leading_trailing_space_bg: $stheme.overlay0
  header: $stheme.green
  date: $stheme.mauve
  filesize: $stheme.blue
  row_index: $stheme.pink
  bool: $stheme.peach
  int: $stheme.peach
  duration: $stheme.peach
  range: $stheme.peach
  float: $stheme.peach
  string: $stheme.green
  nothing: $stheme.peach
  binary: $stheme.peach
  cellpath: $stheme.peach
  hints: $stheme.subtext0 #defaults to dark_gray

  shape_garbage: { fg: $stheme.crust bg: $stheme.red attr: b }
  shape_bool: $stheme.blue
  shape_int: { fg: $stheme.mauve attr: b}
  shape_float: { fg: $stheme.mauve attr: b}
  shape_range: { fg: $stheme.yellow attr: b}
  shape_internalcall: { fg: $stheme.blue attr: b}
  shape_external: { fg: $stheme.blue attr: b}
  shape_externalarg: $stheme.text 
  shape_literal: $stheme.blue
  shape_operator: $stheme.yellow
  shape_signature: { fg: $stheme.green attr: b}
  shape_string: $stheme.green
  shape_filepath: $stheme.yellow
  shape_globpattern: { fg: $stheme.blue attr: b}
  shape_variable: $stheme.text
  shape_flag: { fg: $stheme.blue attr: b}
  shape_custom: {attr: b}
}

# External completer example
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell $spans | from json
# }

# The default config record. This is where much of your global configuration is setup.
$env.config = {
    show_banner: false 

    ls: {
        use_ls_colors: true
        clickable_links: true 
    }

    rm: {
        always_trash: false 
    }

    table: {
        mode: rounded # 
            # options include: basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
        index_mode: auto
        show_empty: true 
        padding: { left: 1, right: 1 } 
        trim: {
            methodology: wrapping 
            wrapping_try_keep_words: true  
            truncating_suffix: "..." 
        }
        header_on_separator: false 
        abbreviated_row_count: 4224
    }

    error_style: "fancy" 

    # datetime_format determines what a datetime rendered in the shell would look like.
    # Behavior without this configuration point will be to "humanize" the datetime display,
    # showing something like "a day ago."
    datetime_format: {
        # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
        # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
    }

    explore: {
        status_bar_background: {fg: $stheme.base, bg: $stheme.crust},
        command_bar_text: {fg: $stheme.subtext0},
        highlight: {fg: $stheme.overlay0, bg: $stheme.yellow},
        status: {
            error: {fg: $stheme.overlay0, bg: $stheme.red},
            warn: {}
            info: {}
        },
        table: {
            split_line: {fg: $stheme.subtext0},
            selected_cell: {bg: $stheme.surface2},
            selected_row: {},
            selected_column: {},
        },
    }
# default:   
#    explore: {
#        status_bar_background: {fg: "#1D1F21", bg: "#C4C9C6"},
#        command_bar_text: {fg: "#C4C9C6"},
#        highlight: {fg: "black", bg: "yellow"},
#        status: {
#            error: {fg: "white", bg: "red"},
#            warn: {}
#            info: {}
#        },
#        table: {
#            split_line: {fg: "#404040"},
#            selected_cell: {bg: light_blue},
#            selected_row: {},
#            selected_column: {},
#        },
#    }
#
    history: {
        max_size: 100_000 
        sync_on_enter: true 
        file_format: "plaintext" 
        isolation: false 
    }

    completions: {
        case_sensitive: false 
        quick: true    
        partial: true    
        algorithm: "prefix"    # prefix or fuzzy
        external: {
            enable: true 
            max_results: 100 
            completer: null # check 'carapace_completer' above as an example
        }
    }

    filesize: {
        metric: true 
        format: "auto" 
    }

    cursor_shape: {
        emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
        vi_insert: underscore # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
        vi_normal: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
    }

    color_config: $theme
    use_grid_icons: true
    footer_mode: "auto" # always, never, number_of_rows, auto
    float_precision: 3 
    buffer_editor: "hx" 
    use_ansi_coloring: true
    bracketed_paste: true 
    edit_mode: vi 
    shell_integration: true 
    render_right_prompt_on_last_line: false 
    use_kitty_protocol: false 
    highlight_resolved_externals: true

    hooks: {
        pre_prompt: [{ null }] # run before the prompt is shown
        pre_execution: [{ null }] # run before the repl input is run
        env_change: {
            PWD: [{|before, after| null }] # run if the PWD environment is different since the last repl input
        }
        display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
        command_not_found: { null } # return an error message when a command is not found
    }

    menus: [
        # Configuration for default nushell menus
        # Note the lack of source parameter
        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: $stheme.text #default green
                selected_text: $stheme.overlay2 #default green_reverse
                description_text: $stheme.teal #default yellow
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: " "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: $stheme.text
                selected_text: $stheme.overlay2
                description_text: $stheme.teal
            }
        }
        {
            name: help_menu
            only_buffer_difference: true
            marker: "󱍋 "
            type: {
                layout: description
                columns: 4
                col_width: 20
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: $stheme.text
                selected_text: $stheme.overlay2
                description_text: $stheme.teal
            }
        }
    ]

    keybindings: [
        {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: history_menu }
        }
        {
            name: help_menu
            modifier: none
            keycode: f1
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: help_menu }
        }
        {
            name: completion_previous_menu
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menuprevious }
        }
        {
            name: next_page_menu
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page_menu
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
        {
            name: escape
            modifier: none
            keycode: escape
            mode: [emacs, vi_normal, vi_insert]
            event: { send: esc }    # NOTE: does not appear to work
        }
        {
            name: cancel_command
            modifier: control
            keycode: char_c
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrlc }
        }
        {
            name: quit_shell
            modifier: control
            keycode: char_d
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrld }
        }
        {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
        {
            name: search_history
            modifier: control
            keycode: char_q
            mode: [emacs, vi_normal, vi_insert]
            event: { send: searchhistory }
        }
        {
            name: open_command_editor
            modifier: control
            keycode: char_o
            mode: [emacs, vi_normal, vi_insert]
            event: { send: openeditor }
        }
        {
            name: move_up
            modifier: none
            keycode: up
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menuup}
                    {send: up}
                ]
            }
        }
        {
            name: move_down
            modifier: none
            keycode: down
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menudown}
                    {send: down}
                ]
            }
        }
        {
            name: move_left
            modifier: none
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menuleft}
                    {send: left}
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: none
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintcomplete}
                    {send: menuright}
                    {send: right}
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: control
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movewordleft}
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: control
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintwordcomplete}
                    {edit: movewordright}
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: none
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolinestart}
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: char_a
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolinestart}
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: none
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintcomplete}
                    {edit: movetolineend}
                ]
            }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: control
            keycode: char_e
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: historyhintcomplete}
                    {edit: movetolineend}
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolinestart}
        }
        {
            name: move_to_line_end
            modifier: control
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {edit: movetolineend}
        }
        {
            name: move_up
            modifier: control
            keycode: char_p
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menuup}
                    {send: up}
                ]
            }
        }
        {
            name: move_down
            modifier: control
            keycode: char_t
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menudown}
                    {send: down}
                ]
            }
        }
        {
            name: delete_one_character_backward
            modifier: none
            keycode: backspace
            mode: [emacs, vi_insert]
            event: {edit: backspace}
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: backspace
            mode: [emacs, vi_insert]
            event: {edit: backspaceword}
        }
        {
            name: delete_one_character_forward
            modifier: none
            keycode: delete
            mode: [emacs, vi_insert]
            event: {edit: delete}
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: delete
            mode: [emacs, vi_insert]
            event: {edit: delete}
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: char_h
            mode: [emacs, vi_insert]
            event: {edit: backspace}
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: char_w
            mode: [emacs, vi_insert]
            event: {edit: backspaceword}
        }
        {
            name: move_left
            modifier: none
            keycode: backspace
            mode: vi_normal
            event: {edit: moveleft}
        }
        {
            name: newline_or_run_command
            modifier: none
            keycode: enter
            mode: emacs
            event: {send: enter}
        }
        {
            name: move_left
            modifier: control
            keycode: char_b
            mode: emacs
            event: {
                until: [
                    {send: menuleft}
                    {send: left}
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: control
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    {send: historyhintcomplete}
                    {send: menuright}
                    {send: right}
                ]
            }
        }
        {
            name: redo_change
            modifier: control
            keycode: char_g
            mode: emacs
            event: {edit: redo}
        }
        {
            name: undo_change
            modifier: control
            keycode: char_z
            mode: emacs
            event: {edit: undo}
        }
        {
            name: paste_before
            modifier: control
            keycode: char_y
            mode: emacs
            event: {edit: pastecutbufferbefore}
        }
        {
            name: cut_word_left
            modifier: control
            keycode: char_w
            mode: emacs
            event: {edit: cutwordleft}
        }
        {
            name: cut_line_to_end
            modifier: control
            keycode: char_k
            mode: emacs
            event: {edit: cuttoend}
        }
        {
            name: cut_line_from_start
            modifier: control
            keycode: char_u
            mode: emacs
            event: {edit: cutfromstart}
        }
        {
            name: swap_graphemes
            modifier: control
            keycode: char_t
            mode: emacs
            event: {edit: swapgraphemes}
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: left
            mode: emacs
            event: {edit: movewordleft}
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: right
            mode: emacs
            event: {
                until: [
                    {send: historyhintwordcomplete}
                    {edit: movewordright}
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: char_b
            mode: emacs
            event: {edit: movewordleft}
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    {send: historyhintwordcomplete}
                    {edit: movewordright}
                ]
            }
        }
        {
            name: delete_one_word_forward
            modifier: alt
            keycode: delete
            mode: emacs
            event: {edit: deleteword}
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: backspace
            mode: emacs
            event: {edit: backspaceword}
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: char_m
            mode: emacs
            event: {edit: backspaceword}
        }
        {
            name: cut_word_to_right
            modifier: alt
            keycode: char_d
            mode: emacs
            event: {edit: cutwordright}
        }
        {
            name: upper_case_word
            modifier: alt
            keycode: char_u
            mode: emacs
            event: {edit: uppercaseword}
        }
        {
            name: lower_case_word
            modifier: alt
            keycode: char_l
            mode: emacs
            event: {edit: lowercaseword}
        }
        {
            name: capitalize_char
            modifier: alt
            keycode: char_c
            mode: emacs
            event: {edit: capitalizechar}
        }
    ]
}

# Obligatory starship code
use ~/.cache/starship/init.nu
