# Homebrew path
eval (/opt/homebrew/bin/brew shellenv)

# Starship
eval (starship init fish)

# Load bindings and aliases
source ~/.config/fish/bindings.fish
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
