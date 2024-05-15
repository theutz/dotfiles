# Settings
let padding = 16

# Load the scripting addition
sudo yabai --load-sa
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

# Global Settings
yabai -m config menubar_opacity 1.0                  # 0-1
yabai -m config mouse_follows_focus on               # on | off
yabai -m config focus_follows_mouse autoraise        # autofocus | autoraise | off
yabai -m config display_arrangement_order horizontal # default | vertical | horizontal
yabai -m config window_origin_display focused        # default | focused | cursor
yabai -m config window_placement first_child         # first_child | second_child
yabai -m config window_zoom_persist off              # on | off
yabai -m config window_shadow float                  # true | false | float
yabai -m config window_opacity on                    # on | off
yabai -m config window_opacity_duration 0.1          # 0-1
yabai -m config active_window_opacity 0.95           # 0-1
yabai -m config normal_window_opacity 0.80           # 0-1
yabai -m config insert_feedback_color 0x88FF0000     # 0xAARRGGBB
yabai -m config split_ratio 0.5                      # 0-1
yabai -m config split_type auto                      # vertical | horizontal | auto
yabai -m config mouse_modifier ctrl                  # cmd | alt | shift | ctrl | fn
yabai -m config mouse_drop_action stack              # swap | stack

# Space Settings
yabai -m config layout bsp                    # bsp | stack | float
yabai -m config top_padding ($padding + 16) # int
yabai -m config bottom_padding $padding       # int
yabai -m config left_padding $padding         # int
yabai -m config right_padding $padding        # int
yabai -m config window_gap $padding           # int

#
# Rules
#
yabai -m rule --add label=settings app='^System Settings$' manage=off
yabai -m rule --add label=clearvpn app='^ClearVPN$' manage=off
yabai -m rule --add label=cleanmymac app='^CleanMyMac X$' manage=off

# Signals
yabai -m signal --add event=window_created action='yabai -m window $YABAI_WINDOW_ID --focus' app='^wezterm-gui$'

# Borders
pueue kill -g borders
sleep 1sec
pueue add -g borders -- /opt/homebrew/bin/borders ...[
  active_color=0xfff6c177
  inactive_color=0xff6e6a86
  blur_radius=10.0
  width=8.0
]
pueue clean -g borders
