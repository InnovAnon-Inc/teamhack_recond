#! /usr/bin/env bash
set -euxo nounset
(( $#   ))
(( $UID ))

# IP Address List

# Libpcap Packet Capture

#sudo masscan -oX masscan.out --ports 0-65535 $*

#nikto -Format xml -host $* -mutate 1,2,3,4,5,6  -output nikto.out
nikto -Format xml -host $*  -output nikto.out \
-Plugin '@@DEFAULT;tests(passfiles,all);apacheusers(enumerate,home,cgiwrap);subdomain;dictionary(dictionary:/usr/share/seclists/Discovery/Web-Content/directory-list-lowercase-2.3-small.txt)'

nmap -Pn -A -oX nmap.out -sV $* --script=vulners/vulners.nse

# OpenVAS

wapiti -u $* --scope page,folder,domain,url,punk -f xml -o wapiti.out

msfconsole -x 'db_import masscan.out nikto.out nmap.out wapiti.out'

