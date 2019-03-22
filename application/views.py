from application import app
from flask import render_template
import socket


@app.route("/")
def home():
    local_ip = socket.gethostbyname(socket.gethostname())
    return render_template('home.html', name=app.config["MY_MODULE"]["name"], ip=local_ip)
