def services [] {
  ^brew services list --json | from json
}

def complete_inactive_services [] {
  services | where status != started | get name
}

def complete_active_services [] {
  services | where status == started | get name
}

# List all brew services
export extern "brew services" []

# List all brew services
export extern "brew services list" []

# Stop active services
export extern "brew services stop" [
  ...service: string@complete_active_services
]

# Start inactive services
export extern "brew services start" [
  ...service: string@complete_inactive_services
]

# Restart active services
export extern "brew services restart" [
  ...service: string@complete_active_services
]