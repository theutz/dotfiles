# Add targets to the source state. If any target is already in the source
# state, then its source state is replaced with its current state in the
# destination directory.
export extern "chezmoi add" [
  ...file:            string                 # the file(s) to be added
  --autotemplate(-a)                         # Generate the template when adding files as templates
  --create                                   # Add files that should exist, irrespective of their contents
  --encrypt                                  # Encrypt files
  --exact                                    # Add directories exactly
  --exclude(-x):      string@"types"         # Exclude entry types (default none)
  --follow(-f)                               # Add symlink targets instead of symlinks
  --help(-h)                                 # help for add
  --include(-i):      string@"types"         # Include entry types (default all)
  --prompt(-p)                               # Prompt before adding each entry
  --quiet(-q)                                # Suppress warnings
  --recursive(-r)                            # Recurse into subdirectories (default true)
  --secrets:          string@"add_secrets"   # Scan for secrets when adding unencrypted files (default warning)
  --template(-T)                             # Add files as templates
  --template-symlinks                        # Add symlinks with target in source or home dirs as templates
  --cache:            string                 # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"bool_or_auto"  # Colorize output (default auto)
  --config(-c):       string                 # Set config file
  --config-format:    string@"config_format" # Set config file format
  --debug                                    # Include debug information in output
  --destination(-D):  string                 # Set destination directory (default /Users/michael)
  --dry-run(-n)                              # Do not make any modifications to the destination directory
  --force                                    # Make all changes without prompting
  --interactive                              # Prompt for all changes
  --keep-going(-k)                           # Keep going as far as possible after an error
  --mode:             string@"mode"          # Mode (default file)
  --no-pager                                 # Do not use the pager
  --no-tty                                   # Do not attempt to get a TTY for prompts
  --output(-o):       string                 # Write output to path instead of stdout
  --persistent-state: string                 # Set persistent state file
  --progress:         string@"bool_or_auto"  # Display progress bars (default auto)
  --source-path                              # Specify targets by source path
  --use-builtin-age:  string@"bool_or_auto"  # Use builtin age (default auto)
  --use-builtin-diff                         # Use builtin diff
  --use-builtin-git:  string@"bool_or_auto"  # Use builtin git (default auto)
  --verbose(-v)                              # Make output more verbose
  --working-tree(-W): string                 # Set working tree directory
]

def mode [] {[file symlink]}
def config_format [] { [json toml yaml] }
def bool_or_auto [] { [on off auto] }
def add_secrets [] {[[value description]; [ignore ""] [warning "default"] [error ""]]}
def types [] {
  const positive = [
    [value       description];
    ["all"       "All entries"]
    ["none"      "No entries"]
    ["dirs"      "Directories"]
    ["files"     "Files"]
    ["remove"    "Removes"]
    ["scripts"   "Scripts"]
    ["symlinks"  "Symbolic links"]
    ["always"    "Scripts that are always run"]
    ["encrypted" "Encrypted entries"]
    ["externals" "External entries"]
    ["templates" "Templates"]
  ]
  let negative = $positive | each {|x| { value: $"no($x.value)", description: $"Exclude ($x.description | str downcase)" }}
  $positive | append $negative
}
