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
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { $"(ansi reset)(date now | date format '%Y/%m/%d %r')" }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = {|| " > " }
let-env PROMPT_INDICATOR_VI_INSERT = {|| " :> " }
let-env PROMPT_INDICATOR_VI_NORMAL = {|| " : " }
let-env PROMPT_MULTILINE_INDICATOR = {|| " >> " }

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
let local_bin = $":( $env.HOME | append '/.local/bin') | str join"
let share_bin = $":( $env.HOME | append '/.local/share/bin') | str join"
let cargo_bin = $":( $env.HOME | append '/.cargo/bin/') | str join"
let-env PATH = ($env.PATH | append [$local_bin, $share_bin, cargo_bin] | str join)

let-env _JAVA_AWT_WM_NONREPARENTING = 1
let-env EDITOR = nvim
let-env TERM = foot
let-env SCRIPT = ($env.HOME | append '/.local/sh' | str join )
let-env XDG_CONFIG_HOME = ( $env.HOME | append '/.config' | str join )
let-env CPATH = ( $env.HOME | append '/.local/include' | str join )

alias vi = nvim
alias vf = vifm

alias mount = sudo mount -o uid=$USER
alias umount = sudo umount

alias batc = cat /sys/class/power_supply/BAT0/capacity
alias bats = cat /sys/class/power_supply/BAT0/status

alias wine = wine64
alias wine32 = wine

alias py = python3

let-env LESS_TERMCAP_md = (ansi gb) # begin bold
let-env LESS_TERMCAP_me = (ansi reset) # reset bold/blink
let-env LESS_TERMCAP_so = (ansi r) # begin reverse video
let-env LESS_TERMCAP_se = (ansi reset) # reset reverse video
let-env LESS_TERMCAP_us = (ansi yu) # begin underline
let-env LESS_TERMCAP_ue = (ansi reset) # reset underline
