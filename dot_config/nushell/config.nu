#                  __                      
#                 /    /                   
#  ___  ___  ___ (       ___      ___      
# |    |   )|   )|___ | |   )    |   )|   )
# |__  |__/ |  / |    | |__/     |  / |__/ 
#                       __/  -             

$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.use_kitty_protocol = true
$env.config.render_right_prompt_on_last_line = false
$env.config.history.max_size = 10000
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi magenta)  (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi blue)  (ansi reset)"

#  _______  _                 _______ _________ _        _______ 
# (  ____ )( \      |\     /|(  ____ \\__   __/( (    /|(  ____ \
# | (    )|| (      | )   ( || (    \/   ) (   |  \  ( || (    \/
# | (____)|| |      | |   | || |         | |   |   \ | || (_____ 
# |  _____)| |      | |   | || | ____    | |   | (\ \) |(_____  )
# | (      | |      | |   | || | \_  )   | |   | | \   |      ) |
# | )      | (____/\| (___) || (___) |___) (___| )  \  |/\____) |
# |/       (_______/(_______)(_______)\_______/|/    )_)\_______)

plugin use gstat
plugin use query
plugin use formats

#  ____ ____ ____ ____ ____ 
# ||S |||e |||t |||u |||p ||
# ||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|
#  ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ 
# ||k |||e |||y |||b |||i |||n |||d |||i |||n |||g |||s ||
# ||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

$env.config.keybindings ++= [
  {
    name: add_pager
    modifier: alt
    keycode: char_p
    mode: [emacs vi_insert vi_normal]
    event: {
      send: ExecuteHostCommand
      cmd: "
      commandline
      | if ($in | str length) == 0 {
        history | last | get command
      } else {
        $in
      }
      | str trim
      | $'($in) | ($env.PAGER)'
      | commandline edit $in
      "
    }
  }
  {
    name: add_sudo
    modifier: alt
    keycode: char_s
    mode: [emacs vi_insert vi_normal]
    event: {
      send: ExecuteHostCommand
      cmd: "
      commandline
      | if ($in | str length) == 0 {
        history | last | get command
      } else {
        $in
      }
      | str trim
      | $'sudo ($in)'
      | commandline edit $in
      "
    }
  }
  {
    name: add_help
    modifier: alt
    keycode: char_h
    mode: [emacs vi_insert vi_normal]
    event: {
      send: ExecuteHostCommand
      cmd: "
      commandline
      | if (($in | str length) == 0) {
        history | last | get command
      } else {
        $in
      }
      | str trim
      | $'($in) --help | ($env.PAGER)'
      | commandline edit $in
      "
    }
  }
]

# 8888ba.88ba  oo                   
# 88  `8b  `8b                      
# 88   88   88 dP .d8888b. .d8888b. 
# 88   88   88 88 Y8ooooo. 88ooood8 
# 88   88   88 88       88 88.  ... 
# dP   dP   dP dP `88888P' `88888P' 

use ($nu.data-dir | path join mise.nu)

#  ____       _                              _     _      
# / ___|  ___| |_ _   _ _ __    _________  _(_) __| | ___ 
# \___ \ / _ \ __| | | | '_ \  |_  / _ \ \/ / |/ _` |/ _ \
#  ___) |  __/ |_| |_| | |_) |  / / (_) >  <| | (_| |  __/
# |____/ \___|\__|\__,_| .__/  /___\___/_/\_\_|\__,_|\___|
#                      |_|                                

source ($nu.data-dir | path join zoxide.nu)

#  ______
# < Yazi >
#  ------
#   \     .    _  .    
#    \    |\_|/__/|    
#        / / \/ \  \  
#       /__|O||O|__ \ 
#      |/_ \_/\_/ _\ |  
#      | | (____) | ||  
#      \/\___/\__/  // 
#      (_/         ||
#       |          ||
#       |          ||\   
#        \        //_/  
#         \______//
#        __ || __||
#       (____(____)

def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  ^yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

# Setup chezmoi
use chezmoi/aliases.nu *
use chezmoi/externals.nu *

# Setup homebrew
use brew.nu *

# Setup sketchybar helpers
use sketchybar.nu *

# Convert a record into .
def "into env" []: record -> string {
  items {|k,v| $"($k)=($v)" }
  | str join "\n"
}

#  _____________________
# < "Config" extensions >
#  ---------------------
#         \   ^__^
#          \  (oo)\_______
#             (__)\       )\/\
#                 ||--WWW |
#                 ||     ||

# Edit starship config
def "config starship" [] {
  $env.XDG_CONFIG_HOME | path join "starship.toml" | hx $in
}

