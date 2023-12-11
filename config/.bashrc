# Bash RC #
[[ $- != *i* ]] && return

# Export #
# export TERM=ns
HISTSIZE=
HISTFILE=~/.bashhist

# Aliases #
alias cache="yay -Scc --noconfirm && sudo fstrim -av"
alias ls="exa -l --icons=never --group-directories-first"
alias la="exa -la --icons=never --group-directories-first"
alias tree="exa -T --icons=never --group-directories-first"
alias grep='grep --color=auto'
alias rel="xrdb merge ~/.Xresources"
alias cmatrix="cmatrix -B -s -C cyan"
alias ravenfield="~/RavenField/run.sh"
# Change theme #
#alias use="xrdb merge"
#alias load="kill -USR1 $(pidof ns)"
alias mirrors="sudo reflector -l 12 -p https --sort rate --save /etc/pacman.d/mirrorlist"
# Git Aliases #
alias ginit="git init && git add ."
alias gadd="git add ."
alias gcommit="git commit -m"
alias gremote="git remote add origin"
alias gpush="git push -u origin main"
# awesome Debug #
alias screentest="Xephyr :1 -ac -br -noreset -screen 1152x720 &"
alias displaytest="DISPLAY=:1.0"

# Test if the font have a correct icon aling #
#                #

# Theme #
echo "<X> | Hello, $USER."
echo "<X> | Welcome Back."
eval "$(starship init bash)"
