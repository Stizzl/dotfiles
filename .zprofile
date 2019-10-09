export BACKGROUND="$HOME/pix/wal/$(ls -1 $HOME/pix/wal | sort -R | head -1)"
export EDITOR="nvim"
export BROWSER="qutebrowser"
export TERMINAL="st"
export PAGER="most"
export PATH="$HOME/bin:$PATH"
export HISTSIZE=""
#export LANG="de_DE.UTF-8" # sets GERMAN UNICODE (öüä §„“)
export LANG="en_US.UTF-8"
#export XDG_CONFIG_HOME="$HOME/.config"
export TERM="xterm-256color" # tmux zsh-syntax-highlighting

[ -f ~/.zshrc ] && . ~/.zshrc

# fix of tmux in correlation of xorg
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  startx
fi
