# Autocompletion
if [[ ! -v BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

# Set complete path
export PATH="$HOME/.local/bin:$PATH"

set +h
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off
set completion-ignore-case on
set completion-prefix-display-length 2
set show-all-if-ambiguous on
set show-all-if-unmodified on

# Immediately add a trailing slash when autocompleting symlinks to directories
set mark-symlinked-directories on

# Do not autocomplete hidden files unless the pattern explicitly begins with a dot
set match-hidden-files off

# Show all autocomplete results at once
set page-completions off

# If there are more than 200 possible completions for a word, ask to show them all
set completion-query-items 200

# Show extra file information when completing, like `ls -F` does
set visible-stats on

# Be more intelligent when autocompleting by also looking at the text after
# the cursor. For example, when the current line is "cd ~/src/mozil", and
# the cursor is on the "z", pressing Tab will not autocomplete it to "cd
# ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
# Readline used by Bash 4.)
set skip-completed-text on

# Coloring for Bash 4 tab completions.
set colored-stats on

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

export BAT_THEME="gruvbox-dark"
export EDITOR="nvim"
export TERMINAL="kitty"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if command -v fzf &> /dev/null; then
  if [[ -f /usr/share/fzf/completion.bash ]]; then
    source /usr/share/fzf/completion.bash
  fi
  if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
    source /usr/share/fzf/key-bindings.bash
  fi
fi

if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
