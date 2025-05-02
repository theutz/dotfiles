$HOME/.local/bin/mise activate fish | source

if status is-interactive
    # Initialize starship
    starship init fish | source

    # Setup atuin
    atuin init fish | source

    # Setup zoxide
    zoxide init fish | source
end