# Edit helix config
def "config helix" [] {
  $env.XDG_CONFIG_HOME | path join helix config.toml | hx -w ($in | path dirname) $in
}

# Edit wezterm config
def "config wezterm" [] {
  $env.XDG_CONFIG_HOME | path join wezterm wezterm.lua | hx -w ($in | path dirname) $in
}

# Edit yazi config
def "config yazi" [] {
  let dir = $env.XDG_CONFIG_HOME | path join yazi
  let files = glob --exclude ["package.toml"] $"($dir)/*.{toml,lua}"
  hx -w $dir ...$files
}

# Edit env.nu
def "config env" [] {
  hx -w $nu.default-config-dir $nu.env-path
}

# Edit config.nu
def "config nu" [] {
  hx -w $nu.default-config-dir $nu.config-path
}

# Edit borders configuration
def "config borders" [] {
  let dir = ($env.XDG_CONFIG_HOME | path join borders)
  hx -w $dir ($dir | path join bordersrc)
}

# Edit sketchybar configuration
def "config sketchybar" [] {
  let $dir = ($env.XDG_CONFIG_HOME | path join sketchybar)
  hx -w $dir ($dir | path join sketchybarrc)
}

# Edit aerospace config
def "config aerospace" [] {
  let $dir = ($env.XDG_CONFIG_HOME | path join aerospace) 
  hx -w $dir ($dir | path join aerospace.toml)
}

# Edit global mise config
def "config mise" [] {
  let $dir = ($env.XDG_CONFIG_HOME | path join mise)
  hx -w $dir ($dir | path join config.toml)
}

#            ,ggg,                                                        
#           dP""8I   ,dPYb,                                               
#          dP   88   IP'`Yb                                               
#         dP    88   I8  8I  gg                                           
#        ,8'    88   I8  8'  ""                                           
#        d88888888   I8 dP   gg     ,gggg,gg    ,g,      ,ggg,     ,g,    
#  __   ,8"     88   I8dP    88    dP"  "Y8I   ,8'8,    i8" "8i   ,8'8,   
# dP"  ,8P      Y8   I8P     88   i8'    ,8I  ,8'  Yb   I8, ,8I  ,8'  Yb  
# Yb,_,dP       `8b,,d8b,_ _,88,_,d8,   ,d8b,,8'_   8)  `YbadP' ,8'_   8) 
#  "Y8P"         `Y88P'"Y888P""Y8P"Y8888P"`Y8P' "YY8P8P888P"Y888P' "YY8P8P

# search for aliases in scope by name
# @example "search for an alias starting with 'm'" {
#   sa ^m
# }
# @example "search for an alias with the word 'mise' in it" {
#   sa -a mise
# }

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

# _    ____ 
# |    [__  
# |___ ___] 
          

alias la = ls -la
alias ll = ls -l
def ls-all-grid [] {
  ls --all | grid --icons --color
}
alias l = ls-all-grid

# _    ____ ___  _   _ 
# |    |__|   /   \_/  
# |___ |  |  /__   |   

alias lg = lazygit
alias ldk = lazydocker

# _  _ _ ____ ____ 
# |\/| | [__  |___ 
# |  | | ___] |___ 

alias m = ^mise
alias mx = ^mise exec
alias mr = ^mise run

# ____ _ ___ 
# | __ |  |  
# |__] |  |  

const _git_log_medium_format = "%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B"
const _git_log_oneline_format = "%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n";
const _git_log_brief_format = "%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n";
const _git_status_ignore_submodules = "none"

# Print the name of the current branch
def git-branch-current [] {
  plugin use gstat
  gstat | get branch
}

# Print a list of lost commits
def git-commit-lost [] {
  use std null-device
  plugin use gstat
  if (gstat | get repo_name) == "no_repository" {
    error make { msg: $"not a repository work tree: ($env.PWD)" }
  }
  ^git fsck e> (null-device)
  | find --regex "^dangling commit" --no-highlight
  | split column " " c1 c2 commit
  | if ($in | is-empty) {
    $in
  } else {
    get commit
    | ^git log --date-order --no-walk --stdin --pretty=format:($_git_log_oneline_format)
  }
}

# Git 

alias g = git

# Branch (b)

def git-branch-create-ai [] {
  use std null-device
  git diff origin/HEAD HEAD  | mods -R branch --no-cache --quiet --raw err> (null-device)
  | str trim
  | git checkout -b $in
}

