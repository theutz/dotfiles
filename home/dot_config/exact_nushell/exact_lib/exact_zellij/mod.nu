# Tools for working with zellij

def list-layouts []: nothing -> list<string> {
  glob ~/.config/zellij/layouts/**/*.kdl
}

# Tiling window manager for the terminal
export extern main [
    --config (-c): path                                 # Change where zellij looks for the configuration file [env: ZELLIJ_CONFIG_FILE=]
    --config-dir: path                                  # Change where zellij looks for the configuration directory [env: ZELLIJ_CONFIG_DIR=]
    --debug (-d)                                        # Specify emitting additional debug information
    --data-dir: path                                    # Change where zellij looks for plugins
    --help (-h)                                         # Print help information
    --layout (-l): string@list-layouts                  # Name of a predefined layout inside the layout directory or the path to a layout file if inside a session (or using the --session flag) will be added to the session as a new tab or tabs, otherwise will start a new session
    --max-panes: number                                 # Maximum panes on screen, caution: opening more panes will close old ones
    --new-session-with-layout (-n): string@list-layouts # Name of a predefined layout inside the layout directory or the path to a layout file. Will always start a new session, even if inside an existing session
    --session (-s): string                              # Specify name of a new session
    --version (-V):                                     # Print version information
]

def directions []: nothing -> list<string> {
  [right left up down]
}

# Send actions to a specific session
export module action {
  # Clear all buffers for a focused pane
  export extern clear []

  # Close the focused pane
  export extern close-pane []

  # Close the current tab
  export extern close-tab []

  # Dump current layout to stdout
  export extern dump-layout []

  # Dump the focused pane to a file
  export extern dump-screen []

  # Open the specified file in a new zellij pane with your default EDITOR
  export extern edit []

  # Open the pane scrollback in your default editor
  export extern edit-scrollback []

  # Change focus to the next pane
  export extern focus-next-pane []

  # Change focus to the previous pane
  export extern focus-previous-pane []

  # Go to the next tab
  export extern go-to-next-tab []

  # Go to the previous tab
  export extern go-to-previous-tab []

  # Go to tab with index
  export extern go-to-tab [index: number]

  # Go to tab with name
  export extern go-to-tab-name [name: string]

  # Scroll down half page in focus pane
  export extern half-page-scroll-down []

  # Scroll up half page in focus pane
  export extern half-page-scroll-up []

  # Print this message or the help of the given subcommand(s)
  export extern help []

  export extern launch-or-focus-plugin []

  export extern launch-plugin []

  export extern list-clients []

  # Move the focused pane in the specified direction.
  export extern move-focus [direction: string@directions]

  # Move focus to the pane or tab (if on screen edge) in the specified direction
  export extern move-focus-or-tab [direction: string@directions]

  # Change the location of the focused pane in the specified direction or rotate forwrads 
  export extern move-pane [direction: string@directions]

  # Rotate the location of the previous pane backwards
  export extern move-pane-backwards []

  def horizontal-directions []: nothing -> list<string> {
    [right left]
  }

  # Move the focused tab in the specified direction.
  export extern move-tab [direction: string@horizontal-directions]

  def new-pane-directions []: nothing -> list<string> {
    [right down]
  }

  # Open a new pane in the specified direction. If no direction is specified, will try to use the biggest available space
  export extern new-pane [direction?: string@new-pane-directions]

  # Create a new tab, optionally with a specified tab layout and name
  export extern new-tab [
    --layout (-l): string@list-layouts # Layout to use for the new tab
    --name (-n): string # Name of the new tab
  ]

  export extern next-swap-layout []

  # Scroll down one page in focus pane
  export extern page-scroll-down []

  # Scroll up one page in focus pane
  export extern page-scroll-up []

  # Send data to one or more plugins, launch them if they are not running
  export extern pipe []

  export extern previous-swap-layout []

  # Query all tab names
  export extern query-tab-names []

  # Renames the focused pane
  export extern rename-pane []

  export extern rename-session []

  # Renames the focused pane
  export extern rename-tab []

  def inc-dec []: nothing -> list<string> {
    [increase decrease]
  }

  # [increase|decrease] the focused panes area at the [left|down|up|right] border
  export extern resize [
    resize: string@inc-dec
    direction?: string@directions
  ]

  # Scroll down in focus pane
  export extern scroll-down []

  # Scroll down to bottom in focus pane
  export extern scroll-to-bottom []

  # Scroll up to top in focus pane
  export extern scroll-to-top []

  # Scroll up in the focused pane
  export extern scroll-up []

  export extern start-or-reload-plugin []

  def modes []: nothing -> list<string> {
    [locked pane tab resize move search session]
  }

  # Switch input mode of all connected clients 
  export extern switch-mode [mode: string@modes]

  # Toggle between sending text commands to all panes on the current tab and normal mode
  export extern toggle-active-sync-tab []

  # Toggle the visibility of all floating panes in the current Tab, open one if none exist
  export extern toggle-floating-panes []

  # Toggle between fullscreen focus pane and normal layout
  export extern toggle-fullscreen []

  # Embed focused pane if floating or float focused pane if embedded
  export extern toggle-pane-embed-or-floating []

  # Toggle frames around panes in the UI
  export extern toggle-pane-frames []

  # Remove a previously set pane name
  export extern undo-rename-pane []

  # Remove a previously set tab name
  export extern undo-rename-tab []

  # Write bytes to the terminal
  export extern write []

  # Write characters to the terminal
  export extern write-chars []
}

export alias ac = action

# Attach to a session
export use module attach {
  export extern main [
    name: string              # Name of the session to attach to
    --create-background (-b)  # Create a detached session in the background if one does not exist
    --create (-c)             # Create a session if one does not exist
    --force-run-commands (-f) # If resurrecting a dead session, immediately run all its commands on startup
    --help (-h)               # Print help information
    --index: number           # Number of the session index in the active sessions ordered creation
  ]

  # Change the behavior of zellij
  export extern options []
}

export alias a = attach

export extern convert-config []

export extern convert-layout []

export extern convert-theme []

# Delete all sessions
export extern delete-all-sessions [
  --force (-f) # Kill the sessions if they're running before deleting them
  --help (-h)  # Print help information
  --yes (-y)   # Automatic yes to prompts
]

export alias da = delete-all-sessions

def cmp-list-sessions []: nothing -> list<string> {
  ^zellij list-sessions --short | lines
}

# Delete a specific session
export extern delete-session [
  session: string@cmp-list-sessions
  --force (-f) # Kill the session if it's running before deleting it
  --help (-h)  # Print help information
]

export alias d = delete-session

# Edit file with default $EDITOR / $VISUAL
export extern edit []

export alias e = edit

# Print this message or the help of the given subcommand(s)
export extern help []

# Kill all sessions
export extern kill-all-sessions [
  --help (-h) # Print help information
  --yes (-y)  # Automatic yes to prompts
]

export alias ka = kill-all-sessions

# Kill a specific session
export extern kill-session [
  session: string@cmp-list-sessions
]

export alias k = kill-session

# List existing plugin aliases
export extern list-aliases []

export alias la = list-aliases

# List active sessions
export extern list-sessions [
  --help (-h)          # Print help information
  --no-formatting (-n) # Do not add colors and formatting to the list (useful for parsing)
  --reverse (-r)       # List the sessions in reverse order (default is ascending order)
  --short (-s)         # Print just the session name
]

export alias ls = list-sessions

# Change the behaviour of zellij
export extern options []

# Send data to one or more plugins, launch them if they are not running
export extern pipe []

# Load a plugin
export extern plugin []

export alias p = plugin

# Run a command in a new pane
export extern run [
  --close-on-exit (-c)                # Close the pane immediately when its command exits
  --cwd: path                         # Change the working directory of the new pane
  --direction (-d): string@directions # Direction to open the new pane in
  --floating (-f)                     # Open the new pane in floating mode
  --help (-h)                         # Print help information
  --height: number                    # The height if the pane is floating as a bare integer (eg. 1) or percent (eg. 10%)
  --in-place (-i)                     # Open the new pane in place of the current pane, temporarily suspending it
  --name (-n): string                 # Name of the new pane
  --start-suspended (-s)              # Start the command suspended, only running after you first presses ENTER
  --width: number                     # The width if the pane is floating as a bare integer (eg. 1) or percent (eg. 10%)
  --x (-x): number                    # The x coordinates if the pane is floating as a bare integer (eg. 1) or percent (eg. 10%)
  --y (-y): number                    # The y coordinates if the pane is floating as a bare integer (eg. 1) or percent (eg. 10%)
  ...command: string                  # Command to run
]

export alias r = run

# Setup zellij and check its configuration
export extern setup []

export module aliases {
  export alias zj = ^zellij
  export alias zja = zellij attach
  export alias zjac = zellij action
  export alias zjls = zellij list-sessions
}
