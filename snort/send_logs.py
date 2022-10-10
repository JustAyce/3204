import time
import subprocess
import select
import es_client

f = subprocess.Popen(['tail','-F','/var/log/snort/snort.alert.fast'],\
        stdout=subprocess.PIPE,stderr=subprocess.PIPE)
p = select.poll()
p.register(f.stdout)

ec = es_client.ElasticClient()
if ec.connect():
  print("Connected")
else:
  exit(0)

while True:
    if p.poll(1):
        alert = f.stdout.readline()
        print(alert)
				# ec.insert(alert)
        time.sleep(1)
