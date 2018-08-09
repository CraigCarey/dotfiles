# git
alias gs='git status'
alias gcm='git commit -am'
alias gca='git commit --amend'
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
function gitig() {
	echo "$1" >> .gitignore
}

# make
alias mcl='make clean -s'
alias mch='make check -s'
alias mk='make -s'

# bash
alias cls='printf "\033c"'
alias pss='PS1="$ "'
alias srcrc='source ~/.bashrc'
alias ll='ls -l'

# misc
alias dfh='df -h'
alias zip_enc='zip -er'
alias cpr='cp -r'
alias chrm='chromium-browser'
alias extip='curl ipinfo.io/ip'
alias netscan='ifconfig | grep broadcast | arp -a'
alias kbgb='setxkbmap -layout gb'
alias kbmac='kbgb -variant mac'
alias dsz='du -sh'
alias aptup='sudo apt update && sudo apt upgrade'
alias aptin='sudo apt install -y'
alias aptsch='apt-cache search'
alias rds='~/.config/i3/dualscreen.sh'
alias suslock='i3lock --color 2f343f && systemctl suspend'
alias sbn='sb -n'
alias vgcheck='valgrind --leak-check=full --show-leak-kinds=all -v'
function chk() {
	local -r result=$?
	if [[ $result == 0 ]]; then
		printf "OK!\n"
	else
		printf "ERROR: $result\n"
	fi
}

# lubuntu specific...
alias startx='sudo service lightdm start'
alias hibernate='sudo systemctl suspend'

# tmux
alias tmuxns='tmux new -s'
alias tmuxls='tmux ls'
alias tmuxas='tmux a -t'
alias tmuxks='tmux kill-session -t'
