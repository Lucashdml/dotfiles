
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


cd() {
  builtin cd "$@" && exa --icons -a --group-directories-first
}
sd() {
	cd "$(fd --type d --hidden --exclude .git --exclude .nvm --exclude node_modules --exclude .vscode --exclude .wine --exclude snap --exclude Code --exclude .git --exclude thorium --exclude .nvm --exclude discord --exclude pgadmin4 --exclude .steam --exclude .npm --exclude node_modules | fzf )"
	nvim
}
sf() {
  local file
  file=$(fd --type f --hidden \
    --exclude .git --exclude .nvm --exclude node_modules \
    --exclude .vscode --exclude .wine --exclude snap \
    --exclude Code --exclude thorium --exclude discord \
    --exclude pgadmin4 --exclude .steam --exclude .npm \
    --exclude .themes | fzf --preview 'bat --color=always --style=header,grid --line-range :500 {}') &&
  [ -n "$file" ] && nvim "$file"
}

export PATH="$HOME/dotfiles/.config/hypr/scripts/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export BAT_THEME="gruvbox-dark"
export EDITOR="nvim"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

eval "$(zoxide init bash)"