alias gb = git branch
alias gba = git branch --all --verbose
alias gbc = git checkout -b
alias gbcai = git-branch-create-ai
alias gbd = git branch --delete
alias gbD = git branch --delete --force
alias gbl = git branch --verbose
alias gbL = git branch --all --verbose
alias gbm = git branch --move
alias gbM = git branch --move --force
alias gbr = git branch --move
alias gbR = git branch --move --force
alias gbs = git show-branch
alias gbS = git show-branch --all
alias gbv = git branch --verbose
alias gbV = git branch --verbose --verbose
alias gbx = git branch --delete
alias gbX = git branch --delete --force

# Commit (c)

def --wrapped git-commit-message-ai [
  ...args
] {
  use std null-device
  git diff --cached
  | mods -R commit --no-cache --raw err> (null-device)
  | str trim
  | git commit --message $in ...$args
}

alias gc = git commit --verbose
alias gcS = git commit --verbose --gpg-sign
alias gca = git commit --verbose --all
alias gcai = git-commit-message-ai
alias gcaS = git commit --verbose --all --gpg-sign
alias gcm = git commit --message
alias gcmS = git comit --message --gpg-sign
alias gcam = git commit --all --message
alias gco = git checkout
alias gcO = git checkout --patch
alias gcf = git commit --amend --reuse-message HEAD
alias gcfS = git commit --amend --reuse-message HEAD --gpg-sign
alias gcF = git commit --verbose --amend
alias gcFS = git commit --verbose --amend --gpg-sign
alias gcp = git cherry-pick --ff
alias gcP = git cherry-pick --no-commit
alias gcr = git revert
alias gcR = git reset "HEAD^"
alias gcs = git show
alias gcsS = git show --pretty=short --show-signature
alias gcl = git-commit-lost
alias gcy = git cherry --verbose --abbrev
alias gcY = git cherry --verbose

# Conflict (C)

alias gCl = git --no-pager diff --name-only --diff-filter=U
alias gCa = git add (gCl)
alias gCe = git mergetool (gCl)
alias gCo = git checkout --ours --
alias gCO = gCo (gCl)alias gCt = git checkout --theirs --
alias gCT = gCt (gCl)

# Data (d)

alias gd = git ls-files
alias gdc = git ls-files --cached
alias gdx = git ls-files --deleted
alias gdm = git ls-files --modified
alias gdu = git ls-files --other --exclude-standard
alias gdk = git ls-files --killed
alias gdi = git status --porcelain --short --ignored | sed -n "s/^!! //p"

# Fetch (f)

alias gf = git fetchexport alias gfa = git fetch --all
alias gfc = git clone
alias gfcr = git clone --recurse-submodules
alias gfm = git pull
alias gfma = git pull --autostash
alias gfr = git pull --rebase
alias gfra = git pull --rebase --autostash

# Flow (F)
alias gFi = git flow init
alias gFf = git flow feature
alias gFb = git flow bugfix
alias gFl = git flow release
alias gFh = git flow hotfix
alias gFs = git flow support

alias gFfl = git flow feature list
alias gFfs = git flow feature start
alias gFff = git flow feature finish
alias gFfp = git flow feature publish
alias gFft = git flow feature track
alias gFfd = git flow feature diff
alias gFfr = git flow feature rebase
alias gFfc = git flow feature checkout
alias gFfm = git flow feature pull
alias gFfx = git flow feature delete

alias gFbl = git flow bugfix list
alias gFbs = git flow bugfix start
alias gFbf = git flow bugfix finish
alias gFbp = git flow bugfix publish
alias gFbt = git flow bugfix track
alias gFbd = git flow bugfix diff
alias gFbr = git flow bugfix rebase
alias gFbc = git flow bugfix checkout
alias gFbm = git flow bugfix pull
alias gFbx = git flow bugfix delete

alias gFll = git flow release list
alias gFls = git flow release start
alias gFlf = git flow release finish
alias gFlp = git flow release publish
alias gFlt = git flow release track
alias gFld = git flow release diff
alias gFlr = git flow release rebase
alias gFlc = git flow release checkout
alias gFlm = git flow release pull
alias gFlx = git flow release delete

alias gFhl = git flow hotfix list
alias gFhs = git flow hotfix start
alias gFhf = git flow hotfix finish
alias gFhp = git flow hotfix publish
alias gFht = git flow hotfix track
alias gFhd = git flow hotfix diff
alias gFhr = git flow hotfix rebase
alias gFhc = git flow hotfix checkout
alias gFhm = git flow hotfix pull
alias gFhx = git flow hotfix delete

