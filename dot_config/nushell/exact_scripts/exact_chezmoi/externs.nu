use completions.nu *

# Add targets to the source state. If any target is already in the source
# state, then its source state is replaced with its current state in the
# destination directory.
export extern "chezmoi add" [
  ...file:            string                                     # the file(s) to be added
  --autotemplate(-a)                                             # Generate the template when adding files as templates
  --create                                                       # Add files that should exist, irrespective of their contents
  --encrypt                                                      # Encrypt files
  --exact                                                        # Add directories exactly
  --exclude(-x):      string@"nu-complete chezmoi types"         # Exclude entry types (default none)
  --follow(-f)                                                   # Add symlink targets instead of symlinks
  --help(-h)                                                     # help for add
  --include(-i):      string@"nu-complete chezmoi types"         # Include entry types (default all)
  --prompt(-p)                                                   # Prompt before adding each entry
  --quiet(-q)                                                    # Suppress warnings
  --recursive(-r)                                                # Recurse into subdirectories (default true)
  --secrets:          string@"nu-complete chezmoi secrets"       # Scan for secrets when adding unencrypted files (default warning)
  --template(-T)                                                 # Add files as templates
  --template-symlinks                                            # Add symlinks with target in source or home dirs as templates
  --cache:            string                                     # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"nu-complete chezmoi bool-or-auto"  # Colorize output (default auto)
  --config(-c):       string                                     # Set config file
  --config-format:    string@"nu-complete chezmoi config-format" # Set config file format
  --debug                                                        # Include debug information in output
  --destination(-D):  string                                     # Set destination directory (default /Users/michael)
  --dry-run(-n)                                                  # Do not make any modifications to the destination directory
  --force                                                        # Make all changes without prompting
  --interactive                                                  # Prompt for all changes
  --keep-going(-k)                                               # Keep going as far as possible after an error
  --mode:             string@"nu-complete chezmoi mode"          # Mode (default file)
  --no-pager                                                     # Do not use the pager
  --no-tty                                                       # Do not attempt to get a TTY for prompts
  --output(-o):       string                                     # Write output to path instead of stdout
  --persistent-state: string                                     # Set persistent state file
  --progress:         string@"nu-complete chezmoi bool-or-auto"  # Display progress bars (default auto)
  --source-path                                                  # Specify targets by source path
  --use-builtin-age:  string@"nu-complete chezmoi bool-or-auto"  # Use builtin age (default auto)
  --use-builtin-diff                                             # Use builtin diff
  --use-builtin-git:  string@"nu-complete chezmoi bool-or-auto"  # Use builtin git (default auto)
  --verbose(-v)                                                  # Make output more verbose
  --working-tree(-W): string                                     # Set working tree directory
]

