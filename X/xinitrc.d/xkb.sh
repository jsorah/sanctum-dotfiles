# Map Caps Lock as a Ctrl key, use right alt as Compose, kill X server with
# Ctrl+Alt+Backspace
# <https://en.wikipedia.org/wiki/Compose_key#Common_compose_combinations>
command -v setxkbmap >/dev/null 2>&1 || return
setxkbmap -option compose:ralt,ctrl:nocaps,terminate:ctrl_alt_bksp
