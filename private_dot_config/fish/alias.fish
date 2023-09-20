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

abbr tf terraform
alias tfstate "terraform state show (terraform state list | fzf) | bat -l hcl --plain"

# fzf
if type -q fzf
    # Options + Ayu Dark-derived theme
    set -gx FZF_DEFAULT_OPTS "--cycle --layout=reverse-list --border" \
        "--height=80% --preview-window=wrap --marker='@' --pointer='@'" \
        "--color=fg:#bfbdb6,bg:#242936,hl:#ffb454 --color=fg+:#bfbdb6,bg+:#2e3e51,hl+:#ffb454 --color=info:#afaf87,prompt:#ffb454,pointer:#39bae6 --color=marker:#ffb454,spinner:#39bae6,header:#e6b673"
end

# tmux
abbr tma "tmux a"

# Shorthand for built-in stuff
abbr c clear
abbr x exit
