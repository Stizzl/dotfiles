export EDITOR="nvim"
export BROWSER="qutebrowser"
export TERMINAL="st"
export PAGER="less"
export PATH="$HOME/bin:$PATH"
export HISTSIZE=""
export LANG="en_US.UTF-8"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -z $TMUX ] && \
    source $HOME/.scripts/tty_prompt.sh

# fix of tmux in correlation of xorg
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  startx
fi
