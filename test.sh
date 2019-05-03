core=$(sysctl -n hw.ncpu)
echo $core
s=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
per=$(printf "%.0f" $s)
echo $per
cpu=$(($per/$core))
echo $cpu