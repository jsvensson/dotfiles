function fzf_change_directory -d 'Go to local directory'
    set -l query (commandline -b)
    [ -n query ]; and set flags --query="$query"; or set flags
    fd -t d | fzf $flags --preview "ll {}" | read select
    [ -n "$select" ]; and builtin cd $select
    commandline -f repaint
end
