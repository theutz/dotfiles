# Return a value based on whether or not the system is 
# in dark or light mode
export def main [
  light: closure # Block to run when in light mode
  dark: closure # Block to run when in light mode
  ...args # Pass any remaining args to the closure
]: nothing -> any {
  if (which dark-mode | is-empty) {
    "on"
  } else {
    ^dark-mode status | str trim
  }
  | match $in {
    on => $dark
    off => $light
    _ => {
      error make {
        msg: "Unknown appearance"
        label: {
          text: "Invalid value"
          span: (metadata $in).span
        }
      }
    }
  }
  | do $in ...$args
}

