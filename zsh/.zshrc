#!/bin/sh

# Config export.
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

# Useful options.
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable terminal freeze.
zle_highlight=('paste:none')

# Remove sound.
unsetopt BEEP

# Completions.
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# Colors.
autoload -Uz colors && colors

# Zsh functions.
source "$ZDOTDIR/zsh-functions"

# Zsh source files.
zsh_add_file 'zsh-exports'
zsh_add_file 'zsh-vim-mode'
zsh_add_file 'zsh-aliases'
zsh_add_file 'zsh-prompt'

# Zsh plugins.
zsh_add_plugin 'zsh-users/zsh-autosuggestions'
zsh_add_plugin 'zsh-users/zsh-syntax-highlighting'
zsh_add_plugin 'hlissner/zsh-autopair'
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions: https://github.com/zsh-users/zsh-completions

# NVM.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Load NVM.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Load NVM bash completion.

# FZF.
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
compinit

# Keybindings.
bindkey -s '^o' 'lf^M'
bindkey -s '^v' 'nvim .^M'
bindkey '^[[P' delete-char
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search 
bindkey '^j' down-line-or-beginning-search
bindkey -r '^u'
bindkey -r '^d'

# Speedy keys.
xset r rate 210 40

# Environment variables.
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'