# Remove targets from the source state, i.e. stop managing them. targets must
# have entries in the source state. They cannot be externals.
export extern "chezmoi forget" [
  ...file:            string                                     # the file(s) to be forgotten
  --help(-h)                                                     # help for forget
  --cache:            string                                     # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"nu-complete chezmoi bool-or-auto"  # Colorize output (default auto)
  --config(-c):       string                                     # Set config file
  --config-format:    string@"nu-complete chezmoi config-format" # Set config file format
  --debug                                                        # Include debug information in output
  --destination(-D):  string                                     # Set destination directory (default /Users/michael)
  --dry-run(-n)                                                  # Do not make any modifications to the destination directory
  --force                                                        # Make all changes without prompting
  --interactive                                                  # Prompt for all changes
  --keep-going(-k)                                               # Keep going as far as possible after an error
  --mode:             string@"nu-complete chezmoi mode"          # Mode (default file)
  --no-pager                                                     # Do not use the pager
  --no-tty                                                       # Do not attempt to get a TTY for prompts
  --output(-o):       string                                     # Write output to path instead of stdout
  --persistent-state: string                                     # Set persistent state file
  --progress:         string@"nu-complete chezmoi bool-or-auto"  # Display progress bars (default auto)
  --source-path                                                  # Specify targets by source path
  --use-builtin-age:  string@"nu-complete chezmoi bool-or-auto"  # Use builtin age (default auto)
  --use-builtin-diff                                             # Use builtin diff
  --use-builtin-git:  string@"nu-complete chezmoi bool-or-auto"  # Use builtin git (default auto)
  --verbose(-v)                                                  # Make output more verbose
  --working-tree(-W): string                                     # Set working tree directory
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
  ...files:           string                                     # the target paths to include in the output
  --exclude(-x):      string@"nu-complete chezmoi types"         # Exclude entry types (default none)
  --help(-h)                                                     # help for status
  --include(-i):      string@"nu-complete chezmoi types"         # Include entry types (default all)
  --init                                                         # Recreate config file from template
  --path-style(-p):   string@"nu-complete chezmoi path-style"    # Path style (default relative)
  --recursive(-r)                                                # Recurse into subdirectories (default true)
  --cache:            string                                     # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"nu-complete chezmoi bool-or-auto"  # Colorize output (default auto)
  --config(-c):       string                                     # Set config file
  --config-format:    string@"nu-complete chezmoi config-format" # Set config file format
  --debug                                                        # Include debug information in output
  --destination(-D):  string                                     # Set destination directory (default /Users/michael)
  --dry-run(-n)                                                  # Do not make any modifications to the destination directory
  --force                                                        # Make all changes without prompting
  --interactive                                                  # Prompt for all changes
  --keep-going(-k)                                               # Keep going as far as possible after an error
  --mode:             string@"nu-complete chezmoi mode"          # Mode (default file)
  --no-pager                                                     # Do not use the pager
  --no-tty                                                       # Do not attempt to get a TTY for prompts
  --output(-o):       string                                     # Write output to path instead of stdout
  --persistent-state: string                                     # Set persistent state file
  --progress:         string@"nu-complete chezmoi bool-or-auto"  # Display progress bars (default auto)
  --source-path                                                  # Specify targets by source path
  --use-builtin-age:  string@"nu-complete chezmoi bool-or-auto"  # Use builtin age (default auto)
  --use-builtin-diff                                             # Use builtin diff
  --use-builtin-git:  string@"nu-complete chezmoi bool-or-auto"  # Use builtin git (default auto)
  --verbose(-v)                                                  # Make output more verbose
  --working-tree(-W): string                                     # Set working tree directory
]

# List all managed entries in the destination directory under all paths in
# alphabetical order. When no paths are supplied, list all managed entries in
# the destination directory in alphabetical order.
export extern "chezmoi managed" [
  ...files:           string                                      # the path from which to list files
  --exclude(-x):      string@"nu-complete chezmoi types"          # Exclude entry types (default none)
  --help(-h)                                                      # help for managed
  --include(-i):      string@"nu-complete chezmoi types"          # Include entry types (default all)
  --path-style(-p):   string@"nu-complete chezmoi path-style"     # Path style (default relative)
  --tree(-t)                                                      # Print paths as a tree
  --cache:            string                                      # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"nu-complete chezmoi bool-or-auto"   # Colorize output (default auto)
  --config(-c):       string                                      # Set config file
  --config-format:    string@"nu-complete chezmoi config-format"  # Set config file format
  --debug                                                         # Include debug information in output
  --destination(-D):  string                                      # Set destination directory (default /Users/michael)
  --dry-run(-n)                                                   # Do not make any modifications to the destination directory
  --force                                                         # Make all changes without prompting
  --interactive                                                   # Prompt for all changes
  --keep-going(-k)                                                # Keep going as far as possible after an error
  --mode:             string@"nu-complete chezmoi mode"           # Mode (default file)
  --no-pager                                                      # Do not use the pager
  --no-tty                                                        # Do not attempt to get a TTY for prompts
  --output(-o):       string                                      # Write output to path instead of stdout
  --persistent-state: string                                      # Set persistent state file
  --progress:         string@"nu-complete chezmoi bool-or-auto"   # Display progress bars (default auto)
  --source-path                                                   # Specify targets by source path
  --use-builtin-age:  string@"nu-complete chezmoi bool-or-auto"   # Use builtin age (default auto)
  --use-builtin-diff                                              # Use builtin diff
  --use-builtin-git:  string@"nu-complete chezmoi bool-or-auto"   # Use builtin git (default auto)
  --verbose(-v)                                                   # Make output more verbose
  --working-tree(-W): string                                      # Set working tree directory
]


