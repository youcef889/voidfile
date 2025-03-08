# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias i='sudo xbps-install -S'
alias u='i;sudo xbps-install -u xbps ; sudo xbps-install -u'  
alias q='sudo xbps-query -Rs'  
alias r='sudo xbps-remove'

export BROWSER=firefox
export PDFREADER=zathura
export VideoPlayer=mpv



