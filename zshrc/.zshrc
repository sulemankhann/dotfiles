# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab




# Load completions
autoload -Uz compinit && compinit


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'



# Aliases
alias reloadcli="source $HOME/.zshrc"
alias developer="cd $HOME/Developer"
alias downloads="cd $HOME/Downloads"
alias videos="cd $HOME/Downloads/Videos"
alias vim='nvim'
alias cat="bat"
alias ls='ls --color'
alias c='clear'
# GIT
alias gs="git status"
alias gl="git log"
alias gcom="git checkout master"
alias gaa="git add ."
alias gc="git commit -m "
alias gp="git push"
alias gi="git init"
alias nah="git checkout --hard && git clean -df"
alias gr="git remote -v"
alias gra="git remote add "
alias gru="git remote set-url "
#youtube-dl
alias yd="yt-dlp "
alias ydfhd="yt-dlp -f 137+140 "

#vapor
alias vapor="./vendor/bin/vapor"



# export variables
# for kittl mono repo
export EDITOR=nvim
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
# Laravel Herd
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"
# Herd injected PHP binary.
export PATH="/Users/suleman/Library/Application Support/Herd/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/suleman/Library/Application Support/Herd/config/php"


# Shell integrations
eval "$(fzf --zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
