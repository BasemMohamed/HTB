#Get CVE from Nmap

################# ARG #############
ip=$1
###################################

nmap -vv -A -T4 -oA scanresult $ip | grep -Eo '^[0-9]{1,6}' > openports.csv

while read openPort;
do 
      echo `nmap -Pn -p $openPort --script vuln $ip | grep 'CVE:' | cut -d':' -f3` &
done < openports.csv
