# Settings
timezones=(
  US/Pacific
  US/Central
  US/Eastern
  GMT
  Europe/London
  Asia/Istanbul
)
export TZ_LIST="${(j:;:@)timezones}"
unset timezones

# Aliases
alias tz='\tz -m'
alias est='eastern-time'
alias pst='pacific-time'
