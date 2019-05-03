core=$(sysctl -n hw.ncpu)
echo $core
ps -A -o %cpu | awk '{s+=$1} END {print s "%"}'
cpu=$(($core/$s))
echo cpu