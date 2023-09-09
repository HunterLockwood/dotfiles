# Reconstructing my .zshrc file after I deleted it by accident. ... oops.
# 2023-04-29: Adding basic environmental variables & zsh utilities
# 2023-04-30: Tweaks to prompts
# 2023-05-07: Changes based on settuping up Arch (btw) on the home pc.
# 2023-09-05: Learned about dirstack and fixing history
# 2023-09-08: Remembering I installed things like fd

# A-E-S-T-H-E-T-I-C
export EDITOR=nvim
export HOMEBREW_INSTALL_BADGE='☕'
export RPROMPT='%F{green}%h%f | %F{magenta}%T%f'
export PROMPT='%F{blue}%~>%f'

# find, fd, fzf
export FZF_COMPLETION_TRIGGER='??'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--reverse \
--border=double \
--info=inline \
--padding=1 \
--height=12 \
--prompt=: \
--pointer=—"

fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}


# Herstory
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_EXPIRE_DUPS_FIRST   # minimize dups on stack
setopt SHARE_HISTORY            # persist history (persistory)
setopt HIST_IGNORE_DUPS         # do not record if dup of prior
setopt APPEND_HISTORY           # append history instead of replace ...
setopt INC_APPEND_HISTORY       # append history right now seriously

# Directory stack to navigate
DIRSTACKSIZE=8
setopt AUTOPUSHD                # cd into pushd
setopt PUSHDIGNOREDUPS          # no dups on the stack
setopt PUSHDMINUS               # invert +/-
setopt PUSHDSILENT              # don't print stack every time
setopt PUSHDTOHOME              # go to ~ with argumentless pushd
alias dh='dirs -v'              # set dh to become a 'directory history' command

# Setting some basic options
setopt AUTO_CD                  # cd without cd
setopt NOTIFY                   # notify when jobs finish

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Basic custom path, manpath stuff 
export PATH="${HOME}/bin:${PATH}"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"

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
alias l='ls'
alias la='ls -AFGhloyu'
alias lsd='ls -lGd */'
alias sudo='sudo '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
