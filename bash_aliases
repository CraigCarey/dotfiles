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
alias gde='git difftool --tool emerge'
alias gdm='git difftool --tool meld'
alias gcdfx='git clean -dfx'
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
alias chrm='chromium-browser'
alias cpr='cp -r'
alias extip='curl ipinfo.io/ip'
alias netscan='ifconfig | grep broadcast | arp -a'

# tmux
alias tmuxns='tmux new -s'
alias tmuxls='tmux ls'
alias tmuxas='tmux a -t'
alias tmuxks='tmux kill-session -t'

# ssh
alias sshfspi='sshfs pi@82.2.222.68: ~/pi_home/'
alias sshpi='ssh pi@82.2.222.68'
