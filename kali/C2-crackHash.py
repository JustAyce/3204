import os
import subprocess
from flask import render_template
from flask import Flask, flash, redirect, request, send_file

UPLOAD_FOLDER = '/opt/'
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


@app.route('/', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        if 'file' not in request.files:
            return ('No file :(')

        file = request.files['file']
        if file:
            f = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
            file.save(f)
            if os.stat(f).st_size != 0:
                print('yep')
                crack_hash(f)
                return ('nice')
            return "empty file"
    # curl -X POST -F file=@hash.txt http://127.0.0.1:5000
    return ('upload.html')

@app.route('/meowware', methods=['GET', 'POST'])
def meowware():
    return send_file('/opt/wordlist.txt', attachment_filename="meowware.exe")

def crack_hash(f):
    command = "john --format=NT --wordlist=/opt/wordlist.txt "+f+" > /opt/cracked.txt"
    proc = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    print(command, proc.pid)
    return True

"""
~/hash.txt
vagrant:e02bc503339d51f71d913c245d35b50b
user2:c549ee84021e5e8372e10cedeafd02a8
~/wordlist.txt
vagrant
user2
"""
if __name__ == '__main__':
    app.run()
