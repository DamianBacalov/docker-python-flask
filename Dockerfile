FROM alpine:latest

RUN apk add --update --no-cache \
    python3 \
    uwsgi \
    uwsgi-python3 \
    nginx \
    bash                                                && \
    pip3 install --upgrade pip                          && \
    find / -type d -name __pycache__ -exec rm -r {} +   && \
    rm -rf /usr/lib/python*/ensurepip                   && \
    rm -rf /usr/lib/python*/turtledemo                  && \
    rm -rf /usr/lib/python*/idlelib                     && \
    rm -f /usr/lib/python*/turtle.py                    && \
    rm -f /usr/lib/python*/webbrowser.py                && \
    rm -f /usr/lib/python*/doctest.py                   && \
    rm -f /usr/lib/python*/pydoc.py                     && \
    rm -rf /root/.cache /var/cache

COPY requirements.txt /home/

RUN pip3 install -r /home/requirements.txt

WORKDIR /home/

COPY . .

# Nginx site config
RUN echo $'server {\n\
  listen 80 default_server;\n\
  listen [::]:80 default_server;\n\
  location / {\n\
  try_files $uri @wsgi;\n\
  }\n\
  location @wsgi {\n\
  include uwsgi_params;\n\
  uwsgi_pass unix:///tmp/uwsgi.sock;\n\
  }\n\
  }' > /etc/nginx/conf.d/default.conf

# CMD Entry point
RUN touch ./nginx-flask-uwsgi.sh                        && \ 
    chmod +x ./nginx-flask-uwsgi.sh                     && \
    echo $'#!/bin/bash\n\n\
    set -m\n\
    uwsgi --uid nginx --socket /tmp/uwsgi.sock --plugins python3 --protocol uwsgi -w wsgi:app --master & \n\
    nginx -g "pid /tmp/nginx.pid;" -c /etc/nginx/nginx.conf\n\
    fg %1' > ./nginx-flask-uwsgi.sh

EXPOSE 80/tcp

CMD ["./nginx-flask-uwsgi.sh"]
