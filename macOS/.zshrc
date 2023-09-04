# Reconstructing my .zshrc file after I deleted it by accident. ... oops.
# 2023-04-29: Adding basic environmental variables & zsh utilities
# 2023-04-30: Tweaks to prompts
# 2023-05-07: Changes based on settuping up Arch (btw) on the home pc.

export EDITOR=nvim
export HOMEBREW_INSTALL_BADGE='☕'
export RPROMPT='%F{green}%h%f | %F{magenta}%T%f'
export PROMPT='%F{blue}%~>%f'

# History
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY

# Other basic options
setopt AUTO_CD
setopt NOTIFY

# Plugins
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


# Common aliases cobbled from old reddit posts and github repos
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias la='ls -AFGhloyu'

# Trying to add custom user path
export PATH="${HOME}/bin:${PATH}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
