$env.PATH = $env.PATH | prepend [
($env.HOME | path join .local bin)
("/opt/homebrew/{,s}bin" | str expand)
]
