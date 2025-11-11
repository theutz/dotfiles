# Tools for working with my vpn

use ./log.nu

export def "is on" []: nothing -> bool {
  status
  | default ""
  | str trim
  | match $in {
    Running => true
    Stopped => false
    _ => {
      log warn $"Unknown status: ($in)"
      false
    }
  }
}

export def toggle []: nothing -> nothing {
  if (is on) { (off) } else { (on) }
}

# Get VPN status
export def status [
  --long (-l) # Output in json
]: nothing -> any {
  try {
    tailscale status --json
    | log trace
    | from json
    | log debug
    | if ($long) {
      tee { ignore | log debug "Show long output" }
    } else {
      get BackendState
    }
  } catch {|e|
    log fail "Couldn't acquire status"
    $e.rendered | log err
  }
}

# Turn vpn on
export def on []: nothing -> nothing {
  try {
    tailscale up o+e>| log info
    log success "VPN is on."
  } catch {|e|
    log fail "VPN status unknown."
    $e.msg | log err | ignore
  }
}

# Turn vpn off
export def off []: nothing -> nothing {
  try {
    tailscale down e+o>| log info
    log success "VPN is off."
  } catch {|e|
    log fail "VPN status unknown."
    $e.msg | log err | ignore
  }
}

export def main [] {
  help modules vpn
}
