#fortune | cowsay #-f $(ls /usr/share/cows/ | shuf | head -1)
#export PS1=" \[\e[34m\]\W\[\e[m\] > " #(old) \[\e[34m\][\[\e[m\]\[\e[35m\]\u\[\e[m\] \e[32m\]\w\[\e[m\]\[\e[34m\]]\[\e[m\]$ 
source $HOME/.shell/prompt
# echo acceleratrum -- accelerator
# echo "to ignore a single file (pull): git update-index --assume-unchanged /path/to/file"

shopt -s autocd

alias ls="ls --color=auto" # adds color to ls
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
alias co="nvim ~/.bashrc"
alias vco="nvim ~/.vimrc"
alias ico="nvim ~/.config/i3/config"
alias restart="systemctl restart NetworkManager"
alias ll="ls -alh"
alias sc="nvim ~/.config/bspwm/sxhkdrc"
alias m="make && sudo make install"
alias e="emacs"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# rmaf() {find . ! -name $1 -type f -exec rm -f {} +}
# rmad() {find . ! -name $1 -type d -exec rm -fr {} +}
alias afk="time afk"
alias voc="nvim ~/tex/english/englishVocabulary/voc.tex"

pdflatex() { /usr/bin/pdflatex $@ && rm *.aux *.log ;}
s() { du -a ~/.scripts/* ~/.config/* ~/bin/* ~/tex/* | awk '{print $2}' | fzf | xargs -r nvim ;}

testy()
{
    [[ -z $@ ]] && return 0
    for (( i = 1; i <= $@; i++ )); do
        cd ..
    done
}

testyyy()
{
    echo Yo, Angelo!
    echo $@
    echo $1
    echo $2
    echo end of line
}

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
