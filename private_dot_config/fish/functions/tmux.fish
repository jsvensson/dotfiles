function tmux --description "Smart tmux wrapper that attaches to existing sessions or creates new one"
    # If already inside tmux, run command normally
    if set -q TMUX
        command tmux $argv
        return
    end
    
    # Get list of existing sessions
    set sessions (tmux list-sessions 2>/dev/null)
    
    if test -n "$sessions"
        # Sessions exist, attach to the first one
        # Extract session name from first line (format: "0: 1 windows...")
        set session_name (echo $sessions[1] | cut -d: -f1)
        command tmux attach -t "$session_name"
    else
        # No sessions exist, create new one named "echo"
        command tmux new-session -s echo
    end
end