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
abbr gcm "git commit -m"
abbr gco "git checkout"
alias gbs "fzf_change_git_branch"
alias gl "git log --graph"
alias gs "git status -sb"

# Go
abbr gmt "go mod tidy -v"

# Kubernetes
abbr k "kubectl"
abbr kc "kubectx"
abbr kns "kubens"

# Chezmoi
abbr cm "chezmoi"

# Docker
abbr dcom "docker-compose"
abbr dim "docker image"
abbr dps "docker ps"

# Brew
abbr bup "brew update"
abbr bo "brew outdated"
abbr bug "brew upgrade"

# Misc
abbr brwe "brew" # maximum butterfingers 
alias ll "ls -l --git"
alias lla "ll -a"
alias ll2 "ll --tree --level=2"
alias ll3 "ll --tree --level=3"
alias ls "exa --icons"
alias llt "ll --header --accessed --modified --created"

####
#### Theme setup
####

set -g theme_display_cmd_duration no
set -g theme_display_date no
set -g theme_nerd_fonts yes

####
#### Env vars
####

set -gx LC_CTYPE UTF-8
set -gx EDITOR nvim
set -gx GIT_CONFIG ~/.config/git/config

# SSH socket config
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

if type -q fzf
	set -gx FZF_DEFAULT_OPTS "--cycle --layout=reverse --border" \
		"--height=90% --preview-window=wrap --marker='@'" \
		"--color=gutter:-1,bg+:yellow,fg+:0,hl+:red,hl:#ffffff"
end

####
#### Path
####

set -gx -a PATH ~/go/bin
