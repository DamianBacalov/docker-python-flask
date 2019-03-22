#!/usr/bin/python
import sys, os
import logging


basedir = os.path.abspath(os.path.dirname(__file__))
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, basedir)

from application import app
app.secret_key = 'my_secret_key'
