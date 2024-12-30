$env.config.edit_mode = "vi"
$env.config.show_banner = false
# use (path self . | path join "modules" "config.nu")

use ($nu.default-config-dir | path join mise.nu)

def "config nu" [] {
  ^chezmoi edit --watch --apply $nu.config-path
}

def "config env" [] {
  ^chezmoi edit --watch --apply $nu.env-path
}
