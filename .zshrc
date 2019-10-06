source $HOME/.prompt/zsh_prompt

alias ls="ls --color=auto"
alias cp="cp -rv"
alias rm="rm -rv"
alias mv="mv -v"
alias mkdir="mkdir -pv"
alias v="nvim"
alias c="clear"
alias q="exit"
alias sn="shutdown now"
alias info="neofetch"
alias up="sudo pacman -Syu --color auto --noconfirm"
alias p="sudo pacman -S"
alias co="nvim ~/.zshrc"
alias vco="nvim ~/.vimrc"
alias ico="nvim ~/.config/i3/config"
alias ll="ls -alh"
alias m="make && sudo make install"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias afk="time afk"
alias voc="nvim ~/tex/english/englishVocabulary/voc.tex"

pdflatex() { /usr/bin/pdflatex $@ && rm *.aux *.log ;}
s() { du -a ~/.scripts/* ~/.config/* ~/bin/* ~/tex/* | awk '{print $2}' | fzf | xargs -r nvim ;}

# Enable colors and change prompt:
autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# From -inputrc
bindkey '^j' history-search-forward
bindkey '^k' history-search-backward
bindkey '^x' kill-whole-line
bindkey '^y' clear-screen

source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin load zsh-users/zsh-autosuggestions
    bindkey '^ ' autosuggest-accept
zplugin load zsh-users/zsh-completions
zplugin load zsh-users/zsh-history-substring-search
zplugin load hlissner/zsh-autopair
zplugin load zsh-users/zsh-syntax-highlighting
