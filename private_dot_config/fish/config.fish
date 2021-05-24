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
alias gbs "fzf_change_git_branch"
alias gl "git log --graph"
alias gs "git status -sb"

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

if type -q fzf
	set -gx FZF_DEFAULT_OPTS "--cycle --layout=reverse --border" \
		"--height=90% --preview-window=wrap --marker='@'" \
		"--color=gutter:-1,bg+:3,fg+:0,hl+:9,hl:#ffffff"
end

####
#### Path
####

set -gx -a PATH ~/go/bin
