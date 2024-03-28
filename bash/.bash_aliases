alias less='less -r'
alias la='eza --icons --group-directories-first' lat='la --sort=modified' las='la --sort=size' lad='la -ad .*'
alias ls='ls --classify=auto --color=auto -G' lsd='ls -ad .*'
alias xo='xdg-open'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias cal='ncal -bMw'
alias ccat='iconv -fgb2312 -tutf8 -c'
alias unicode='unicode --brief'
alias pngtoppm='pngtopnm -mix -background "#FFF"'
alias t='tmux a || tmux'
alias a2ps='a2ps -B --border=no --columns=1 -R --margin=0'
#alias qiv='qiv -m --vikeys'
#alias iv='nsxiv -qbsf' xv='iv' xiv='iv'
alias mpva='mpv --no-resume-playback' mpa='mpv --audio-display=no --video=no'
alias mpvcs6='mpv --no-resume-playback --audio-display=no --video=no http://cs6.swfu.edu.cn:9900'
alias rsync='rsync --info=progress2'
alias zathura='zathura --fork'
alias libreoffice='QT_QPA_PLATFORMTHEME=qt5ct SAL_USE_VCLPLUGIN=qt5 libreoffice'
alias sm='sm -n Purisa'
alias toilet='toilet --gay --font future'
alias blame='systemd-analyze blame | head'
alias sshfs='sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3'
alias wget='wget -c --no-check-certificate'
alias Date='date +%Y%m%d%H%M'
alias unpaper='unpaper -t pbm --overwrite --no-blackfilter --no-noisefilter --no-blurfilter --no-grayfilter --no-deskew --no-wipe'
alias rdesktop='rdesktop -f -g 1920x1080 -a 32 -z -x b -P'
alias today='notmuch search date:today'
alias baiduyunpan='/opt/baidunetdisk/baidunetdisk --no-sandbox'
#alias recordmydesktop='recordmydesktop --no-cursor --fps 30 --no-sound --no-wm-check --no-frame'
alias pcpu='procs --sortd cpu' pmem='procs --sortd mem'
alias googleearth='http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890 /opt/google/earth/pro/googleearth'

# Local Variables:
# mode: sh
# End:
