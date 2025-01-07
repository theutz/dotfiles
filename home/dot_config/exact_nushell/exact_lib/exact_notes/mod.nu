# My personal note-taking system

export-env {
  $env.NOTES_DIR = $env.HOME | path join "notes"
}

export module aliases {
  export alias n = notes
}

# See module hlep
export def main [] {
  help modules notes
}
