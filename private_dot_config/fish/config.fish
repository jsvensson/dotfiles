# Homebrew path
eval (/opt/homebrew/bin/brew shellenv)

# Starship
eval (starship init fish)

# Load aliases
source ~/.config/fish/alias.fish

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