# Change the attributes and/or type of targets. modifier specifies what to
# modify.
#   
# Add attributes by specifying them or their abbreviations directly,
# optionally prefixed with a plus sign (+). Remove attributes by prefixing
# them or their attributes with the string no or a minus sign (-). The
# available attribute modifiers and their abbreviations are:
#   
#   ATTRIBUTE MODIFIER | ABBREVIATION
# ---------------------+---------------
#   after              | a
#   before             | b
#   empty              | e
#   encrypted          | none
#   exact              | none
#   executable         | x
#   external           | none
#   once               | o
#   private            | p
#   readonly           | r
#   remove             | none
#   template           | t
#   
# The type of a target can be changed using a type modifier:
#   
#   TYPE MODIFIER
# -----------------
#   create
#   modify
#   script
#   symlink
#   
# The negative form of type modifiers, e.g. nocreate, changes the target to be
# a regular file if it is of that type, otherwise the type is left unchanged.
#   
# Multiple modifications may be specified by separating them with a comma (,).
# If you use the -modifier form then you must put modifier after a -- to prevent
# chezmoi from interpreting -modifier as an option.
#   
# Examples:
#   $ chezmoi chattr template ~/.bashrc
#   $ chezmoi chattr noempty ~/.profile
#   $ chezmoi chattr private,template ~/.netrc
#   $ chezmoi chattr -- -x ~/.zshrc
#   $ chezmoi chattr +create,+private ~/.kube/config
export extern "chezmoi chattr" [
  attributes:         string@"nu-complete chezmoi chattr attributes"  # A comma-separated list of attribute changes
  ...target:          string                                          # The file paths to modify
  --help(-h)                                                          # help for chattr
  --recursive(-r)                                                     # Recurse into subdirectories
  --cache:            string                                          # Set cache directory (default /Users/michael/.cache/chezmoi)
  --color:            string@"nu-complete chezmoi bool-or-auto"       # Colorize output (default auto)
  --config(-c):       string                                          # Set config file
  --config-format:    string@"nu-complete chezmoi config-format"      # Set config file format
  --debug                                                             # Include debug information in output
  --destination(-D):  string                                          # Set destination directory (default /Users/michael)
  --dry-run(-n)                                                       # Do not make any modifications to the destination directory
  --force                                                             # Make all changes without prompting
  --interactive                                                       # Prompt for all changes
  --keep-going(-k)                                                    # Keep going as far as possible after an error
  --mode:             string@"nu-complete chezmoi mode"               # Mode (default file)
  --no-pager                                                          # Do not use the pager
  --no-tty                                                            # Do not attempt to get a TTY for prompts
  --output(-o):       string                                          # Write output to path instead of stdout
  --persistent-state: string                                          # Set persistent state file
  --progress:         string@"nu-complete chezmoi bool-or-auto"       # Display progress bars (default auto)
  --source-path                                                       # Specify targets by source path
  --use-builtin-age:  string@"nu-complete chezmoi bool-or-auto"       # Use builtin age (default auto)
  --use-builtin-diff                                                  # Use builtin diff
  --use-builtin-git:  string@"nu-complete chezmoi bool-or-auto"       # Use builtin git (default auto)
  --verbose(-v)                                                       # Make output more verbose
  --working-tree(-W): string                                          # Set working tree directory
]
