[ -z $TMUX ] && \
    source $HOME/.scripts/background_prompt.sh

export EDITOR="nvim"
export BROWSER="qutebrowser"
export TERMINAL="st"
export PAGER="most"
export PATH="$HOME/bin:$PATH"
export HISTSIZE=""
export LANG="en_US.UTF-8"
# export TERM="xterm-256color" # tmux zsh-syntax-highlighting

[ -f ~/.zshrc ] && . ~/.zshrc

# fix of tmux in correlation of xorg
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  startx
fi
