# Activat Mise
let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu
| str replace "--ignore-errors" "--optional"
| save $mise_path --force

# Setup XDG
[
  [source          default                             ];
  [XDG_CONFIG_HOME ($env.HOME | path join .config)     ]
  [XDG_DATA_HOME   ($env.HOME | path join .local share)]
  [XDG_STATE_HOME  ($env.HOME | path join .local state)]
  [XDG_CACHE_HOME  ($env.HOME | path join .cache)      ]
] | each {|it|
  $env | upsert $it.source $it.default
}

$env.PATH = $env.PATH
| prepend ($env.XDG_DATA_HOME | path join bob nvim-bin)
