export BACKGROUND="$HOME/pix/wal/$(ls -1 $HOME/pix/wal | sort -R | head -1)"
export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="st"
export PAGER="most"
export PATH="$HOME/bin:$PATH"
export HISTSIZE=""
#export LANG="de_DE.UTF-8" # sets GERMAN UNICODE (öüä §„“)
export LANG="en_US.UTF-8"
#export XDG_CONFIG_HOME="$HOME/.config"

[ -f ~/.zshrc ] && . ~/.zshrc

startx
