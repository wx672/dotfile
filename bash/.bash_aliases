bman(){ # man with colors
  NAME="man $*"
  [[ $TMUX ]] && tmux rename-window "$NAME"
  batcat -lman <(command man "$@") 
  [[ $TMUX ]] && tmux rename-window bash
}
alias man='bman'

skpath(){
  tmux set-buffer -w $(fd -a $1 | sk -e10)
  echo '['$(tmux showb)']' is on clipboard.
}
alias realp='skpath'

skplay(){
  sk < <(fd -d 1 --size +50m $1) \
      --exact --bind "enter:execute(mpv {})+abort"
}

mp4(){ ffmpeg -i "$1" -an -c:v libx265 "$1".mp4; } # convert $1 to mp4

dict(){ batcat <(/usr/bin/dict "$@"); }

emacs(){
  if wmctrl -xa emacs; then
    [ "$1" ] && emacsclient -n "$@" || emacsclient -ne "(recentf-open-files)"
  else
    [ "$1" ] && emacsclient -nc "$@" || emacsclient -nce "(recentf-open-files)"
  fi
}
alias e='emacs'

pdf(){ local F="$*"; lloconv -f pdf "$F" "${F%.*}.pdf"; }
alias xls2x='libreoffice --convert-to xlsx' # xls -> xlsx
alias ppt='libreoffice --show'

mdcht(){ [[ $1 = -* ]] && cheat $@ || mdless <(cheat $@); }

skcht() 
{
	local CHTDIR="$HOME/.config/cheat/cheatsheets/personal"
	local SKOPTS="-e10 --preview-window=right:90%" 

	[[ $2 ]] && {
		local chosen=$(sk < <(/bin/ls $CHTDIR | rg $2) $SKOPTS \
  					--preview='cheat {} | mdless' )
	} || {
		case $1 in
			-* | '')     
				chosen=$(sk < <(/bin/ls $CHTDIR) $SKOPTS \
					--preview='cheat {} | mdless' )
				;;
			*)
				chosen=$(sk < <(/bin/ls $CHTDIR | rg $1) $SKOPTS \
					--preview='cheat {} | mdless' )
				;;
		esac
	}
	
	[ $chosen ] || return

	[[ $1 = -* ]] && cheat $1 $chosen || mdless <(cheat $chosen)
}

mount.sqfs(){ # $1 must be a squashfs file
  squashfs-mount ${1}:/mnt -- bash -c "cd /mnt && bash"
}

proxy() {
  cat <<EOF
pon/poff - Switch on/off proxy

Current settings:
	 http_proxy: $http_proxy
	https_proxy: $https_proxy
EOF
}

alias poff='unset http_proxy HTTP_PROXY https_proxy HTTPs_PROXY'

pon(){
  export http_proxy=http://127.0.0.1:${1:-7890}/
  export HTTP_PROXY=$http_proxy
  export https_proxy=$http_proxy
  export HTTPS_PROXY=$https_proxy

  cat <<EOF
http_proxy=$http_proxy
HTTP_PROXY=$http_proxy
https_proxy=$http_proxy
HTTPS_PROXY=$https_proxy
EOF
}

lipsum(){
  [[ $2 ]] || {
    echo 'Usage: loremipsum <paragraphs|sentences> <integer>'
    return
  }
  curl -s http://metaphorpsum.com/"$1"/"$2" && printf "\n"
}

