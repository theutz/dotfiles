$env.config.show_banner = false
$env.config.edit_mode = "vi"

# Initialize starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Initialize mise
use ($nu.default-config-dir | path join mise.nu)

# Setup yazi wrapper
def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

alias cm = chezmoi
alias cms = chezmoi status
