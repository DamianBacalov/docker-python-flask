from flask import Flask
import os
import os.path


app = Flask(__name__)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
app.config.from_object('config')

if "MODULE_NAME" in os.environ:
    app.config["MY_MODULE"].update(
        name=os.environ["MODULE_NAME"]
    )

from application import views


