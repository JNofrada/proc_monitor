#Checks if root
if [[ $EUID -eq 0]]
then
	echo "This script must not be ran as root"
	exit 1
fi

#Print number of cores
core=$(sysctl -n hw.ncpu)
echo $core

#Print total CPU percentage (can be over 100%)
s=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
Echo $s

#Print total CPU percentage (can be over 100%) floored to the nearest whole number
per=$(printf "%.0f" $s)
echo $per

#Print cpu percentage divided by number of cores
cpu=$(($per/$core))
echo $cpu

if [$cpu -gt '80' ]
then
	#Print current user
	NAME=$(whoami)
	echo $NAME

	#Checks again if root
	if [[$NAME -eq "root"]]
	then
		echo "This script must not be ran as root"
		exit 1
	fi

	#Print process with top cpu percentage
	mockingbird=$(top -F -R -o cpu -U $NAME -l 2 -n 2 -ncols 1 | sed -n '25p')
	echo $mockingbird

	#Kills top process with CPU percentage
	kill $mockingbird
fi