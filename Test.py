import subprocess
output = subprocess.Popen(['sysctl', '-n', 'hw.ncpu'], stdout=subprocess.PIPE).communicate()[0]
print output,
print ("cool")
