# git
alias gs='git status'
alias gcm='git commit -am'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gp='git push'
alias gpr='git pull; git reset --hard FETCH_HEAD'
alias grso='git remote show origin'
alias gbsa='git branch -a'
alias gl='git log --graph --decorate'
alias glo='gl --oneline'
alias gd='git difftool'
alias gdm='GTK_THEME=adwaita git difftool --tool meld'
alias gcl='git clean -dfx'
alias grhh='git reset --hard HEAD'
alias gdrb='git push --delete origin'
alias gdlb='git branch -d'
alias gch='git checkout'
alias gnb='git checkout -b'
alias grpo='git remote prune origin'
function gitig() {
	printf "$1\n" >> .gitignore
}

# building
alias mcl='make clean -s'
alias mch='make check -s'
alias mk='make -s'
alias cmk='cmake .. && make -j$(nproc)'
alias wchk='$(cmk) | grep -i warn'

# terminal
alias cls='printf "\033c"'
alias pss='PS1="$ "'
alias srcrc='source ~/.zshrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias h='history'
alias hist='h | grep'
alias xc='xclip -selection clipboard <'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# docker
alias dils='docker image ls'
alias dcls='docker ps -a'
alias drun='docker run'
alias drunt='docker run -it --entrypoint=/bin/bash'
alias dstart='docker start --attach'
alias ddeli='docker rmi -f'
alias ddelc='docker rm'
alias ddelai='docker rmi -f $(docker images -q)'
alias ddelac='docker rm -f $(docker ps -aq)'

# package manager
alias aptup='sudo apt update && sudo apt upgrade'
alias aptin='sudo apt install -y'
alias aptsch='apt-cache search'

# networking
alias extip='curl ipinfo.io/ip'
alias netscan='ifconfig | grep broadcast | arp -a'
alias arpscn='sudo arp-scan -I enp4s0 -l'
alias speed-test='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias ping8='ping 8.8.8.8'
alias weath='curl wttr.in/Belfast'
alias serveos='ssh -R anvccdt:22:localhost:22 serveo.net'
alias serveoc='ssh -J serveo.net craig@anvccdt'

# misc
alias cpr='cp -r'
alias sbn='sb -n'
alias dfh='df -h'
alias dsz='du -sh'
alias zip_enc='zip -er'
alias kbgb='setxkbmap -layout gb'
alias kbmac='kbgb -variant mac'
alias rds='~/.config/i3/dualscreen.sh'
alias rds='~/.config/i3/singlescreen.sh'
alias suslock='i3lock --color 2f343f && systemctl suspend'
alias shdown='shutdown now'
alias vgcheck='valgrind --leak-check=full --show-leak-kinds=all -v'
alias rsadb='sudo adb kill-server && sudo adb start-server'
alias tarx='tar -xvf'
alias cld='clion diff'

# lubuntu specific...
alias startx='sudo service lightdm start'
alias hibernate='sudo systemctl suspend'

# tmux
alias tmuxns='tmux new -s'
alias tmuxls='tmux ls'
alias tmuxas='tmux a -t'
alias tmuxks='tmux kill-session -t'
alias tmuxka='tmux kill-session -a'

function chk() {
	local -r result=$?
	if [[ $result == 0 ]]; then
		printf "OK!\n"
	else
		printf "ERROR: $result\n"
	fi
}

function mkcd() {
	mkdir "$1" && cd "$1"
}

function findall() {
	find / -iname "$1" 2>/dev/null
}

function findhere() {
	find . -iname "$1" 2>/dev/null
}

function cheet() {
	printf "\n"
	cat ~/cheatsheets/"$1"
	printf "\n\n"
	alias | grep "$1"
	printf "\n"
}

function rmtrw() {
	sudo mount -o remount,rw "$1" "$1"
}

function xbl() {
	xbacklight -set "$1"
}

alias cvshell='docker run --gpus all --device /dev/dri -v $PWD:/home/cv_sdk/ -v ~/.jfrog/:/home/debugger/.jfrog/ -it --entrypoint=/bin/bash anvcvsdk'
alias cvtest='docker run --gpus all --device /dev/dri -v $PWD:/home/cv_sdk/ -v ~/.jfrog/:/home/debugger/.jfrog/ -it --entrypoint=/home/cv_sdk/run_module_tests.sh anvcvsdk'
alias cvbld='docker build -t anvcvsdk .'
