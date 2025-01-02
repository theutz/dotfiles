# Edit nushell interactive configuration
export def main [] {
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
