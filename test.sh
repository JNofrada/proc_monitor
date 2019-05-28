core=$(sysctl -n hw.ncpu)
echo $core
s=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
per=$(printf "%.0f" $s)
Echo $s
echo $per
cpu=$(($per/$core))
echo $cpu
NAME=$(whoami)
echo $NAME
top -F -R -o cpu -U $NAME -l 2 -n 2 -ncols 2 | grep PID -A 2 | cut -c "
