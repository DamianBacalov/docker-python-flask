# docker-python-flask
My suggestion of a Production Ready Docker image for a Python / Flask application.

### The image will be:

* Small: around 50MB
* For production: no debugging servers involved
* Unique: one source code and one image for all environments
* More secure: developers don't know production's credentials
* Clean: source code includes only one extra file (Dockerfile)

### Why is this image smaller than others?

* Based on Alipine image
* Cleanes the system after apk add commands
* Uses Alpine uwsgi package
* Doesn't use Supervisord. It uses a bash's job as described [here](https://docs.docker.com/config/containers/multi-service_container/)

### Environment variables
This demo uses a config setting named "MY_MODULE.name". To override it, you should provide an environment variable called "MODULE_NAME". For example:
```
docker run -e MODULE_NAME=my_name ...
```
