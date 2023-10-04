def create_left_prompt [] {
    let home = $env.HOME
    let dir = $env.PWD

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi green_bold })
    let path_segment = $"($path_color)($dir)"

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

	$"(ansi reset)($last_exit_code) ($path_segment)"
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { $"(ansi reset)(ansi {fg: '#666666'})(date now | format date '%r')" }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| " > " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| " > " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| " : " }
$env.PROMPT_MULTILINE_INDICATOR = {|| " >> " }

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

