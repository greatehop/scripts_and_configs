# colorize grep
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# set prompt before deleting user's crontab
alias crontab='crontab -i'

# set shell prompt
export PS1="[\\[\\e[0m\\]\\u@\\[\\e[32m\\]\\h\\[\\e[0m\\]]\\\$ "

# set history log format (/var/log/{messages,syslog}
export HISTTIMEFORMAT="%d.%m.%Y %H:%M:%S "

# set editor
export EDITOR=vim