alias ..='cd ..'  ...='cd ../..'  ....='cd ../../..'
alias t='tmux a || tmux'
alias wk='echo $(($(date +%W) - 34))'  Date='date +%Y%m%d%H%M'
alias cal='ncal -bMw'
alias less='less -r'
alias mu='mupdf -C FDF6E3'
alias la='eza --icons --group-directories-first' lat='la --sort=modified' las='la --sort=size' lad='la -ad .*'
alias ls='ls --classify=auto --color=auto -G' lsd='ls -ad .*' lst='ls -tr'
alias xo='xdg-open'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias nalafetch='sudo nala fetch -c CN --non-free --auto'
alias ccat='iconv -fgb2312 -tutf8 -c'
alias unicode='unicode --brief'
alias pngtoppm='pngtopnm -mix -background "#FFF"'
alias a2ps='a2ps -B --border=no --columns=1 -R --margin=0'
alias mpva='mpv --no-resume-playback' mpa='mpv --video=no' 
alias ypv='mpv --profile=ypv $(xsel -bo)' ypa='mpv --profile=ypa $(xsel -bo)' bpv='mpv --profile=noproxy $(xsel -bo)' 
#alias mpvcs6='mpv --no-resume-playback --audio-display=no --video=no http://cs6.swfu.edu.cn:9900'
alias rsync='rsync --info=progress2'
alias zathura='zathura --fork'
# alias libreoffice='QT_QPA_PLATFORMTHEME=qt5ct SAL_USE_VCLPLUGIN=qt5 libreoffice'
alias sm='sm -n Purisa'
alias toilet='toilet --gay --font future'
alias blame='systemd-analyze blame | head'
alias wget='wget -c --no-check-certificate'
alias unpaper='unpaper -t pbm --overwrite --no-blackfilter --no-noisefilter --no-blurfilter --no-grayfilter --no-deskew --no-wipe'
alias rdesktop='rdesktop -f -g 1920x1080 -a 32 -z -x b -P'
alias today='notmuch search date:today'
#alias sshfs='sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3'
#alias baiduyunpan='/opt/baidunetdisk/baidunetdisk --no-sandbox'
#alias recordmydesktop='recordmydesktop --no-cursor --fps 30 --no-sound --no-wm-check --no-frame'
alias pcpu='procs --sortd cpu'  pmem='procs --sortd mem'
alias googleearth='http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890 /opt/google/earth/pro/googleearth'

skemj() {
  [[ "$2" ]] || {
    echo usage: "skemoji <search|emoji> <search string>"
    return 1
  }

  local chosen=""

  case "$1" in
    s*)
      chosen=$(uni -quiet \
        -f "%(char l:3)%(wide_padding)%(cpoint l:8)%(name t)(%(block t))" \
        search "$2" | sk -e10 | choose 0)
      ;;
    e*)
      chosen=$(uni -quiet emoji ${2:-all} | sort --random-sort | sk -e10 | choose 0)
      ;;
    *)
      echo usage: "$0 <search|emoji> <search string>"
      return 1
      ;;
  esac

  [ "$chosen" ] || {
    echo No match found.
    return
  }

  tmux set-buffer -w "$chosen" && {
    echo "$chosen is on clipboard."
  }
}

gmaps() {
  local QUERY=""
  for WORD in "$@"; do QUERY="$QUERY%20$WORD"; done
  setsid -f x-www-browser https://www.google.com/maps/search/$QUERY 2>/dev/null
}

ffshot() { # screenshot
  ffmpeg -y -f x11grab -s 1920x1080 -r 1 -i "$DISPLAY" -vframes 1 /tmp/"$(date +%Y%m%d%H%M)".jpg &>/dev/null
}

ffrec() { # screen recording lossy
  trap 'pkill screenkey' INT EXIT TERM ERR

  (screenkey --no-systray --opacity 0.0 --font-color red --font "monospace" --font-size small &)

  ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0 \
    -c:v libx264 -preset superfast \
    "$(date +%Y%m%d%H%M)".mp4
}

ffrec_lossless() { # screen recording losslessly (very large file!)
  ffmpeg -f x11grab -s 1920x1080 -r 30 -i :0.0 \
    -c:v libx264rgb -crf 0 -preset superfast \
    "$(date +%Y%m%d%H%M)".mkv
}

ffrec_overlay() { # recording screen and webcam
  ffmpeg \
    -f x11grab -framerate 30 \
    -s "$(xdpyinfo | awk '/dimensions/ {print $2;}')" \
    -i "$DISPLAY" \
    -f alsa -i pulse \
    -f v4l2 -s 640x360 -framerate 30 -i /dev/video0 \
    -filter_complex "overlay=W-w:H-h" \
    -c:v libx264 -crf 0 -preset ultrafast -c:a aac -b:a 48k \
    "$(date +%Y%m%d%H%M)".mp4
}

ffcam() { # capture webcam
  ffmpeg -f v4l2 -s 640x480 -r 30 -i /dev/video0 \
    -f alsa -i hw:1 \
    -c:v libx264 -qp 0 -c:a aac -b:a 48k \
    "$(date +%Y%m%d%H%M)".mp4
}

