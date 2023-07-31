#
# Bindings
#

zle -N lg # create a zle widget so it can be bound to a key
bindkey '^g' lg

bindkey -M vicmd v edit-command-line
bindkey '^ ' autosuggest-accept

zle -N _navi_widget
bindkey '^n' _navi_widget

