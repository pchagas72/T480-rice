if status is-interactive
    # Enable Vi Mode (replaces zsh-vi-mode)
    fish_vi_key_bindings
    
    # Set the cursor shapes for different vi modes
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    # Starship Prompt Initialization
    starship init fish | source
    fastfetch
end

# Environment Variables
set -gx EDITOR nvim
set -gx TERMINAL alacritty
set -g fish_greeting

# Basic Aliases (migrated from common shell patterns)
alias ls="ls --color"
alias vim="nvim"
alias get_idf=". $HOME/.local/esp/esp-idf/export.sh"
alias idf="idf.py"
alias img="sxiv -t * & disown"

fish_add_path $HOME/.local/bin