alias gFsl = git flow support list
alias gFss = git flow support start
alias gFsf = git flow support finish
alias gFsp = git flow support publish
alias gFst = git flow support track
alias gFsd = git flow support diff
alias gFsr = git flow support rebase
alias gFsc = git flow support checkout
alias gFsm = git flow support pull
alias gFsx = git flow support delete

# Grep (g)

alias gg = git grep
alias ggi = git grep --ignore-case
alias ggl = git grep --files-with-matches
alias ggL = git grep --files-without-matches
alias ggv = git grep --invert-match
alias ggw = git grep --word-regexp

# Index (i)

alias gia = git add
alias giA = git add --patch
alias giu = git add --update
alias gid = git diff --no-ext-diff --cached
alias giD = git diff --no-ext-diff --cached --word-diff
alias gii = git update-index --assume-unchanged
alias giI = git update-index --no-assume-unchanged
alias gir = git reset
alias giR = git reset --patch
alias gix = git rm -r --cached
alias giX = git rm -r --force --cached

# Log (l)

alias gl = git log --topo-order $"--pretty=format:($_git_log_medium_format)"
alias gls = git log --topo-order --stat $"--pretty=format:($_git_log_medium_format)"
alias gld = git log --topo-order --stat --patch --full-diff $"--pretty=format:($_git_log_medium_format)"
alias glo = git log --topo-order $"--pretty=format:($_git_log_oneline_format)"
alias glg = git log --topo-order --graph $"--pretty=format:($_git_log_oneline_format)"
alias glb = git log --topo-order $"--pretty=format:($_git_log_brief_format)"
alias glc = git shortlog --summary --numbered
alias glS = git log --show-signature

# Merge (m)

alias gm = git merge
alias gmC = git merge --no-commit
alias gmF = git merge --no-ff
alias gma = git merge --abort
alias gmt = git mergetool

# Push (p)

alias gp = git push
alias gpf = git push --force-with-lease
alias gpF = git push --force
alias gpa = git push --all
def gpA [] {
  git push --all; git push --tags
}
alias gpt = git push --tags
def gpc [] {
  git push --set-upstream origin (git-branch-current)
}
def gpp [] {
  let curr = git-branch-current
  git pull origin $curr
  git push origin $curr
}

# Rebase (r)

alias gr = git rebase
alias gra = git rebase --abort
alias grc = git rebase --continue
alias gri = git rebase --interactive
alias grs = git rebase --skip

# Remote (R)

alias gR = git remote
alias gRl = git remote --verbose
alias gRa = git remote add
alias gRx = git remote rm
alias gRm = git remote rename
alias gRu = git remote update
alias gRp = git remote prune
alias gRs = git remote show
alias gRb = gh repo view -w

# Stash (s)

alias gs = git stash
alias gsa = git stash apply

alias gsx = git stash drop
alias gsX = git-stash-clear-interactive
alias gsl = git stash list
alias gsL = git-stash-dropped
alias gsd = git stash show --patch --stat
alias gsp = git stash pop
alias gsr = git-stash-recover
alias gss = git stash save --include-untracked
alias gsS = git stash save --patch --no-keep-index
alias gsw = git stash save --include-untracked --keep-index

# Submodule (S)

alias gS = git submodule
alias gSa = git submodule add
alias gSf = git submodule foreach
alias gSi = git submodule init
alias gSI = git submodule update --init --recursive
alias gSl = git submodule status
alias gSm = git-submodule-move
alias gSs = git submodule sync
alias gSu = git submodule update --remote --recursive
alias gSx = git-submodule-remove

# Tag (t)

alias gt = git tag
alias gtl = git tag --list
alias gts = git tag --sign
alias gtv = git verify-tag

# Working Copy (w)

alias gws = git status $"--ignore-submodules=($_git_status_ignore_submodules)" --short
alias gwS = git status $"--ignore-submodules=($_git_status_ignore_submodules)"
alias gwd = git diff --no-ext-diff
alias gwD = git diff --no-ext-diff --word-diff
alias gwr = git reset --soft
alias gwR = git reset --hard
alias gwc = git clean --dry-run
alias gwC = git clean --force
alias gwx = git rm -r
alias gwX = git rm -r --force

# ___  ____ ____ _  _ ____ ____ 
# |  \ |  | |    |_/  |___ |__/ 
# |__/ |__| |___ | \_ |___ |  \ 

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

# ___  ____ ____ _  _ ____ ____    ____ ____ _  _ ___ ____ _ _  _ ____ ____    ____ 
# |  \ |  | |    |_/  |___ |__/    |    |  | |\ |  |  |__| | |\ | |___ |__/    |    
# |__/ |__| |___ | \_ |___ |  \    |___ |__| | \|  |  |  | | | \| |___ |  \    |___ 

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

