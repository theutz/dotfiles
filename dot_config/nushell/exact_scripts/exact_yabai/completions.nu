export def "nu-complete config yabai targets" [] {
  [ [value description];
    [rc-file (xdg config yabai yabairc)]
    [nu-module ($nu.default-config-dir | path join scripts yabai mod.nu)]
    [launch-agent ($env.HOME | path join Library LaunchAgents com.koekeishiya.yabai.plist)]
  ]
}

export def "nu-complete yabai message" [context: string] {
  [config]
}
