#!/bin/bash

# Start the first process
exec python3 /opt/hoaxshell/hoaxshell.py -o -s 10.0.0.100 &
  
# Start the second process
/opt/HTTPUploadExfil/httpuploadexfil :1337 /home/vagrant/exfildata &
  
# Wait for any process to exit
#wait -n
  
# Exit with status of process that exited first
#exit $?
