# Left Prompt


# [[file:nushell.org::*Left Prompt][Left Prompt:1]]
def create_left_prompt [] {
    let dir = match (do --ignore-shell-errors { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    let path = $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
    let overlay = overlay list | last | if $in != zero { $" (ansi yellow)\(($in)\)" } else { "" }

    $"($path)($overlay)"
}
# Left Prompt:1 ends here

# Right Prompt


# [[file:nushell.org::*Right Prompt][Right Prompt:1]]
def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}
# Right Prompt:1 ends here

# Indicators


# [[file:nushell.org::*Indicators][Indicators:1]]
# Use nushell functions to define your right and left prompt
# $env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
# $env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| "> " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| ": " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }
# Indicators:1 ends here

# Environment Variable Conversions

# Specifies how environment variables are:

# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)

# Note: The conversions happen *after* config.nu is loaded


# [[file:nushell.org::*Environment Variable Conversions][Environment Variable Conversions:1]]
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}
# Environment Variable Conversions:1 ends here



# #+RESULTS[5ed25a1224323d4aa1f18220f72123762a00703d]: nu-primary-lib-dir
# : /Users/michael/.config/nushell/scripts


# [[file:nushell.org::*Library Directories][Library Directories:2]]
let primary = "/Users/michael/.config/nushell/scripts"
$env.NU_LIB_DIRS = [
  $primary
  ($nu.default-config-dir | path join nu_scripts)
]
# Library Directories:2 ends here



# #+RESULTS[a44f5aecb06c47f0a534dee49f94a16ea9b5a574]:

# Directories to search for plugin binaries when calling register. The default for this is =$nu.default-config-dir/plugins=


# [[file:nushell.org::*Library Directories][Library Directories:3]]
$env.NU_PLUGIN_DIRS = [
  ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]
# Library Directories:3 ends here

# Environment Variables


# [[file:nushell.org::*Environment Variables][Environment Variables:1]]
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.HOMEBREW_EDITOR = "emacsclient --create-frame --no-wait --alternate-editor ''"
# Environment Variables:1 ends here
