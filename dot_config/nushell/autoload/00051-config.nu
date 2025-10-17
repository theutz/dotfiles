# Open file or files in editor
def e []: any -> nothing {
  $in | match ($in | describe) {
    "list<any>" if ($in | is-empty) => $in
    "list<string>" => $in
    "string" => [$in]
    _ => {
      error make {msg: "Unknown path" label: { text: "Originates here" span: (metadata $in).span }}
    }
  }
  | run-external (
    $env.VISUAL? | default -e $env.EDITOR? | default -e vim
  ) ...$in
}

# Create path relative to XDG_CONFIG_HOME
def xdg-config-home [...args: string]: oneof<string, nothing> -> path {
  let prefix = $in
  $env.XDG_CONFIG_HOME?
  | default -e [$env.HOME .config] 
  | [$in $prefix ...$args]
  | compact
  | path join
}

# Configure the config command
def "config config" [] { const self = path self; $self | e }

# Configure nushell
def "config nu" [] { [$nu.default-config-dir autoload] | path join | e }

# Configure neovim
def "config nvim" [] { xdg-config-home nvim | e }

def "nu-complete config nvim plugins plugin" [] {
  xdg-config-home nvim lua plugins ** *.lua | glob --no-dir $in | each { path parse | get stem }
}
# Configure neovim plugins plugin
def "config nvim plugins" [plugin?: string@"nu-complete config nvim plugins plugin"] {
  $plugin | if ($in | is-empty) { $in } else { path parse | update extension lua | path join }
  | [nvim lua plugins $in] | compact | path join
  | xdg-config-home | e
}
hide "nu-complete config nvim plugins plugin"

# Configure wezterm
def "config wezterm" [] { xdg-config-home wezterm | e }

# Configure sketchybar
def "config sketchybar" [] { xdg-config-home sketchybar | e }

# Configure aerospace
def "config aerospace" [] { xdg-config-home aerospace aerospace.toml | e }

# Configure borders
def "config borders" [] { xdg-config-home borders bordersrc | e }

# Configure tmux
def "config tmux" [] { xdg-config-home tmux tmux.conf | e }

hide e
