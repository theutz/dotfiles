use completions.nu *

# Configure settings the background task manager pueue
export def "config pueue" [
  target: string@"nu-complete config pueue target" # The file to edit
] {
  let file = (
    nu-complete config pueue target
    | where value == $target
    | get description.0
  )
  run-external $env.EDITOR $file
}
