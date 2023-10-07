# Reconstructing my .zshrc file after I deleted it by accident. ... oops.
# 2023-04-29: Adding basic environmental variables & zsh utilities
# 2023-04-30: Tweaks to prompts
# 2023-05-07: Changes based on settuping up Arch (btw) on the home pc.
# 2023-09-05: Learned about dirstack and fixing history
# 2023-09-08: Remembering I installed things like fd
# 2023-09-23: Switching to helix, darkmode/lightmode aliases

##### Dark Mode / Light Mode #####
####   Command-line changes   ####
## fast-theme XDG:catppuccin-foo##

# A-E-S-T-H-E-T-I-C
export EDITOR=hx
export HOMEBREW_INSTALL_BADGE='☕☕☕'
export RPROMPT='%F{green}%h%f | %F{magenta}%T%f'
export PROMPT='%F{blue}%~>%f'

# find, fd, fzf
export FZF_COMPLETION_TRIGGER='??'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=" \
--reverse \
--border=double \
--info=inline \
--padding=1 \
--height=12 \
--prompt=: \
--pointer=—"

## fzf catppuccin: macchiato first, latte second

#export FZF_DEFAULT_OPTS=" \
#--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
#--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
#--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"


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
export PATH="/opt/homebrew/bin/python3:$PATH"

# Common aliases cobbled from old reddit posts and github repos
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls'
alias la='ls -AFGhloyu'
alias lsd='ls -lGd */'
alias sudo='sudo '
alias weather='curl -s "wttr.in/{Springdale,Oxford},%20Ohio?m&format=4"'
alias {lightmode,darkmode}="hx ~/.zshrc ~/.config/alacritty/alacritty.yml ~/.config/sketchybar/sketchybarrc ~/.config/helix/config.toml ~/.config/bat/config"
alias pip='pip3'
alias python='python3'
alias password='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