# ___  ____ ____ _  _ ____ ____    _ _  _ ____ ____ ____    _ 
# |  \ |  | |    |_/  |___ |__/    | |\/| |__| | __ |___    | 
# |__/ |__| |___ | \_ |___ |  \    | |  | |  | |__] |___    | 

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

# ___  ____ ____ _  _ ____ ____    _  _ ____ _    _  _ _  _ ____    _  _ 
# |  \ |  | |    |_/  |___ |__/    |  | |  | |    |  | |\/| |___    |  | 
# |__/ |__| |___ | \_ |___ |  \     \/  |__| |___ |__| |  | |___     \/  

alias dkV = docker volume
alias dkVin = docker volume inspect
alias dkVls = docker volume ls
alias dkVpr = docker volume prune
alias dkVrm = docker volume rm

# ___  ____ ____ _  _ ____ ____    _  _ ____ ___ _ _ _ ____ ____ _  _    _  _ 
# |  \ |  | |    |_/  |___ |__/    |\ | |___  |  | | | |  | |__/ |_/     |\ | 
# |__/ |__| |___ | \_ |___ |  \    | \| |___  |  |_|_| |__| |  \ | \_    | \| 

alias dkN = docker network
alias dkNs = docker network connect
alias dkNx = docker network disconnect
alias dkNin = docker network inspect
alias dkNls = docker network ls
alias dkNpr = docker network prune
alias dkNrm = docker network rm

# ____ _   _ ____ ___ ____ _  _    _   _ 
# [__   \_/  [__   |  |___ |\/|     \_/  
# ___]   |   ___]  |  |___ |  |      |   

alias dkY = docker system
alias dkYdf = docker system df
alias dkYpr = docker system prune

# ___  ____ ____ _  _ ____ ____    ____ _    ____ ____ _  _ _  _ ___  
# |  \ |  | |    |_/  |___ |__/    |    |    |___ |__| |\ | |  | |__] 
# |__/ |__| |___ | \_ |___ |  \    |___ |___ |___ |  | | \| |__| |    

# Clean up exited containers
def dkrmC [] {
  docker container ls -qaf status=exited
  | lines
  | if ($in | is-empty) {
    $in
  } else {
    docker rm ...$in
  }
}

# Clean up dangling images
def dkrmI [] {
  docker image ls -qf dangling=true
  | lines
  | if ($in | is-empty) {
    $in
  } else {
    docker image rm ...$in
  }
}

# Cleanup dangling volumes
def dkrmV [] {
  docker volume ls -qf dangling=true
  | lines
  | if ($in | is-empty) {
    $in
  } else {
    docker volume rm ...$in
  }
}

# ___  ____ ____ _  _ ____ ____    ____ ____ _  _ ___  ____ ____ ____ 
# |  \ |  | |    |_/  |___ |__/    |    |  | |\/| |__] |  | [__  |___ 
# |__/ |__| |___ | \_ |___ |  \    |___ |__| |  | |    |__| ___] |___ 

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
alias dkcuw = docker compose up --watch
alias dkcv = docker compose version
alias dkcx = docker compose stop

# ___  _  _ ____ _  _ ____ 
# |__] |  | |___ |  | |___ 
# |    |__| |___ |__| |___ 

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

# ___ _  _ _  _ _  _ 
#  |  |\/| |  |  \/  
#  |  |  | |__| _/\_ 

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

# ___  ____ _    _    _  _ 
#   /  |___ |    |    |  | 
#  /__ |___ |___ |___ | _| 

alias zj = zellij
alias zjac = zellij action                 
alias zja  = zellij attach                 
alias zjda = zellij delete-all-sessions    
alias zjd  = zellij delete-session         
alias zje  = zellij edit                   
alias zjka = zellij kill-all-sessions      
alias zjk  = zellij kill-session           
alias zjla = zellij list-aliases           
alias zjls = zellij list-sessions          
alias zjr  = zellij run                    
alias zjn = zellij --session

# New zellij session with same name and layout
def zjnl [
  name: string # the name of the layout/session
] {
  zellij --new-session-with-layout $name --session $name
}

# _  _ _ ____ ____ ____ _    _    ____ _  _ ____ ____ _  _ ____ 
# |\/| | [__  |    |___ |    |    |__| |\ | |___ |  | |  | [__  
# |  | | ___] |___ |___ |___ |___ |  | | \| |___ |__| |__| ___] 

alias sa = search-aliases
alias sp = spotify_player
alias sup = supervisorctl
alias ze = zoxide edit
