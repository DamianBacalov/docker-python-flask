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

### Special thanks
I was able to create this image because I've learned from:

* [digitalocean.com](https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-16-04)
* [netdevops.me](https://netdevops.me/2017/flask-application-in-a-production-ready-container/)
* [towardsdatascience.com](https://towardsdatascience.com/how-to-do-rapid-prototyping-with-flask-uwsgi-nginx-and-docker-on-openshift-f0ef144033cb)
* [Gabriela Melo](https://medium.com/@gabimelo/developing-a-flask-api-in-a-docker-container-with-uwsgi-and-nginx-e089e43ed90e)
* [Fernando Koff](https://github.com/Koff/alpine-python3-django-uwsgi-nginx/blob/master/Dockerfile)
* [Yoan Blanc](https://medium.com/@greut/minimal-python-deployment-on-docker-with-uwsgi-bc5aa89b3d35)
* [Bradley Zhou](https://bradleyzhou.com/posts/building-slim-uwsgi-docker-image)
* [Aleksander S.](https://github.com/myth/python3-uwsgi-alpine/blob/master/Dockerfile)
* [docker.com](https://docs.docker.com/config/containers/multi-service_container/)
