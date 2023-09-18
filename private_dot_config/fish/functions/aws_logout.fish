function aws_logout -d 'Log out of aws and aws-vault'
    # Find all env vars starting with 'AWS_'
    set tokens (set | grep '^AWS_' | cut -f 1 -d ' ')
    for t in $tokens
        set -e $t
    end
end
