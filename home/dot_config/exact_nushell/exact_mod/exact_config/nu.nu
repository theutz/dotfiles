# Edit nushell interactive configuration
export def main [] {
  ["env.nu" "config.nu"]
  | each {|| prepend "nushell" | path join | xdg config }
  | ^chezmoi edit --watch ...$in
}

export def config [] {
  xdg config "nushell" "config.nu" | edit
}

# Edit nushell environment
export def env [] {
  xdg config "nushell" "env.nu" | edit
}

# Edit nushell modules
export def modules [] {
  xdg config "nushell" "mod" | edit
}

export alias mod = modules
