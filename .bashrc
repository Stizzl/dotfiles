source $HOME/.prompt/bash_prompt

shopt -s autocd

alias ls="ls --color=auto"
alias cp="cp -rvi"
alias rm="rm -rv"
alias mv="mv -v"
alias mkdir="mkdir -pv"
alias v="nvim"
alias c="clear"
alias q="exit"
alias sn="shutdown now"
alias up="sudo pacman -Syu --color auto --noconfirm"
alias p="sudo pacman -S"
alias co="nvim ~/.bashrc"
alias vco="nvim ~/.vimrc"
alias ll="ls -alh"
alias m="make && sudo make install"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias afk="time afk"
alias voc="nvim ~/tex/english/englishVocabulary/voc.tex"
alias lf="/usr/bin/lf -last-dir-path=$PWD"
alias tmux="tmux -2"
alias vim="vim -u NONE"

pdflatex() { /usr/bin/pdflatex $@ && rm *.aux *.log ;}
s() { du -a ~/.scripts/* ~/.config/* ~/bin/* ~/tex/* | awk '{print $2}' | fzf | xargs -r nvim ;}

#{{{
__fzf_history ()
{
    builtin history -a;
    builtin history -c;
    builtin history -r;
    builtin typeset \
        READLINE_LINE_NEW="$(
            HISTTIMEFORMAT= builtin history |
            command fzf +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r |
            command sed '
                /^ *[0-9]/ {
                    s/ *\([0-9]*\) .*/!\1/;
                    b end;
                };
                d;
                : end
            '
        )";

        if
                [[ -n $READLINE_LINE_NEW ]]
        then
                builtin bind '"\er": redraw-current-line'
                builtin bind '"\e^": magic-space'
                READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${READLINE_LINE_NEW}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
                READLINE_POINT=$(( READLINE_POINT + ${#READLINE_LINE_NEW} ))
        else
                builtin bind '"\er":'
                builtin bind '"\e^":'
        fi
}

builtin set -o histexpand;
builtin bind -x '"\C-x1": __fzf_history';
builtin bind '"\C-r": "\C-x1\e^\er"'
#}}}

# vim:foldmethod=marker:foldlevel=0
