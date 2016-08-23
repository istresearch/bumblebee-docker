FROM ubuntu:xenial
MAINTAINER Marti Martinez "martinezah@gmail.com"
ENV stamp 20160823T000001Z
RUN apt-get update
RUN apt-get install -y python default-jdk libre2-1v5
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV CLASSPATH=/tmp/venv/lib/python2.7/site-packages/cdrtools/tika-server-1.13.jar
COPY venv /tmp/venv
COPY app /app
ENTRYPOINT ["/tmp/venv/bin/python"]
CMD ["/app/run.py"]
EXPOSE 8080
