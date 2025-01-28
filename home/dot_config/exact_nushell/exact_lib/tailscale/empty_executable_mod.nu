# Tools for working with tailscale

# Print out current geo information
export def "location show" []: nothing -> any {
  http get https://dnsleaktest.com
  | mise x ubi:mgdm/htmlq -- htmlq --text '.welcome > p'
  | lines -s | str join " "
  | parse -r '^Hello (?<ip>.*?) from (?<city>.*?), (?<country>.*?)$'
  | into record
}

export alias whereami = location-show

# Set tailscale exit node by location
export def "location set" []: nothing -> table {
  let locations = exit-nodes

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

export alias move = location-set

# The easiest, most secure way to use WireGuard
export extern main [
  --socket: string # path to tailscaled socket (default /var/run/tailscaled.socket)
]

def risk-types [] {
  ["lose-ssh" "mac-app-connector" "all"]
}

# Output exit nodes as table
export def exit-nodes [] {
  ^tailscale exit-node list
  | complete
  | get stdout
  | lines -s
  | str trim
  | drop 3
  | split column -r '\s{2,}'
  | headers
  | rename -b { str downcase }
  | upsert ip { str trim }
}

def cmp-exit-nodes []: nothing -> list<string> {
  exit-nodes
  | get hostname
}

# Connect to Tailscale, logging in if needed
export extern up [
  --accept-dns                                    # accept DNS configuration from the admin panel (default true)
  --accept-risk: string@risk-types                # accept risk and skip confirmation for risk types
  --accept-routes                                 # accept routes advertised by other Tailscale nodes (default false)
  --advertise-connector                           # advertise this node as an app connector (default false)
  --advertise-exit-node                           # offer to be an exit node for internet traffic for the tailnet (default false)
  --advertise-routes: string                      # routes to advertise to other nodes (comma-separated, e.g. "10.0.0.0/8,192.168.0.0/24") or empty string to not advertise routes
  --advertise-tags: string                        # comma-separated ACL tags to request; each must start with "tag:" (e.g. "tag:eng,tag:montreal,tag:ssh")
  --auth-key: string                              # node authorization key; if it begins with "file:", then it's a path to a file containing the authkey 
  --exit-node: string@cmp-exit-nodes              # Tailscale exit node (IP or base name) for internet traffic, or empty string to not use an exit node 
  --exit-node-allow-lan-access                    # Allow direct access to the local network when routing traffic via an exit node (default false) 
  --force-reauth                                  # force reauthentication (default false) 
  --hostname: string                              # hostname to use instead of the one provided by the OS 
  --json                                          # output in JSON format (WARNING: format subject to change) (default false) 
  --login-server: string                          # base URL of control server (default https://controlplane.tailscale.com) 
  --operator: string                              # Unix username to allow to operate on tailscaled without sudo 
  --qr                                            # show QR code for login URLs (default false) 
  --reset                                         # reset unspecified settings to their default values (default false) 
  --shields-up                                    # don't allow incoming connections (default false) 
  --ssh                                           # run an SSH server, permitting access per tailnet admin's declared policy (default false) 
  --timeout: string                               # maximum amount of time to wait for tailscaled to enter a Running state; default (0s) blocks forever (default 0s)
]

# Disconnect from Tailscale
export extern down []

# Change specified preferences
export extern set []

# Log in to a Tailscale account
export extern login []

# Disconnect from Tailscale and expire current node key
export extern logout []

# Switches to a different Tailscale account
export extern switch []

# [ALPHA] Configure the host to enable more Tailscale features
export extern configure []

# Diagnose the MDM and system policy configuration
export extern syspolicy []

# Print an analysis of local network conditions
export extern netcheck []

# Show Tailscale IP addresses
export extern ip []

# Diagnose the internal DNS forwarder
export extern dns []

# Show state of tailscaled and its connections
export extern status []

# Show Tailscale metrics
export extern metrics []

# Ping a host at the Tailscale layer, see how it routed
export extern ping []

# Connect to a port on a host, connected to stdin/stdout
export extern nc []

# SSH to a Tailscale machine
export extern ssh []

# Serve content and local servers on the internet
export extern funnel []

# Serve content and local servers on your tailnet
export extern serve []

# Print Tailscale version
export extern version []

# Run a web server for controlling Tailscale
export extern web []

# Send or receive files
export extern file []

# Print a shareable identifier to help diagnose issues
export extern bugreport []

# Get TLS certs
export extern cert []

# Manage tailnet lock
export extern lock []

# Get open source license information
export extern licenses []

# Show machines on your tailnet configured as exit nodes
export extern exit-node []

# Update Tailscale to the latest/different version
export extern update []

# Show the machine and user associated with a Tailscale IP (v4 or v6)
export extern whois []

# Share a directory with your tailnet
export extern drive []

# Shell tab-completion scripts
export extern completion []

