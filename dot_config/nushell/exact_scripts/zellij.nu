# Zellij session management aliases

# List all zellij sessions
export alias zjls = zellij list-sessions

# Attach to a session (or create if it doesn't exist)
export alias zja = zellij attach

# Create a new session
export alias zjn = zellij --session

# Kill a session
export alias zjk = zellij kill-session

# Kill all sessions
export alias zjka = zellij kill-all-sessions

# Delete a session
export alias zjd = zellij delete-session

# Run zellij with a specific layout
export alias zjl = zellij --layout

# Run zellij action (for scripting)
export alias zjr = zellij run

# Edit zellij config
export alias zjc = zellij setup --dump-config

# Setup zellij (generate config, completions, etc.)
export alias zjs = zellij setup