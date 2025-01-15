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

    }
  } else {
    $in
  }
}
