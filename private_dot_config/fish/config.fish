# Starship
eval (starship init fish)

####
#### Aliases
####

# Vim
alias vim "nvim"

# Git
abbr gb "git branch"
abbr gco "git checkout"
alias gl "git log --graph"
alias gs "git status -sb"

# Kubernetes
alias k "kubectl"
alias kc "kubectx"

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
#### Theme setup
####

set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_display_cmd_duration no

####
#### Env vars
####

set -gx EDITOR nvim
set -gx GIT_CONFIG ~/.config/git/config

####
#### Path
####

set -gx PATH $PATH ~/go/bin
