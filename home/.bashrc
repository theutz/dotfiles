export GPG_TTY=$(tty)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export BUILDKIT_INLINE_CACHE=1

eval "$(starship init bash)"
