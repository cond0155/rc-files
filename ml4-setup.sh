# # Start vagrant (start from any directory)
# movielens-vagrant () {
# 	echo ">> cd ~/movielens/movielens4"
# 	cd ~/movielens/movielens4 ;
# 	echo ">> vagrant ssh"
# 	vagrant ssh ;
# }

# Not necessary (now use dev-tunnel, see vagrant)
# Tunnel and port-forward for mysql
# tunnel-mysql () {
# 	echo "nargs: $#"
# 	if [[ $# -ne 1 ]]; then
# 		echo "USAGE: tunnel-mysql <machine name>"
# 		echo "(ie: tunnel-mysql flagon)"
# 	else
# 		HOST_MACHINE=$1
# 		echo "ssh condiff@${HOST_MACHINE}.cs.umn.edu -L 3306:localhost:3306 -N"
# 		ssh condiff@${HOST_MACHINE}.cs.umn.edu -L 3306:localhost:3306 -N
# 	fi
# }

ML4_DIR="$HOME/code/movielens/movielens4"


ml4-goto () {
	cd "${ML4_DIR}"
}


alias ml4='source ${ML4_DIR}/ml4-init'


# Elasticsearch 1.5.2 path
# export PATH=$PATH:/usr/share/elasticsearch-1.5.2/bin

# Vagrant binaries
# export PATH="$HOME/code/movielens/vagrant/bin:$PATH"
# export PATH="$HOME/code/movielens/vagrant/node/current/bin:$PATH"
