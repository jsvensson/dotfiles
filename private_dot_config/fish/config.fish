####
#### Fish Configuration
####
# Core shell settings are auto-loaded from conf.d/ in alphabetical order.
# No manual sourcing needed - just add .fish files to conf.d/ with numeric prefixes.

# Theme setup is handled by conf.d/30_theme.fish
# Tool initialization (starship, zoxide, atuin) by conf.d/10_tools.fish
# Editor/SSH config handled by conf.d/20_editor.fish

####
#### Post-config
#### This is intended for edge cases that need to be set after extensions load.

# Bind Ctrl-R to atuin (overrides fzf's history binding which loads earlier)
if status is-interactive
    bind \cr _atuin_search
end
