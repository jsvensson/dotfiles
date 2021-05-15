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
alias ll "exa -l --icons"
alias llt "ll --tree --level=2"
alias brwe "brew" # maximum butterfingers 

####
#### Env vars
####

set -gx EDITOR vim

####
#### Path
####

set -gx PATH $PATH ~/go/bin
