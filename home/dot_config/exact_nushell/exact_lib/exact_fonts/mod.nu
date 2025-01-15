# Tools for working with fonts

# List all fonts on the system
def main [] {
  "
  use framework \"AppKit\"
  set fontFamilyNames to (current application's NSFontManager's sharedFontManager's availableFontFamilies) as list
  return fontFamilyNames
  "
  | osascript
  | split row ","
}
