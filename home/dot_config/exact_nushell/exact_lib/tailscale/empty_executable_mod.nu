# Tools for working with tailscale

def --wrapped main [...args] {
  ^tailscale ...$args
}

def location-show []: nothing -> any {
  http get https://dnsleaktest.com
  | mise x ubi:mgdm/htmlq -- htmlq --text '.welcome > p'
  | lines -s | str join " "
  | parse -r '^Hello (?<ip>.*?) from (?<city>.*?), (?<country>.*?)$'
}

alias whereami = location-show

def location-set []: nothing -> table {
  let locations = ^tailscale exit-node list | complete | get stdout
    | lines -s | str trim | drop 3 | split column -n 5 -r '\s{2,}'
    | headers | rename -b { str downcase }

  let country = $locations | get country | uniq | sort
    | input list --fuzzy 'Choose country'

  let city = $locations | where country == $country
    | get city | uniq | sort
    | input list --fuzzy 'Choose city'

  let hostname = $locations | where country == $country and city == $city
    | get hostname | uniq | sort
    | input list --fuzzy 'Choose hostname'

  [
    set
    --exit-node
    $hostname
  ] | run-external tailscale ...$in
}

alias move = location-set
