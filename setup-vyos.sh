#!/bin/vbash
source /opt/vyatta/etc/functions/script-template
configure
set interface ethernet eth0 desc "Connecting to Host thru NAT"
commit
exit