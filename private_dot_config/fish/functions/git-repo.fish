function git-repo -d 'Navigate to a git repository'
    set -l query (commandline -b)
    [ -n query ]
    ghq list | gum filter --header "Select repository" --height 20 --padding "0 2" | read select
    [ -n "$select" ]; and builtin cd (ghq root)/$select
    commandline -r ''
    commandline -f repaint
end
