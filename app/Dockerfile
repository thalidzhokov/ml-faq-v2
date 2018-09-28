FROM python:3

LABEL maintainer="Albert Thalidzhokov <thalidzhokov@gmail.com>"

ENV PYTHONUNBUFFERED 1
RUN mkdir /docker_app
WORKDIR /docker_app
COPY . /docker_app
RUN pip install -r requirements.txt
# RUN pip install  -i  https://pypi.python.org/simple/  -r requirements.txt