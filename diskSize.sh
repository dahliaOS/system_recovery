lsblk ${1} | grep disk | awk '{print $4}'
