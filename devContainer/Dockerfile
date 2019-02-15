FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
RUN mkdir -p /web
COPY requirements.txt /
RUN pip3 install -r requirements.txt
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
COPY . /app/
WORKDIR /app
# CMD python3 main.py  # To run the app automatically when the container is started, uncomment.
