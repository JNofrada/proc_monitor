import subprocess
output = subprocess.Popen(['sysctl', '-n', 'hw.ncpu'], stdout=subprocess.PIPE).communicate()[0]
newput = subprocess.Popen(['ps', '-A', '-o', '%cpu', '|', 'awk', "'{s+=1}", 'END', '{print', "s}'"], stdout=subprocess.PIPE).communicate()[0]
print output,
print newput,
#int(output)
#int(newput)
#print (output)
#print (newput)
print ("cool")
