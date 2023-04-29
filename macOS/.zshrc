# Reconstructing my .zshrc file after I deleted it by accident. ... oops.
# 2023-04-29: Adding basic environmental variables & zsh utilities

export EDITOR=nvim
export HOMEBREW_INSTALL_BADGE='☕'

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hunterlockwood/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hunterlockwood/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hunterlockwood/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hunterlockwood/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

