####
#### Tool Initialization
####
# Initialize external tools that modify shell behavior

# Starship prompt - modern, customizable shell prompt
eval (starship init fish)

# zoxide - smarter cd with frecency tracking
zoxide init fish | source

# atuin - enhanced shell history with search, sync, and statistics
atuin init fish | source

# fzf - configure from a file instead of entirely through env vars
set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzf/config

# Gum configuration (interactive command-line prompt tool)
set -gx GUM_FILTER_INDICATOR "❯"
