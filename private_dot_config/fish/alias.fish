####
#### Aliases
####

# fish
alias reload "source ~/.config/fish/config.fish"

# Vim
alias vim nvim

# Git
abbr g gitui
abbr ga "git add"
abbr gb "git branch"
abbr gc "git commit"
abbr gcm "git commit -m"
abbr gco "git checkout"
abbr gfa "git fetch --all --prune"
alias gl "git log --graph"
alias gs "git status -sb"

# Go
abbr gmd "go mod download -x"
abbr gmt "go mod tidy -v"
alias goland "open -na GoLand.app"

# Kubernetes
abbr k kubectl
abbr kc kubectx
abbr kns kubens

# Chezmoi
abbr cm chezmoi

# Docker
abbr dcom docker-compose
abbr dim "docker image"
abbr dps "docker ps"

# Brew
if type -q brew
    abbr bup "brew update"
    abbr bo "brew outdated"
    abbr bug "brew upgrade"
end

if type -q bat
    alias cat bat
end

# Surely nothing can go wrong with this.
if type -q z
    alias cd z
end

# Replace dig with doggo
if type -q doggo
    abbr dig doggo
end

# Misc
alias afk "open -a /System/Library/CoreServices/ScreenSaverEngine.app"
abbr brwe brew # maximum butterfingers

# exa
if type -q eza
    alias ll "ls -l --git"
    alias lla "ll -a"
    alias ll2 "ll --tree --level=2"
    alias ll3 "ll --tree --level=3"
    alias ls "eza --icons"
    alias llt "ll --header --accessed --modified --created"
end

abbr tf tofu
alias tfstate "tofu state show (tofu state list | fzf) | bat -l hcl --plain"

# Shorthand for built-in stuff
abbr c clear
abbr x exit
