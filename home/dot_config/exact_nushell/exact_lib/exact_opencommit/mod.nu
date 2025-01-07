# Auto-generate impressive commits in 1 second. Killing lame commits with AI
export extern main [
  --context (-c): string # Additional user input context for the commit message
  --fgm
  --help (-h) # Show help
  --version # Show version
  --yes (-y) # Skip commit confirmation prompt
]

export module aliases {
  export alias oco = main
}
