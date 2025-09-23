# search for aliases in scope by name
@example "search for an alias starting with 'm'" {
  sa ^m
}
@example "search for an alias with the word 'mise' in it" {
  sa -a mise
}
def search-aliases [
  --all (-a) # Search in all fields, not just name
  term: string # The term to search for
]: nothing -> table<name: string expansion: string description: string> {
  scope aliases
  | if ($all) {
    find --regex $term --no-highlight
  } else {
    where name =~ $term
  }
  | select name expansion description
}

# LS
alias la = ls -la
alias ll = ls -l
def ls-all-grid [] {
  ls --all | grid --icons --color
}
alias l = ls-all-grid

# Lazy
alias lg = lazygit
alias ldk = lazydocker

# Mise
alias m = ^mise
alias mx = ^mise exec
alias mr = ^mise run

# Docker

alias dk = docker
alias dka = docker attach
alias dkb = docker build
alias dkd = docker diff
alias dkdf = docker system df
alias dke = docker exec
alias dkE = docker exec -it
alias dkh = docker history
alias dki = docker images
alias dkin = docker inspect
alias dkim = docker import
alias dkk = docker kill
alias dkl = docker logs
alias dkli = docker login
alias dklo = docker logout
alias dkls = docker ps
alias dkp = docker pause
alias dkP = docker unpause
alias dkpl = docker pull
alias dkph = docker push
alias dkps = docker ps
alias dkpsa = docker ps -a
alias dkr = docker run
alias dkR = docker run -it --rm
alias dkRe = docker run -it --rm --entrypoint /bin/bash
alias dkRM = docker system prune
alias dkrm = docker rm
alias dkrmi = docker rmi
alias dkrn = docker rename
alias dks = docker start
alias dkS = docker restart
alias dkss = docker stats
alias dksv = docker save
alias dkt = docker tag
alias dktop = docker top
alias dkup = docker update
alias dkV = docker volume
alias dkv = docker version
alias dkw = docker wait
alias dkx = docker stop

# Docker Container (C)

alias dkC = docker container
alias dkCa = docker container attach
alias dkCcp = docker container cp
alias dkCd = docker container diff
alias dkCe = docker container exec
alias dkCin = docker container inspect
alias dkCk = docker container kill
alias dkCl = docker container logs
alias dkCls = docker container ls
alias dkCp = docker container pause
alias dkCpr = docker container prune
alias dkCrn = docker container rename
alias dkCS = docker container restart
alias dkCrm = docker container rm
alias dkCr = docker container run
alias dkCR = docker container run -it --rm
alias dkCRe = docker container run -it --rm --entrypoint /bin/bash
alias dkCs = docker container start
alias dkCss = docker container stats
alias dkCx = docker container stop
alias dkCtop = docker container top
alias dkCP = docker container unpause
alias dkCup = docker container update
alias dkCw = docker container wait

# Docker Image (I)

alias dkI = docker image
alias dkIb = docker image build
alias dkIh = docker image history
alias dkIim = docker image import
alias dkIin = docker image inspect
alias dkIls = docker image ls
alias dkIpr = docker image prune
alias dkIpl = docker image pull
alias dkIph = docker image push
alias dkIrm = docker image rm
alias dkIsv = docker image save
alias dkIt = docker image tag

# Docker Volume (V)

alias dkV = docker volume
alias dkVin = docker volume inspect
alias dkVls = docker volume ls
alias dkVpr = docker volume prune
alias dkVrm = docker volume rm

# Docker Network (N)

alias dkN = docker network
alias dkNs = docker network connect
alias dkNx = docker network disconnect
alias dkNin = docker network inspect
alias dkNls = docker network ls
alias dkNpr = docker network prune
alias dkNrm = docker network rm

# System (Y)
alias dkY = docker system
alias dkYdf = docker system df
alias dkYpr = docker system prune

# Docker Cleanup

# Clean up exited containers
def dkrmC [] {
  docker ps -qaf status=exited | lines | docker rm ...$in
}

# Clean up dangling images
def dkrmI [] {
  docker image ls -qf dangling=true | lines | docker image rm ...$in
}

# Cleanup dangling volumes
def dkrmV [] {
  docker volumes ls -qf dangling=true | lines | docker volume rm ...$in
}

# Docker Compose

alias dkc = docker compose
alias dkcb = docker compose build
alias dkcB = docker compose build --no-cache
alias dkcd = docker compose down
alias dkce = docker compose exec
alias dkck = docker compose kill
alias dkcl = docker compose logs
alias dkcls = docker compose ps
alias dkcp = docker compose pause
alias dkcP = docker compose unpause
alias dkcpl = docker compose pull
alias dkcph = docker compose push
alias dkcps = docker compose ps
alias dkcr = docker compose run
alias dkcR = docker compose run --rm
alias dkcrm = docker compose rm
alias dkcs = docker compose start
alias dkcsc = docker compose scale
alias dkcS = docker compose restart
alias dkcu = docker compose up
alias dkcU = docker compose up -d
alias dkcv = docker compose version
alias dkcx = docker compose stop

# Pueue

alias pu = pueue
alias puG = pueue group
alias pua = pueue add
alias puag = pueue add --group
alias pucl = pueue clean
alias puf = pueue follow
alias puga = pueue group add
alias pugr = pueue group remove
alias pupa = pueue parallel
alias pupag = pueue parallel --group
alias puw = pueue wait

# pueue group status
def pug [] { pueue group --json | from json | transpose name | flatten }

# pueue task status
def pus [] { pueue status --json | from json | get tasks | flatten }

# tmux

alias tx = tmux

# List tmux sessions
def txl [] {
  use std null-device
  tmux ls -F '#{session_id} #{session_name} #{?session_attached,true,false}' e> (null-device)
  | if ($in | is-empty) { [] } else {
    detect columns --no-headers
    | rename id name attached
    | update attached { into bool }
    | sort-by id
  }
}

# Create new tmux session
def --wrapped txn [
  session: string # Name of the session
  --window (-n): string = "main" # Name of the first window
  ...args
] {
  tmux new -s $session -n $window ...$args
}

# Attach to a tmux session
def txa [
  session: string # the session name to connect with
] {
  mut args = ["switch-client" "-t" $session]
  txl
  | where name =~ $session
  | if ($in | is-empty) {
    $args = ["new-session" "-s" $session]
  } else {
    if ($env.TMUX? | is-empty) {
      $args = ["attach-session" "-t" $session]
    }
  }
  tmux ...$args
}

# Miscellaneous
alias sa = search-aliases
alias sp = spotify_player
alias sup = supervisorctl
alias ze = zoxide edit

