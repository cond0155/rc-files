# Determine the path of this file
#   From: http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"



# Movielens, if applicable
if [ $SHOULD_SETUP_MOVIELENS = true ]; then
	source "${DIR}/ml4-setup.sh"
fi


# bash completion (installed with brew)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi



# PYTHON
# Add pip-installed packages to search path for "import" statements
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages
export PYTHONPATH=$PYTHONPATH:${HOME}/Library/Python/2.7/lib/python/site-packages
export PYTHONPATH=$PYTHONPATH:/usr/local/Cellar/opencv/2.4.10.1/lib/python2.7/site-packages
# Autocomplete!
export PYTHONSTARTUP="${HOME}/.pythonrc"



# FFMPEG
# Suppress headers
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
# Make it quiet by default
alias ffmpeg='ffmpeg -loglevel quiet'
alias ffprobe='ffprobe -loglevel quiet'



# OpenShift
# Make this script accessable from anywhere, easiest with a function
switch-rhc () {
	SWITCH_SCRIPT="${HOME}/.openshift/switch.sh"
	$SWITCH_SCRIPT $1
}



# COREUTILS:	(allow GNU bash commands to override OSX version)
	# [			dircolors	link		pinky		shuf	  tsort
	# base64	dirname		ln			pr			sleep	  tty
	# basename	du			logname		printenv	sort	  uname
	# cat		echo		ls			printf		split	  unexpand
	# chcon		env			md5sum		ptx			stat	  uniq
	# chgrp		expand		mkdir		pwd			stdbuf	  unlink
	# chmod		expr		mkfifo		readlink	stty	  uptime
	# chown		factor		mknod		realpath	sum		  users
	# chroot	false		mktemp		rm			sync	  vdir
	# cksum		fmt			mv			rmdir		tac		  wc
	# comm		fold		nice		runcon		tail	  who
	# cp		groups		nl			seq			tee		  whoami
	# csplit	head		nohup		sha1sum		test	  yes
	# cut		hostid		nproc		sha224sum	timeout
	# date		id			numfmt		sha256sum	touch
	# dd		install		od			sha384sum	tr
	# df		join		paste		sha512sum	true
	# dir		kill		pathchk		shred		truncate
export PATH=/usr/local/opt/coreutils/libexec/gnuman:$PATH



# OPAM CONFIG
	# . ${HOME}/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
	# eval `opam config env`



## This command will disable the dash board:
# defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock
## To re-enable it, do:
# defaults write com.apple.dashboard mcx-disabled -boolean NO && killall Dock



# simple function for getting local ip (if you're too lazy to read ifconfig)
# getMyIP() {
#      local _ip _myip _line _nl=$'\n'
#      while IFS=$': \t' read -a _line ;do
#          [ -z "${_line%inet}" ] &&
#             _ip=${_line[${#_line[1]}>4?1:2]} &&
#             [ "${_ip#127.0.0.1}" ] && _myip=$_ip
#        done< <(LANG=C /sbin/ifconfig)
#      printf ${1+-v} $1 "%s${_nl:0:$[${#1}>0?0:1]}" $_myip
# }
# getPublicIP() {
# 	curl ipinfo.io/ip
# }