say() {
  while getopts :v: OPT; do
    case $OPT in
      v) local voice="$OPTARG" ;;
      *)
        echo "Usage: espeak-ng [-h] [-v <voice>] words"
        return 0
        ;;
    esac
  done
  shift $((OPTIND - 1))
  OPTIND=1

  ($SAY -s140 -p70 -v${voice:-"en-gb"} "$*")
}

propstring() {
  echo -n 'Property '
  xprop WM_CLASS | sed 's/.*"\(.*\)", "\(.*\)".*/= "\1,\2" {/g'
  echo '}'
}

booksearch() {
  local LIBPATH=$HOME/Calibre

  [[ "$1" ]] || {
    echo Usage: 'booksearch <keywords>'
    return 1
  }
  calibredb list -s "$@" --with-library="$LIBPATH"/Calibre1
  calibredb list -s "$@" --with-library="$LIBPATH"/Calibre2
  calibredb list -s "$@" --with-library="$LIBPATH"/Calibre3
}
alias searchbook='booksearch'

loconvert() {
  [ -f $2 ] || {
    cat <<EOF
File not found.
Usage: locovert <to format> <source file>
EOF
    return 1
  }
  libreoffice --headless --convert-to "$*"
}

sssh() {
  local KEY='' USR='' REMOTE=''

  while getopts :k:u:r: OPT; do
    case $OPT in
      k) KEY="--ssh=\"ssh -i $OPTARG\"" ;;
      u) USR="$OPTARG" ;;
      r) REMOTE="$OPTARG" ;;
      *)
        echo "Usage: sssh [-k key] [-u user] [-r remote-host]"
        return
        ;;
    esac
  done
  shift $((OPTIND - 1))
  OPTIND=1

  [[ $1 = syk* ]] && REMOTE="sykp100.duckdns.org"

  [ $DISPLAY ] && {
    setsid -f st -e mosh ${KEY} ${USR:-wx672}@${REMOTE:-cs6.swfu.edu.cn}
  } || {
    mosh ${KEY} ${USR:-wx672}@${REMOTE:-cs6.swfu.edu.cn}
  }
}

rcb() { # remote clipboard
  local PORT=${1:-33333}

  echo fetching from port $PORT ...

  # at remote side (cs6) do, for example, 'ls *.mkv | nc -4l 33333'
  tmux set-buffer -w $(nc -4 cs6 $PORT) || echo copy from nc failed.
  tmux showb
}

cs6v() {
  local PORT=${1:-33333}
  local url="https://cs6.swfu.edu.cn/~wx672"
  local base=${1:-tmp}
  local movies=$(nc -4 -w 1 cs6 $PORT)

  [[ "$movies" ]] || {
    echo "Movies are missing!"
    return 1
  }

  cat <<EOF
Files to be downloaded:

$movies

EOF

  for m in $movies; do
    echo Downloading "$url"/"$base"/"$m" ...
    aria2c --no-conf --check-certificate=false -x16 "$url"/"$base"/"$m"
  done
}

cs6r() { rsync -avLP --inplace --append cs6:public_html/"$1" .; }

# mount.sqfs() {
#   cmdchk squashfuse || return 127
#   mkdir -p "$1" && squashfuse "$1".sqfs "$1" && cd "$1"
# }

# https://stackoverflow.com/questions/660613/how-do-you-hide-the-mouse-pointer-under-linux-x11
setmouse() {
  for i in $(DISPLAY=":0" xinput | grep Mouse | cut -d"=" -f2 | cut -b-2); do
    DISPLAY=":0" xinput --"$1" "$i"
  done
}

moff() {
  DISPLAY=":0" xdotool mousemove 3840 2160 # use xrandr to find out
  setmouse disable
}

mon() {
  DISPLAY=":0" xdotool mousemove 1366 768 # use xrandr to find out
  setmouse enable
}

settouchpad() {
  for i in $(DISPLAY=":0" xinput | grep Touchpad | cut -d"=" -f2 | cut -b-2); do
    DISPLAY=":0" xinput --"$1" "$i"
  done
}

toff() { # touchpad
  DISPLAY=":0" xdotool mousemove 3840 2160 # use xrandr to find out
  settouchpad disable
}

ton() {
  DISPLAY=":0" xdotool mousemove 1366 768 # use xrandr to find out
  settouchpad enable
}

# Local Variables:
# mode: sh
# End:
