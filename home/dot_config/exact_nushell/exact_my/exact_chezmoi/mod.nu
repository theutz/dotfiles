export extern main [...args] {
  ^chezmoi ...$args
}

# Add an existing file, directory, or symlink to the source state
#
# Description:
#   Add targets to the source state. If any target is already in the source state,
#   then its source state is replaced with its current state in the destination
#   directory.
# 
# Usage:
#   chezmoi add targets... [flags]
# 
# Aliases:
#   add, manage
# 
# Examples:
#   $ chezmoi add ~/.bashrc
#   $ chezmoi add ~/.gitconfig --template
#   $ chezmoi add ~/.ssh/id_rsa --encrypt
#   $ chezmoi add ~/.vim --recursive
#   $ chezmoi add ~/.oh-my-zsh --exact --recursive

def "cmp types" [] { [
  { value: all, description: "All entries" }
  { value: none, description: "No entries" }
  { value: dirs, description: "Directories" }
  { value: files, description: "Files" }
  { value: remove, description: "Removes" }
  { value: scripts, description: "Scripts" }
  { value: symlinks, description: "Symbolic links" }
  { value: always, description: "Scripts that are always run" }
  { value: encrypted, description: "Encrypted entries" }
  { value: externals, description: "External entries" }
  { value: templates, description: "Templates" }
] }
def "cmp secrets" [] { [error ignore warning] }
def "cmp config-format" [] { [json toml yaml] }
def "cmp mode" [] { [file symlink] }
def "cmp bool-auto" [] { ["true" "false" "auto"] }
def "cmp ref-ext" [] { [always auto never] }

export extern add [
  # Global Flags
  --cache: path                                                  # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color: string@"cmp bool-auto"                                # Colorize output (default auto)
  --config (-c): path                                            # Set config file
  --config-format: string@"cmp config-format"                    # Set config file format
  --debug                                                        # Include debug information in output
  --destination (-D): path                                       # Set destination directory (default /Users/michael)
  --dry-run (-n)                                                 # Do not make any modifications to the destination directory
  --force                                                        # Make all changes without prompting
  --interactive                                                  # Prompt for all changes
  --keep-going (-k)                                              # Keep going as far as possible after an error
  --mode: string@"cmp mode"                                      # Mode (default file)
  --no-pager                                                     # Do not use the pager
  --no-tty                                                       # Do not attempt to get a TTY for prompts
  --output (-o): path                                            # Write output to path instead of stdout
  --persistent-state: path                                       # Set persistent state file
  --progress: string@"cmp bool-auto"                             # Display progress bars (default auto)
  --refresh-externals (-R): string@"cmp ref-ext"                 # Refresh external cache (default auto)
  --source (-S): path                                            # Set source directory (default /Users/michael/.local/share/chezmoi)
  --source-path                                                  # Specify targets by source path
  --use-builtin-age: string@"cmp bool-auto"                      # Use builtin age (default auto)
  --use-builtin-diff                                             # Use builtin diff
  --use-builtin-git: string@"cmp bool-auto"                      # Use builtin git (default auto)
  --verbose (-v)                                                 # Make output more verbose
  --working-tree (-W): path                                      # Set working tree directory

  # Specific Flags
  --autotemplate (-a)                                            # Generate the template when adding files as templates
  --create                                                       # Add files that should exist, irrespective of their contents
  --encrypt                                                      # Encrypt files
  --exact                                                        # Add directories exactly
  --exclude (-x): string@"cmp types"                             # Exclude entry types (default none)
  --follow (-f)                                                  # Add symlink targets instead of symlinks
  --help (-h)                                                    # help for add
  --include (-i): string@"cmp types"                             # Include entry types (default all)
  --prompt (-p)                                                  # Prompt before adding each entry
  --quiet (-q)                                                   # Suppress warnings
  --recursive (-r)                                               # Recurse into subdirectories (default true)
  --secrets: string@"cmp secrets"                                # Scan for secrets when adding unencrypted files (default warning)
  --template (-T)                                                # Add files as templates
  --template-symlinks                                            # Add symlinks with target in source or home dirs as templates

  # Positionals
  ...targets: path                                               # Path(s) to add to the source
]: nothing -> nothing

# Interact with age
export extern age []

# Update the destination directory to match the target state
export extern apply []

# Generate a tar archive of the target state
export extern archive []

# Print the target contents of a file, script, or symlink
export extern cat []

# Print the configuration file
export extern cat-config []

# Launch a shell in the source directory
export extern cd []

# Change the attributes of a target in the source state
export extern chattr []

# Generate shell completion code
export extern completion []

# Print the template data
export extern data []

# Decrypt file or standard input
export extern decrypt []

# Permanently delete an entry from the source state, the destination directory, and the state
export extern destroy []

# Print the diff between the target state and the destination state
export extern diff []

# Check your system for potential problems
export extern doctor []

# Generate a dump of the target state
export extern dump []

# Dump the configuration values
export extern dump-config []

# Edit the source state of a target
export extern edit []

# Edit the configuration file
export extern edit-config []

# Edit the configuration file template
export extern edit-config-template []

# Encrypt file or standard input
export extern encrypt []

# Execute the given template(s)
export extern execute-template []

# Remove a target from the source state
export extern forget []

# Generate a file for use with chezmoi
export extern generate []

# Run git in the source directory
export extern git []

# Print help about a command
export extern help []

# Print ignored targets
export extern ignored []

# Import an archive into the source state
export extern import []

# Setup the source directory and update the destination directory to match the target state
export extern init []

# Print license
export extern license []

# List the managed entries in the destination directory
export extern managed []

# Perform a three-way merge between the destination state, the source state, and the target state
export extern merge []

# Perform a three-way merge for each modified file
export extern merge-all []

# Purge chezmoi's configuration and data
export extern purge []

# Re-add modified files
export extern re-add []

# Interact with a secret manager
export extern secret []

# Print the source path of a target
export extern source-path []

# Manipulate the persistent state
export extern state []

# Show the status of targets
export extern status []

# Print the target path of a source path
export extern target-path []

# List the unmanaged files in the destination directory
export extern unmanaged []

# Pull and apply any changes
export extern update []

# Upgrade chezmoi to the latest released version
export extern upgrade []

# Exit with success if the destination state matches the target state, fail otherwise
export extern verify []
