export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/nes/.gem:/ruby/1.9.1/bin:/home/nes/.gem:/ruby/1.9.1/bin

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nes"

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# History 
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
setopt appendhistory

# Stop being annoying
unsetopt beep
bindkey -e

# Bindings 
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


# Aliases 
alias -g G='| grep'
alias -g T='| tail'
alias -g L='| less'
alias -g M='| more'
alias -s {avi,mpeg,mpg,mov,m2v,mp4,mkv,flv}=mplayer 
alias -s {jpg,jpeg,bmp,png,ico,gif}=feh
alias chkwm="awesome --config ~/.config/awesome/rc.lua -k"
alias mplayer='mplayer'
alias vimsrv='vim --servername VIMSRV --remote'
alias mv="mv -iv"
alias grep="ack-grep"
alias less="less -r" # Colors for less pipe
alias rm="rm -i"
alias ls="ls -X -F --group-directories-first --color=auto"
alias ll="ls -lh"
alias df="df -h"
alias cal="ncal -Mbm"
alias du="du -h --max-depth=1 --exclude='./.*'"
alias ping_g="ping -c 3 google.com"
alias psg='ps -A | grep'
alias ....='../../'
alias t-r='transmission-remote'
alias browse='chromium-browser'

# Hashes
hash -d ss=~/work/projects/sspure
hash -d ssrr=~/work/projects/superstroy
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras npm node autojump command-not-found)

source $ZSH/oh-my-zsh.sh

# Completion
autoload -Uz compinit
zmodload zsh/complist
compinit

zstyle :compinstall filename '/home/nes/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' menu select=20

# Init
stty -ixon; # Fix broken keys for console vim
eval "$(dircolors ~/.dir_colors)";
echo; fortune; echo;
