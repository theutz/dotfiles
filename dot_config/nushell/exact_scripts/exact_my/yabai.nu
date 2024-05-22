def domains [] {
  [config display space window query rule signal]
}

def layer [] {
  [below normal above auto]
}

def bool-sel [] {
  [on off]
}

def rule-sel [] {
  (^yabai -m rule --list | from json | each {|x|
    {value: $x.index, description: $"($x.label) ($x.app)"}
  })
}

def signal-sel [] {
  (^yabai -m signal --list | from json | each {|x|
    {value: $x.index, description: $"($x.label) ($x.app) ($x.event)"}
  })
}

def dir-sel [] {
  [north east south west]
}

def stack-sel [] {
  [prev next first last recent] | each {$"stack.($in)"}
}

def window-sel [] {
  let win = [
    prev         next         first last
    recent       mouse
    largest      smallest
    sibling
    first_nephew second_nephew
    uncle        first_cousin second_cousin
  ]
  let stack = stack-sel
  let dir = dir-sel
  let special = $win ++ $stack ++ $dir | each {|x|
    {value: $x, description: ""}
  }
  let ids = ^yabai -m query --windows | from json | each {|x|
    {value: $x.id, description: $"($x.app) | ($x.title)"}
  }
  $special ++ $ids
}

def display-sel [] {
  let display = [prev  next  first  last  recent  mouse]
  let dir = dir-sel
  let labels = (^yabai -m query --displays | from json
    | select label | compact --empty label)
  let indices = (^yabai -m query --displays | from json
    | select index | compact --empty index)
  $display ++ $dir ++ $labels ++ $indices
}

def space-sel [] {
  let special = [
    prev
    next
    first
    last
    recent
    mouse
  ]
  let labels = (^yabai -m query --spaces | from json
    | compact --empty label | get label)
  let indices = (^yabai -m query --spaces | from json
    | compact --empty index | get index)
  $special ++ $labels ++ $indices
}

def easing [] {
  [
    ease_in_sine  ease_out_sine  ease_in_out_sine
    ease_in_quad  ease_out_quad  ease_in_out_quad
    ease_in_cubic ease_out_cubic ease_in_out_cubic
    ease_in_quart ease_out_quart ease_in_out_quart
    ease_in_quint ease_out_quint ease_in_out_quint
    ease_in_expo  ease_out_expo  ease_in_out_expo
    ease_in_circ  ease_out_circ  ease_in_out_circ
  ]
}

def settings [] {
  [
    [value                     description];
    [debug_output              "Enable output of debug information to stdout."]
    [external_bar              "Specify top and bottom padding for a potential custom bar that you may be running."]
    [menubar_opacity           "Changes the transparency of the macOS menubar."]
    [mouse_follows_focus       "When focusing a window, put the mouse at its center."]
    [focus_follows_mouse       "Automatically focus the window under the mouse."]
    [display_arrangement_order "Specify how displays are ordered (determined by center point)."]
    [window_origin_display     "Specify which display a newly created window should be managed in."]
    [window_placement          "Specify whether managed windows should become the first or second leaf-node."]
    [window_zoom_persist       "Windows will keep their zoom-state through layout changes."]
    [window_shadow             "Draw shadow for windows."]
    [window_opacity            "Enable opacity for windows."]
    [window_opacity_duration   "Duration of transition between active / normal opacity."]
    [active_window_opacity     "Opacity of the focused window."]
    [normal_window_opacity     "Opacity of an unfocused window."]
    [window_animation_duration "Duration of window frame animation."]
    [window_animation_easing   "Easing function to use for window animations."]
    [insert_feedback_color     "Color of the window --insert message and mouse_drag selection."]
    [split_ratio               "Specify the size distribution when a window is split."]
    [split_type                "Specify how a window should be split."]
    [mouse_modifier            "Keyboard modifier used for moving and resizing windows."]
    [mouse_action1             "Action performed when pressing mouse_modifier + button1."]
    [mouse_action2             "Action performed when pressing mouse_modifier + button2."]
    [mouse_drop_action         "Action performed when a bsp-managed window is dropped in the center of some other bsp-managed window."]
  ]
}

export def "nu-complete yabai message" [] {
  domains
}

export def handle-query [query] {
  let q = $query | parse --regex '^\s*-{1,2}(?P<cmd>displays|spaces|windows)(?:\s*)(?P<prop>[^-][[:alnum:],]*)?(?:\s*)(?:--(?P<arg>(?:display|space|window)))?(?:\s*)(?P<selector>\w*)?$'
  match $q.cmd {
    _ => ([displays spaces windows] | each {$"--($in)"})
  }
}

export def "nu-complete yabai" [context: string] {
  let ctx = $context | parse --regex '^yabai (?P<flag>-{1,2}\w+)(?:\s+(?P<domain>\w+))?(?:\s+(?P<rest>.*))?$'
  match $ctx.flag.0 {
    "-m" | "--message" => {
      match $ctx.domain.0 {
        config => settings
        query => { handle-query $ctx.rest }
        "" => domains
        _ => (domains | filter {|x| $ctx.domain.0 in $x})
      }
    },
    _ => $ctx
  }
}

# Control the yabai window manager
export extern main [
  --load-sa                                 # Install and load the scripting-addition.
  --uninstall-sa                            # Uninstall the scripting-addition.
  --install-service                         # Write launchd service file to disk.
  --uninstall-service                       # Remove launchd service file from disk.
  --start-service                           # Enable, load, and start the launchd service.
  --restart-service                         # Attempts to restart the service instance.
  --stop-service                            # Stops a running instance of the service.
  --config(-c):  string                     # Use the specified configuration file.
  --verbose(-V)                             # Output debug information to stdout.
  --version(-v)                             # Print version to stdout and exit.
  --help(-h)                                # Print options to stdout and exit.
  --message(-m): string@"nu-complete yabai" # Send message to a running instance of yabai.
  ...args:       string@"nu-complete yabai"    # Arguments to control yabai
]
