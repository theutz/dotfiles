# Construct an absolute path from XDG_RUNTIME_DIR
export def runtime [
  ...path: string
] -> string {
  $env.XDG_RUNTIME_DIR
    | default ([$env.HOME .local state])
    | path join ...$path
}
