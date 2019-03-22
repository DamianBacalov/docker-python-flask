import logging

LOGGING_LEVEL = logging.INFO
LOGGING_HANDLER = logging.StreamHandler()
LOGGING_FORMATTER = logging.Formatter('[%(asctime)s] %(levelname)s in %(module)s: %(message)s')


MY_MODULE = {
    "name": "development"
}
