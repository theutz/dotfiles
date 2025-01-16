# Tools for working with fonts

def list []: nothing -> table {
  "
  use framework \"AppKit\"
  set fontFamilyNames to (current application's NSFontManager's sharedFontManager's availableFontFamilies) as list
  return fontFamilyNames
  "
  | osascript
  | split row ","
  | wrap name
}

# List all fonts on the system
export def main [
  --nerd (-n) # List only nerd fonts
  --raw (-r)
]: nothing -> table {
  list
  | if ($nerd) {
    where name =~ "Nerd Font"
    | if ($raw) {
      $in
    } else {
      nerd-grid
    }
  } else {
    $in
  }
}

def nerd-grid []: nothing -> table {
  main -n -r
  | upsert mono {|it|
    $it.name
    | str ends-with 'Mono'
  } 
  | upsert propo {|it|
    $it.name
    | str ends-with 'Propo'
  }  
  | upsert name {|it|
    $it.name
    | str replace -r ' Nerd Font( (Mono|Propo))?' ''
  }
  | reduce -f [] {|it, acc|
    let last = if ($acc | length) == 0 {
      {
        name: null
        mono: false
        propo: false
      }
    } else {
      $acc | last
    }
    if ($it.name == $last.name) {
      $acc | drop | append {
        name: $it.name
        mono: ($it.mono or $last.mono)
        propo: ($it.propo or $last.propo)
      }
    } else {
      $acc | append ($it | into record)
    }
  }
}
