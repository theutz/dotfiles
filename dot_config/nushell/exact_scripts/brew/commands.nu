export def "brew services+" [
  --all (-a) # Include sudo results
] {
  let root = {||
    if $all {
      ^sudo brew services --json | from json
    } else {
      []
    }
  }
  let user = {||
    ^brew services --json | from json
  }
  [$root $user] | par-each {|x| do $x} | flatten
}
