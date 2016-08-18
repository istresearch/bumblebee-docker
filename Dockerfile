FROM ubuntu:xenial
MAINTAINER Marti Martinez 'martinezah@gmail.com'
ENV stamp 20160818T000000Z
COPY venv /tmp/venv
COPY app /app
WORKDIR /app
ENTRYPOINT ['/tmp/venv/bin/python']
CMD ['run.py']
EXPOSE 8080
