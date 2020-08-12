#
# RVM
#

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# shellcheck source=../../.rvm/scripts/rvm
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# shellcheck source=.config/yabai/helpers.zsh
. "$HOME/.config/yabai/helpers.zsh"

