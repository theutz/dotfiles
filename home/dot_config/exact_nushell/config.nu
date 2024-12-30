$env.config.edit_mode = "vi"
$env.config.show_banner = false
# use (path self . | path join "modules" "config.nu")

use ($nu.default-config-dir | path join mise.nu)

# edit nu configuration
def "config nu" [] {
  ^chezmoi edit --watch --apply $nu.config-path
}

# edit nu environment configuration
def "config env" [] {
  ^chezmoi edit --watch --apply $nu.env-path
}

use ($nu.default-config-dir | path join config.nu)
