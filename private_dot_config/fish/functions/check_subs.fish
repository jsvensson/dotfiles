function check_subs --description "Check .mkv/.m4v files for embedded subtitles"
    argparse h/help m/missing-only n/names-only -- $argv
    or return 2

    if set -q _flag_help
        echo "Usage: check_subs [options] [dir]"
        echo
        echo "Check .mkv/.m4v files in dir (default: .) for embedded subtitle"
        echo "streams, and list the subtitle language tags of each file."
        echo
        echo "Options:"
        echo "  -m, --missing-only   List only files with no embedded subtitles"
        echo "  -n, --names-only     Print only file names, no status or languages"
        echo "  -h, --help           Show this help and exit"
        return 0
    end

    if set -q argv[1]
        set dir $argv[1]
    else
        set dir .
    end

    set -l found_any 0

    for f in $dir/*.mkv $dir/*.m4v
        if not test -e "$f"
            if test $found_any -eq 0
                echo "No .mkv or .m4v files found in $dir"
                return 1
            end
            continue
        end
        set found_any 1

        set langs (ffprobe -v error -select_streams s \
            -show_entries stream=stream:stream_tags=language \
            -of csv=p=0 "$f" 2>/dev/null \
            | sed 's/^s[0-9]*,//' | sort -u | paste -sd, -)

        if test -n "$langs"
            and set -q _flag_missing_only
            continue
        end

        if set -q _flag_names_only
            echo (basename "$f")
        else if test -n "$langs"
            echo "SUBS   $langs  —  "(basename "$f")
        else
            echo "NONE          —  "(basename "$f")
        end
    end
end
