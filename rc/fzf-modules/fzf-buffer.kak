# ╭─────────────╥────────────────────────╮
# │ Author:     ║ File:                  │
# │ Andrey Orst ║ fzf-buffer.kak         │
# ╞═════════════╩════════════════════════╡
# │ Module for changing buffers with fzf │
# │ for fzf.kak plugin                   │
# ╞══════════════════════════════════════╡
# │ GitHub.com/andreyorst/fzf.kak        │
# ╰──────────────────────────────────────╯

map global fzf -docstring "open buffer" 'b' '<esc>: fzf-buffer<ret>'

define-command -hidden fzf-buffer %{ evaluate-commands %sh{
    printf "%s\n" "info -title %{fzf buffer} %{Set buffer to edit in current client.}"
    buffers=$(printf "%s\n" "$kak_buflist" | sed "s/^'//;s/'$/\n/;s/' '/\n/g")
    printf "%s\n" "fzf %{buffer} %{printf \"%s\n\" \"$buffers\"}"
}}