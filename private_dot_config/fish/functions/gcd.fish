function gcd
    set dir (git rev-parse --show-toplevel 2>&1)
    if not test -d $dir
        echo "Not in a git repo" 
        return 1
    end

    cd dir
end
