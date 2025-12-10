# Load zoxide
zoxide init nushell
| save --force (
  $nu.data-dir
  | path join vendor autoload zoxide.nu
)

# ┌─────────────────┐
# │ Custom commands │
# └─────────────────┘

# Zoxide to a folder, open FZF, then open EDITOR
def "zoxide folder" [
  --all-files (-a) # Glob all files, rather than first-level
  --dir-query (-d) # Prompt for directory switch
  dir: string # The dir to jump to
  file: string = "" # The first part of the query
] {
  if ($dir_query) { __zoxide_zi $dir } else { __zoxide_z $dir }

  glob (if ($all_files) { "**/*" } else { "*" })
  | each { path relative-to $env.PWD } | to text
  | fzf --query $file --multi --select-1
  | complete
  | tee { $in.stderr | print -e }
  | if ($in.exit_code == 0) {
    let files = $in.stdout | lines 
    run-external $env.EDITOR ...$files
  }
}

# ┌───────┐
# │ Setup │
# └───────┘

# Edit zoxide entries
alias ze = zoxide edit

alias zf = zoxide folder 
