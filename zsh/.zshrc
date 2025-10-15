ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

# Functions
#
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
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

# Keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Exports
export PATH="$HOME/dotfiles/hypr/.config/hypr/scripts/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export BAT_THEME="gruvbox-dark"
export EDITOR="nvim"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
