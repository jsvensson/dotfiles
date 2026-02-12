####
#### Path
####

set -gx -a PATH ~/.local/bin
set -gx -a PATH ~/bin
set -gx -a PATH ~/go/bin
set -gx -a PATH ~/.cargo/bin

# Homebrew path
eval (/opt/homebrew/bin/brew shellenv)

# Starship
eval (starship init fish)

# zoxide
zoxide init fish | source

# initialize atuin for shell history
atuin init fish | source

# Load bindings and aliases
source ~/.config/fish/bindings.fish
source ~/.config/fish/alias.fish

####
#### Theme setup
####

fish_config theme choose "Biscuit"

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


# fzf config
set -gx FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
	--cycle --layout=reverse-list --border
	--height=80% --preview-window=wrap,70% --marker='@' --pointer='@'"

# gum config
set -gx GUM_FILTER_INDICATOR 

####
#### Autocompletion definitions
####

# 1Password CLI
if type -q op
    op completion fish | source
end
