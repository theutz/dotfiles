# Convert a record into dotenv
def "into env" []: record -> string {
  items {|k,v| $"($k)=($v)" }
  | str join "\n"
}

# Convert a hex color into argb
def "into argb" [alpha?: string = "FF"] {
  str replace "#" "" | ["0x" $alpha $in] | str join
}
