# Starship
eval (starship init fish)

####
#### Aliases
####

# Vim
alias vim "nvim"

# Git
abbr ga "git add"
abbr gb "git branch"
abbr gc "git commit"
abbr gco "git checkout"
alias gl "git log --graph"
alias gs "git status -sb"

# Kubernetes
abbr k "kubectl"
abbr kc "kubectx"

# Chezmoi
abbr cm "chezmoi"

# Docker
abbr dcom "docker-compose"
abbr dim "docker image"
abbr dps "docker ps"

# Misc
abbr brwe "brew" # maximum butterfingers 
alias ll "exa -l --icons"
alias lla "ll -a"
alias llt "ll --tree --level=2"
alias ls "exa --icons"

####
#### Theme setup
####

set -g theme_display_cmd_duration no
set -g theme_display_date no
set -g theme_nerd_fonts yes

####
#### Env vars
####

set -gx EDITOR nvim
set -gx GIT_CONFIG ~/.config/git/config

####
#### Path
####

set -gx PATH $PATH ~/go/bin
