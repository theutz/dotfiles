function cmfzf --description 'Use fzf to filter files in chezmoi status'
    set files $(chezmoi status | fzf --multi | awk '{ print $2 }')

    for file in $files
        string join / $HOME $file
    end
end
