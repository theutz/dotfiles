function readd_abbr --on-event fish_postexec
    if string match -rq "^abbr (-a|--add)\b" $argv[1]
        abbr >$fish_abbr_file
        chezmoi re-add $fish_abbr_file
    end
end
