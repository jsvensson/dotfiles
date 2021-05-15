# Starship
eval (starship init fish)

####
#### Aliases
####

# Vim
alias vim "nvim"

# Git
alias gs "git status -sb"
alias gb "git branch"
alias gl "git log --graph"

# Chezmoi
alias cm "chezmoi"

# Docker
alias dps "docker ps"
alias dim "docker image"
alias dcom "docker-compose"

# Misc
alias ls "exa --icons"
alias ll "exa -l --icons"
alias lla "ll -a"
alias llt "ll --tree --level=2"
alias brwe "brew" # maximum butterfingers 

####
#### Env vars
####

set -gx EDITOR nvim
set -gx GIT_CONFIG ~/.config/git/config

####
#### Path
####

set -gx PATH $PATH ~/go/bin
