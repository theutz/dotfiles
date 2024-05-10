use completions.nu *

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
  --secrets:          string@"secrets"   # Scan for secrets when adding unencrypted files (default warning)
  --template(-T)                             # Add files as templates
  --template-symlinks                        # Add symlinks with target in source or home dirs as templates
  --cache:            string                 # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"bool-or-auto"  # Colorize output (default auto)
  --config(-c):       string                 # Set config file
  --config-format:    string@"config-format" # Set config file format
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
  --progress:         string@"bool-or-auto"  # Display progress bars (default auto)
  --source-path                              # Specify targets by source path
  --use-builtin-age:  string@"bool-or-auto"  # Use builtin age (default auto)
  --use-builtin-diff                         # Use builtin diff
  --use-builtin-git:  string@"bool-or-auto"  # Use builtin git (default auto)
  --verbose(-v)                              # Make output more verbose
  --working-tree(-W): string                 # Set working tree directory
]

# Remove targets from the source state, i.e. stop managing them. targets must
# have entries in the source state. They cannot be externals.
export extern "chezmoi forget" [
  ...file:            string                 # the file(s) to be forgotten
  --help(-h)                                 # help for forget
  --cache:            string                 # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"bool-or-auto"  # Colorize output (default auto)
  --config(-c):       string                 # Set config file
  --config-format:    string@"config-format" # Set config file format
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
  --progress:         string@"bool-or-auto"  # Display progress bars (default auto)
  --source-path                              # Specify targets by source path
  --use-builtin-age:  string@"bool-or-auto"  # Use builtin age (default auto)
  --use-builtin-diff                         # Use builtin diff
  --use-builtin-git:  string@"bool-or-auto"  # Use builtin git (default auto)
  --verbose(-v)                              # Make output more verbose
  --working-tree(-W): string                 # Set working tree directory
]

# Print the status of the files and scripts managed by chezmoi in a format
# similar to git status https://git-scm.com/docs/git-status.
# 
# The first column of output indicates the difference between the last state
# written by chezmoi and the actual state. The second column indicates the
# difference between the actual state and the target state, and what effect
# running chezmoi apply /apply.md will have.
# 
#   CHARACTER |  MEANING  |    FIRST COLUMN    |     SECOND COLUMN
# ------------+-----------+--------------------+-------------------------
#   Space     | No change | No change          | No change
#   A         | Added     | Entry was created  | Entry will be created
#   D         | Deleted   | Entry was deleted  | Entry will be deleted
#   M         | Modified  | Entry was modified | Entry will be modified
#   R         | Run       | Not applicable     | Script will be run
export extern "chezmoi status" [
  ...files:           string                 # the target paths to include in the output
  --exclude(-x):      string@"types"         # Exclude entry types (default none)
  --help(-h)                                 # help for status
  --include(-i):      string@"types"         # Include entry types (default all)
  --init                                     # Recreate config file from template
  --path-style(-p):   string@"path-style"    # Path style (default relative)
  --recursive(-r)                            # Recurse into subdirectories (default true)
  --cache:            string                 # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"bool-or-auto"  # Colorize output (default auto)
  --config(-c):       string                 # Set config file
  --config-format:    string@"config-format" # Set config file format
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
  --progress:         string@"bool-or-auto"  # Display progress bars (default auto)
  --source-path                              # Specify targets by source path
  --use-builtin-age:  string@"bool-or-auto"  # Use builtin age (default auto)
  --use-builtin-diff                         # Use builtin diff
  --use-builtin-git:  string@"bool-or-auto"  # Use builtin git (default auto)
  --verbose(-v)                              # Make output more verbose
  --working-tree(-W): string                 # Set working tree directory
]
