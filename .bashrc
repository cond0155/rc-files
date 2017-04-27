# Determine the path of this (.bashrc) file
#   From: http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"



#---------------------------------------------------
# Import any local environment variables
if [ -f "${DIR}/local/env-source.sh" ]; then
	source "${DIR}/local/env-source.sh"
else
	SHOULD_IMPORT_ANDROID=false
	SHOULD_SETUP_MOVIELENS=false
	SHOULD_SETUP_FOR_PERSONAL_MAC=false
	SHOULD_SOURCE_GIT_COMPLETION=false
fi



#---------------------------------------------------
# Anywhere: Setup things that should be true anywhere

	# Terminal prompt appearance
	# 	Light blue: 	"\[\033[0;36m\]" + content + "\[\033[m\]"
	#   Other colors:   "\[\033[" + colorcode "\]" + ...
	# 		Black       0;30     Dark Gray     1;30
	# 		Blue        0;34     Light Blue    1;34
	# 		Green       0;32     Light Green   1;32
	# 		Cyan        0;36     Light Cyan    1;36
	# 		Red         0;31     Light Red     1;31
	# 		Purple      0;35     Light Purple  1;35
	# 		Brown       0;33     Yellow        1;33
	# 		Light Gray  0;37     White         1;37
	# 	For background colors, replace the '3' with '4'
	PS1="\[\033[0;36m\] \W \$  \[\033[m\]"

	HISTSIZE=130000 HISTFILESIZE=-1
	
	# Restrict bash history to unique commands, no duplicates
	export HISTCONTROL=erasedups

	# Allow forward i-searching with Ctrl-S
	[[ $- == *i* ]] && stty -ixon



#---------------------------------------------------
# Personal laptop setup
if [ $SHOULD_SETUP_FOR_PERSONAL_MAC = true ]; then
	# Make git faster!
	alias g='git'

	source "${DIR}/personal-osx-setup.sh"
fi



#---------------------------------------------------
# Android environment setup
if [ $SHOULD_IMPORT_ANDROID = true ]; then
	source "${DIR}/android-setup.sh"
fi


#---------------------------------------------------
# Git tab completion (https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
if [ $SHOULD_SOURCE_GIT_COMPLETION = true ]; then
	source "${DIR}/git-completion.bash"
fi


# ln -s .bashrc ~/.bash_profile
