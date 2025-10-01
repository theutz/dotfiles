# Convert a record into dotenv
def "into env" []: record -> string {
  items {|k,v| $"($k)=($v)" }
  | str join "\n"
}
