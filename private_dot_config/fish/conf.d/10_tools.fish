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
