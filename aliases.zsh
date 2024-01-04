# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
weather() { curl -4 wttr.in/${1:-antwerp} }
alias c="clear"

# Directories
alias sites="cd $HOME/Sites"
alias downloads="cd $HOME/Downloads"
alias videos="cd $HOME/Downloads/Videos"
alias nv="cd $HOME/.config/nvim"
alias v="nvim "


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
alias yd="youtube-dl "
alias ydfhd="youtube-dl -f 137+140 "
alias ydhd="youtube-dl -f 136+140 "

alias ctags="`brew --prefix`/bin/ctags"
