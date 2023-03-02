# Homebrew path
eval (/opt/homebrew/bin/brew shellenv)

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
abbr gmd "go mod download -x"
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
if type -q brew
	abbr bup "brew update"
	abbr bo "brew outdated"
	abbr bug "brew upgrade"
end

# Misc
alias afk "open -a /System/Library/CoreServices/ScreenSaverEngine.app"
abbr brwe "brew" # maximum butterfingers 
alias ll "ls -l --git"
alias lla "ll -a"
alias ll2 "ll --tree --level=2"
alias ll3 "ll --tree --level=3"
alias ls "exa --icons"
alias llt "ll --header --accessed --modified --created"
abbr tf "terraform"

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
	# Options + Catppuccin Macchiato theme
	set -gx FZF_DEFAULT_OPTS "--cycle --layout=reverse --border" \
		"--height=90% --preview-window=wrap --marker='@'" \
		"--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796" \
		"--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6" \
		"--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
end

####
#### Autocompletion definitions
####

# 1Password CLI
if type -q op
	op completion fish | source
end

####
#### Path
####

set -gx -a PATH ~/go/bin
set -gx -a PATH ~/bin
