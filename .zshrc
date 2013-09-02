# Proxy
#export http_proxy="http://110.101.115.100:3128/"
#export ftp_proxy="ftp://110.101.115.100:3128/"
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME:/ruby/1.9.1/bin
# Word Separators
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# The following lines were added by compinstall
PROMPT=$'%{\e[0;37m%}[%n@%m %~]$%{\e[0m%} '
PROMPT=$'%{\e[38;5;223m%}[%n@%m %~]$%{\e[0m%} '   
#PROMPT=$'%{\e[1;32m%}[%{\e[1;34m%}%~%{\e[1;32m%}] %{\e[1;31m%}%#%{\e[0m%} '
RPROMPT=$'%{\e[0;35m%}%T%{\e[0m%}'

#zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/nes/.zshrc'
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' menu select=20
# CDargs
#source ~/apparix.sh


autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
setopt appendhistory
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

setopt autocd

bindkey "^[[2~" yank
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[e" 	expand-cmd-path ## C-e for expanding path of typed command
bindkey "^[[A" 	up-line-or-search ## up arrow for back-history-search
bindkey "^[[B" 	down-line-or-search ## down arrow for fwd-history-search
bindkey " " 	magic-space ## do history expansion on space


alias -g G='| grep'
alias -g T='| tail'
alias -g L='| less'
alias -g M='| more'
alias -s {avi,mpeg,mpg,mov,m2v,mp4,mkv,flv}=mplayer 
alias -s {jpg,jpeg,bmp,png,ico,gif}=feh
alias chkwm="awesome --config ~/.config/awesome/rc.lua -k"
alias mplayer='mplayer'
alias mv="mv -iv"
alias rm="rm -i"
alias ls="ls -X -F --group-directories-first --color=auto"
alias ll="ls -lh"
alias df="df -h"
alias cal="cal -m"
alias du="du -h --max-depth=1 --exclude='./.*'"
alias ping_g="ping -c 3 google.com"
alias wget_mp3='wget -c -r -l 1 -A mp3 -np -nd'
alias psg='ps -A | grep'
alias ....='../../'
alias aninfo='/home/nes/system/mpc/pls-handler.sh /home/nes/system/streams/animenfo.pls'
alias t-r='transmission-remote'
alias vimr='vim --servername GVIM --remote'
echo; fortune; echo;
