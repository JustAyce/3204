import time
import subprocess
import select
import es_client

# Create connection to es
ec = es_client.ElasticClient()
if ec.connect():
  print("Connected")
else:
  exit(0)

# Reads the log output by snort and inserts each row of data to elasticsearch
f = subprocess.Popen(['tail','-F','/var/log/snort/snort.alert.fast'],\
        stdout=subprocess.PIPE,stderr=subprocess.PIPE)
p = select.poll()
p.register(f.stdout)

while True:
    if p.poll(1):
        alert = f.stdout.readline()
        print(alert)
	ec.insert(alert)
        time.sleep(1)
