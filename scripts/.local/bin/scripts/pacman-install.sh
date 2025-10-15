#!/bin/bash

fzf_args=(
  --multi
  --preview 'pacman -Sii {1}'
  --preview-label='alt-p: toggle description, alt-j/k: scroll, tab: multi-select, F11: maximize'
  --preview-label-pos='bottom'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --bind 'alt-k:preview-up,alt-j:preview-down'
  --color 'pointer:green,marker:green'
)

pkg_names=$(pacman -Slq | fzf "${fzf_args[@]}")

if [[ -n "$pkg_names" ]]; then
  # Convert newline-separated selections to space-separated for yay
  echo "$pkg_names" | tr '\n' ' ' | xargs sudo pacman -S --noconfirm
fi

# --- Pause before exiting ---
# This keeps the terminal window open until the user presses a key.
# It uses 'gum style' to show a styled message and 'read' to wait for a key press.
echo
gum style --foreground "#b8bb26" --bold --padding "0 1" "󰣇 Done! Press any key to close..."
# Wait for a single key press (-n 1) silently (-s) before exiting.
read -n 1 -s
