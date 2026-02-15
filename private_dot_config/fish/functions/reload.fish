####
#### Reload Function
####
# Reload all fish configuration including conf.d files

function reload -d "Reload fish configuration"
    source ~/.config/fish/config.fish
    for f in ~/.config/fish/conf.d/*.fish
        source $f
    end
    echo "Fish config reloaded ✓"
end
